using RedbonePlatform.Classes;
using System;
using System.Linq;
using static RedbonePlatform.Services.LoadLogger;

namespace RedbonePlatform.Services
{
	public class EDIService
	{
		public static void AcceptDeclineTender(int personId, int tenderId, int clientId, bool accept, DateTime bookingDate, string customerShipmentNumber,
			string senderIdQualifier, string senderId, string senderAlphaCode, string senderAs2Id,
			string receiverIdQualifier, string receiverId, string receiverAlphaCode, string receiverAs2Url, string receiverAs2Id, string receiverGsId,
			string mode, string ShipperTenderId)
		{
			int loadId;
			var shipmentIdNumber = "";

			//save the tender status and add to loads table if accepted
			using (Datasets.dsEDILoadTendersTableAdapters.QueriesTableAdapter qAdapt = new Datasets.dsEDILoadTendersTableAdapters.QueriesTableAdapter())
			{
				//if accepted, marks tender as accepted and copies to load tables
				//if declined, marks as such in the tender table
				loadId = (int)qAdapt.sp_EDI_LoadTenders_Status_Update(tenderId, accept ? "A" : "D", personId);
				shipmentIdNumber = qAdapt.sp_EDI_GetShipmentIdNumber(loadId, tenderId).ToString();
			}

			//insert row into edi outgoing table where it will be sent to the client via the EDI service
			using (Datasets.dsEDILoadTendersTableAdapters.Outgoing_990TableAdapter adapt = new Datasets.dsEDILoadTendersTableAdapters.Outgoing_990TableAdapter())
			{
				using (Datasets.dsEDILoadTenders.Outgoing_990DataTable outgoing = new Datasets.dsEDILoadTenders.Outgoing_990DataTable())
				{
					Datasets.dsEDILoadTenders.Outgoing_990Row row = outgoing.NewOutgoing_990Row();

					row.LoadId = loadId;
					row.ClientId = clientId;
					row.ShipmentNumber = customerShipmentNumber;
					row.ShipmentIdNumber = shipmentIdNumber;
					row.StatusId = "O";
					row.TransactionSet = "990";
					row.Accept = accept;
					row.DateSent = DateTime.Now;
					row.PurposeCode = "";
					row.SenderIdQualifier = senderIdQualifier;
					row.SenderId = senderId;
					row.SenderAlphaId = senderAlphaCode;
					row.SenderAs2Id = senderAs2Id;
					row.ReceiverIdQualifier = receiverIdQualifier;
					row.ReceiverId = receiverId;
					row.ReceiverAlphaId = receiverAlphaCode;
					row.ReceiverUrl = receiverAs2Url;
					row.ReceiverAs2Id = receiverAs2Id;
					row.ReceiverGsId = receiverGsId;
					row.BookingDate = bookingDate;
					row.Mode = mode;
					row.ShipperTenderId = ShipperTenderId;

					outgoing.Rows.Add(row);
					adapt.Update(outgoing);
				}
			}
		}

		//Send 214 Status Update to Client
		public static void SendStatusChangeToClient(bool doValidation, string bussinessUnit, int clientId, SendStatusUpdateArgs args, string mode)
		{
			var notify = false;
			var thresholdExceeded = false;
			string senderInterchangeId = "";
			string senderInterchangeIdQualifier = "";
			string senderAlphaCode = "";
			string senderAs2Id = "";

			//if no tender id then this load was not tendered via EDI even though it's an EDI client
			if (args.TenderId == 0)
			{
				return;
			}

			if (doValidation)
			{
				//trucking - check if edi client
				using (Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter clientAdapt = new Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter())
				{
					notify = clientAdapt.GetData(clientId).Select(c => c.IsEdiClient).FirstOrDefault() == true;
				}

				if (notify)
				{
					//if the stop is late, check the threshold for the client/status and send to pending if required.
					if (args.StatusType == ShipmentStatusType.StatusChange)
					{
						switch (args.LoadBussinessUnit)
						{
							case "T":
								//trucking - check if arrival/departure dates exceeded thresholds
								using (Datasets.dsDispatchTableAdapters.sp_EDI_StatusUpdate_ValidateTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.sp_EDI_StatusUpdate_ValidateTableAdapter())
								{
									var validationResult = dispatchAdapt.GetData(args.StopId);

									if (args.StatusDateType == StatusDateType.Arrival)
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyArrivalThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateArrivalThresholdExceeded)).FirstOrDefault();
									}
									else
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyDepartureThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateDepartureThresholdExceeded)).FirstOrDefault();
									}
								}
								break;
							case "L":
								//trucking - check if arrival/departure dates exceeded thresholds
								using (Datasets.dsLogisticsTableAdapters.sp_EDI_Logistics_StatusUpdate_ValidateTableAdapter dispatchAdapt = new Datasets.dsLogisticsTableAdapters.sp_EDI_Logistics_StatusUpdate_ValidateTableAdapter())
								{
									var validationResult = dispatchAdapt.GetData(args.StopId);

									if (args.StatusDateType == StatusDateType.Arrival)
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyArrivalThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateArrivalThresholdExceeded)).FirstOrDefault();
									}
									else
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyDepartureThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateDepartureThresholdExceeded)).FirstOrDefault();
									}
								}
								break;
						}

						if (thresholdExceeded)
						{
							//arrival or departure time exceeded the client threshold so place in queue for approval
							switch (args.LoadBussinessUnit)
							{
								case "T":
									//trucking
									using (Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTableAdapter statusAdapt = new Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTableAdapter())
									{
										Datasets.dsDispatch.LoadStatusUpdate_PendingDataTable tbl = new Datasets.dsDispatch.LoadStatusUpdate_PendingDataTable();
										Datasets.dsDispatch.LoadStatusUpdate_PendingRow row = tbl.NewLoadStatusUpdate_PendingRow();

										row.LoadStopId = args.StopId;
										row.DateType = args.StatusDateType == StatusDateType.Arrival ? "A" : "D";

										tbl.Rows.Add(row);
										statusAdapt.Update(tbl);
									}
									break;
								case "L":
									//logistics
									using (Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTableAdapter statusAdapt = new Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTableAdapter())
									{
										Datasets.dsLogistics.LoadStatusUpdate_PendingDataTable tbl = new Datasets.dsLogistics.LoadStatusUpdate_PendingDataTable();
										Datasets.dsLogistics.LoadStatusUpdate_PendingRow row = tbl.NewLoadStatusUpdate_PendingRow();

										row.LoadStopId = args.StopId;
										row.DateType = args.StatusDateType == StatusDateType.Arrival ? "A" : "D";

										tbl.Rows.Add(row);
										statusAdapt.Update(tbl);
									}
									break;
							}

							return;
						}
					}
				}
			}

			//threshold not exceeded, or approving update, so send status
			using (Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter controlAdapt = new Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter())
			{
				var controlRow = controlAdapt.GetData().FirstOrDefault();

				if (controlRow != null)
				{
					senderInterchangeId = mode == "P" ? controlRow.SenderInterchangeId : controlRow.SenderInterchangeIdTest;
					senderInterchangeIdQualifier = controlRow.SenderInterchangeIdQualifier;
					senderAlphaCode = mode == "P" ? controlRow.SenderAlphaCode : controlRow.SenderAlphaCodeTest;
					senderAs2Id = mode == "P" ? controlRow.SenderAs2Id : controlRow.SenderAs2IdTest;
				}
			}

			using (Datasets.dsClientTableAdapters.ClientEdiTableAdapter ediAdapt = new Datasets.dsClientTableAdapters.ClientEdiTableAdapter())
			{
				string stopType = args.StopType;

				Datasets.dsClient.ClientEdiRow ediRow = ediAdapt.GetData(clientId).FirstOrDefault();

				if (ediRow != null)
				{
					//insert edi specific data into edi outgoing table
					using (Datasets.dsEDILoadTendersTableAdapters.Outgoing_214TableAdapter outgoingAdapt = new Datasets.dsEDILoadTendersTableAdapters.Outgoing_214TableAdapter())
					{
						Datasets.dsEDILoadTenders.Outgoing_214DataTable outgoing = new Datasets.dsEDILoadTenders.Outgoing_214DataTable();
						Datasets.dsEDILoadTenders.Outgoing_214Row outgoingRow = outgoing.NewOutgoing_214Row();

						switch (args.StatusType)
						{
							case ShipmentStatusType.Appointment:
								stopType += "appointment";
								break;
							case ShipmentStatusType.StatusChange:
								stopType += "";
								break;
						}

						switch (args.StatusDateType)
						{
							case StatusDateType.Scheduled:
								stopType += "";
								break;
							case StatusDateType.Arrival:
								stopType += "arrival";
								break;
							case StatusDateType.Departure:
								stopType += "departure";
								break;
						}

						//outgoingRow.StopType 
						string shipmentIdNumber = "";
						using (Datasets.dsEDILoadTendersTableAdapters.QueriesTableAdapter qAdapt = new Datasets.dsEDILoadTendersTableAdapters.QueriesTableAdapter())
						{
							//loadId = (int)qAdapt.sp_EDI_LoadTenders_Status_Update(tenderId, accept ? "A" : "D", personId);
							shipmentIdNumber = qAdapt.sp_EDI_GetShipmentIdNumber(args.LoadId, args.TenderId).ToString();
						}

						outgoingRow.LoadId = args.LoadId;
						outgoingRow.StopNumber = args.StopNumber;
						outgoingRow.StopId = args.StopId;
						outgoingRow.StopType = stopType;
						outgoingRow.StopSequenceNumber = args.StopSequenceNumber;   //tender stop sequence number
						outgoingRow.ClientId = clientId;

						outgoingRow.ShipmentNumber = args.ShipmentNumber;
						outgoingRow.ShipmentIdNumber = shipmentIdNumber;
						outgoingRow.TransactionSet = "214";
						outgoingRow.StatusId = "O";
						outgoingRow.DateSent = DateTime.Now;
						outgoingRow.SenderIdQualifier = senderInterchangeIdQualifier;
						outgoingRow.SenderId = senderInterchangeId;
						outgoingRow.SenderAlphaId = senderAlphaCode;
						outgoingRow.SenderAs2Id = senderAs2Id;
						outgoingRow.ReceiverIdQualifier = ediRow.InterchangeIdQualifier;
						outgoingRow.ReceiverId = mode == "P" ? ediRow.InterchangeId : ediRow.InterchangeIdTest;
						outgoingRow.ReceiverAlphaId = ediRow.CarrierAlphaCode;
						outgoingRow.ReceiverUrl = mode == "P" ? ediRow.As2Url : ediRow.As2UrlTest;
						outgoingRow.ReceiverAs2Id = mode == "P" ? ediRow.As2Id : ediRow.As2IdTest;
						outgoingRow.ReceiverGsId = mode == "P" ? ediRow.GSId : ediRow.GSIdTest;
						//outgoingRow.Mode = mode;

						outgoingRow.ShipmentStatusReason = args.StatusReason;
						outgoingRow.ShipmentStatusDateTime = args.StatusDate;

						outgoingRow.StatusType = (int)args.StatusType;
						outgoingRow.StatusDateType = (int)args.StatusDateType;

						//insert load specific data into edi outgoing table
						string businessReferenceIds = "";
						string businessReferenceIdQualifiers = "";

						using (Datasets.dsDispatchTableAdapters.QueriesTableAdapter adapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter())
						{
							outgoingRow.ReferenceIdentification = adapt.GetTripNumber(args.LoadId).ToString();
							//outgoingRow.ShipmentNumber = adapt.GetCustomerLoadNumber(args.LoadId).ToString();
						}

						//set pick/drop status or appointment status
						if (args.StatusType == ShipmentStatusType.Appointment)
						{
							outgoingRow.ShipmentAppointmentStatusCode = args.StatusCode;
							outgoingRow.ShipmentStatusCode = "";
						}
						else if (args.StatusType == ShipmentStatusType.StatusChange)
						{
							outgoingRow.ShipmentStatusCode = args.StatusCode;
							outgoingRow.ShipmentAppointmentStatusCode = "";
						}

						outgoingRow.TruckNumber = args.TruckNumber;
						outgoingRow.TrailerNumber = args.TrailerNumber;
						outgoingRow.PurposeCode = args.PurposeCode;

						switch (bussinessUnit)
						{
							case "T":
								//trucking load - get the business instructions for the stop
								using (Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
								{
									var dispatchTable = dispatchAdapt.GetData(args.LoadId, args.StopNumber);

									if (dispatchTable != null)
									{
										foreach (Datasets.dsDispatch.LoadStop_ReferenceNumbersRow dispatchRow in dispatchTable)
										{
											businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + dispatchRow.ReferenceIdentification;
											businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + dispatchRow.ReferenceIdentificationQualifierCode;
										}
									}
								}
								break;

							case "L":
								//logistics load - get the business instructions for the stop
								using (Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter logisticsAdapt = new Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
								{
									var logisticsTable = logisticsAdapt.GetData(args.LoadId, args.StopNumber);

									if (logisticsTable != null)
									{
										foreach (Datasets.dsLogistics.LoadStop_ReferenceNumbersRow logisticsRow in logisticsTable)
										{
											businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + logisticsRow.ReferenceIdentification;
											businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + logisticsRow.ReferenceIdentificationQualifierCode;
										}
									}
								}
								break;
						}

						outgoingRow.BusinessInstructionsReferenceIdentification = businessReferenceIds;
						outgoingRow.BusinessInstructionsReferenceIdentificationQualifier = businessReferenceIdQualifiers;

						outgoing.Rows.Add(outgoingRow);
						outgoingAdapt.Update(outgoing);

						LoadLogger.LogEvent(LoadLogEventType.EDILoadStatusSent, args.ShipmentNumber, args.TenderId, args.LoadId, args.StopId);
					}
				}
			}
		}

		//Send 212 Manifest to Client TODO---------------------------------------------------------------------------------------------------
		public static void SendManifestToClient(bool doValidation, string bussinessUnit, int clientId, SendStatusUpdateArgs args, string mode)
		{
			var notify = false;
			var thresholdExceeded = false;
			string senderInterchangeId = "";
			string senderInterchangeIdQualifier = "";
			string senderAlphaCode = "";
			string senderAs2Id = "";

			if (doValidation)
			{
				//trucking - check if edi client
				using (Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter clientAdapt = new Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter())
				{
					notify = clientAdapt.GetData(clientId).Select(c => c.IsEdiClient).FirstOrDefault() == true;
				}

				if (notify)
				{
					//if the stop is late, check the threshold for the client/status and send to pending if required.
					if (args.StatusType == ShipmentStatusType.StatusChange)
					{
						switch (args.LoadBussinessUnit)
						{
							case "T":
								//trucking - check if arrival/departure dates exceeded thresholds
								using (Datasets.dsDispatchTableAdapters.sp_EDI_StatusUpdate_ValidateTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.sp_EDI_StatusUpdate_ValidateTableAdapter())
								{
									var validationResult = dispatchAdapt.GetData(args.StopId);

									if (args.StatusDateType == StatusDateType.Arrival)
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyArrivalThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateArrivalThresholdExceeded)).FirstOrDefault();
									}
									else
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyDepartureThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateDepartureThresholdExceeded)).FirstOrDefault();
									}
								}
								break;
							case "L":
								//trucking - check if arrival/departure dates exceeded thresholds
								using (Datasets.dsLogisticsTableAdapters.sp_EDI_Logistics_StatusUpdate_ValidateTableAdapter dispatchAdapt = new Datasets.dsLogisticsTableAdapters.sp_EDI_Logistics_StatusUpdate_ValidateTableAdapter())
								{
									var validationResult = dispatchAdapt.GetData(args.StopId);

									if (args.StatusDateType == StatusDateType.Arrival)
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyArrivalThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateArrivalThresholdExceeded)).FirstOrDefault();
									}
									else
									{
										thresholdExceeded = validationResult.Select(v => Convert.ToBoolean(v.EarlyDepartureThresholdExceeded)).FirstOrDefault() ||
															validationResult.Select(v => Convert.ToBoolean(v.LateDepartureThresholdExceeded)).FirstOrDefault();
									}
								}
								break;
						}

						if (thresholdExceeded)
						{
							//arrival or departure time exceeded the client threshold so place in queue for approval
							switch (args.LoadBussinessUnit)
							{
								case "T":
									//trucking
									using (Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTableAdapter statusAdapt = new Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTableAdapter())
									{
										Datasets.dsDispatch.LoadStatusUpdate_PendingDataTable tbl = new Datasets.dsDispatch.LoadStatusUpdate_PendingDataTable();
										Datasets.dsDispatch.LoadStatusUpdate_PendingRow row = tbl.NewLoadStatusUpdate_PendingRow();

										row.LoadStopId = args.StopId;
										row.DateType = args.StatusDateType == StatusDateType.Arrival ? "A" : "D";

										tbl.Rows.Add(row);
										statusAdapt.Update(tbl);
									}
									break;
								case "L":
									//logistics
									using (Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTableAdapter statusAdapt = new Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTableAdapter())
									{
										Datasets.dsLogistics.LoadStatusUpdate_PendingDataTable tbl = new Datasets.dsLogistics.LoadStatusUpdate_PendingDataTable();
										Datasets.dsLogistics.LoadStatusUpdate_PendingRow row = tbl.NewLoadStatusUpdate_PendingRow();

										row.LoadStopId = args.StopId;
										row.DateType = args.StatusDateType == StatusDateType.Arrival ? "A" : "D";

										tbl.Rows.Add(row);
										statusAdapt.Update(tbl);
									}
									break;
							}

							return;
						}
					}

				}
			}

			//threshold not exceeded, or approving update, so send status
			using (Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter controlAdapt = new Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter())
			{
				var controlRow = controlAdapt.GetData().FirstOrDefault();

				if (controlRow != null)
				{
					senderInterchangeId = mode == "P" ? controlRow.SenderInterchangeId : controlRow.SenderInterchangeIdTest;
					senderInterchangeIdQualifier = controlRow.SenderInterchangeIdQualifier;
					senderAlphaCode = mode == "P" ? controlRow.SenderAlphaCode : controlRow.SenderAlphaCodeTest;
					senderAs2Id = mode == "P" ? controlRow.SenderAs2Id : controlRow.SenderAs2IdTest;
				}
			}

			using (Datasets.dsClientTableAdapters.ClientEdiTableAdapter ediAdapt = new Datasets.dsClientTableAdapters.ClientEdiTableAdapter())
			{
				Datasets.dsClient.ClientEdiRow ediRow = ediAdapt.GetData(clientId).FirstOrDefault();

				if (ediRow != null)
				{
					//insert edi specific data into edi outgoing table
					using (Datasets.dsEDILoadTendersTableAdapters.Outgoing_212TableAdapter outgoingAdapt = new Datasets.dsEDILoadTendersTableAdapters.Outgoing_212TableAdapter())
					{
						Datasets.dsEDILoadTenders.Outgoing_212DataTable outgoing = new Datasets.dsEDILoadTenders.Outgoing_212DataTable();
						Datasets.dsEDILoadTenders.Outgoing_212Row outgoingRow = outgoing.NewOutgoing_212Row();

						//outgoingRow.ShipmentNumber = customerLoadNumber;
						outgoingRow.StatusId = "O";
						outgoingRow.TransactionSet = "212";
						outgoingRow.DateSent = DateTime.Now;
						outgoingRow.SenderId = senderInterchangeId;
						outgoingRow.SenderIdQualifier = senderInterchangeIdQualifier;
						outgoingRow.SenderAlphaId = senderAlphaCode;
						outgoingRow.SenderAs2Id = senderAs2Id;
						outgoingRow.ReceiverIdQualifier = ediRow.InterchangeIdQualifier;
						outgoingRow.ReceiverId = mode == "P" ? ediRow.InterchangeId : ediRow.InterchangeIdTest;
						outgoingRow.ReceiverAlphaId = ediRow.CarrierAlphaCode;
						outgoingRow.ReceiverUrl = mode == "P" ? ediRow.As2Url : ediRow.As2UrlTest;
						outgoingRow.ReceiverAs2Id = mode == "P" ? ediRow.As2Id : ediRow.As2IdTest;
						outgoingRow.ReceiverGsId = mode == "P" ? ediRow.GSId : ediRow.GSIdTest;
						//outgoingRow.Mode = mode;

						//insert load specific data into edi outgoing table
						string businessReferenceIds = "";
						string businessReferenceIdQualifiers = "";

						using (Datasets.dsDispatchTableAdapters.QueriesTableAdapter adapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter())
						{
							outgoingRow.ReferenceIdentification = adapt.GetTripNumber(args.LoadId).ToString();
							outgoingRow.ShipmentNumber = adapt.GetCustomerLoadNumber(args.LoadId).ToString();
						}

						//set status date and time
						outgoingRow.ShipmentStatusDateTime = args.StatusDate;

						//set pick/drop status or appointment status
						if (args.StatusType == ShipmentStatusType.Appointment)
						{
							outgoingRow.ShipmentAppointmentStatusCode = args.StatusCode;
						}
						else if (args.StatusType == ShipmentStatusType.StatusChange)
						{
							outgoingRow.ShipmentStatusCode = args.StatusCode;
						}

						switch (bussinessUnit)
						{
							case "T":
								//trucking load - get the business instructions for the stop
								using (Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
								{
									var dispatchTable = dispatchAdapt.GetData(args.LoadId, args.StopNumber);

									if (dispatchTable != null)
									{
										foreach (Datasets.dsDispatch.LoadStop_ReferenceNumbersRow dispatchRow in dispatchTable)
										{
											businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + dispatchRow.ReferenceIdentification;
											businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + dispatchRow.ReferenceIdentificationQualifierCode;
										}
									}
								}
								break;

							case "L":
								//logistics load - get the business instructions for the stop
								using (Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter logisticsAdapt = new Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
								{
									var logisticsTable = logisticsAdapt.GetData(args.LoadId, args.StopNumber);

									if (logisticsTable != null)
									{
										foreach (Datasets.dsLogistics.LoadStop_ReferenceNumbersRow logisticsRow in logisticsTable)
										{
											businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + logisticsRow.ReferenceIdentification;
											businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + logisticsRow.ReferenceIdentificationQualifierCode;
										}
									}
								}
								break;
						}

						outgoingRow.BusinessInstructionsReferenceIdentification = businessReferenceIds;
						outgoingRow.BusinessInstructionsReferenceIdentificationQualifier = businessReferenceIdQualifiers;

						outgoing.Rows.Add(outgoingRow);
						outgoingAdapt.Update(outgoing);

						LoadLogger.LogEvent(LoadLogEventType.EDILoadStatusSent, args.ShipmentNumber, args.TenderId, args.LoadId, args.StopId);
					}
				}
			}
		}

		//#region 210 - Send Invoice to Client

		//public static void SendInvoiceToClient(int personId, int loadId, string mode)
		//{
		//	string senderInterchangeId = "";
		//	string senderInterchangeIdQualifier = "";
		//	string senderAlphaCode = "";
		//	string receiverInterchangeId = "";
		//	string receiverInterchangeIdQualifier = "";
		//	string receiverAlphaCode = "";
		//	int clientId = 0;

		//	//get sender ids
		//	using (Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter controlAdapt = new Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter())
		//	{
		//		var controlRow = controlAdapt.GetData().FirstOrDefault();

		//		if (controlRow != null)
		//		{
		//			senderInterchangeId = controlRow.SenderInterchangeId;
		//			senderInterchangeIdQualifier = controlRow.SenderInterchangeIdQualifier;
		//			senderAlphaCode = controlRow.SenderAlphaCode;
		//		}
		//	}

		//	//get receiver ids


		//	//insert row into edi outgoing table where it will be sent to the client via the EDI service
		//	using (Datasets.dsClientTableAdapters.ClientEdiTableAdapter ediAdapt = new Datasets.dsClientTableAdapters.ClientEdiTableAdapter())
		//	{
		//		Datasets.dsClient.ClientEdiRow ediRow = ediAdapt.GetData(clientId).FirstOrDefault();

		//		if (ediRow != null)
		//		{
		//			//insert edi specific data into edi outgoing table
		//			using (Datasets.dsEDILoadTendersTableAdapters.Outgoing_210TableAdapter outgoingAdapt = new Datasets.dsEDILoadTendersTableAdapters.Outgoing_210TableAdapter())
		//			{
		//				Datasets.dsEDILoadTenders.Outgoing_210DataTable outgoing = new Datasets.dsEDILoadTenders.Outgoing_210DataTable();
		//				Datasets.dsEDILoadTenders.Outgoing_210Row outgoingRow = outgoing.NewOutgoing_210Row();

		//				//outgoingRow.ShipmentNumber = customerLoadNumber;
		//				outgoingRow.TransactionSet = "210";
		//				outgoingRow.StatusId = "O";
		//				outgoingRow.DateSent = DateTime.Today;
		//				outgoingRow.SenderIdQualifier = senderInterchangeIdQualifier;
		//				outgoingRow.SenderId = senderInterchangeId;
		//				outgoingRow.SenderAlphaId = senderAlphaCode;
		//				outgoingRow.ReceiverIdQualifier = ediRow.InterchangeIdQualifier;
		//				outgoingRow.ReceiverId = ediRow.InterchangeId;
		//				outgoingRow.ReceiverAlphaId = ediRow.CarrierAlphaCode;
		//				outgoingRow.ReceiverUrl = ediRow.As2Url;
		//				//outgoingRow.Mode = mode;

		//				//insert load specific data into edi outgoing table
		//				string businessReferenceIds = "";
		//				string businessReferenceIdQualifiers = "";

		//				using (Datasets.dsDispatchTableAdapters.QueriesTableAdapter adapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter())
		//				{
		//					outgoingRow.ReferenceIdentification = adapt.GetTripNumber(args.LoadId).ToString();
		//					outgoingRow.ShipmentNumber = adapt.GetCustomerLoadNumber(args.LoadId).ToString();
		//				}

		//				//set status date and time
		//				outgoingRow.ShipmentStatusDateTime = args.StatusDate;

		//				//set pick/drop status or appointment status
		//				if (args.StatusType == ShipmentStatusType.Appointment)
		//				{
		//					outgoingRow.ShipmentAppointmentStatusCode = args.StatusCode;
		//				}
		//				else if (args.StatusType == ShipmentStatusType.StatusChange)
		//				{
		//					outgoingRow.ShipmentStatusCode = args.StatusCode;
		//				}

		//				outgoingRow.TruckNumber = args.TruckNumber;
		//				outgoingRow.TrailerNumber = args.TrailerNumber;

		//				switch (bussinessUnit)
		//				{
		//					case "T":
		//						//trucking load - get the business instructions for the stop
		//						using (Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
		//						{
		//							var dispatchTable = dispatchAdapt.GetData(args.LoadId, args.StopNumber);

		//							if (dispatchTable != null)
		//							{
		//								foreach (Datasets.dsDispatch.LoadStop_ReferenceNumbersRow dispatchRow in dispatchTable)
		//								{
		//									businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + dispatchRow.ReferenceIdentification;
		//									businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + dispatchRow.ReferenceIdentificationQualifierCode;
		//								}
		//							}
		//						}
		//						break;

		//					case "L":
		//						//logistics load - get the business instructions for the stop
		//						using (Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter logisticsAdapt = new Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
		//						{
		//							var logisticsTable = logisticsAdapt.GetData(args.LoadId, args.StopNumber);

		//							if (logisticsTable != null)
		//							{
		//								foreach (Datasets.dsLogistics.LoadStop_ReferenceNumbersRow logisticsRow in logisticsTable)
		//								{
		//									businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + logisticsRow.ReferenceIdentification;
		//									businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + logisticsRow.ReferenceIdentificationQualifierCode;
		//								}
		//							}
		//						}
		//						break;
		//				}

		//				outgoingRow.BusinessInstructionsReferenceIdentification = businessReferenceIds;
		//				outgoingRow.BusinessInstructionsReferenceIdentificationQualifier = businessReferenceIdQualifiers;

		//				outgoing.Rows.Add(outgoingRow);
		//				outgoingAdapt.Update(outgoing);

		//				LoadLogger.LogEvent(LoadLogEventType.LoadStatusUpdated, args.LoadId, args.StopId);
		//			}
		//		}
		//	}
		//}

		//#endregion

		//public static void SendStatusChangeToClient(string bussinessUnit, int tripNumber, int stopId, string customerLoadNumber, int clientId, Int16 currentStatus)
		//{
		//	var notify = false;
		//	var ediStatus = "";

		//	//if the new status is flagged as requiring a send to the client via EDI then send it
		//	using (Datasets.dsLoadStatusTableAdapters.LoadStatusTypeTableAdapter adaptStatusType = new Datasets.dsLoadStatusTableAdapters.LoadStatusTypeTableAdapter())
		//	{
		//		var row = adaptStatusType.GetData(currentStatus).Where(s => s.LoadStatusTypeId == currentStatus).FirstOrDefault();

		//		if (row != null)
		//		{
		//			notify = row.Notify;
		//			ediStatus = row.EdiStatusId;
		//		}

		//		//status is set to notify edi client of status change so check if client is an edi client
		//		if (notify)
		//		{
		//			using (Datasets.dsClientTableAdapters.ClientTableAdapter clientAdapt = new Datasets.dsClientTableAdapters.ClientTableAdapter())
		//			{
		//				notify = clientAdapt.GetData(clientId).Select(c => c.EdiInd).FirstOrDefault() == true;
		//			}
		//		}
		//	}

		//	if (notify)
		//	{
		//		string senderInterchangeId = "";
		//		string senderInterchangeIdQualifier = "";
		//		string senderAlphaCode = "";

		//		using(Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter controlAdapt = new Datasets.dsEDILoadTendersTableAdapters.ControlTableAdapter())
		//		{
		//			var controlRow = controlAdapt.GetData().FirstOrDefault();

		//			if (controlRow != null)
		//			{
		//				senderInterchangeId = controlRow.SenderInterchangeId;
		//				senderInterchangeIdQualifier = controlRow.SenderInterchangeIdQualifier;
		//				senderAlphaCode = controlRow.SenderAlphaCode;
		//			}
		//		}

		//		using (Datasets.dsClientTableAdapters.ClientEdiTableAdapter ediAdapt = new Datasets.dsClientTableAdapters.ClientEdiTableAdapter())
		//		{
		//			Datasets.dsClient.ClientEdiRow ediRow = ediAdapt.GetData(clientId).FirstOrDefault();

		//			if (ediRow != null)
		//			{
		//				//insert edi specific data into edi outgoing table
		//				using (Datasets.dsEDILoadTendersTableAdapters.Outgoing_214TableAdapter outgoingAdapt = new Datasets.dsEDILoadTendersTableAdapters.Outgoing_214TableAdapter())
		//				{
		//					Datasets.dsEDILoadTenders.Outgoing_214DataTable outgoing = new Datasets.dsEDILoadTenders.Outgoing_214DataTable();
		//					Datasets.dsEDILoadTenders.Outgoing_214Row outgoingRow = outgoing.NewOutgoing_214Row();

		//					outgoingRow.ShipmentNumber = customerLoadNumber;
		//					outgoingRow.StatusId = "O";
		//					outgoingRow.TransactionSet = "214";
		//					outgoingRow.DateSent = DateTime.Today;
		//					outgoingRow.ReceiverIdQualifier = ediRow.InterchangeIdQualifier;
		//					outgoingRow.ReceiverId = ediRow.InterchangeId;
		//					outgoingRow.ReceiverAlphaId = ediRow.CarrierAlphaCode;
		//					outgoingRow.ReceiverUrl = ediRow.As2Url;
		//					outgoingRow.SenderIdQualifier = senderInterchangeIdQualifier;
		//					outgoingRow.SenderId = senderInterchangeId;
		//					outgoingRow.SenderAlphaId = senderAlphaCode;
		//					//outgoingRow.Mode = mode;

		//					//insert load specific data into edi outgoing table
		//					string businessReferenceIds = "";
		//					string businessReferenceIdQualifiers = "";

		//					outgoingRow.ReferenceIdentification = tripNumber.ToString();

		//					switch(bussinessUnit)
		//					{
		//						case "T":
		//							//trucking load - get the business instructions for the stop
		//							using (Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter dispatchAdapt = new Datasets.dsDispatchTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
		//							{
		//								var dispatchTable = dispatchAdapt.GetData(stopId);

		//								if (dispatchTable != null)
		//								{
		//									foreach (Datasets.dsDispatch.LoadStop_ReferenceNumbersRow dispatchRow in dispatchTable)
		//									{
		//										businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + dispatchRow.ReferenceIdentification;
		//										businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + dispatchRow.ReferenceIdentificationQualifierCode;
		//									}
		//								}
		//							}
		//							break;

		//						case "L":
		//							//logistics load - get the business instructions for the stop
		//							using (Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter logisticsAdapt = new Datasets.dsLogisticsTableAdapters.LoadStop_ReferenceNumbersTableAdapter())
		//							{
		//								var logisticsTable = logisticsAdapt.GetData(stopId);

		//								if (logisticsTable != null)
		//								{
		//									foreach (Datasets.dsLogistics.LoadStop_ReferenceNumbersRow logisticsRow in logisticsTable)
		//									{
		//										businessReferenceIds += (businessReferenceIds == "" ? "" : ",") + logisticsRow.ReferenceIdentification;
		//										businessReferenceIdQualifiers += (businessReferenceIdQualifiers == "" ? "" : ",") + logisticsRow.ReferenceIdentificationQualifierCode;
		//									}
		//								}
		//							}
		//							break;
		//					}

		//					outgoingRow.BusinessInstructionsReferenceIdentification = businessReferenceIds;
		//					outgoingRow.BusinessInstructionsReferenceIdentificationQualifier = businessReferenceIdQualifiers;

		//					outgoing.Rows.Add(outgoingRow);
		//					outgoingAdapt.Update(outgoing);
		//				}
		//			}
		//		}
		//	}
		//}

		#region Enums

		public enum StatusDateType
		{
			Arrival,
			Departure,
			Scheduled
		}

		public enum ShipmentStatusType
		{
			StatusChange,
			Appointment
		}




		#endregion

	}
}