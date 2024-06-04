using System.Web;

namespace RedbonePlatform.Services
{
	public static class LoadLogger
	{

		public static void LogEvent(LoadLogEventType eventTypeId, string customerLoadNumber, int tenderId = 0, int loadId = 0, int stopId = 0, string tripNumber = "", string extraInformation = "")
		{
			Classes.Auth auth = (Classes.Auth)HttpContext.Current.Session["Auth"];
			int personId = auth.PersonId;

			//get the email template
			using (Datasets.dsLoadLoggerTableAdapters.LoadLoggerTableAdapter adapt = new Datasets.dsLoadLoggerTableAdapters.LoadLoggerTableAdapter())
			{
				using (Datasets.dsLoadLogger.LoadLoggerDataTable tbl = new Datasets.dsLoadLogger.LoadLoggerDataTable())
				{
					var logRow = tbl.NewLoadLoggerRow();

					logRow.LogEventTypeId = (int)eventTypeId;
					logRow.TenderId = tenderId;
					logRow.LoadId = loadId;
					logRow.StopId = stopId;
					logRow.TripNumber = tripNumber;
					logRow.CustomerLoadNumber = customerLoadNumber;
					logRow.ExtraInformation = extraInformation;
					logRow.PersonId = personId;

					tbl.Rows.Add(logRow);
					adapt.Update(tbl);
				}
			}
		}

		public enum LoadLogEventType
		{
			TenderReceived = 1,
			TenderAccepted = 2,
			TenderDeclined = 3,
			TenderUpdated = 4,
			TenderCancelled = 5,
			LoadCreatedTrucking = 6,
			LoadCreatedLogistics = 7,
			LoadCopied = 8,
			LoadUpdated = 9,
			LoadStatusChanged = 10,
			EDILoadPickAppointmentSent = 11,
			EDILoadDropAppointmentSent = 12,
			EDILoadStatusSent = 13,
			EDILoadInvoiceSent = 14,
			LoadMovedToTrucking = 15,
			LoadMovedToLogistics = 16
		}

	}
}