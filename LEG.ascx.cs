using RedbonePlatform.Classes;
using RedbonePlatform.Datasets;
using RedbonePlatform.Datasets.dsPersonEdit_DriverInfoTableAdapters;
using System;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using static RedbonePlatform.Datasets.dsPersonEdit_DriverInfo;

namespace RedbonePlatform.UserControls
{
	public partial class LEG : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            RadComboBox_FleetManager.Enabled = false;

            //drivers editable
            Boolean bDriversAreEditable = false;
            bDriversAreEditable = getDriversAreEditable(Convert.ToInt32(HiddenField_PunitId.Value));
            setDriversSelectable(bDriversAreEditable);
            //RadAjaxManager manager = RadAjaxManager.GetCurrent(Page);
            //if (manager != null)
            //{
            //    manager.AjaxRequest += new RadAjaxControl.AjaxRequestDelegate(Manager_AjaxRequest);
            //}
        }

		//void Manager_AjaxRequest(object sender, AjaxRequestEventArgs e)
		//{
		//    // ScriptManager.GetCurrent(Page).AsyncPostBackSourceElementID; //you get the initiator here or in the e.Args where you have passed the arg as part of the AjaxRequest()
		//    if (e.Argument.Equals("SaveLEGNotes"))
		//    {
		//        // Check to see if Load is locked by another user:
		//        if (LockedUserChanged())
		//            return;

		//        // Update RadEditor text to the DB..
		//        string content = RadEditor_Notes.Content;
		//        Int32 LoadStopId = Convert.ToInt32(HiddenField_LoadStopId.Value);
		//        Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
		//        qry.LoadStopNotes_Update(content, LoadStopId);
		//        //RadWindowManager1.RadAlert("Notes Saved!", 200, 130, "Notes Saved!", "");
		//    }
		//}

		protected void RadComboBox_Customer_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
		{
			int ClientId = (e.Value != "" ? Convert.ToInt32(e.Value) : 0);
			PopulateCustomerAddress(ClientId);
			SaveStop();
		}

		public void PopulateCustomerAddress(int ClientId)
		{
			if (ClientId > 0)
			{
				HiddenField_ClientId.Value = ClientId.ToString();

				// Populate Client Name
				Datasets.dsDispatchTableAdapters.ClientLEGTableAdapter adaptClient = new Datasets.dsDispatchTableAdapters.ClientLEGTableAdapter();
				Datasets.dsDispatch.ClientLEGDataTable tblClient = adaptClient.GetDataBy(ClientId);
				RadComboBox_Customer.Text = tblClient[0].ClientName;


                if (tblClient[0].ThirdPartyTrailerInd)
                {
                    Label_CustomerThirdParty.Text = "Attention: Customer Uses Third Party Trailers";
                    HiddenField_TrailerShowThirdParty.Value = "true";
                }
                else
                {
                    Label_CustomerThirdParty.Text = "";
                    HiddenField_TrailerShowThirdParty.Value = "false";
                }

                RadComboBox_Trailer1.DataBind();
                RadComboBox_Trailer2.DataBind();



                if (ClientId == 248 || ClientId == 205) // adhoc
                {
                    // Adhoc Client fields
                    Label_ClientAddress.Visible = false;
                    tblAdhoc.Visible = true;
                    RadTextBox_AdhocClientName.Visible = true;
                    RadTextBox_AdhocClientAddressLine1.Visible = true;
                    RadTextBox_AdhocClientAddressLine2.Visible = true;
                    RadTextBox_AdhocClientCity.Visible = true;
                    RadTextBox_AdhocClientState.Visible = true;
                    RadMaskedTextBox_AdhocClientZip.Visible = true;
                    RadTextBox_AdhocTimezone.Visible = true;
                }
                else
                {
                    // Hide adhoc items
                    Label_ClientAddress.Visible = true;
                    tblAdhoc.Visible = false;
                    RadTextBox_AdhocClientName.Visible = false;
                    RadTextBox_AdhocClientAddressLine1.Visible = false;
                    RadTextBox_AdhocClientAddressLine2.Visible = false;
                    RadTextBox_AdhocClientCity.Visible = false;
                    RadTextBox_AdhocClientState.Visible = false;
                    RadMaskedTextBox_AdhocClientZip.Visible = false;
                    RadTextBox_AdhocTimezone.Visible = false;

					// Lookup Customer Address to populate
					Datasets.dsDispatchTableAdapters.ClientAddressTableAdapter adapt = new Datasets.dsDispatchTableAdapters.ClientAddressTableAdapter();
					Datasets.dsDispatch.ClientAddressDataTable tbl = adapt.GetData(ClientId);

					// if there is an address, populate the Client Address under the Client
					if (tbl.Rows.Count > 0)
					{
						string Address = "";
						Datasets.dsDispatch.ClientAddressRow row = tbl[0];
						Address += row.IsAddressLine1Null() ? "" : row.AddressLine1.Trim() + "<br />";
						Address += row.IsAddressLine2Null() ? "" : row.AddressLine2.Trim() + "<br />";
						Address += row.IsCityNull() ? "" : row.City.Trim();
						Address += row.IsStateNull() ? "" : ", " + row.State.Trim();
						Address += row.IsZipCodeNull() ? "" : " " + row.ZipCode.Trim();

						// Lookup the first two contacts and their phone numbers. Put link to open each contact in People Management
						Datasets.dsDispatchTableAdapters.ContactAndPhoneNoTableAdapter adapt_Contact = new Datasets.dsDispatchTableAdapters.ContactAndPhoneNoTableAdapter();
						Datasets.dsDispatch.ContactAndPhoneNoDataTable tblContact = adapt_Contact.GetData(row.ClientId);

						if (tblContact.Rows.Count > 0)
						{
							Int16 iCounter = 1;
							Address += "<br />";
							foreach (Datasets.dsDispatch.ContactAndPhoneNoRow rowContact in tblContact)
							{
								if (iCounter == 3) break; // display top 2

								Address += "<br />" + rowContact.ContactName + ' ' + rowContact.PhoneNumber;
								iCounter++;
							}
						}
						Label_ClientAddress.Text = Address;
					}
					else
					{
						Label_ClientAddress.Text = "No Address On File for this Customer!";
					}
				}
			}
			else
			{
				HiddenField_ClientId.Value = "0";
				RadComboBox_Customer.Text = "";
				Label_ClientAddress.Text = "";

                // Hide adhoc items
                Label_ClientAddress.Visible = true;
                tblAdhoc.Visible = false;
                RadTextBox_AdhocClientName.Visible = false;
                RadTextBox_AdhocClientAddressLine1.Visible = false;
                RadTextBox_AdhocClientAddressLine2.Visible = false;
                RadTextBox_AdhocClientCity.Visible = false;
                RadTextBox_AdhocClientState.Visible = false;
                RadMaskedTextBox_AdhocClientZip.Visible = false;
                RadTextBox_AdhocTimezone.Visible = false;
            }


 

        }

		public int LoadStopId
		{
			get { return Convert.ToInt32(HiddenField_LoadStopId.Value); }
			set
			{
				HiddenField_LoadStopId.Value = value.ToString();

				Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adapt = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();
				Datasets.dsDispatch.LoadStopRow row = adapt.GetCertainStop(Convert.ToInt32(value))[0];

				HiddenField_LoadId.Value = row.LoadId.ToString();

				PopulateCustomerAddress(row.IsClientIdNull() ? 0 : row.ClientId);

				RadButton_Notes.Text = "Notes";

				if (row.NoteCount > 0)
				{
					RadButton_Notes.Text += " (" + row.NoteCount.ToString() + ")";
				}

				// Populate Drop Start Date/Time fields.
				if (!row.IsDropStartDateTimeNull())
				{
					// Populate Date
					RadDatePicker_DropStartDate.SelectedDate = row.DropStartDateTime.Date;

					// Populate time if being used
					if (!row.IsDropStartDateTime_DisplayTimeIndNull() && row.DropStartDateTime_DisplayTimeInd)
						RadTimePicker_DropStartTime.SelectedTime = row.DropStartDateTime.TimeOfDay;
					else
						RadTimePicker_DropStartTime.SelectedTime = null;
				}
				else
				{
					RadDatePicker_DropStartDate.SelectedDate = null;
					RadTimePicker_DropStartTime.SelectedTime = null;
				}

				// Populate Start Date/Time fields.
				if (!row.IsStartDateTimeNull())
				{
					// Populate Date
					RadDatePicker_StartDate.SelectedDate = row.StartDateTime.Date;

					// Populate time if being used
					if (!row.IsStartDateTime_DisplayTimeIndNull() && row.StartDateTime_DisplayTimeInd)
						RadTimePicker_StartTime.SelectedTime = row.StartDateTime.TimeOfDay;
					else
						RadTimePicker_StartTime.SelectedTime = null;
				}
				else
				{
					RadDatePicker_StartDate.SelectedDate = null;
					RadTimePicker_StartTime.SelectedTime = null;
				}

				// Populate Throught Date/Time fields
				if (!row.IsThroughDateTimeNull())
				{
					// Populate Date
					RadDatePicker_ThroughDate.SelectedDate = row.ThroughDateTime.Date;

					// Populate time if being used
					if (!row.IsThroughDateTime_DisplayTimeIndNull() && row.ThroughDateTime_DisplayTimeInd)
						RadTimePicker_ThroughTime.SelectedTime = row.ThroughDateTime.TimeOfDay;
					else
						RadTimePicker_ThroughTime.SelectedTime = null;
				}
				else
				{
					RadDatePicker_ThroughDate.SelectedDate = null;
					RadTimePicker_ThroughTime.SelectedTime = null;
				}


				// Populate Arrival Date/Time fields
				if (!row.IsArrivalDateTimeNull())
				{
					RadDatePicker_ArrivalDate.SelectedDate = row.ArrivalDateTime.Date;
					RadTimePicker_ArrivalTime.SelectedTime = row.ArrivalDateTime.TimeOfDay;
				}
				else
				{
					RadDatePicker_ArrivalDate.SelectedDate = null;
					RadTimePicker_ArrivalTime.SelectedTime = null;
				}

				//RadEditor_Notes.Content = row.IsNotesNull() ? "" : row.Notes;

				RadDropDownList_ApptOrFCFS.SelectedValue = row.IsLoadApptTypeIdNull() ? null : row.LoadApptTypeId.ToString();

                HiddenField_FleetManagerPersonId.Value = row.IsDispatchFleetManagerIdNull() ? "0" : row.DispatchFleetManagerId.ToString();
                RadComboBox_FleetManager.Items.Clear();
                RadComboBox_FleetManager.Items.Add(new RadComboBoxItem("-Driver Manager-", "0"));
                RadComboBox_FleetManager.DataBind();
                RadComboBox_FleetManager.SelectedValue = row.IsDispatchFleetManagerIdNull() ? null : row.DispatchFleetManagerId.ToString();

                HiddenField_Driver1PersonId.Value = row.IsDriver1_PersonIdNull() ? "0" : row.Driver1_PersonId.ToString();
				RadComboBox_Driver1.Items.Clear();
				RadComboBox_Driver1.Items.Add(new RadComboBoxItem("-Driver #1-", "0"));
				RadComboBox_Driver1.DataBind();
				RadComboBox_Driver1.SelectedValue = row.IsDriver1_PersonIdNull() ? null : row.Driver1_PersonId.ToString();
				DriverExpirationLogic(Convert.ToInt32(HiddenField_Driver1PersonId.Value), RadComboBox_Driver1, RadToolTip_RadComboBox_Driver1, false);

				HiddenField_Driver2PersonId.Value = row.IsDriver2_PersonIdNull() ? "0" : row.Driver2_PersonId.ToString();
				RadComboBox_Driver2.Items.Clear();
				RadComboBox_Driver2.Items.Add(new RadComboBoxItem("-Driver #2-", "0"));
				RadComboBox_Driver2.DataBind();
				RadComboBox_Driver2.SelectedValue = row.IsDriver2_PersonIdNull() ? null : row.Driver2_PersonId.ToString();
				DriverExpirationLogic(Convert.ToInt32(HiddenField_Driver2PersonId.Value), RadComboBox_Driver2, RadToolTip_RadComboBox_Driver2, false);

				HiddenField_TrailerId1.Value = row.IsTrailer1_TrailerIdNull() ? "0" : row.Trailer1_TrailerId.ToString();
				RadComboBox_Trailer1.Items.Clear();
				RadComboBox_Trailer1.Items.Add(new RadComboBoxItem("-Trailer #1-", "0"));
				RadComboBox_Trailer1.DataBind();
				RadComboBox_Trailer1.SelectedValue = row.IsTrailer1_TrailerIdNull() ? null : row.Trailer1_TrailerId.ToString();
				TrailerExpirationLogic(Convert.ToInt16(HiddenField_TrailerId1.Value), RadComboBox_Trailer1, RadToolTip_RadComboBox_Trailer1, false);

				HiddenField_TrailerId2.Value = row.IsTrailer2_TrailerIdNull() ? "0" : row.Trailer2_TrailerId.ToString();
				RadComboBox_Trailer2.Items.Clear();
				RadComboBox_Trailer2.Items.Add(new RadComboBoxItem("-Trailer #2-", "0"));
				RadComboBox_Trailer2.DataBind();
				RadComboBox_Trailer2.SelectedValue = row.IsTrailer2_TrailerIdNull() ? null : row.Trailer2_TrailerId.ToString();
				TrailerExpirationLogic(Convert.ToInt16(HiddenField_TrailerId2.Value), RadComboBox_Trailer2, RadToolTip_RadComboBox_Trailer2, false);

				HiddenField_PunitId.Value = row.IsTruckPunitIdNull() ? "0" : row.TruckPunitId.ToString();
				RadComboBox_Truck1.Items.Clear();
				RadComboBox_Truck1.Items.Add(new RadComboBoxItem("-Truck #1-", "0"));
				RadComboBox_Truck1.DataBind();
				RadComboBox_Truck1.SelectedValue = row.IsTruckPunitIdNull() ? null : row.TruckPunitId.ToString();
				TruckExpirationLogic(Convert.ToInt32(HiddenField_PunitId.Value), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, false);

				// Load Adhoc items if Adhoc Location is set
				if (!row.IsClientIdNull() && (row.ClientId == 248 | row.ClientId == 205)) // Adhoc
				{
					RadTextBox_AdhocClientName.Text = row.IsAdhocClientNameNull() ? "" : row.AdhocClientName;
					RadTextBox_AdhocClientAddressLine1.Text = row.IsAdhocClientAddressLine1Null() ? "" : row.AdhocClientAddressLine1;
					RadTextBox_AdhocClientAddressLine2.Text = row.IsAdhocClientNameNull() ? "" : row.AdhocClientAddressLine2;
					RadTextBox_AdhocClientCity.Text = row.IsAdhocClientNameNull() ? "" : row.AdhocClientCity;
					RadTextBox_AdhocClientState.Text = row.IsAdhocClientNameNull() ? "" : row.AdhocClientState;
					RadMaskedTextBox_AdhocClientZip.Text = row.IsAdhocClientNameNull() ? "" : row.AdhocClientZipCode;
					RadTextBox_AdhocTimezone.Text = row.IsAdhocTimeZoneNull() ? "" : row.AdhocTimeZone;
				}

				if (!row.IsPaidMilesNull()) RadNumericTextBox_PaidLoaded.Value = row.PaidMiles; else RadNumericTextBox_PaidLoaded.Value = null;
				if (!row.IsPaidEmptyNull()) RadNumericTextBox_EmptyMiles.Value = row.PaidEmpty; else RadNumericTextBox_EmptyMiles.Value = null;

			}
		}
		public void SaveStop()
		{
			// Check to see if Load is locked by another user:
			if (LockedUserChanged())
				return;

			Int32 LoadStopId = Convert.ToInt32(HiddenField_LoadStopId.Value);

			Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adapt = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();
			Datasets.dsDispatch.LoadStopDataTable tbl = adapt.GetCertainStop(LoadStopId);
			Datasets.dsDispatch.LoadStopRow rowStop = tbl[0];

			tbl.Columns["LastUpdtPersonId"].ReadOnly = false;

			if (RadComboBox_Customer.SelectedValue != "Select Customer-")
			{
				if (RadComboBox_Customer.Text != "" && HiddenField_ClientId.Value != "0")
				{
					rowStop.ClientId = Convert.ToInt32(HiddenField_ClientId.Value);
				}
				else
				{
					rowStop.SetClientIdNull();
				}
			}
			else
			{
				rowStop.ClientId = Convert.ToInt32(RadComboBox_Customer.SelectedValue);
				HiddenField_ClientId.Value = rowStop.ClientId.ToString();
			}

			//get current user's id
			Auth auth = (Auth)Session["Auth"];
			rowStop.LastUpdtPersonId = auth.PersonId;

			// Save Drop Start Date/Time if populated
			DateTime dropStartDateTime = new DateTime();
			TimeSpan dropStartTime = new TimeSpan();

			if (RadDatePicker_DropStartDate.SelectedDate != null)
			{
				dropStartDateTime = Convert.ToDateTime(RadDatePicker_DropStartDate.SelectedDate);

				// Piece together date/time for single DB datetime field.
				if (RadTimePicker_DropStartTime.SelectedTime != null)
				{
					dropStartTime = (TimeSpan)RadTimePicker_DropStartTime.SelectedTime;
					dropStartDateTime = new DateTime(dropStartDateTime.Year, dropStartDateTime.Month, dropStartDateTime.Day, dropStartTime.Hours, dropStartTime.Minutes, dropStartTime.Seconds);
					rowStop.DropStartDateTime_DisplayTimeInd = true;
				}
				else
				{
					rowStop.DropStartDateTime_DisplayTimeInd = false;
				}

				rowStop.DropStartDateTime = dropStartDateTime;
			}
			else
			{
				rowStop.SetDropStartDateTimeNull();
				rowStop.DropStartDateTime_DisplayTimeInd = false;
			}

			// Save Start Date/Time if populated
			DateTime startDateTime = new DateTime();
			TimeSpan startTime = new TimeSpan();

			if (RadDatePicker_StartDate.SelectedDate != null)
			{
				startDateTime = Convert.ToDateTime(RadDatePicker_StartDate.SelectedDate);

				// Piece together date/time for single DB datetime field.
				if (RadTimePicker_StartTime.SelectedTime != null)
				{
					startTime = (TimeSpan)RadTimePicker_StartTime.SelectedTime;
					startDateTime = new DateTime(startDateTime.Year, startDateTime.Month, startDateTime.Day, startTime.Hours, startTime.Minutes, startTime.Seconds);
					rowStop.StartDateTime_DisplayTimeInd = true;
				}
				else
				{
					rowStop.StartDateTime_DisplayTimeInd = false;
				}

				rowStop.StartDateTime = startDateTime;
			}
			else
			{
				rowStop.SetStartDateTimeNull();
				rowStop.StartDateTime_DisplayTimeInd = false;
			}

			// Save Through Date/Time if populated
			DateTime throughDateTime = new DateTime();
			TimeSpan throughTime = new TimeSpan();

			if (RadDatePicker_ThroughDate.SelectedDate != null)
			{
				throughDateTime = Convert.ToDateTime(RadDatePicker_ThroughDate.SelectedDate);

				// Piece together date/time for single DB datetime field.
				if (RadTimePicker_ThroughTime.SelectedTime != null)
				{
					throughTime = (TimeSpan)RadTimePicker_ThroughTime.SelectedTime;
					throughDateTime = new DateTime(throughDateTime.Year, throughDateTime.Month, throughDateTime.Day, throughTime.Hours, throughTime.Minutes, throughTime.Seconds);
					rowStop.ThroughDateTime_DisplayTimeInd = true;
				}
				else
				{
					rowStop.ThroughDateTime_DisplayTimeInd = false;
				}

				rowStop.ThroughDateTime = throughDateTime;
			}
			else
			{
				rowStop.SetThroughDateTimeNull();
				rowStop.ThroughDateTime_DisplayTimeInd = false;
			}

			// Save Arrival DateTime 
			if (RadDatePicker_ArrivalDate.SelectedDate != null)
			{
				startDateTime = Convert.ToDateTime(RadDatePicker_ArrivalDate.SelectedDate);

				// Piece together date/time for single DB datetime field.
				if (RadTimePicker_ArrivalTime.SelectedTime != null)
				{
					startTime = (TimeSpan)RadTimePicker_ArrivalTime.SelectedTime;
					startDateTime = new DateTime(startDateTime.Year, startDateTime.Month, startDateTime.Day, startTime.Hours, startTime.Minutes, startTime.Seconds);
				}

				rowStop.ArrivalDateTime = startDateTime;
			}
			else
			{
				rowStop.SetArrivalDateTimeNull();
			}

			if (RadDropDownList_ApptOrFCFS.SelectedValue == "") rowStop.SetLoadApptTypeIdNull(); else rowStop.LoadApptTypeId = Convert.ToInt16(RadDropDownList_ApptOrFCFS.SelectedValue);
			if (RadComboBox_Driver1.SelectedValue == "0") rowStop.SetDriver1_PersonIdNull(); else rowStop.Driver1_PersonId = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
			if (RadComboBox_Driver2.SelectedValue == "0") rowStop.SetDriver2_PersonIdNull(); else rowStop.Driver2_PersonId = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
			if (RadComboBox_Trailer1.SelectedValue == "0") rowStop.SetTrailer1_TrailerIdNull(); else rowStop.Trailer1_TrailerId = Convert.ToInt16(RadComboBox_Trailer1.SelectedValue);
			if (RadComboBox_Trailer2.SelectedValue == "0") rowStop.SetTrailer2_TrailerIdNull(); else rowStop.Trailer2_TrailerId = Convert.ToInt16(RadComboBox_Trailer2.SelectedValue);
            if (RadComboBox_Truck1.SelectedValue == "0") rowStop.SetTruckPunitIdNull(); else rowStop.TruckPunitId = Convert.ToInt32(RadComboBox_Truck1.SelectedValue);
			if (RadComboBox_FleetManager.SelectedValue == "0") rowStop.SetDispatchFleetManagerIdNull(); else rowStop.DispatchFleetManagerId = RadComboBox_FleetManager.SelectedValue;

            Int32 ClientId = 0;
			if (RadComboBox_Customer.SelectedValue != "") ClientId = Convert.ToInt32(RadComboBox_Customer.SelectedValue);

			if (ClientId == 248 || ClientId == 205)
			{
				rowStop.AdhocClientName = RadTextBox_AdhocClientName.Text.Trim();
				rowStop.AdhocClientAddressLine1 = RadTextBox_AdhocClientAddressLine1.Text.Trim();
				rowStop.AdhocClientAddressLine2 = RadTextBox_AdhocClientAddressLine2.Text.Trim();
				rowStop.AdhocClientCity = RadTextBox_AdhocClientCity.Text.Trim();
				rowStop.AdhocClientState = RadTextBox_AdhocClientState.Text.Trim();
				rowStop.AdhocClientZipCode = RadMaskedTextBox_AdhocClientZip.Text;
				rowStop.AdhocTimeZone = RadTextBox_AdhocTimezone.Text.Trim();
			}

			//rowStop.Notes = RadEditor_Notes.Content.Trim();

			if (RadNumericTextBox_EmptyMiles.Value != null) rowStop.PaidEmpty = Convert.ToInt32(RadNumericTextBox_EmptyMiles.Value); else rowStop.SetPaidEmptyNull();
			if (RadNumericTextBox_PaidLoaded.Value != null) rowStop.PaidMiles = Convert.ToInt32(RadNumericTextBox_PaidLoaded.Value); else rowStop.SetPaidMilesNull();

			//Auth auth = (Auth)Session["Auth"];
			//rowStop.LastUpdtPersonId = auth.PersonId;

			adapt.Update(rowStop);
		}

		protected void RadDropDownList_ApptOrFCFS_SelectedIndexChanged(object sender, DropDownListEventArgs e)
		{
			SaveStop();
		}

		protected void RadTextBox_TextChanged(object sender, EventArgs e)
		{
			SaveStop();
		}

		protected void RadComboBox_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
		{
			RadComboBox cbo = (sender as RadComboBox);
			Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
            Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
            Int32 LoadStopId = Convert.ToInt32(HiddenField_LoadStopId.Value);

            Int32? TruckPunitId = null;
            Int32? TruckPunitIdBefore = null;
            Int32? Driver1Id = null;
            Int32? Driver1IdBefore = null;
            Int32? Driver2Id = null;
            Int32? Driver2IdBefore = null;
            Int32? DispatchFleetManagerId = null;
            Int32? DispatchFleetManagerIdBefore = null;
            Int16? Trailer1_TrailerId = null;
            Int16? Trailer2_TrailerId = null;

            // When a Driver is selected, show expired stuff
            switch (cbo.ID)
			{
				case "RadComboBox_Driver1":
					//asdf
                    // If old and new drivers don't match, ensure that the old driver isn't associated with a charge
                    if (e.Value != e.OldValue)
                    {
                        if (driverHasCharges(LoadId, e.OldValue))
                        {
                            RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("This Driver has an associated Charge and can't be changed!"), 500, 130, "Driver has associated Charge!", "");
                            // select old driver again.
                            RadComboBox_Driver1.SelectedValue = e.OldValue;
                            return;
                        }
                    }

                    if (!DriversDuplicateCheck_IsValid())
						RadComboBox_Driver1.SelectedIndex = 0;

					DriverExpirationLogic(Convert.ToInt32(e.Value), RadComboBox_Driver1, RadToolTip_RadComboBox_Driver1, true);
					break;
				case "RadComboBox_Driver2":
					// If old and new drivers don't match, ensure that the old driver isn't associated with a charge
					if (e.Value != e.OldValue)
					{
                        if (driverHasCharges(LoadId, e.OldValue))
                        {
                            RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("This Driver has an associated Charge and can't be changed!"), 500, 130, "Driver has associated Charge!", "");
                            // select old driver again.
                            RadComboBox_Driver2.SelectedValue = e.OldValue;
                            return;
                        }
                    }

					if (!DriversDuplicateCheck_IsValid())
						RadComboBox_Driver2.SelectedIndex = 0;

					DriverExpirationLogic(Convert.ToInt32(e.Value), RadComboBox_Driver2, RadToolTip_RadComboBox_Driver2, true);
					break;
				case "RadComboBox_Trailer1":
					if (!TrailersDuplicateCheck_IsValid())
						RadComboBox_Trailer1.SelectedIndex = 0;

					TrailerExpirationLogic(Convert.ToInt16(e.Value), RadComboBox_Trailer1, RadToolTip_RadComboBox_Trailer1, true);
					break;
				case "RadComboBox_Trailer2":
					if (!TrailersDuplicateCheck_IsValid())
						RadComboBox_Trailer2.SelectedIndex = 0;

					TrailerExpirationLogic(Convert.ToInt16(e.Value), RadComboBox_Trailer2, RadToolTip_RadComboBox_Trailer2, true);
					break;
                case "RadComboBox_Truck1":
                    TruckExpirationLogic(Convert.ToInt32(e.Value), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, true);

                    if (RadComboBox_Truck1.SelectedValue != "0")
                    {
                        TruckPunitId = Convert.ToInt16(RadComboBox_Truck1.SelectedValue);

                        //set 'before change' truck
                        TruckPunitIdBefore = Convert.ToInt32(e.OldValue);

                        //set 'before change' drivers (if need to set back)
                        if (RadComboBox_Driver1.SelectedValue != "0")
                            Driver1IdBefore = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
                        else
                            Driver1IdBefore = null;
                        if (RadComboBox_Driver2.SelectedValue != "0")
                            Driver2IdBefore = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
                        else
                            Driver2IdBefore = null;

                        //don't change driver2 for now...
                        Driver2Id = Driver2IdBefore;

                        //set 'before change' fleet manager
                        if (RadComboBox_FleetManager.SelectedValue != "0")
                            DispatchFleetManagerIdBefore = Convert.ToInt32(RadComboBox_FleetManager.SelectedValue);
                        else
                            DispatchFleetManagerIdBefore = null;

                        Datasets.dsDispatchFleetManagerTableAdapters.vFleetManagerDriverTableAdapter fleetManagerDriverTableAdapt = new Datasets.dsDispatchFleetManagerTableAdapters.vFleetManagerDriverTableAdapter();
                        Datasets.dsDispatchFleetManager.vFleetManagerDriverRow fleetManagerDriverRow = null;

                        fleetManagerDriverRow = fleetManagerDriverTableAdapt.GetData().Where(vFMD => vFMD.PunitId == TruckPunitId).FirstOrDefault();
                        if (fleetManagerDriverRow != null)
                        {
                            if (!fleetManagerDriverRow.IsDispatchFleetManagerIdNull()) DispatchFleetManagerId = fleetManagerDriverRow.DispatchFleetManagerId;
                            if (!fleetManagerDriverRow.IsPersonIdNull()) Driver1Id = fleetManagerDriverRow.PersonId;
                        }

                        if (DispatchFleetManagerId == null && (Driver1Id == null || Driver1Id == 0))
                        {
                            //this is spare truck
                            setDriversSelectable(true);
                        }
                        else
                        {
                            //if the driver driverHasCharges:
                            if (Driver1IdBefore != null && driverHasCharges(LoadId, Driver1IdBefore.ToString()))
                            {
                                RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("This Driver has an associated Charge and can't be changed!"), 500, 130, "Driver has associated Charge!", "");
                                // select old driver again.
                                RadComboBox_Driver1.SelectedValue = Driver1IdBefore.ToString();
                                return;
                            }
                        }

                        try
                        {
                            // Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
                            //asdfqry.sp_Load_SaveTruck(LoadId, TruckPunitId);
                            //asdfqry.sp_Load_SaveDrivers(LoadId, Driver1Id, Driver2Id);
                            qry.sp_LoadStop_SaveFleetManager(LoadId, LoadStopId, DispatchFleetManagerId);
                        }
                        catch (Exception ex)

                        {
                            //revert if all saves don't work
                            //asdfqry.sp_Load_SaveTruck(LoadId, TruckPunitIdBefore);
                            //asdfqry.sp_Load_SaveDrivers(LoadId, Driver1IdBefore, Driver2IdBefore);
                            qry.sp_LoadStop_SaveFleetManager(LoadId, LoadStopId, DispatchFleetManagerIdBefore);

                            RadWindowManager1.RadAlert("An error occurred while saving the selected truck, it&#39;s drivers, or it&#39;s driver manager.<br/><br/>", 400, 150, "Save Error", "ReloadThePage");
                            return;
                        }

                        //update drivers on page
                        RadComboBox_Driver1.SelectedValue = Driver1Id == null ? null : Driver1Id.ToString();
                        RadComboBox_Driver2.SelectedValue = Driver2Id == null ? null : Driver2Id.ToString();
                        RadComboBox_FleetManager.SelectedValue = DispatchFleetManagerId == null ? null : DispatchFleetManagerId.ToString();
                    }
                    break;

				default:
					break;
			}
			// Trailers and truck may have been set back to -Select- state due to expiry, so need to save the value.
			SaveStop();

			Page.Validate();
		}

        private bool getDriversAreEditable(int? truckPunitId)
        {
            bool bDriversAreEditable = false;

            if (truckPunitId != null && truckPunitId != 0)
            {
                Int32? Driver1Id = null;
                Int32? DispatchFleetManagerId = null;

                Datasets.dsDispatchFleetManagerTableAdapters.vFleetManagerDriverTableAdapter fleetManagerDriverTableAdapt = new Datasets.dsDispatchFleetManagerTableAdapters.vFleetManagerDriverTableAdapter();
                Datasets.dsDispatchFleetManager.vFleetManagerDriverRow fleetManagerDriverRow = fleetManagerDriverTableAdapt.GetData().Where(vFMD => vFMD.PunitId == truckPunitId).FirstOrDefault();

                if (fleetManagerDriverRow != null)
                {
                    if (!fleetManagerDriverRow.IsDispatchFleetManagerIdNull()) DispatchFleetManagerId = fleetManagerDriverRow.DispatchFleetManagerId;
                    if (!fleetManagerDriverRow.IsPersonIdNull()) Driver1Id = fleetManagerDriverRow.PersonId;
                }

                if (DispatchFleetManagerId == null && (Driver1Id == null || Driver1Id == 0))
                {
                    //this is spare truck
                    bDriversAreEditable = true;
                }
            }
            return bDriversAreEditable;
        }

        private void setDriversSelectable(bool selectable)
        {
            RadComboBox_Driver1.Enabled = selectable;
            RadComboBox_Driver2.Enabled = selectable;
        }

        private bool driverHasCharges(int loadId, string oldValue)
        {
            Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
            Boolean DriverHasCharge = false;
            qry.sp_DriverInLoadHasChargeInd(loadId, Convert.ToInt32(oldValue), out DriverHasCharge);
            return DriverHasCharge;
        }

        public void DispatchValidation()
		{
			Page.Validate("Dispatch");
		}

		protected void ImageButton_OpenClientEdit_Click(object sender, ImageClickEventArgs e)
		{
			String ClientId = "0";
			ClientId = HiddenField_ClientId.Value;
			String ClientName = RadComboBox_Customer.Text;

			ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "OpenClientEdit", "OpenClientEditInMain('" + ClientId + "','" + ClientName + "');", true);
		}

		protected void RadTimePicker_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
		{
			SaveStop();
		}

		private void DriverExpirationLogic(Int32 PersonId, RadComboBox radComboBox, RadToolTip radToolTip, Boolean showPopupAlertAndReassignToDefaultIfNeeded)
		{
			String DriverText = radComboBox.ID.Contains("Driver1") ? "Driver 1" : "Driver 2";

			if (PersonId != 0 && radComboBox.SelectedIndex != 0)
			{
				Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
				String MsgConsolidated = "";
				Boolean CloseToExpiring = false;
				Boolean AlreadyExpired = false;

				qry.sp_DriverExpirations(PersonId, out MsgConsolidated, out CloseToExpiring, out AlreadyExpired);
				if (MsgConsolidated != "")
				{
					radComboBox.BackColor = (AlreadyExpired ? Color.Red : Color.Yellow);
					radComboBox.ForeColor = (AlreadyExpired ? Color.White : Color.Black);

					radToolTip.Text = DriverText + "<br />" + MsgConsolidated;

					if (showPopupAlertAndReassignToDefaultIfNeeded)
						RadWindowManager1.RadAlert(MsgConsolidated, 400, 150, DriverText, "");
				}
				else
				{
					radComboBox.BackColor = Color.Empty;
					radComboBox.ForeColor = Color.Empty;

					radToolTip.Text = DriverText + " (OTR, Lease Operator, Owner Operator)";
				}
			}
			else
			{
				radComboBox.BackColor = Color.Empty;
				radComboBox.ForeColor = Color.Empty;

				radToolTip.Text = DriverText + " (OTR, Lease Operator, Owner Operator)";
			}
		}

		private void TrailerExpirationLogic(Int16 TrailerId, RadComboBox radComboBox, RadToolTip radToolTip, Boolean showPopupAlertAndReassignToDefaultIfNeeded)
		{
			String TrailerText = radComboBox.ID.Contains("Trailer1") ? "Trailer 1" : "Trailer 2";

			if (TrailerId != 0 && radComboBox.SelectedIndex != 0)
			{
				String MsgConsolidated = "";
				Boolean CloseToExpiring = false;
				Boolean AlreadyExpired = false;
				Boolean TrailerCantBeAssigned = false;

				Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
				qry.sp_TrailerExpirations(TrailerId, out MsgConsolidated, out CloseToExpiring, out AlreadyExpired, out TrailerCantBeAssigned);

				if (MsgConsolidated != "")
				{
					radComboBox.BackColor = (AlreadyExpired ? Color.Red : Color.Yellow);
					radComboBox.ForeColor = (AlreadyExpired ? Color.White : Color.Black);
					radToolTip.Text = TrailerText + "<br />" + MsgConsolidated;

					if (showPopupAlertAndReassignToDefaultIfNeeded)
					{
						if (TrailerCantBeAssigned)
							radComboBox.SelectedIndex = 0;

						RadWindowManager1.RadAlert(MsgConsolidated, 400, 150, TrailerText, "");
					}
				}
				else
				{
					radComboBox.BackColor = Color.Empty;
					radComboBox.ForeColor = Color.Empty;

					radToolTip.Text = TrailerText;
				}
			}
			else
			{
				radComboBox.BackColor = Color.Empty;
				radComboBox.ForeColor = Color.Empty;

				radToolTip.Text = TrailerText;
			}
		}

		private void TruckExpirationLogic(Int32 PunitId, RadComboBox radComboBox, RadToolTip radToolTip, Boolean showPopupAlertAndReassignToDefaultIfNeeded)
		{
			const String TruckText = "Truck 1";


			if (PunitId != 0)
			{
				String MsgConsolidated = "";
				Boolean CloseToExpiring = false;
				Boolean AlreadyExpired = false;
				Boolean TruckCantBeAssigned = false;

				Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
				qry.sp_TruckExpirations(PunitId, out MsgConsolidated, out CloseToExpiring, out AlreadyExpired, out TruckCantBeAssigned, null, Convert.ToInt32(HiddenField_LoadStopId.Value));

				if (MsgConsolidated != "")
				{
					radComboBox.BackColor = (AlreadyExpired ? Color.Red : Color.Yellow);
					radComboBox.ForeColor = (AlreadyExpired ? Color.White : Color.Black);
					radToolTip.Text = TruckText + "<br />" + MsgConsolidated;

					if (showPopupAlertAndReassignToDefaultIfNeeded)
					{
						if (TruckCantBeAssigned)
							radComboBox.SelectedIndex = 0;

						RadWindowManager1.RadAlert(MsgConsolidated, 400, 150, TruckText, "");
					}
				}
				else
				{
					radComboBox.BackColor = Color.Empty;
					radComboBox.ForeColor = Color.Empty;

					radToolTip.Text = TruckText;
				}
			}
			else
			{
				radComboBox.BackColor = Color.Empty;
				radComboBox.ForeColor = Color.Empty;

				radToolTip.Text = TruckText;
			}
		}

		protected void CustomValidator_Drivers_ServerValidate(object source, ServerValidateEventArgs args)
		{
			// Ensure Driver1 and Drvier2 are unique
			args.IsValid = DriversDuplicateCheck_IsValid();
		}

		//Ensure unique drivers are entered
		private Boolean DriversDuplicateCheck_IsValid()
		{
			Boolean bIsValid = true;
			if (RadComboBox_Driver1.SelectedIndex == 0 || RadComboBox_Driver2.SelectedIndex == 0)
				bIsValid = true;
			else
				bIsValid = (RadComboBox_Driver1.SelectedValue != RadComboBox_Driver2.SelectedValue);

			if (!bIsValid)
				RadWindowManager1.RadAlert("Drivers must be Unique!", 300, 150, "Duplicate Drivers", "");

			return bIsValid;
		}

		protected void CustomValidator_Trailers_ServerValidate(object source, ServerValidateEventArgs args)
		{
			// Ensure Driver1 and Drvier2 are unique
			args.IsValid = TrailersDuplicateCheck_IsValid();
		}

		private Boolean TrailersDuplicateCheck_IsValid()
		{
			Boolean bIsValid = true;
			if (RadComboBox_Trailer1.SelectedIndex == 0 || RadComboBox_Trailer2.SelectedIndex == 0)
				bIsValid = true;
			else
				bIsValid = (RadComboBox_Trailer1.SelectedValue != RadComboBox_Trailer2.SelectedValue);

			if (!bIsValid)
				RadWindowManager1.RadAlert("Trailers must be Unique!", 300, 150, "Duplicate Trailers", "");

			return bIsValid;
		}
		private Boolean LockedUserChanged()
		{
			// Determine if Load is currently locked by another user
			Classes.Auth auth = (Classes.Auth)Session["Auth"];
			Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
			Int32 LoadId;
			Int32 LockedPersonId;

			qry.sp_LockedPersonIdAndLoadIdForStops_Get(Convert.ToInt32(HiddenField_LoadStopId.Value), out LockedPersonId, out LoadId);

			if (auth.PersonId != LockedPersonId)
			{
				RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("The Load's lock has been taken over by another user and saves are no loger permitted and the Load will be Closed!"), 500, 130, "Load is now Locked by another user!", "CloseMe2");
				return true;
			}
			return false;
		}

		protected void RadNumericTextBox_TextChanged(object sender, EventArgs e)
		{
			SaveStop();
		}

		protected void RadButton_DispatchLEG_Click(object sender, EventArgs e)
		{
			// Ensure Truck has been entered
			if (RadComboBox_Truck1.SelectedIndex == 0)
			{
				RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("Truck is required to Dispatch!"), 300, 130, "Truck Required!", "");
				return;
			}

			// RadWindowManager1.RadAlert("Development in Progress..", 250, 100, "Under Construction", "");

			// Check to see if Load is locked by another user:
			if (LockedUserChanged())
				return;

			int LoadStopId = Convert.ToInt32(HiddenField_LoadStopId.Value);
			int LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
			// RadAjaxManagerProxy1.ResponseScripts.Add("openDispatchSheetReport('" + LoadStopId + "');");
			ScriptManager.RegisterStartupScript(Page, typeof(Page), "openDispatchSheetReportFromLEG", "openDispatchSheetReport('" + LoadId.ToString() + "','" + LoadStopId.ToString() + "');", true);

		}

		protected void RadDatePicker_ArrivalDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
		{
			SaveStop();
		}

		protected void RadTimePicker_ArrivalTime_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
		{
			SaveStop();
		}

		protected void RadButton_Charges_Click(object sender, EventArgs e)
		{
			// Check to see if Load is locked by another user:
			if (LockedUserChanged())
				return;

			// Ensure 
			if (RadDatePicker_DropStartDate.SelectedDate == null)
			{
				RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("Drop Trailer Date is required in order to manage Charges!"), 300, 130, "Drop Trailer Date Required!", "");
				return;
			}

			int LoadStopId = Convert.ToInt32(HiddenField_LoadStopId.Value);
			int LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
			// RadAjaxManagerProxy1.ResponseScripts.Add("openDispatchSheetReport('" + LoadStopId + "');");
			ScriptManager.RegisterStartupScript(Page, typeof(Page), "openChargesFromLEG", "openCharges('" + LoadId.ToString() + "','" + LoadStopId.ToString() + "');", true);
		}

        protected void RadComboBox_Trailer1_DataBound(object sender, EventArgs e)
        {
            var combo = (RadComboBox)sender;
            combo.Items.Insert(0, new RadComboBoxItem("-Trailer #1-", "0"));
            combo.SelectedIndex = 0;
        }

        protected void RadComboBox_Trailer2_DataBound(object sender, EventArgs e)
        {
            var combo = (RadComboBox)sender;
            combo.Items.Insert(0, new RadComboBoxItem("-Trailer #2-", "0"));
            combo.SelectedIndex = 0;
        }
    }
}
