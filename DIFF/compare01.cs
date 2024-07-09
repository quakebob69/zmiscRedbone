using RedbonePlatform.Classes;
using RedbonePlatform.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Controls;
using Telerik.Web.UI;
using Telerik.Web.UI.Editor.DialogControls;

namespace RedbonePlatform.Pages.ContainerPages
{
    public partial class DispatchSheet : System.Web.UI.Page
    {
        private int? miLockedPersonId;
        private Classes.Auth auth;

        public static bool IsEdiClient { get; set; } = false;
        public static bool IsEdiLoad { get; set; } = false;

        public static bool CanOverrideEdiStop { get; set; } = false;

        public static bool IsEdiLocked { get; set; } = false;


        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Response.Write("<script>console.log('Page Init - NO Postback');</script>");

                CurrentDockStates.Clear();
                HiddenField_PageGUID.Value = Guid.NewGuid().ToString();

                CheckIsEdiLoad();

                // Prevent tabbing to RadNumericTextBox up down spinners.
                foreach (System.Web.UI.Control ctl in Page.Controls)
                {
                    if (ctl is Telerik.Web.UI.RadNumericTextBox)
                    {
                        (ctl as RadNumericTextBox).ButtonDownContainer.Attributes.Add("tabindex", "-1");
                        (ctl as RadNumericTextBox).ButtonUpContainer.Attributes.Add("tabindex", "-1");
                    }
                }
            }
            else
            {
                // Restore any RadDocks to their previous state
                if (CurrentDockStates.Count > 0)
                {
                    Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adapt = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();

                    for (int i = 0; i < CurrentDockStates.Count; i++)
                    {
                        RadDock dock = new RadDock();
                        dock.ID = string.Format("RadDock_{0}", i);
                        dock.ApplyState(CurrentDockStates[i]);
                        dock.AutoPostBack = true;
                        dock.CommandsAutoPostBack = true;
                        dock.DockMode = DockMode.Docked;
                        dock.Command += new DockCommandEventHandler(RadDock_Command);
                        dock.DockPositionChanged += new DockPositionChangedEventHandler(RadDock_DockPositionChanged);
                        //dock.DefaultCommands = Telerik.Web.UI.Dock.DefaultCommands.ExpandCollapse | Telerik.Web.UI.Dock.DefaultCommands.Close; // temporarily just providing the expand / collapse 
                        dock.DefaultCommands = Telerik.Web.UI.Dock.DefaultCommands.None;

                        dock.Commands.Clear();

                        dock.Commands.Add(new DockExpandCollapseCommand());

                        if (!IsEdiLocked)
                        {
                            dock.Commands.Add(new DockCloseCommand());
                        }

                        //dock.Commands.Clear();
                        //dock.Commands.Add(new DockCloseCommand());
                        //dock.Commands.Add(new DockExpandCollapseCommand());

                        if (!CurrentDockStates[i].Closed)
                        {
                            Datasets.dsDispatch.LoadStopDataTable tblLoadStop = adapt.GetCertainStop(Convert.ToInt32(dock.UniqueName));
                            LoadStopWidget(dock, tblLoadStop[0]);
                        }

                        // Was playing with adding a Delete Dock confirmation. will revisit if requirement surfaces.
                        //dock.OnClientCommand = "RadDock_Client_Command";
                        // dock.OnClientCommand = "CloseDock";
                        RadDockLayout1.Controls.Add(dock);
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Authorization
            auth = (Classes.Auth)Session["Auth"];

            if (auth == null)
            {
                Response.Redirect("~/Default.aspx?ShowLogin=true", true);
                return;
            }
            else
            {
                if (!auth.Entitlements.Contains(900)) // RedbonePlatform-Dispatch-Loads
                {
                    Response.Redirect("~/AccessDenied.aspx", true);
                    return;
                }

                CanOverrideEdiStop = auth.Entitlements.Contains(935);
            }

            if (!Page.IsPostBack)
            {
                // Adjust company logo according to config
                Image_Logo.ImageUrl = ConfigurationManager.AppSettings.Get("DispatchSheet.aspx_Image");

                // First Load - but if page is refreshed during new creation, should look at hiddenfield vs. QueryString.
                if (HiddenField_LoadId.Value == "")
                {
                    HiddenField_LoadId.Value = Request.QueryString["LoadId"];
                }


                auth.LogUsageStatistic(Classes.Auth.UsageStatisticType.AccessedDispatchSheet);
                ApplyUserSettings();

                Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adaptStop = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();
                Datasets.dsDispatch.LoadStopDataTable tblStop = null;
                //Datasets.dsDispatch.LoadStopRow rowStop = null;

                Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);

                LoadPopulate();

                // Load the first stop and trigger others to be loaded on postback
                tblStop = adaptStop.GetAllStopsForLoad(LoadId);
                Int16 iCounter = 0;

                foreach (Datasets.dsDispatch.LoadStopRow row in tblStop)
                {
                    if (iCounter == 0)
                        LoadStop(row);
                    else
                    {
                        Session["StopsToLoadOnPostback"] = tblStop;
                        HiddenField_StopToLoadNextOnPostback.Value = row.LoadStopId.ToString();
                        break;
                    }

                    iCounter++;
                }

                // Sample accessing Dock.ContentContainer controls.
                //UserControls.Pick pck = dock.ContentContainer.FindControl("Pick0") as UserControls.Pick;
                //pck.CustomerPickupClientId = 1; // select Customer with ClientId 5
                //pck.PopulateCustomerAddress();

                // Query the UserFiles folder for this load to determine how many files have been attached
                UpdateFileCountOnFilesButton();
            }
            else
            { // Postback section..
              // Update Dock titles if recently re-ordered
                if (HiddenField_UpdateDockTitles.Value == "true")
                {
                    DockTitleAndValidationUpdate();
                    // Session["UpdateDockTitles"] = "";
                    HiddenField_UpdateDockTitles.Value = "";
                }

                // Load additional stops on postback
                if (HiddenField_StopToLoadNextOnPostback.Value != "")
                {
                    // Find stop to load next
                    Datasets.dsDispatch.LoadStopDataTable tbl = (Datasets.dsDispatch.LoadStopDataTable)Session["StopsToLoadOnPostback"];
                    Boolean bNextToSave = false;
                    if (tbl != null)
                    {
                        foreach (Datasets.dsDispatch.LoadStopRow row in tbl)
                        {
                            if (!bNextToSave && row.LoadStopId == Convert.ToInt32(HiddenField_StopToLoadNextOnPostback.Value))
                            {
                                LoadStop(row);
                                HiddenField_StopToLoadNextOnPostback.Value = "";
                                bNextToSave = true;
                            }
                            else if (bNextToSave)
                            {
                                HiddenField_StopToLoadNextOnPostback.Value = row.LoadStopId.ToString();
                                bNextToSave = false;
                                break;
                            }
                        }
                    }
                }
                else
                {
                    // Clear session var
                    Session["StopsToLoadOnPostback"] = null;
                }
            }
        }

        private void CheckIsEdiLoad()
        {
            Int32 loadId = Convert.ToInt32(Request.QueryString["LoadId"]);

            Datasets.dsDispatchTableAdapters.LoadTableAdapter adaptLoad = new Datasets.dsDispatchTableAdapters.LoadTableAdapter();
            Datasets.dsDispatch.LoadRow rowLoad = adaptLoad.GetData(loadId).FirstOrDefault();

            IsEdiLoad = (rowLoad.TenderId != 0 && rowLoad.TenderId != null);
            IsEdiLocked = IsEdiLoad;
        }


        //RadComboBox_HoldSub_OnNeedDataSource
        protected void RadComboBox_HoldSub_OnNeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            // int clientId = auth.ClientIds[0];

            RadComboBox_HoldSub.DataSource = GetSubTypes();
        }

        private Datasets.dsLoadStatus.LoadStatusSubTypeDataTable GetSubTypes()
        {
            Datasets.dsLoadStatusTableAdapters.LoadStatusSubTypeTableAdapter adapt = new Datasets.dsLoadStatusTableAdapters.LoadStatusSubTypeTableAdapter();
            Datasets.dsLoadStatus.LoadStatusSubTypeDataTable tblStats = new Datasets.dsLoadStatus.LoadStatusSubTypeDataTable();

            //DateTime currStrt = (DateTime)ViewState["currStart"];
            //DateTime currEnd = (DateTime)ViewState["currEnd"];
            //String currApprvd = ViewState["currApprvd"].ToString();
            short id = short.Parse(RadComboBox_Status.SelectedValue);

            if (id > 0)
            {
                tblStats = adapt.GetDataByTypeId(id, "T");
            }

            if (tblStats.Count <= 0)
            {
                RadComboBox_HoldSub.Visible = false;
                RadTextBox_SubOther.Visible = false;
            }
            else
            {
                RadComboBox_HoldSub.Visible = true;
            }

            return tblStats;
        }

        public void LoadPopulate()
        {
            try
            {
                // Get existing load
                Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);

                Datasets.dsDispatchTableAdapters.LoadTableAdapter adaptLoad = new Datasets.dsDispatchTableAdapters.LoadTableAdapter();
                Datasets.dsDispatch.LoadDataTable tblLoad = null;
                Datasets.dsDispatch.LoadRow rowLoad = null;

                // Populate Load details and LOAD section
                tblLoad = adaptLoad.GetData(LoadId);
                rowLoad = tblLoad[0];

                if (rowLoad.IsLockedPersonIdNull())
                    miLockedPersonId = null;
                else
                    miLockedPersonId = rowLoad.LockedPersonId;

                HiddenField_Mode.Value = rowLoad.Mode;

                //if (!rowLoad.IsTripNumberNull()) Label_TripNumber.Text = Decimal.Round(rowLoad.TripNumber, 2).ToString();
                if (!rowLoad.IsTripNumberNull()) Label_TripNumber.Text = rowLoad.TripNumber.ToString();
                //RadNumericTextBox_TripNumber.DbValue = rowLoad.IsTripNumberNull() ? "" : rowLoad.TripNumber.ToString();

                RadButton_TenderDetails.Enabled = (!rowLoad.IsTenderIdNull() && rowLoad.TenderId > 0);

                //if the tenderid on the load is null or 0 then it's not an edi load even though the client is edi enabled
                //IsEdiLoad = (rowLoad.TenderId != 0 && rowLoad.TenderId != null);
                //IsEdiLocked = IsEdiLoad;

                if (!rowLoad.IsMileageFromLEGOverrideIndNull())
                {
                    RadNumericTextBox_LoadedMiles.ReadOnly = (rowLoad.MileageFromLEGOverrideInd == false);
                    RadNumericTextBox_EmptyMiles.ReadOnly = (rowLoad.MileageFromLEGOverrideInd == false);
                    RadNumericTextBox_BillableMiles.ReadOnly = (rowLoad.AutoRatingInd == false);
                    RadCheckBox_MileageOverride.Checked = (rowLoad.MileageFromLEGOverrideInd == true);
                }
                else
                {
                    RadNumericTextBox_LoadedMiles.ReadOnly = true;
                    RadNumericTextBox_BillableMiles.ReadOnly = (rowLoad.AutoRatingInd == false);
                    RadNumericTextBox_EmptyMiles.ReadOnly = true;
                    RadCheckBox_MileageOverride.Checked = false;
                }

                RadNumericTextBox_LoadedMiles.DbValue = rowLoad.IsMilesNull() ? 0 : rowLoad.Miles;
                RadNumericTextBox_BillableMiles.DbValue = rowLoad.IsBillableMilesNull() ? 0 : rowLoad.BillableMiles;
                RadNumericTextBox_EmptyMiles.DbValue = rowLoad.IsDeadHeadNull() ? 0 : rowLoad.DeadHead;

                PopulateCustomerDetails(rowLoad.IsClientIdNull() ? 0 : rowLoad.ClientId);

                HiddenField_LoadPlannerPersonId.Value = rowLoad.IsLoadPlannerPersonIdNull() ? "0" : rowLoad.LoadPlannerPersonId.ToString();
                RadComboBox_LoadPlanner.Items.Clear();
                RadComboBox_LoadPlanner.Items.Add(new RadComboBoxItem("-Load Planner-", "0"));
                RadComboBox_LoadPlanner.DataBind();
                RadComboBox_LoadPlanner.SelectedValue = rowLoad.IsLoadPlannerPersonIdNull() ? null : rowLoad.LoadPlannerPersonId.ToString();

                HiddenField_DispatcherPersonId.Value = rowLoad.IsDispatcherPersonIdNull() ? "0" : rowLoad.DispatcherPersonId.ToString();
                RadComboBox_Dispatcher.Items.Clear();
                RadComboBox_Dispatcher.Items.Add(new RadComboBoxItem("-Dispatcher-", "0"));
                RadComboBox_Dispatcher.DataBind();
                RadComboBox_Dispatcher.SelectedValue = rowLoad.IsDispatcherPersonIdNull() ? null : rowLoad.DispatcherPersonId.ToString();

                RadComboBox_Commodity.SelectedValue = rowLoad.IsCommodityTypeIdNull() ? null : rowLoad.CommodityTypeId.ToString();
                RadComboBox_TrailerType.SelectedValue = rowLoad.IsEquipmentTypeIdNull() ? null : rowLoad.EquipmentTypeId.ToString();
                if (!rowLoad.IsTemperatureNull()) RadNumericTextBox_Temperature.DbValue = rowLoad.Temperature; else RadNumericTextBox_Temperature.DbValue = null;
                //RadDropDownList_TempMode.SelectedValue = rowLoad.IsTemperatureTypeIdNull() ? null : rowLoad.TemperatureTypeId.ToString();
                RadDropDownList_TempMode.SelectedValue = rowLoad.IsTemperatureTypeIdNull() ? "0" : rowLoad.TemperatureTypeId.ToString();

                HiddenField_Driver1PersonId.Value = rowLoad.IsDriver1_PersonIdNull() ? "0" : rowLoad.Driver1_PersonId.ToString();
                RadComboBox_Driver1.Items.Clear();
                RadComboBox_Driver1.Items.Add(new RadComboBoxItem("-Driver #1-", "0"));
                RadComboBox_Driver1.DataBind();
                RadComboBox_Driver1.SelectedValue = rowLoad.IsDriver1_PersonIdNull() ? null : rowLoad.Driver1_PersonId.ToString();
                DriverExpirationLogic(Convert.ToInt32(HiddenField_Driver1PersonId.Value), RadComboBox_Driver1, RadToolTip_RadComboBox_Driver1, false);

                HiddenField_Driver2PersonId.Value = rowLoad.IsDriver2_PersonIdNull() ? "0" : rowLoad.Driver2_PersonId.ToString();
                RadComboBox_Driver2.Items.Clear();
                RadComboBox_Driver2.Items.Add(new RadComboBoxItem("-Driver #2-", "0"));
                RadComboBox_Driver2.DataBind();
                RadComboBox_Driver2.SelectedValue = rowLoad.IsDriver2_PersonIdNull() ? null : rowLoad.Driver2_PersonId.ToString();
                DriverExpirationLogic(Convert.ToInt32(HiddenField_Driver2PersonId.Value), RadComboBox_Driver2, RadToolTip_RadComboBox_Driver2, false);

                HiddenField_TrailerId1.Value = rowLoad.IsTrailer1_TrailerIdNull() ? "0" : rowLoad.Trailer1_TrailerId.ToString();
                RadComboBox_Trailer1.Items.Clear();
                RadComboBox_Trailer1.Items.Add(new RadComboBoxItem("-Trailer #1-", "0"));
                RadComboBox_Trailer1.DataBind();
                RadComboBox_Trailer1.SelectedValue = rowLoad.IsTrailer1_TrailerIdNull() ? null : rowLoad.Trailer1_TrailerId.ToString();
                TrailerExpirationLogic(Convert.ToInt16(HiddenField_TrailerId1.Value), RadComboBox_Trailer1, RadToolTip_RadComboBox_Trailer1, false);

                HiddenField_TrailerId2.Value = rowLoad.IsTrailer2_TrailerIdNull() ? "0" : rowLoad.Trailer2_TrailerId.ToString();
                RadComboBox_Trailer2.Items.Clear();
                RadComboBox_Trailer2.Items.Add(new RadComboBoxItem("-Trailer #2-", "0"));
                RadComboBox_Trailer2.DataBind();
                RadComboBox_Trailer2.SelectedValue = rowLoad.IsTrailer2_TrailerIdNull() ? null : rowLoad.Trailer2_TrailerId.ToString();
                TrailerExpirationLogic(Convert.ToInt16(HiddenField_TrailerId2.Value), RadComboBox_Trailer2, RadToolTip_RadComboBox_Trailer2, false);

                HiddenField_PunitId.Value = rowLoad.IsTruckPunitIdNull() ? "0" : rowLoad.TruckPunitId.ToString();
                RadComboBox_Truck1.Items.Clear();
                RadComboBox_Truck1.Items.Add(new RadComboBoxItem("-Truck-", "0"));
                RadComboBox_Truck1.DataBind();
                RadComboBox_Truck1.SelectedValue = rowLoad.IsTruckPunitIdNull() ? "0" : rowLoad.TruckPunitId.ToString();
                TruckExpirationLogic(Convert.ToInt32(HiddenField_PunitId.Value), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, false);

                //if (!rowLoad.IsNotesNull()) RadEditor_LoadDetailNotes.Content = rowLoad.Notes; else RadEditor_LoadDetailNotes.Content = "";
                RadTextBox_CustomerLoadNumber.Text = rowLoad.IsCustomerLoadNumberNull() ? null : rowLoad.CustomerLoadNumber;
                HiddenField_TenderId.Value = rowLoad.IsTenderIdNull() ? "" : rowLoad.TenderId.ToString();
                HiddenField_CustomerLoadNumber.Value = rowLoad.IsCustomerLoadNumberNull() ? "" : rowLoad.CustomerLoadNumber;
                if (!rowLoad.IsWeightNull()) RadNumericText_Weight.Value = Convert.ToDouble(rowLoad.Weight);
                if (!rowLoad.IsRateNull()) RadNumericTextBox_FlatRate.Value = Convert.ToDouble(rowLoad.Rate);
                if (!rowLoad.IsGrossRevenueNull()) Label_GrossRevenue.Text = Decimal.Round(rowLoad.GrossRevenue, 2).ToString("C2");
                if (!rowLoad.IsPiecesNull()) RadNumericTextBox_Pieces.Value = rowLoad.Pieces; else RadNumericTextBox_Pieces.Value = null;
                if (!rowLoad.IsSendOriginalsIndNull()) RadCheckBox_SendOriginals.Checked = rowLoad.SendOriginalsInd; else RadCheckBox_SendOriginals.Checked = false;
                if (!rowLoad.IsPaidEmptyNull()) RadNumericTextBox_PaidEmpty.Value = rowLoad.PaidEmpty; else RadNumericTextBox_PaidEmpty.Value = null;
                if (!rowLoad.IsPaidMilesNull()) RadNumericTextBox_PaidLoaded.Value = rowLoad.PaidMiles; else RadNumericTextBox_PaidLoaded.Value = null;
                if (!rowLoad.IsPaperworkRecvdDateNull()) RadDatePicker_PaperworkReceivedDate.SelectedDate = rowLoad.PaperworkRecvdDate; else RadDatePicker_PaperworkReceivedDate.SelectedDate = null;
                if (!rowLoad.IsAvailableBillingNull()) RadCheckBox_BillingApproval.Checked = rowLoad.AvailableBilling; else RadCheckBox_BillingApproval.Checked = false;

                RadComboBox_Status.SelectedValue = (rowLoad.IsLoadStatusTypeIdNull()) ? null : rowLoad.LoadStatusTypeId.ToString();

                RadComboBox_HoldSub.DataBind();

                RedbonePlatform.Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter comWorkTypeAdapt = new Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter();
                Datasets.dsLoadStatus.LoadToLoadStatusSubTypeDataTable tblcomWorkType = comWorkTypeAdapt.GetDataByLoad_Status(LoadId, rowLoad.LoadStatusTypeId);
                //RadComboBox_HoldSub.SelectedValue = (rowLoad.IsLoadStatusSubTypeIdNull()) ? null : rowLoad.LoadStatusSubTypeId.ToString();
                RadComboBoxItemCollection collection = RadComboBox_HoldSub.Items;

                RadTextBox_SubOther.Visible = false;

                if (collection.Count != 0)
                {
                    foreach (RadComboBoxItem item in collection)
                    {
                        int numVal = int.Parse(item.Value);
                        var currObj = tblcomWorkType.Where(x => x.LoadStatusSubTypeId == numVal).FirstOrDefault();

                        if (currObj != null)
                        {
                            item.Checked = true;

                            if (item.Text.Contains("Other"))
                            {
                                RadTextBox_SubOther.Visible = true;

                                if (!currObj.IsCustomValNull())
                                {
                                    RadTextBox_SubOther.Text = currObj.CustomVal;
                                    RadTextBox_SubOther.Visible = true;
                                }
                            }
                        }
                    }
                }

                Label_RPM1.Text = (rowLoad.IsRatePerMileNull() ? "TBD" : decimal.Round(rowLoad.RatePerMile, 2).ToString("C2"));

                Label_ACCTotal.Text = rowLoad.IsAccChargesTotalNull() ? 0.ToString("C2") : rowLoad.AccChargesTotal.ToString("C2");
                Label_ACCBillable.Text = rowLoad.IsExtraChargesNull() ? 0.ToString("C2") : rowLoad.ExtraCharges.ToString("C2");
                Label_Rate.Text = rowLoad.IsAccChargesTotalNull() ? 0.ToString("C2") : rowLoad.AccChargesTotal.ToString("C2");

                RadCheckBox_AutoRatingInd.Checked = rowLoad.AutoRatingInd;
                if (!rowLoad.IsAllowPerBOLIndNull()) RadCheckBox_AllowPerBOL.Checked = rowLoad.AllowPerBOLInd; else RadCheckBox_AllowPerBOL.Checked = false;

                if (rowLoad.IsBillableTotalNull()) Label_BillableTotal.Text = ""; else Label_BillableTotal.Text = rowLoad.BillableTotal.ToString("C2");

                //set up notes button
                RadButton_Notes.Text = "Notes";

                if (rowLoad.NoteCountAll > 0)
                {
                    RadButton_Notes.Text += " (" + rowLoad.NoteCountAll.ToString() + ")";

                    if (rowLoad.NoteCountBilling > 0)
                    {
                        RadButton_Notes.CssClass = "RadButtonRed";
                        RadButton_Notes.ToolTip = "Click to view billing note";
                        //RadButton_Notes.CssClass.Replace("RadButtonGreen", "RadButtonRed");
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void SaveLoad()
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            Classes.Auth auth = (Classes.Auth)Session["Auth"];
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();

            // Get current load record
            Datasets.dsDispatchTableAdapters.LoadTableAdapter adaptLoad = new Datasets.dsDispatchTableAdapters.LoadTableAdapter();
            Datasets.dsDispatch.LoadDataTable tblLoad = adaptLoad.GetData(Convert.ToInt32(HiddenField_LoadId.Value));
            Datasets.dsDispatch.LoadRow rowLoad = tblLoad[0];

            //get selected status
            int selectedStatusId = Convert.ToInt16(RadComboBox_Status.SelectedValue);
            bool statChanged = false;

            // if certain fields are null, leave them in their empty state so they show their field name 

            rowLoad.MileageFromLEGOverrideInd = (RadCheckBox_MileageOverride.Checked == true);

            if (rowLoad.MileageFromLEGOverrideInd)
            {
                rowLoad.Miles = Convert.ToInt32(RadNumericTextBox_LoadedMiles.Value);
                rowLoad.DeadHead = Convert.ToInt32(RadNumericTextBox_EmptyMiles.Value);
            }

            rowLoad.BillableMiles = Convert.ToInt32(RadNumericTextBox_BillableMiles.Value);

            //rowLoad.RatePerMile = Convert.ToDouble(HiddenField_RPM.Value);

            // save old ClientId to compare to determine if we should check for auto rating records in order to set the Auto rating indicator 
            Int32? ClientIdOld = null;

            if (!rowLoad.IsClientIdNull())
                ClientIdOld = rowLoad.ClientId;

            if (RadComboBox_Customer.SelectedValue == "0" || RadComboBox_Customer.SelectedValue == "") rowLoad.SetClientIdNull(); else rowLoad.ClientId = Convert.ToInt32(RadComboBox_Customer.SelectedValue);
            if (RadComboBox_LoadPlanner.SelectedValue == "0") rowLoad.SetLoadPlannerPersonIdNull(); else rowLoad.LoadPlannerPersonId = Convert.ToInt32(RadComboBox_LoadPlanner.SelectedValue);
            if (RadComboBox_Dispatcher.SelectedValue == "0") rowLoad.SetDispatcherPersonIdNull(); else rowLoad.DispatcherPersonId = Convert.ToInt32(RadComboBox_Dispatcher.SelectedValue);
            if (RadComboBox_Commodity.SelectedValue == "0") rowLoad.SetCommodityTypeIdNull(); else rowLoad.CommodityTypeId = Convert.ToInt16(RadComboBox_Commodity.SelectedValue);
            if (RadComboBox_TrailerType.SelectedValue == "0") rowLoad.SetEquipmentTypeIdNull(); else rowLoad.EquipmentTypeId = Convert.ToInt16(RadComboBox_TrailerType.SelectedValue);
            if (RadNumericTextBox_Temperature.Value != null) rowLoad.Temperature = Convert.ToDecimal(RadNumericTextBox_Temperature.Value); else rowLoad.SetTemperatureNull();
            if (RadDropDownList_TempMode.SelectedValue == "0") rowLoad.SetTemperatureTypeIdNull(); else rowLoad.TemperatureTypeId = Convert.ToInt16(RadDropDownList_TempMode.SelectedValue);
            if (RadComboBox_Driver1.SelectedValue == "0") rowLoad.SetDriver1_PersonIdNull(); else rowLoad.Driver1_PersonId = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
            if (RadComboBox_Driver2.SelectedValue == "0") rowLoad.SetDriver2_PersonIdNull(); else rowLoad.Driver2_PersonId = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
            if (RadComboBox_Trailer1.SelectedValue == "0") rowLoad.SetTrailer1_TrailerIdNull(); else rowLoad.Trailer1_TrailerId = Convert.ToInt16(RadComboBox_Trailer1.SelectedValue);
            if (RadComboBox_Trailer2.SelectedValue == "0") rowLoad.SetTrailer2_TrailerIdNull(); else rowLoad.Trailer2_TrailerId = Convert.ToInt16(RadComboBox_Trailer2.SelectedValue);
            if (RadComboBox_Truck1.SelectedValue == "0") rowLoad.SetTruckPunitIdNull(); else rowLoad.TruckPunitId = Convert.ToInt32(RadComboBox_Truck1.SelectedValue);

            // When in Billed status, don't do anything (was wiping out the content when disabled)
            // if (rowLoad.LoadStatusTypeId != 8)
            //if (RadEditor_LoadDetailNotes.Content.Trim() != "") rowLoad.Notes = RadEditor_LoadDetailNotes.Content; else rowLoad.Notes = "";

            if (RadTextBox_CustomerLoadNumber.Text.Trim() != "") rowLoad.CustomerLoadNumber = RadTextBox_CustomerLoadNumber.Text.Trim(); else rowLoad.SetCustomerLoadNumberNull();
            if (RadNumericText_Weight.Value != null) rowLoad.Weight = Convert.ToDecimal(RadNumericText_Weight.Value); else rowLoad.SetWeightNull();
            if (RadNumericTextBox_FlatRate.Value != null) rowLoad.Rate = Decimal.Round(Convert.ToDecimal(RadNumericTextBox_FlatRate.Value), 2); else rowLoad.SetRateNull();

            var ComWorkTypeItems = RadComboBox_HoldSub.CheckedItems;

            if (RadComboBox_Status.SelectedIndex != -1)
            {
                //int newId = Convert.ToInt16(RadComboBox_Status.SelectedValue);

                if (selectedStatusId != rowLoad.LoadStatusTypeId)
                {
                    //check to see if there are any subitems, if yes dont change status
                    //status "Awaiting Cust Appr" (9) can have sub-statuses selected
                    if (ComWorkTypeItems.Count() > 0 && selectedStatusId != 9)
                    {
                        //prevent saving and show error
                        RadNotificationFail.Show("Status may not be changed until all substatuses have been removed");
                        // e.Canceled = true;
                        // e.Item.Edit = true;
                        return;
                    }

                    statChanged = true;

                    //if status changed to something other than hold billing then remove problem indicator
                    //status "Awaiting Cust Appr" (9) can have sub-statuses selected
                    short statType = Convert.ToInt16(RadComboBox_Status.SelectedValue);
                    rowLoad.LoadStatusTypeId = statType;

                    if (statType != 6 && statType != 9)
                    {
                        rowLoad.ProblemInd = false;
                    }
                }
            }

            if (RadNumericTextBox_Pieces.Value != null) rowLoad.Pieces = Convert.ToInt32(RadNumericTextBox_Pieces.Value); else rowLoad.SetPiecesNull();
            if (RadNumericTextBox_PaidEmpty.Value != null) rowLoad.PaidEmpty = Convert.ToInt32(RadNumericTextBox_PaidEmpty.Value); else rowLoad.SetPaidEmptyNull();
            if (RadNumericTextBox_PaidLoaded.Value != null) rowLoad.PaidMiles = Convert.ToInt32(RadNumericTextBox_PaidLoaded.Value); else rowLoad.SetPaidMilesNull();
            if (RadDatePicker_PaperworkReceivedDate.SelectedDate != null) rowLoad.PaperworkRecvdDate = Convert.ToDateTime(RadDatePicker_PaperworkReceivedDate.SelectedDate); else rowLoad.SetPaperworkRecvdDateNull();

            rowLoad.AvailableBilling = (Convert.ToBoolean(RadCheckBox_BillingApproval.Checked));

            //save substatuses
            // if (RadComboBox_HoldSub.SelectedIndex != -1) rowLoad.LoadStatusSubTypeId = Convert.ToInt16(RadComboBox_HoldSub.SelectedValue);
            List<String> endlst = new List<string>();
            List<int> lstComWorkType = new List<int>();

            //var ComWorkTypeItems = RadComboBox_HoldSub.CheckedItems;

            if (ComWorkTypeItems.Count != 0)
            {
                foreach (var item in ComWorkTypeItems)
                {
                    if (item.Checked)
                    {
                        lstComWorkType.Add(int.Parse(item.Value));
                    }
                }

                //create mapping objects in db

                // addRow.Endorsements = string.Join(",", endlst);
                int ldId = int.Parse(HiddenField_LoadId.Value);
                RedbonePlatform.Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter comWorkTypeAdapt = new Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter();
                Datasets.dsLoadStatus.LoadToLoadStatusSubTypeDataTable tblcomWorkType = comWorkTypeAdapt.GetDataByLoad(ldId);
                // RedbonePlatform.Datasets.dsRecruiting.EmployerToCommercialWorkTypeRow comWorkTypeRow = tblcomWorkType.FirstOrDefault();

                foreach (RedbonePlatform.Datasets.dsLoadStatus.LoadToLoadStatusSubTypeRow row in tblcomWorkType.Rows)
                {
                    row.Delete();
                }

                if (!statChanged)
                {
                    foreach (var str in lstComWorkType)
                    {
                        RedbonePlatform.Datasets.dsLoadStatus.LoadToLoadStatusSubTypeRow comWorkTypeRow = tblcomWorkType.NewLoadToLoadStatusSubTypeRow();

                        if (ComWorkTypeItems.Where(x => x.Value == str.ToString()).Select(x => x.Text).FirstOrDefault() == "Other")
                        {
                            comWorkTypeRow.CustomVal = RadTextBox_SubOther.Text;
                        }

                        comWorkTypeRow.LoadId = ldId;
                        comWorkTypeRow.LoadStatusSubTypeId = str;
                        tblcomWorkType.Rows.Add(comWorkTypeRow);
                    }

                    if (ComWorkTypeItems.Any(x => x.Text.Contains("Other")))
                    {
                        RadTextBox_SubOther.Visible = true;
                        //  if (RadTextBox_SubOther.Text.Trim() != "") rowLoad.CustomerLoadNumber = RadTextBox_CustomerLoadNumber.Text.Trim(); else rowLoad.SetCustomerLoadNumberNull();
                    }
                    else
                    {
                        RadTextBox_SubOther.Text = "";
                        RadTextBox_SubOther.Visible = false;
                    }
                }
                else
                {
                    RadTextBox_SubOther.Visible = false;
                }

                comWorkTypeAdapt.Update(tblcomWorkType);
            }
            else
            {
                // there are no checkboxes so delete all linked subsatueses
                int ldId = int.Parse(HiddenField_LoadId.Value);
                RedbonePlatform.Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter comWorkTypeAdapt = new Datasets.dsLoadStatusTableAdapters.LoadToLoadStatusSubTypeTableAdapter();
                Datasets.dsLoadStatus.LoadToLoadStatusSubTypeDataTable tblcomWorkType = comWorkTypeAdapt.GetDataByLoad(ldId);
                // RedbonePlatform.Datasets.dsRecruiting.EmployerToCommercialWorkTypeRow comWorkTypeRow = tblcomWorkType.FirstOrDefault();

                foreach (RedbonePlatform.Datasets.dsLoadStatus.LoadToLoadStatusSubTypeRow row in tblcomWorkType.Rows)
                {
                    row.Delete();
                }

                comWorkTypeAdapt.Update(tblcomWorkType);
            }

            // set based on client having auto rating records (acc or detail) if previously not set (should still allow user to manage once a Client is assigned)
            if (!rowLoad.IsClientIdNull())
            {
                if (ClientIdOld == null || ClientIdOld != rowLoad.ClientId)
                {
                    Int32 iAutoRating = Convert.ToInt32(qry.sp_Client_HasAutoRatingRecords(rowLoad.ClientId));
                    rowLoad.AutoRatingInd = Convert.ToBoolean(iAutoRating);
                    RadCheckBox_AutoRatingInd.Checked = rowLoad.AutoRatingInd;
                }
                else
                {
                    rowLoad.AutoRatingInd = Convert.ToBoolean(RadCheckBox_AutoRatingInd.Checked);
                }
            }
            else
            {
                rowLoad.AutoRatingInd = false;
            }

            // Ensure unique Trip # is entered.
            //if (RadNumericTextBox_TripNumber.Value != null)
            //{
            //    Boolean TripNumberInUse = false;
            //    Int32 TripNumber = Convert.ToInt32(RadNumericTextBox_TripNumber.Value);
            //    // Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //    qry.sp_LoadTripNumberCheckForInUse(TripNumber, Convert.ToInt32(HiddenField_LoadId.Value), out TripNumberInUse);
            //    if (TripNumberInUse)
            //    {
            //        RadWindowManager1.RadAlert("Trip # " + TripNumber.ToString("N0") + " is already in use.", 280, 150, "Trip Number In Use!", "");
            //    }
            //    else
            //    {
            //        rowLoad.TripNumber = Convert.ToInt32(RadNumericTextBox_TripNumber.Value);
            //    }
            //}
            //else
            //{
            //    rowLoad.SetTripNumberNull();
            //}

            // if (RadNumericTextBox_TripNumber.Value != null) rowLoad.TripNumber = Convert.ToInt32(RadNumericTextBox_TripNumber.Value); else rowLoad.SetTripNumberNull();

            rowLoad.SendOriginalsInd = Convert.ToBoolean(RadCheckBox_SendOriginals.Checked);
            rowLoad.AllowPerBOLInd = Convert.ToBoolean(RadCheckBox_AllowPerBOL.Checked);

            rowLoad.LastUpdtDt = DateTime.Now;
            rowLoad.LastUpdtPersonId = auth.PersonId;
            rowLoad.LockedPersonId = auth.PersonId;

            adaptLoad.Update(rowLoad);

            //if (statChanged)
            //{
            //	//status changed so send EDI message to client based on current status type
            //	var customerLoadNumber = rowLoad.IsCustomerLoadNumberNull() ? "" : rowLoad.CustomerLoadNumber;
            //	EDIService.SendStatusChangeToClient("L", rowLoad.LoadId, 0, customerLoadNumber, rowLoad.ClientId, (Int16)selectedStatusId);
            //}
            // refresh the page as additional auto rating and calculations may have occurred via sp_LoadCalculate

            LoadPopulate();
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
                    // RadWindowManager1.RadAlert(MsgConsolidated, 280, 150, "Driver Issues!", "");

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
            const String TruckText = "Truck";
            String MsgConsolidated2 = "";

            if (PunitId != 0)
            {
                String MsgConsolidated = "";
                Boolean CloseToExpiring = false;
                Boolean AlreadyExpired = false;
                Boolean TruckCantBeAssigned = false;

                Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
                qry.sp_TruckExpirations(PunitId, out MsgConsolidated, out CloseToExpiring, out AlreadyExpired, out TruckCantBeAssigned, Convert.ToInt32(HiddenField_LoadId.Value), null);

                if (MsgConsolidated != "")
                {
                    radComboBox.BackColor = (AlreadyExpired ? Color.Red : Color.Yellow);
                    radComboBox.ForeColor = (AlreadyExpired ? Color.White : Color.Black);
                    radToolTip.Text = MsgConsolidated;
                    MsgConsolidated2 = MsgConsolidated;

                    if (showPopupAlertAndReassignToDefaultIfNeeded)
                    {
                        if (TruckCantBeAssigned)
                            radComboBox.SelectedIndex = 0;

                        RadWindowManager1.RadAlert(MsgConsolidated, 400, 150, "Truck #1", "");
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


        private void ApplyUserSettings()
        {
            // Set RibbonBar Skin 
            if (Session["GlobalSkin"] is null) Session["GlobalSkin"] = "Black";
            RadSkinManager1.Skin = Session["GlobalSkin"].ToString();

            // Adjust Redbone Trucking image background if not a black skin
            System.Drawing.Color color;
            switch (Session["GlobalSkin"])
            {
                case "Black":
                    Image_Logo.BackColor = default(Color);
                    break;
                case "WebBlue":
                    color = System.Drawing.ColorTranslator.FromHtml("#728A9F");
                    Image_Logo.BackColor = color;
                    break;
                case "Metro":
                    color = System.Drawing.ColorTranslator.FromHtml("#8FC8E9");
                    Image_Logo.BackColor = color;
                    break;
                default:
                    break;
            }

        }


        protected void RadComboBox_Customer_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Session["RadButton_Pick_DontClick"] = true;
            // Auto Save (if not coming from LoadPopulate()

            // Validate Customer
            ValidateCustomerStatus(true);

            SaveLoad();
        }

        private void ValidateCustomerStatus(Boolean ShowPopup)
        {
            String MsgConsolidated = "";
            RadComboBox cbo = (RadComboBox_Customer);
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            qry.sp_CustomerStatusValidation(Convert.ToInt32(cbo.SelectedValue), out MsgConsolidated);

            if (MsgConsolidated != "")
            {
                cbo.BackColor = Color.Red;
                cbo.ForeColor = Color.White;
                RadToolTip_CustomerMain.Text = MsgConsolidated;
                cbo.Text = "";
                cbo.SelectedValue = "";

                if (ShowPopup)
                    RadWindowManager1.RadAlert(MsgConsolidated, 400, 150, MsgConsolidated, "");
            }
            else
            {
                cbo.BackColor = Color.Empty;
                cbo.ForeColor = Color.Empty;

                RadToolTip_CustomerMain.Text = "";
            }
        }

        private void PopulateCustomerDetails(int ClientId)
        {
            // Lookup Customer Address to populate (if one is selected)
            if (ClientId > 0)
            {
                // Set Customer Text in dropdown:
                Datasets.dsDispatchTableAdapters.CustomerInfoTableAdapter adapt1 = new Datasets.dsDispatchTableAdapters.CustomerInfoTableAdapter();
                Datasets.dsDispatch.CustomerInfoDataTable tblCustomerName = adapt1.GetDataBy(ClientId);

                if (tblCustomerName.Rows.Count > 0)
                {
                    RadComboBox_Customer.Text = tblCustomerName[0].ClientName;
                    RadComboBox_Customer.SelectedValue = ClientId.ToString();
                }
                else
                {
                    RadComboBox_Customer.SelectedValue = "0";
                }

                Datasets.dsDispatchTableAdapters.ClientAddressTableAdapter adapt = new Datasets.dsDispatchTableAdapters.ClientAddressTableAdapter();
                Datasets.dsDispatch.ClientAddressDataTable tbl = adapt.GetData(ClientId);

                RadComboBox cbo = RadComboBox_Customer;

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
                    Label_CustomerAddressContact.Text = Address;

                }
                else
                {
                    Label_CustomerAddressContact.Text = "No Address On File for this Customer!";
                }

                // if there is a change in Customer, populate Client Profile Notes into the Load Notes field, overwriting anything in there.
                // DOING THIS IN THE sp_Load_Udate
                //if (HiddenField_ClientId.Value == "0")
                //{
                //    RadEditor_LoadDetailNotes.Content = "";
                //}
                //else if (HiddenField_ClientId.Value != ClientId.ToString())
                //{
                //    RadEditor_LoadDetailNotes.Content = tblCustomerName[0].Notes;

                //}
            }
            else
            {
                RadComboBox_Customer.SelectedValue = "0";
                Label_CustomerAddressContact.Text = "";

                // clear out any Notes from the Notes field.
                // DOING THIS IN THE sp_Load_Udate
                // RadEditor_LoadDetailNotes.Content = "";

            }

            // Save ClientId to hidden field to reference in order to determine if a new Client is being selected 
            //  in order to either populate Client Profile Notes into the Load's Notes field. We only want to change this if a Client has changed.
            HiddenField_ClientId.Value = ClientId.ToString();

        }

        private void LoadStop(Datasets.dsDispatch.LoadStopRow rowLoadStop)
        {
            RadDock dock = CreateRadDock(rowLoadStop);
            LoadStopWidget(dock, rowLoadStop);
            RadDockLayout1.Controls.Add(dock);
            dock.Dock(RadDockZone1);

            // Refresh the DockLayout clientside to get the stop's user control's events to register.
            // 02/04/19 had to wrap this in a $(document).ready block due to RefreshDockLayout being undefined when internet connection is slow with multiple stops.
            RadAjaxManager1.ResponseScripts.Add("$telerik.$(document).ready(function(){RefreshDockLayout();});");
        }

        private RadDock CreateRadDock(Datasets.dsDispatch.LoadStopRow rowLoadStop)
        {
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            string StopNm = qry.LoadStopType_Get(rowLoadStop.LoadStopId);

            int docksCount = CurrentDockStates.Count;

            RadDock dock = new RadDock
            {
                ID = string.Format("RadDock_{0}", docksCount),
                Title = StopNm + ' ' + rowLoadStop.StopTypeNumber.ToString(),
                Tag = ((Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Pick ? "pick" : (Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Drop ? "drop" : "") + "," + rowLoadStop.LoadStopId.ToString(),
                UniqueName = rowLoadStop.LoadStopId.ToString(), // Guid.NewGuid().ToString(),
                DockMode = DockMode.Docked,
                AutoPostBack = true,
                CommandsAutoPostBack = true,
                CssClass = (Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Pick ? "pick" : (Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Drop ? "drop" : "",
                //DefaultCommands = Telerik.Web.UI.Dock.DefaultCommands.ExpandCollapse | Telerik.Web.UI.Dock.DefaultCommands.Close // temporarily just providing the expand / collapse 
                DefaultCommands = Telerik.Web.UI.Dock.DefaultCommands.None
                //OnClientCommand = "CloseDock"                
            };

            dock.Commands.Clear();

            dock.Commands.Add(new DockExpandCollapseCommand());

            if (!IsEdiLocked)
            {
                dock.Commands.Add(new DockCloseCommand());
            }

            //dock.Commands.Clear();
            //dock.Commands.Add(new DockExpandCollapseCommand());
            //dock.Commands.Add(new DockCloseCommand());

            dock.Attributes["stoptype"] = rowLoadStop.LoadStopTypeId.ToString();

            //don't allow pick or drop stops to be deleted if is an edi controlled load
            //if (IsEdiClient && ((Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Pick || (Enums.LoadStopType)rowLoadStop.LoadStopTypeId == Enums.LoadStopType.Drop))
            //{
            //	dock.DefaultCommands = Telerik.Web.UI.Dock.DefaultCommands.ExpandCollapse;
            //}

            return dock;
        }

        private void LoadStopWidget(RadDock dock, Datasets.dsDispatch.LoadStopRow rowLoadStop)
        {
            System.Web.UI.Control widget = null;

            switch (rowLoadStop.LoadStopTypeId)
            {
                case 1:
                    widget = LoadControl(@"~/UserControls/Pick.ascx");
                    widget.ID = String.Format("Pick{0}", CurrentDockStates.Count);
                    UserControls.Pick pck = widget as UserControls.Pick;
                    // this loads it as well. This property will populate the Stop
                    pck.LoadStopId = rowLoadStop.LoadStopId;
                    pck.CanOverrideEdiStop = CanOverrideEdiStop;

                    // Nice way to allow the user control to raise an event to this.
                    // pck.LoadCalcAndUiRefresh += new EventHandler(this.RadButton_RefreshACCTotal_Click);

                    //event for pick user control to send status updates
                    pck.SendStatusEvent += new UserControls.Pick.SendStatusDelegate(this.SendStatusChangeToClient);
                    break;
                case 3:
                    widget = LoadControl(@"~/UserControls/Drop.ascx");
                    widget.ID = String.Format("Drop{0}", CurrentDockStates.Count);
                    UserControls.Drop drp = widget as UserControls.Drop;
                    drp.LoadStopId = rowLoadStop.LoadStopId;
                    drp.CanOverrideEdiStop = CanOverrideEdiStop;

                    //event for drop user control to send status updates
                    drp.SendStatusEvent += new UserControls.Drop.SendStatusDelegate(this.SendStatusChangeToClient);
                    break;
                case 2:
                    widget = LoadControl(@"~/UserControls/LEG.ascx");
                    widget.ID = String.Format("LEG{0}", CurrentDockStates.Count);
                    UserControls.LEG leg = widget as UserControls.LEG;
                    leg.LoadStopId = rowLoadStop.LoadStopId;
                    break;
                case 4:
                    widget = LoadControl(@"~/UserControls/FuelStop.ascx");
                    widget.ID = String.Format("Fuel{0}", CurrentDockStates.Count);
                    UserControls.FuelStop fuel = widget as UserControls.FuelStop;
                    fuel.LoadStopId = rowLoadStop.LoadStopId;
                    break;
                //case 5:
                //	widget = LoadControl(@"~/UserControls/Empty.ascx");
                //	widget.ID = String.Format("Empty{0}", CurrentDockStates.Count);
                //	UserControls.Empty empty = widget as UserControls.Empty;
                //	empty.LoadStopId = rowLoadStop.LoadStopId;
                //	break;
                default:
                    break;
            }

            if (widget != null)
            {
                dock.ContentContainer.Controls.Add(widget);
            }
        }


        //Store the info about the added docks in the session.
        private List<DockState> CurrentDockStates
        {
            get
            {
                List<DockState> _currentDockStates = (List<DockState>)Session["CurrentDockStates"];
                if (Object.Equals(_currentDockStates, null))
                {
                    _currentDockStates = new List<DockState>();
                    Session["CurrentDockStates"] = _currentDockStates;
                }
                return _currentDockStates;
            }
            set
            {
                Session["CurrentDockStates"] = value;
            }
        }

        protected void RadDockLayout1_SaveDockLayout(object sender, DockLayoutEventArgs e)
        {
            CurrentDockStates = RadDockLayout1.GetRegisteredDocksState();
        }

        protected void RadDockLayout1_LoadDockLayout(object sender, DockLayoutEventArgs e)
        {
            foreach (DockState state in CurrentDockStates)
            {
                e.Positions[state.UniqueName] = state.DockZoneID;
                e.Indices[state.UniqueName] = state.Index;
            }
        }

        private void CreateStops(Int16 stopsToAdd, Int16 LoadStopTypeId)
        {
            Datasets.dsDispatch.LoadStopDataTable tblStop = CreateNewStopRecords(LoadStopTypeId, stopsToAdd);

            // load the first stop (will trigger postback)
            LoadStop(tblStop[0]);

            // If more than one stop should be added, setup session and hidden field to trigger additional loads be created on postback
            if (stopsToAdd > 1)
            {
                Session["StopsToLoadOnPostback"] = tblStop;
                HiddenField_StopToLoadNextOnPostback.Value = tblStop[1].LoadStopId.ToString();
            }

            // Execute sp_LoadCalculate then refresh page
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            qry.sp_LoadCalculate(Convert.ToInt32(HiddenField_LoadId.Value));
            LoadPopulate();
            // todo: add to radajaxmanager so that totals will update accordingly when LoadPopulate is called.

        }

        private Datasets.dsDispatch.LoadStopDataTable CreateNewStopRecords(Int16 LoadStopTypeId, Int16 numberOfStopsToAdd)
        {
            int LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
            Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adaptStop = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();
            Datasets.dsDispatchTableAdapters.StopNumbersNextTableAdapter adaptStopNumbers = new Datasets.dsDispatchTableAdapters.StopNumbersNextTableAdapter();
            Datasets.dsDispatch.LoadStopDataTable tblStops = new Datasets.dsDispatch.LoadStopDataTable();
            Datasets.dsDispatch.LoadStopRow rowStop = null;
            Datasets.dsDispatch.StopNumbersNextDataTable tblStopNumbers = null;

            for (int i = 0; i < numberOfStopsToAdd; i++)
            {
                tblStopNumbers = adaptStopNumbers.GetData(LoadId, LoadStopTypeId);
                Datasets.dsDispatch.StopNumbersNextRow rowStopNumbers = tblStopNumbers[0];
                rowStop = tblStops.NewLoadStopRow();
                rowStop.LoadId = LoadId;
                rowStop.LoadStopTypeId = LoadStopTypeId;
                rowStop.StopNumber = Convert.ToInt16(rowStopNumbers.newStopNumber);
                rowStop.StopTypeNumber = Convert.ToInt16(rowStopNumbers.newStopTypeNumber);
                rowStop.ShowOnDispatchSheet = true;

                switch (LoadStopTypeId)
                {
                    case (Int16)Enums.LoadStopType.Pick:
                        rowStop.LoadTypeId = (Int16)Enums.LoadType.HookOnly;
                        break;
                    case (Int16)Enums.LoadStopType.Drop:
                        rowStop.LoadTypeId = (Int16)Enums.LoadType.LiveUnload;
                        break;
                    case (Int16)Enums.LoadStopType.Leg:
                        rowStop.LoadTypeId = (Int16)Enums.LoadType.HookOnly;
                        break;
                    //case (Int16)Enums.LoadStopType.Empty:
                    //	rowStop.LoadTypeId = (Int16)Enums.LoadType.HookOnly;
                    //	break;
                    case (Int16)Enums.LoadStopType.Fuel:
                        rowStop.LoadTypeId = (Int16)Enums.LoadType.LiveLoad;
                        break;
                    default:
                        break;
                }

                // When a LEG or EMPTY is added, default certain fields with values from the LOAD section, if they have been set.
                if (LoadStopTypeId == 2) // || LoadStopTypeId == 5)
                {

                    // Removed auto population of the below items
                    //if (RadComboBox_Driver1.SelectedValue == "0") rowStop.SetDriver1_PersonIdNull(); else rowStop.Driver1_PersonId = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
                    //if (RadComboBox_Driver2.SelectedValue == "0") rowStop.SetDriver2_PersonIdNull(); else rowStop.Driver2_PersonId = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
                    //if (RadComboBox_Truck1.SelectedValue == "0") rowStop.SetTruckPunitIdNull(); else rowStop.TruckPunitId = Convert.ToInt32(RadComboBox_Truck1.SelectedValue);
                    // end of remove

                    //trailer1 may be overwritten in the insert stored procedure - DMS 2023-06-21
                    if (RadComboBox_Trailer1.SelectedValue == "0") rowStop.SetTrailer1_TrailerIdNull(); else rowStop.Trailer1_TrailerId = Convert.ToInt16(RadComboBox_Trailer1.SelectedValue);
                    if (RadComboBox_Trailer2.SelectedValue == "0") rowStop.SetTrailer2_TrailerIdNull(); else rowStop.Trailer2_TrailerId = Convert.ToInt16(RadComboBox_Trailer2.SelectedValue);
                }

                Auth auth = (Auth)Session["Auth"];
                rowStop.LastUpdtPersonId = auth.PersonId;

                tblStops.AddLoadStopRow(rowStop);
                adaptStop.Update(tblStops);
            }

            return tblStops;
        }

        protected void RadButton_Pick_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            // When selecting a client in any stop using the Enter key, upon postback the Pick button has focus, gets the click, and erroneously creates a pick.
            // This session var is set anytime a customer is selected in any stop
            if (Convert.ToBoolean(Session["RadButton_Pick_DontClick"]) == true)
            {
                Session["RadButton_Pick_DontClick"] = false;
                return;
            }

            //Int16 stopsToAdd = Convert.ToInt16(RadNumericTextBox_PicksToAdd.Value);

            //// Determine how many Pick stops are already present and only add additinoal picks according to the shortage compared to the number.
            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //Int16 TotalStops = Convert.ToInt16(qry.LoadStop_GetTotalNumberOfStopsForTypeAndLoad(Convert.ToInt32(HiddenField_LoadId.Value), 1));

            //Int16 stopsToAddFinal = Convert.ToInt16(stopsToAdd - TotalStops);
            //if (stopsToAddFinal > 0)
            //    CreateStops(stopsToAddFinal, 1);

            CreateStops(1, 1);

        }

        protected void RadButton_Drop_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            //Int16 stopsToAdd = Convert.ToInt16(RadNumericTextBox_DropsToAdd.Value);

            //// Determine how many Pick stops are already present and only add additinoal picks according to the shortage compared to the number.
            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //Int16 TotalStops = Convert.ToInt16(qry.LoadStop_GetTotalNumberOfStopsForTypeAndLoad(Convert.ToInt32(HiddenField_LoadId.Value), 3));

            //Int16 stopsToAddFinal = Convert.ToInt16(stopsToAdd - TotalStops);
            //if (stopsToAddFinal > 0)
            //    CreateStops(stopsToAddFinal, 3);

            CreateStops(1, 3);

        }

        protected void RadButton_Leg_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            //Int16 stopsToAdd = Convert.ToInt16(RadNumericTextBox_LEGsToAdd.Value);

            //// Determine how many Pick stops are already present and only add additinoal picks according to the shortage compared to the number.
            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //Int16 TotalStops = Convert.ToInt16(qry.LoadStop_GetTotalNumberOfStopsForTypeAndLoad(Convert.ToInt32(HiddenField_LoadId.Value), 2));

            //Int16 stopsToAddFinal = Convert.ToInt16(stopsToAdd - TotalStops);
            //if (stopsToAddFinal > 0)
            //    CreateStops(stopsToAddFinal, 2);

            CreateStops(1, 2);
        }

        //protected void RadButton_Empty_Click(object sender, EventArgs e)
        //{
        //	// Check to see if Load is locked by another user:
        //	if (LockedUserChanged())
        //		return;

        //	CreateStops(1, 5);  //create an 'Empty' leg
        //}

        protected void RadButton_FuelStop_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            //Int16 stopsToAdd = Convert.ToInt16(RadNumericTextBox_FuelStopssToAdd.Value);

            //// Determine how many Pick stops are already present and only add additinoal picks according to the shortage compared to the number.
            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //Int16 TotalStops = Convert.ToInt16(qry.LoadStop_GetTotalNumberOfStopsForTypeAndLoad(Convert.ToInt32(HiddenField_LoadId.Value), 4));

            //Int16 stopsToAddFinal = Convert.ToInt16(stopsToAdd - TotalStops);
            //if (stopsToAddFinal > 0)
            //    CreateStops(stopsToAddFinal, 4);

            CreateStops(1, 4);
        }

        protected void RadNumericTextBox_TextChanged(object sender, EventArgs e)
        {
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();

            int tripNumber = Convert.ToInt32(HiddenField_LoadId.Value);
            string refLookup = qry.GetCustomerRefNumber(tripNumber).ToString();
            string newCustNumber = (RadTextBox_CustomerLoadNumber.Text == "") ? "none" : RadTextBox_CustomerLoadNumber.Text;
            string oldCustNumber = (HiddenField_CustomerLoadNumber.Value == "" || HiddenField_CustomerLoadNumber.Value == null) ? "none" : HiddenField_CustomerLoadNumber.Value;


            auth = (Classes.Auth)Session["Auth"];

            auth.LogUsageStatistic(Classes.Auth.UsageStatisticType.ModifiedCustomerRefNumber, tripNumber + " - " + auth.FirstName + " " + auth.LastName + " - Modified Customer Ref from " + refLookup + " to " + newCustNumber);

            SaveLoad();

        }

        protected void RadNumericTextBox_EmptyMiles_TextChanged(object sender, EventArgs e)
        {
            // populate the RadNumericTextBox_PaidEmpty field if not already populated.
            if (RadNumericTextBox_PaidEmpty.Value == null && RadCheckBox_AutoRatingInd.Checked == true)
            {
                RadNumericTextBox_PaidEmpty.Value = RadNumericTextBox_EmptyMiles.Value;
            }

            SaveLoad();
        }

        protected void RadNumericTextBox_LoadedMiles_TextChanged(object sender, EventArgs e)
        {
            // populate the RadNumericTextBox_PaidLoaded field if not already populated.
            if (RadNumericTextBox_PaidLoaded.Value == null && RadCheckBox_AutoRatingInd.Checked == true)
            {
                RadNumericTextBox_PaidLoaded.Value = RadNumericTextBox_LoadedMiles.Value;
            }

            SaveLoad();
        }

        protected void RadNumericTextBox_BillableMiles_TextChanged(object sender, EventArgs e)
        {
            SaveLoad();
        }

        protected void RadComboBox_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            // Prevent "In Transit" Load Status change when Customer Load #, Weight, ACC Charges, or Rate is null
            // Clientside code is handling this.
            //if (RadComboBox_Status.SelectedValue == "3" && !InTransitValidation())
            //{
            //    RadWindowManager1.RadAlert("Customer Load #, Weight, ACC Charges, and Rate are all required before you can change the status to In Transit!", 500, 130, "Missing Fields!", "");
            //    return;
            //}

            RadComboBox cbo = (sender as RadComboBox);
            Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();
            Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);

            Int32? Driver1Id = null;
            Int32? Driver2Id = null;
            Int16? Trailer1_TrailerId = null;
            Int16? Trailer2_TrailerId = null;
            Int32? TruckPunitId = null;

            bool ediUpdateNeeded = false;

            switch (cbo.ID)
            {
                case "RadComboBox_Status":
                    // When the Load Status = Dispatched, show the Dispatch button.
                    SaveLoad();
                    RadButton_Dispatch.Visible = (cbo.SelectedValue == "2");
                    RadComboBox_HoldSub.DataBind();
                    //SendStatusToClient();
                    break;
                	
				case "RadComboBox_Driver1":
					if (e.Value != e.OldValue)
					{
                        if(driverHasCharges(LoadId, e.OldValue))
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

					if (RadComboBox_Driver1.SelectedValue != "0")
						Driver1Id = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
					else
						Driver1Id = null;

					if (RadComboBox_Driver2.SelectedValue != "0")
						Driver2Id = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
					else
						Driver2Id = null;

					// Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
					qry.sp_Load_SaveDrivers(LoadId, Driver1Id, Driver2Id);

					// check for duplicate Drviers
					// Page.Validate();
					ediUpdateNeeded = true;
					break;
				
				case "RadComboBox_Driver2":
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

					if (RadComboBox_Driver1.SelectedValue != "0")
						Driver1Id = Convert.ToInt32(RadComboBox_Driver1.SelectedValue);
					else
						Driver1Id = null;

					if (RadComboBox_Driver2.SelectedValue != "0")
						Driver2Id = Convert.ToInt32(RadComboBox_Driver2.SelectedValue);
					else
						Driver2Id = null;

					// Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
					qry.sp_Load_SaveDrivers(LoadId, Driver1Id, Driver2Id);

					// check for duplicate Drviers
					Page.Validate();
					ediUpdateNeeded = true;
					break;
				
                case "RadComboBox_Trailer1":
                    if (!TrailersDuplicateCheck_IsValid())
                        RadComboBox_Trailer1.SelectedIndex = 0;

                    TrailerExpirationLogic(Convert.ToInt16(e.Value), RadComboBox_Trailer1, RadToolTip_RadComboBox_Trailer1, true);

                    if (RadComboBox_Trailer1.SelectedValue != "0")
                        Trailer1_TrailerId = Convert.ToInt16(RadComboBox_Trailer1.SelectedValue);
                    if (RadComboBox_Trailer2.SelectedValue != "0")
                        Trailer2_TrailerId = Convert.ToInt16(RadComboBox_Trailer2.SelectedValue);

                    // Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
                    qry.sp_Load_SaveTrailers(LoadId, Trailer1_TrailerId, Trailer2_TrailerId);

                    //TruckExpirationLogic(Convert.ToInt32(RadComboBox_Truck1.SelectedValue), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, true);

                    //if (RadComboBox_Truck1.SelectedValue != "0")
                    //    TruckPunitId = Convert.ToInt16(RadComboBox_Truck1.SelectedValue);

                    //qry.sp_Load_SaveTruck(LoadId, TruckPunitId);

                    // Check for Duplicate Trailers
                    Page.Validate();
                    ediUpdateNeeded = true;
                    break;
                case "RadComboBox_Trailer2":
                    if (!TrailersDuplicateCheck_IsValid())
                        RadComboBox_Trailer2.SelectedIndex = 0;

                    TrailerExpirationLogic(Convert.ToInt16(e.Value), RadComboBox_Trailer2, RadToolTip_RadComboBox_Trailer2, true);

                    if (RadComboBox_Trailer1.SelectedValue != "0")
                        Trailer1_TrailerId = Convert.ToInt16(RadComboBox_Trailer1.SelectedValue);
                    if (RadComboBox_Trailer2.SelectedValue != "0")
                        Trailer2_TrailerId = Convert.ToInt16(RadComboBox_Trailer2.SelectedValue);

                    // Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
                    qry.sp_Load_SaveTrailers(LoadId, Trailer1_TrailerId, Trailer2_TrailerId);

                    TruckExpirationLogic(Convert.ToInt32(RadComboBox_Truck1.SelectedValue), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, true);

                    if (RadComboBox_Truck1.SelectedValue != "0")
                        TruckPunitId = Convert.ToInt16(RadComboBox_Truck1.SelectedValue);

                    qry.sp_Load_SaveTruck(LoadId, TruckPunitId);

                    // Check for Duplicate Trailers
                    Page.Validate();
                    ediUpdateNeeded = true;
                    break;
                case "RadComboBox_Truck1":
                    TruckExpirationLogic(Convert.ToInt32(RadComboBox_Truck1.SelectedValue), RadComboBox_Truck1, RadToolTip_RadComboBox_Truck1, true);

                    if (RadComboBox_Truck1.SelectedValue != "0")
                        TruckPunitId = Convert.ToInt16(RadComboBox_Truck1.SelectedValue);















                    1
                    get driver(s) from person table using TruckPunitId:
                        Driver1Id
                        Driver2Id


                    2
                    if either of the trucks drivers driverHasCharges:

                        use this:
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

                    return And don't change truck for drivers


                    3
                    apply this to all drivers:
                        DriverExpirationLogic(Convert.ToInt32(e.Value), RadComboBox_Driver1, RadToolTip_RadComboBox_Driver1, true);


                    4
                    try
                    {
                        // Save just this selection to the load, so no need to save entire load and refresh via SaveLoad
                        qry.sp_Load_SaveTruck(LoadId, TruckPunitId);
                        qry.sp_Load_SaveDrivers(LoadId, Driver1Id, Driver2Id);
                    }
                    catch (Exception ex)
                    {
                        set back if both stored procs don't work
                        qry.sp_Load_SaveTruck(LoadId, TruckPunitId);
                        qry.sp_Load_SaveDrivers(LoadId, Driver1Id, Driver2Id);
                        
                        throw ex;
                    }

                    5
                    //update drivers on page
                    RadComboBox_Driver1.SelectedValue = Driver1Id == null ? null : Driver1Id.ToString();
                    RadComboBox_Driver2.SelectedValue = Driver2Id == null ? null : Driver2Id.ToString();
                    LoadPopulate();

                    6
                    //Set Driver Manager
                    //

                    ediUpdateNeeded = true;
                    break;
                default:
                    SaveLoad();
                    break;
            }

            if (ediUpdateNeeded)
            {
                //call to update truck/trailer through edi  We arent doing this for now
                //SendStatusChangeToClient(LoadId, 0, int.Parse(HiddenField_ClientId.Value), "", DateTime.Now, "NS", EDIService.StatusDateType.Scheduled, EDIService.ShipmentStatusType.StatusChange);
            }
        }

        private bool driverHasCharges(int loadId, string oldValue)
        {
            Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchExpirationsTableAdapters.QueriesTableAdapter();

            Boolean DriverHasCharge = false;
            qry.sp_DriverInLoadHasChargeInd(loadId, Convert.ToInt32(oldValue), out DriverHasCharge);

            return DriverHasCharge;
        }

        protected void RadDropDownList_TempMode_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            SaveLoad();
        }
        private void RadDock_DockPositionChanged(object sender, DockPositionChangedEventArgs e)
        {

            // This event will fire for every dock in the zone when one is moved, others move.
            //  Correction, this only fires for the docks that are moved when one is repositioned. 
            //  E.g. if the bottom is moved up one, then only bottom two docks change position. If bottom is moved to top, then all change position.
            RadDock dock = sender as RadDock;
            Int32 LoadStopId = Convert.ToInt32(dock.Tag.Split(',')[1]);
            Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            qry.sp_LoadStopNumbersChange(LoadId, LoadStopId, Convert.ToInt16(e.Index + 1));

            HiddenField_UpdateDockTitles.Value = "true";
        }

        private void DockTitleAndValidationUpdate()
        {
            // Loop through all Docks and update Title
            Int16 PickCount = 0, DropCount = 0, LEGCount = 0;

            for (int i = 0; i < RadDockZone1.Docks.Count; i++)
            {
                if (!RadDockZone1.Docks[i].Closed)
                {
                    RadDockZone1.Docks[i].TitlebarContainer.Height = 5;

                    if (RadDockZone1.Docks[i].Title.Contains("Pick"))
                    {
                        PickCount++;
                        RadDockZone1.Docks[i].Title = "Pick " + PickCount.ToString();

                        // Cause Dispatch validation in Pick
                        UserControls.Pick pck = RadDockZone1.Docks[i].ContentContainer.Controls[0] as UserControls.Pick;
                        pck.DispatchValidation();
                    }
                    if (RadDockZone1.Docks[i].Title.Contains("LEG"))
                    {
                        LEGCount++;
                        RadDockZone1.Docks[i].Title = "LEG " + LEGCount.ToString();

                        // Cause Dispatch validation in Drop
                        UserControls.LEG leg = RadDockZone1.Docks[i].ContentContainer.Controls[0] as UserControls.LEG;
                        leg.DispatchValidation();
                    }
                    if (RadDockZone1.Docks[i].Title.Contains("Drop"))
                    {
                        DropCount++;
                        RadDockZone1.Docks[i].Title = "Drop " + DropCount.ToString();

                        // Cause Dispatch validation in Drop
                        UserControls.Drop drp = RadDockZone1.Docks[i].ContentContainer.Controls[0] as UserControls.Drop;
                        drp.DispatchValidation();
                    }
                    if (RadDockZone1.Docks[i].Title.Contains("Fuel"))
                    {
                        DropCount++;
                        RadDockZone1.Docks[i].Title = "Fuel " + DropCount.ToString();

                        // Cause Dispatch validation in Drop
                        UserControls.FuelStop fuel = RadDockZone1.Docks[i].ContentContainer.Controls[0] as UserControls.FuelStop;
                        fuel.DispatchValidation();
                    }
                }
            }
        }

        protected void RadDock_Command(object sender, Telerik.Web.UI.DockCommandEventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            if (e.Command.Name == "lock")
            {
                RadDock dock = (RadDock)sender;
            }
            if (e.Command.Name == "Close")
            {
                RadDock dock = (RadDock)sender;
                // remove stop from DB
                Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adapt = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter();

                adapt.Delete(Convert.ToInt32(dock.Tag.Split(',')[1]));

                // renumber stops accordingly
                Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
                qry.sp_LoadStopNumbersChangeWhenOneIsDeleted(Convert.ToInt32(HiddenField_LoadId.Value));

                // Recalculate and run Auto Rating
                qry.sp_LoadCalculate(Convert.ToInt32(HiddenField_LoadId.Value));

                // refresh stops in ui to reflect the new numbers
                DockTitleAndValidationUpdate();

                // Cause postback so that new Stops can be added (for some reason the ajax on the Pick/Drop/Leg buttons no longer posts the RadDockLayout1 back..
                ScriptManager.RegisterClientScriptBlock(this.Page, typeof(System.Web.UI.Page), "RefreshDocks", "RefreshDocks();", true);

                // reload load so that totals are updated 
                LoadPopulate();
            }
        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            //if (e.Argument == "SaveDispatchNotes")
            //{
            //// Check to see if Load is locked by another user:
            //if (LockedUserChanged())
            //    return;

            //// Update RadEditor text to the DB..
            //string content = RadEditor_LoadDetailNotes.Content;
            //Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //qry.LoadNotes_Update(content, LoadId);
            //}
            if (e.Argument == "LoadPopulate")
            {
                LoadPopulate();
            }
            else if (e.Argument == "RefreshFileCount")
            {
                UpdateFileCountOnFilesButton();
            }
            else if (e.Argument == "RefreshACCTotal")
            {
                // Execute sp_LoadCalculate then refresh page
                Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
                qry.sp_LoadCalculate(Convert.ToInt32(HiddenField_LoadId.Value));
                LoadPopulate();
            }
            else if (e.Argument == "Save")
            {
                // The control should call SaveLoad() just by doing this postback
                // RadAjaxManager1.Alert("Save");
            }
            else if (e.Argument == "EdiLock")
            {
                if (CanOverrideEdiStop)
                {
                    string ediBoxClass = IsEdiLocked ? "ediBoxLocked" : "ediBoxUnLocked";
                    spanEdiLoad.InnerHtml = IsEdiClient ? "<a href='javascript:EdiLock();' class='ediBoxLink' title='Click to unlock stops'><span class='" + ediBoxClass + "'><b>&nbsp;EDI&nbsp;</b></span></a>" : "";
                    IsEdiLocked = !IsEdiLocked; //toggle

                    RadButton_Pick.Enabled = !IsEdiLocked;
                    RadButton_Drop.Enabled = !IsEdiLocked;

                    // Cause postback so that Stops are refeshed with updated commands
                    RadAjaxManager1.ResponseScripts.Add("$telerik.$(document).ready(function(){RefreshDockLayout();});");
                }
            }
        }

        // This gets called when closing ACC Charges
        public void RadButton_RefreshACCTotal_Click(object sender, EventArgs e)
        {
            // Execute sp_LoadCalculate then refresh page
            // Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            // qry.sp_LoadCalculate(Convert.ToInt32(HiddenField_LoadId.Value));
            // LoadPopulate();

            // Refresh page (not refreshing page after LoadPopulate). This is called from Pick.ascx.cs SaveStop function.
            // RadAjaxManager1.RaisePostBackEvent("LoadPopulate");

        }

        public void DoLoadPopulate()
        {

        }

        //private decimal ACCTotalDispay()
        //{
        //    // no longer in use..
        //    // Total the ACC Charges and update the ACC Charges label and Load Total with just revenue ACC charges.
        //    Datasets.dsDispatch_AccChargesTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatch_AccChargesTableAdapters.QueriesTableAdapter();
        //    decimal accTotalRevenue = 0;
        //    decimal accTotal = 0;
        //    qry.sp_LoadAccChargesRevenue(Convert.ToInt32(HiddenField_LoadId.Value), out accTotal, out accTotalRevenue);
        //    Label_ACCTotal.Text = accTotal.ToString("C2");
        //    //Label_LoadTotal.Text = "TBD";
        //    Label_ACCBillable.Text = accTotalRevenue.ToString("C2");
        //    return accTotal;
        //}

        protected void RadButton_StatusMoveNext_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            // Increment the Load Status by 1 and then update the load.
            try
            {
                // Prevent "In Transit" Load Status change when Customer Load #, Weight, ACC Charges, or Rate is null
                if (RadComboBox_Status.SelectedValue == "3" && !InTransitValidation())
                {
                    RadWindowManager1.RadAlert("Customer Load #, Weight, ACC Charges, and Rate are all required before you can change the status to In Transit!", 280, 190, "Missing Fields!", "");
                    return;
                }

                RadComboBox_Status.SelectedIndex = RadComboBox_Status.SelectedIndex + 1;
                Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
                Classes.Auth auth = (Classes.Auth)Session["Auth"];
                qry.sp_Load_LoadStatus_UpdateInsert(Convert.ToInt32(HiddenField_LoadId.Value), Convert.ToInt16(RadComboBox_Status.SelectedValue), DateTime.Now, auth.PersonId, true);

                // When the Load Status = Dispatched, show the Dispatch button.
                RadButton_Dispatch.Visible = (RadComboBox_Status.SelectedValue == "2");

                //load the sub types for on hold
                RadComboBox_HoldSub.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private Boolean InTransitValidation()
        {
            Boolean bValid = true;
            bValid = (RadTextBox_CustomerLoadNumber.Text.Trim() != "" && RadNumericText_Weight.Value != null && Label_ACCTotal.Text != "$0.00" && RadNumericTextBox_FlatRate.Value != null);
            return bValid;
        }

        protected void RadButton_Dispatch_Click(object sender, EventArgs e)
        {
            // Check to see if Load is locked by another user:
            if (LockedUserChanged())
                return;

            Page.Validate("Dispatch");

            if (Page.IsValid)
            {
                // open the Dispatch report.
                // ensure at least a pick and a drop exist. Client validation would have already ensured required fields exist for them.
                int LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
                Boolean PickAndDropExists = false;
                Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
                qry.sp_LoadDispatchValidation(LoadId, out PickAndDropExists);

                if (PickAndDropExists)
                {
                    Auth auth = (Auth)Session["Auth"];

                    // Change status to Dispatched if current status is "being entered"
                    if (RadComboBox_Status.SelectedValue == "0" || RadComboBox_Status.SelectedValue == "1")
                    {
                        qry.sp_Load_LoadStatus_UpdateInsert(Convert.ToInt32(HiddenField_LoadId.Value), 2, DateTime.Now, auth.PersonId, true);
                        RadComboBox_Status.SelectedValue = "2";
                        SaveLoad();
                    }
                    else if (Convert.ToInt16(RadComboBox_Status.SelectedValue) > 2)
                    {
                        //load has already moved beyond 'dispatched' so just save the status
                        qry.sp_Load_LoadStatus_UpdateInsert(Convert.ToInt32(HiddenField_LoadId.Value), 2, DateTime.Now, auth.PersonId, false);
                    }

                    RadAjaxManager1.ResponseScripts.Add("openDispatchSheetReport('" + LoadId + "','0');");
                }
                else
                {
                    RadWindowManager1.RadAlert("You must have at least 1 Pick and 1 Drop in order to Dispatch!", 280, 150, "Missing Pick and Drop!", "");
                }
            }
        }

        protected void RadCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            SaveLoad();
        }

        protected void RadCheckBox_AutoRatingInd_Click(object sender, EventArgs e)
        {
            // Save AutoRatingInd to Load table
            //int LoadId = Convert.ToInt32(HiddenField_LoadId.Value);

            //Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            //qry.LoadUpdateAutoRatingInd(RadCheckBox_AutoRatingInd.Checked, LoadId);

            SaveLoad();
        }
        protected void RadDatePicker_PaperworkReceivedDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            SaveLoad();
        }

        private void UpdateFileCountOnFilesButton()
        {
            Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);
            String TotalFiles = "0";

            //// Query the UserFiles folder for this load to determine how many files have been attached
            //string sTopDirectory = Request.PhysicalApplicationPath + @"UserFiles\LoadDocuments\" + LoadId.ToString();
            //if (Directory.Exists(sTopDirectory))
            //    TotalFiles = Directory.GetFiles(sTopDirectory).Length.ToString();
            //else
            //    TotalFiles = "0";

            // Query the LoadFile table for this Load to determine how many documents
            Datasets.dsDispatch_FilesTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatch_FilesTableAdapters.QueriesTableAdapter();
            TotalFiles = qry.LoadFileCount_Get(LoadId).ToString();

            RadButton_FileManagement.Text = "Docs (" + TotalFiles + ")";
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
                // Trailer ALB1000 can be duplicated
                bIsValid = ((RadComboBox_Trailer1.SelectedValue == "177") || (RadComboBox_Trailer1.SelectedValue != RadComboBox_Trailer2.SelectedValue));

            if (!bIsValid)
                RadWindowManager1.RadAlert("Trailers must be Unique!", 300, 150, "Duplicate Trailers", "");

            return bIsValid;
        }

        protected void CustomValidator_Temperature_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;

            String trailerType = RadComboBox_TrailerType.SelectedValue;

            if (trailerType == "6" || trailerType == "5" || trailerType == "1")
                args.IsValid = true;
            else
            {
                // if Per BOL is checked, don't validate temp or temp type
                if (!Convert.ToBoolean(RadCheckBox_AllowPerBOL.Checked))
                {
                    // require Temperature
                    String temp = RadNumericTextBox_Temperature.Value.ToString();
                    args.IsValid = (temp != "");
                }
            }
        }

        protected void CustomValidator_TempModeEquipment_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;

            String trailerType = RadComboBox_TrailerType.SelectedValue;

            if (trailerType == "6" || trailerType == "5" || trailerType == "1")
                args.IsValid = true;
            else
            {
                // if Per BOL is checked, don't validate temp or temp type
                if (!Convert.ToBoolean(RadCheckBox_AllowPerBOL.Checked))
                {
                    // require TempMode
                    string tempType = RadDropDownList_TempMode.SelectedValue;
                    args.IsValid = (tempType != "0");
                }
            }
        }

        private Boolean LockedUserChanged()
        {
            // Determine if Load is currently locked by another user
            Classes.Auth auth = (Classes.Auth)Session["Auth"];
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            miLockedPersonId = qry.LockedUser_Get(Convert.ToInt32(HiddenField_LoadId.Value));

            if (auth.PersonId != miLockedPersonId)
            {
                RadWindowManager1.RadAlert(HttpUtility.HtmlEncode("The Load's lock has been taken over by another user and saves are no loger permitted and the Load will be Closed!"), 500, 130, "Load is now Locked by another user!", "CloseMe2");
                return true;
            }
            return false;
        }
        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            Classes.Auth auth = (Classes.Auth)Session["Auth"];

            // Disable controls if load is in billed status and user is not a Main-Operations-LoadBilledManagement
            Boolean bEnabled = ((auth.Entitlements.Contains(910)) || (!(RadComboBox_Status.SelectedValue == "8")));
            Boolean billingApprovedEnabled = (auth.Entitlements.Contains(920)); //Main-Operations-LoadBilledIndicator

            // check if edi client
            //if edi client then loack ability to add/delete picks and drops
            var clientId = string.IsNullOrEmpty(HiddenField_ClientId.Value) ? 0 : Convert.ToInt32(HiddenField_ClientId.Value);

            using (Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter clientAdapt = new Datasets.dsClientTableAdapters.ClientEdiSettingsTableAdapter())
            {
                IsEdiClient = IsEdiLoad && (clientAdapt.GetData(Convert.ToInt32(clientId)).Select(c => c.IsEdiClient).FirstOrDefault() == true);
            }

            RadComboBox_Status.Enabled = bEnabled;
            RadButton_StatusMoveNext.Enabled = bEnabled;
            RadComboBox_Customer.Enabled = bEnabled;

            RadButton_Pick.Enabled = bEnabled && !IsEdiLocked;
            RadButton_Drop.Enabled = bEnabled && !IsEdiLocked;

            if (IsEdiLoad)
            {
                RadButton_Pick.ToolTip = IsEdiLocked ? "Adding a new Pickup stop is not allowed for EDI enabled loads." : "Add a new Pickup stop.";
                RadButton_Drop.ToolTip = IsEdiLocked ? "Adding a new Delivery stop is not allowed for EDI enabled loads." : "Add a new Delivery stop.";

                //spanEdiLoad.InnerHtml = IsEdiClient ? "<span class='ediBox'><i class='fa-solid fa-lock'></i><b>&nbsp;EDI&nbsp;</b></span>" : "";
                //spanEdiLoad.InnerHtml = IsEdiLocked ? "<a href='javascript:EdiLock();' class='ediBoxLink' title='Click to unlock stops'><span class='ediBoxLocked'><b>&nbsp;EDI&nbsp;</b></span></a>" : "";
                string ediBoxClass = IsEdiLocked ? "ediBoxLocked" : "ediBoxUnLocked";
                spanEdiLoad.InnerHtml = "<a href='javascript:EdiLock();' class='ediBoxLink' title='Click to unlock stops'><span class='" + ediBoxClass + "'><b>&nbsp;EDI&nbsp;</b></span></a>";
            }
            else
            {
                RadButton_Pick.ToolTip = "Add a new Pickup stop.";
                RadButton_Drop.ToolTip = "Add a new Delivery stop.";
            }

            //don't allow pick or drop stops to be deleted if is an edi controlled load
            if (IsEdiClient)
            {
                foreach (RadDock dock in RadDockLayout1.RegisteredDocks)
                {
                    var stopType = dock.Tag.Split(',')[0];

                    if (stopType == "pick" || stopType == "drop")
                    {
                        //remove the 'close' button so they can't delete the stop
                        dock.DefaultCommands = IsEdiLocked ? Telerik.Web.UI.Dock.DefaultCommands.ExpandCollapse : Telerik.Web.UI.Dock.DefaultCommands.ExpandCollapse | Telerik.Web.UI.Dock.DefaultCommands.Close;

                        //DockCommand command = new DockCommand()
                        //{
                        //	AutoPostBack = true,
                        //	Name = "lock",
                        //	CssClass = "lockButton",
                        //	Text = "Unlock EDI stops"
                        //};

                        //dock.Commands.Add(command);
                    }
                }
            }

            RadButton_Leg.Enabled = bEnabled;
            RadButton_FuelStop.Enabled = bEnabled;
            RadComboBox_LoadPlanner.Enabled = bEnabled;
            RadComboBox_Driver1.Enabled = bEnabled;
            RadComboBox_Dispatcher.Enabled = bEnabled;
            RadComboBox_Driver2.Enabled = bEnabled;
            RadComboBox_Commodity.Enabled = bEnabled;
            RadComboBox_Truck1.Enabled = bEnabled;
            RadComboBox_TrailerType.Enabled = bEnabled;
            RadComboBox_Trailer1.Enabled = bEnabled;
            RadNumericTextBox_Temperature.Enabled = bEnabled;
            RadComboBox_Trailer2.Enabled = bEnabled;
            RadDropDownList_TempMode.Enabled = bEnabled;

            // When disabling the Notes field, causes issues. 
            // need to figure out how to make read-only.
            if (!bEnabled)
            {
                //RadEditor_LoadDetailNotes.Attributes["overflow"] = "scroll";
                //RadEditor_LoadDetailNotes.Attributes["border"] = "1px solid white";
            }
            else
            {
                //RadEditor_LoadDetailNotes.Attributes.Clear();
                //RadEditor_LoadDetailNotes.
            }
            //RadEditor_LoadDetailNotes.Enabled = bEnabled;

            RadNumericTextBox_PaidEmpty.Enabled = bEnabled;
            RadNumericTextBox_PaidLoaded.Enabled = bEnabled;
            RadNumericTextBox_Pieces.Enabled = bEnabled;
            RadDatePicker_PaperworkReceivedDate.Enabled = bEnabled;
            RadTextBox_CustomerLoadNumber.Enabled = bEnabled;
            RadNumericText_Weight.Enabled = bEnabled;
            RadNumericTextBox_FlatRate.Enabled = bEnabled;
            RadCheckBox_SendOriginals.Enabled = bEnabled;
            RadCheckBox_BillingApproval.Enabled = billingApprovedEnabled;
            RadCheckBox_AllowPerBOL.Enabled = bEnabled;
            RadCheckBox_AutoRatingInd.Enabled = bEnabled;

            // This worked and disabled all controls in the Stop but the RadEditor didn't display correctly.
            //foreach(Control doc in RadDockLayout1.Controls)
            //{
            //    if (doc is RadDock)
            //    {
            //        ((RadDock)doc).Enabled = bEnabled;
            //    }
            //}
            foreach (RadDock doc in RadDockZone1.Docks)
            {
                //doc.Enabled = bEnabled;
            }
        }
        protected void RadComboBox_HoldSub_DataBinding(object sender, EventArgs e)
        {
            RadComboBox_HoldSub.DataSource = GetSubTypes();
        }

        protected void RadCheckBox_MileageOverride_CheckedChanged(object sender, EventArgs e)
        {
            SaveLoad();
        }

        //called by pick, drop, leg user controls on status change
        //protected void SendStatusChangeToClient(int loadId, int loadStopId, DateTime statusUpdateDate)
        protected void SendStatusChangeToClient(object sender, SendStatusUpdateArgs args)
        {
            string mode = HiddenField_Mode.Value;

            args.TenderId = Convert.ToInt32(HiddenField_TenderId.Value);
            args.LoadId = args.LoadId == 0 ? Convert.ToInt32(HiddenField_LoadId.Value) : args.LoadId;
            args.ClientId = args.ClientId == 0 ? Convert.ToInt32(HiddenField_ClientId.Value) : args.ClientId;

            args.TruckNumber = RadComboBox_Truck1.SelectedIndex < 0 ? "" : RadComboBox_Truck1.SelectedValue;
            args.TrailerNumber = RadComboBox_Trailer1.SelectedIndex < 0 ? "" : RadComboBox_Trailer1.SelectedValue;

            args.ShipmentNumber = RadTextBox_CustomerLoadNumber.Text;

            //var stopId = Convert.ToInt32(HiddenField_LoadStopId.Value);
            //var statusReason = args.StatusReason;

            //using (Datasets.dsDispatchTableAdapters.LoadStopTableAdapter adapt = new Datasets.dsDispatchTableAdapters.LoadStopTableAdapter())
            //{
            //	Datasets.dsDispatch.LoadStopRow row = adapt.GetCertainStop(loadId).FirstOrDefault();
            //	stopTypeName = row.LoadStopTypeName;
            //}

            //switch (args.StatusReason)
            //{
            //	case "PICK":
            //		break;
            //	case "DROP":
            //		break;
            //	case "LEG":
            //		break;
            //}

            //stop status changed so send EDI message to client based on current status type
            //Services.EDIService.SendStatusChangeToClient("T", tripNumber, stopId, customerLoadNumber, HiddenField_ClientId.Value, "");
            Services.EDIService.SendStatusChangeToClient(true, "T", Convert.ToInt32(HiddenField_ClientId.Value), args, mode);

        }

        protected void RadButton_busUnitConv_Click(object sender, EventArgs e)
        {

            //Get current load obj
            Int32 LoadId = Convert.ToInt32(HiddenField_LoadId.Value);

            var result = ConvertDispatchLoad(LoadId);

            if (result)
            {
                Response.Redirect("~/Pages/ContainerPages/Logistics_DispatchSheet.aspx?LoadId=" + LoadId);
            }
            else
            {
                //show error message0
            }
        }

        private bool ConvertDispatchLoad(int LoadId)
        {
            bool retValue = true;

            try
            {
                // Execute sp_LoadCopy and pass selected copy types
                using (Datasets.dsDispatchTableAdapters.QueriesTableAdapter qry = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter())
                {
                    qry.sp_Load_MoveToLogistics(LoadId, auth.PersonId);
                }
            }
            catch (SqlException ex)
            {
                retValue = false;
            }

            return retValue;
        }

        //    private int ConvertDispatchLoadOld(int LoadId)
        //    {
        //        int retVal = 0;

        //        try
        //        {
        //            Datasets.dsDispatchTableAdapters.LoadTableAdapter adaptLoad = new Datasets.dsDispatchTableAdapters.LoadTableAdapter();
        //            Datasets.dsDispatch.LoadDataTable tblLoad = null;
        //            Datasets.dsDispatch.LoadRow rowLoad = null;

        //            // Populate Load details and LOAD section
        //            tblLoad = adaptLoad.GetData(LoadId);
        //            rowLoad = tblLoad[0];

        //            //convert this trucking load to a logistics load
        //            Datasets.dsLogisticsTableAdapters.LoadTableAdapter adaptLogLoad = new Datasets.dsLogisticsTableAdapters.LoadTableAdapter();
        //            Datasets.dsLogistics.LoadDataTable tblLogLoad = new dsLogistics.LoadDataTable();
        //            Datasets.dsLogistics.LoadRow rowLogLoad = tblLogLoad.NewLoadRow();

        //            //rowLogLoad.LoadId = rowLoad.LoadId;
        //            rowLogLoad.TripNumber = rowLoad.TripNumber;
        //            if (!rowLoad.IsClientIdNull()) rowLogLoad.ClientId = rowLoad.ClientId;
        //            if (!rowLoad.IsChargesNull()) rowLogLoad.Charges = rowLoad.Charges;
        //            if (!rowLoad.IsExtraChargesNull()) rowLogLoad.ExtraCharges = rowLoad.ExtraCharges;
        //            if (!rowLoad.IsMilesNull()) rowLogLoad.Miles = rowLoad.Miles;
        //            if (!rowLoad.IsPaidMilesNull()) rowLogLoad.PaidMiles = rowLoad.PaidMiles;
        //            if (!rowLoad.IsPaidEmptyNull()) rowLogLoad.PaidEmpty = rowLoad.PaidEmpty;
        //            if (!rowLoad.IsDeadHeadNull()) rowLogLoad.DeadHead = rowLoad.DeadHead;
        //            if (!rowLoad.IsPaidNull()) rowLogLoad.Paid = rowLoad.Paid;
        //            if (!rowLoad.IsRatePerMileNull()) rowLogLoad.RatePerMile = rowLoad.RatePerMile;
        //            if (!rowLoad.IsDispatcherPersonIdNull()) rowLogLoad.DispatcherPersonId = rowLoad.DispatcherPersonId;
        //            if (!rowLoad.IsCreatedTsNull()) rowLogLoad.CreatedTs = rowLoad.CreatedTs;
        //            if (!rowLoad.IsAvailableBillingNull()) rowLogLoad.AvailableBilling = rowLoad.AvailableBilling;
        //            if (!rowLoad.IsCommodityTypeIdNull()) rowLogLoad.CommodityTypeId = rowLoad.CommodityTypeId;
        //            // rowLogLoad.BrokerPersonId = rowLoad.BrokerPersonId;
        //            if (!rowLoad.IsEquipmentTypeIdNull()) rowLogLoad.EquipmentTypeId = rowLoad.EquipmentTypeId;
        //            if (!rowLoad.IsTemperatureNull()) rowLogLoad.Temperature = rowLoad.Temperature;
        //            if (!rowLoad.IsTemperatureTypeIdNull()) rowLogLoad.TemperatureTypeId = rowLoad.TemperatureTypeId;
        //            if (!rowLoad.IsCustomerLoadNumberNull()) rowLogLoad.CustomerLoadNumber = rowLoad.CustomerLoadNumber;
        //            if (!rowLoad.IsWeightNull()) rowLogLoad.Weight = rowLoad.Weight;
        //            if (!rowLoad.IsRateNull()) rowLogLoad.Rate = rowLoad.Rate;
        //            if (!rowLoad.IsLoadStatusTypeIdNull()) rowLogLoad.LoadStatusTypeId = rowLoad.LoadStatusTypeId;
        //            if (!rowLoad.IsGrossRevenueNull()) rowLogLoad.GrossRevenue = rowLoad.GrossRevenue;
        //            if (!rowLoad.IsCreatedDtNull()) rowLogLoad.CreatedDt = rowLoad.CreatedDt;
        //            if (!rowLoad.IsCreatePersonIdNull()) rowLogLoad.CreatePersonId = rowLoad.CreatePersonId;
        //            if (!rowLoad.IsLastUpdtDtNull()) rowLogLoad.LastUpdtDt = rowLoad.LastUpdtDt;
        //            if (!rowLoad.IsLastUpdtPersonIdNull()) rowLogLoad.LastUpdtPersonId = rowLoad.LastUpdtPersonId;
        //            if (!rowLoad.IsSubTotalNull()) rowLogLoad.SubTotal = rowLoad.SubTotal;
        //            if (!rowLoad.IsLockedPersonIdNull()) rowLogLoad.LockedPersonId = rowLoad.LockedPersonId;
        //            if (!rowLoad.IsPiecesNull()) rowLogLoad.Pieces = rowLoad.Pieces;
        //            if (!rowLoad.IsSendOriginalsIndNull()) rowLogLoad.SendOriginalsInd = rowLoad.SendOriginalsInd;
        //            if (!rowLoad.IsLoadTotalNull()) rowLogLoad.LoadTotal = rowLoad.LoadTotal;
        //            if (!rowLoad.IsAutoRatingIndNull()) rowLogLoad.AutoRatingInd = rowLoad.AutoRatingInd;
        //            if (!rowLoad.IsAccChargesTotalNull()) rowLogLoad.AccChargesTotal = rowLoad.AccChargesTotal;
        //            if (!rowLoad.IsPaperworkRecvdDateNull()) rowLogLoad.PaperworkRecvdDate = rowLoad.PaperworkRecvdDate;
        //            // rowLogLoad.InvoiceDate = rowLoad.InvoiceDate;
        //            //  rowLogLoad.ProblemInd = rowLoad.TripNumber;
        //            if (!rowLoad.IsAllowPerBOLIndNull()) rowLogLoad.AllowPerBOLInd = rowLoad.AllowPerBOLInd;
        //            if (!rowLoad.IsDriver1_PersonIdNull()) rowLogLoad.Driver1 = getPersonName(rowLoad.Driver1_PersonId);
        //            if (!rowLoad.IsDriver2_PersonIdNull()) rowLogLoad.Driver2 = getPersonName(rowLoad.Driver2_PersonId);
        //            if (!rowLoad.IsTruckPunitIdNull()) rowLogLoad.Truck = getTruckPunitName(rowLoad.TruckPunitId);
        //            if (!rowLoad.IsTrailer1_TrailerIdNull()) rowLogLoad.Trailer1 = getTrailerName(rowLoad.Trailer1_TrailerId);
        //            if (!rowLoad.IsTrailer2_TrailerIdNull()) rowLogLoad.Trailer2 = getTrailerName(rowLoad.Trailer2_TrailerId);
        //            // rowLogLoad.Driver1Phone = rowLoad.Driver1Phone;
        //            //rowLogLoad.CarrierId = rowLoad.carr;
        //            //  rowLogLoad.CarrierNotes = rowLoad.TripNumber;
        //            // rowLogLoad.CarrierAccChargesBillable = rowLoad.TripNumber;
        //            //  rowLogLoad.CarrierAccChargesNonBillable = rowLoad.TripNumber;
        //            //  rowLogLoad.CarrierRate = rowLoad.TripNumber;
        //            //rowLogLoad.Margin = rowLoad.Margin;
        //            //rowLogLoad.MarginPercent = rowLoad.MarginPercent;
        //            //rowLogLoad.CarrierPayTotal = rowLoad.CarrierPayTotal;
        //            //rowLogLoad.CarrierAutoRatingInd = rowLoad.CarrierAutoRatingInd;
        //            //rowLogLoad.TenderId = rowLoad.TenderId;
        //            //rowLogLoad.RateWasSent = rowLoad.RateWasSent;
        //            rowLogLoad.TruckPunitId = rowLoad.TruckPunitId;
        //            tblLogLoad.Rows.Add(rowLogLoad);
        //            adaptLogLoad.Update(tblLogLoad);

        //            retVal = rowLogLoad.LoadId;

        //            //move load billing
        //            Datasets.dsDispatchTableAdapters.LoadBillingTableAdapter adaptBilling = new Datasets.dsDispatchTableAdapters.LoadBillingTableAdapter();
        //            Datasets.dsDispatch.LoadBillingDataTable tblBilling = adaptBilling.GetDataByLoad(LoadId);

        //            Datasets.dsLogisticsTableAdapters.LoadBillingTableAdapter adaptBillingLog = new Datasets.dsLogisticsTableAdapters.LoadBillingTableAdapter();
        //            Datasets.dsLogistics.LoadBillingDataTable tblBillingLog = new dsLogistics.LoadBillingDataTable();
        //            foreach (var recd in tblBilling)
        //            {
        //                //create new logistics record
        //                var row = tblBillingLog.NewLoadBillingRow();

        //                row.LoadId = rowLogLoad.LoadId;
        //                row.ImportErrors = recd.ImportErrors;
        //                row.ImportedDt = recd.ImportedDt;
        //                row.ImportSuccess = recd.ImportSuccess;
        //                tblBillingLog.Rows.Add(row);
        //            }

        //            adaptBillingLog.Update(tblBillingLog);

        //            //move load file
        //            Datasets.dsDispatchTableAdapters.LoadFileTableAdapter adaptFile = new Datasets.dsDispatchTableAdapters.LoadFileTableAdapter();
        //            Datasets.dsDispatch.LoadFileDataTable tblFiles = adaptFile.GetDataByLoad(LoadId);
        //            //  Datasets.dsDispatch_Files.LoadFileRow rowFiles = tblFiles[0];

        //            Datasets.dsLogisticsTableAdapters.LoadFileTableAdapter adaptFileLog = new Datasets.dsLogisticsTableAdapters.LoadFileTableAdapter();
        //            Datasets.dsLogistics.LoadFileDataTable tblFilesLog = new dsLogistics.LoadFileDataTable();

        //            foreach (var recd in tblFiles)
        //            {
        //                //create new logistics record
        //                var row = tblFilesLog.NewLoadFileRow();
        //                row.LoadId = rowLogLoad.LoadId;
        //                row.LoadFileTypeId = recd.LoadFileTypeId;
        //                row.AddedByPersonId = recd.AddedByPersonId;
        //                row.AddedDate = recd.AddedDate;
        //                row.ModifiedDate = recd.ModifiedDate;
        //                row.ActiveInd = recd.ActiveInd;
        //                tblFilesLog.Rows.Add(row);
        //            }

        //            adaptFileLog.Update(tblFilesLog);

        //            //move load notes
        //            Datasets.dsDispatchTableAdapters.LoadNotes1TableAdapter adaptNotes = new Datasets.dsDispatchTableAdapters.LoadNotes1TableAdapter();
        //            Datasets.dsDispatch.LoadNotes1DataTable tblNotes = adaptNotes.GetDataByLoad(LoadId);
        //            //  Datasets.dsDispatch.LoadNotesRow rowNotes = tblNotes[0];

        //            Datasets.dsLogisticsTableAdapters.LoadNotes1TableAdapter adaptNotesLog = new Datasets.dsLogisticsTableAdapters.LoadNotes1TableAdapter();
        //            Datasets.dsLogistics.LoadNotes1DataTable tblNotesLog = new dsLogistics.LoadNotes1DataTable();

        //            foreach (var recd in tblNotes)
        //            {
        //                if (recd.LoadStopid > 0)
        //                {
        //                    //create new logistics record
        //                    var row = tblNotesLog.NewLoadNotes1Row();

        //                    //recreate notes rows with loadid matching and loadstopid of 0
        //                    row.NoteTypeId = recd.NoteTypeId;
        //                    row.LoadId = rowLogLoad.LoadId;
        //                    row.LoadStopid = recd.LoadStopid;
        //                    row.NoteDate = recd.NoteDate;
        //                    row.NotePersonId = recd.NotePersonId;
        //                    row.NoteText = recd.NoteText;
        //                    row.ArchivedInd = recd.ArchivedInd;
        //                    row.Action = recd.Action;
        //                    row.ActionPersonId = recd.ActionPersonId;
        //                    row.ActionDate = recd.ActionDate;
        //                    tblNotesLog.Rows.Add(row);
        //                }
        //            }

        //            // rowLogLoad.Driver1 = rowLoad.Driver1;
        //            // rowLogLoad.Driver2 = rowLoad.Driver2;
        //            // rowLogLoad.Truck = rowLoad.Truck;
        //            //rowLogLoad.Trailer1 = rowLoad.Trailer1;
        //            // rowLogLoad.Trailer2 = rowLoad.Trailer2;
        //            // rowLogLoad.Driver1Phone = rowLoad.Driver1Phone;
        //            // rowLogLoad.CarrierId = rowLoad.CarrierId;
        //            //  rowLogLoad.CarrierNotes = rowLoad.TripNumber;
        //            // rowLogLoad.CarrierAccChargesBillable = rowLoad.TripNumber;
        //            //  rowLogLoad.CarrierAccChargesNonBillable = rowLoad.TripNumber;
        //            //  rowLogLoad.CarrierRate = rowLoad.TripNumber;
        //            //rowLogLoad.Margin = rowLoad.Margin;
        //            //rowLogLoad.MarginPercent = rowLoad.MarginPercent;
        //            //rowLogLoad.CarrierPayTotal = rowLoad.CarrierPayTotal;
        //            //rowLogLoad.CarrierAutoRatingInd = rowLoad.CarrierAutoRatingInd;
        //            //rowLogLoad.TenderId = rowLoad.TenderId;
        //            //rowLogLoad.RateWasSent = rowLoad.RateWasSent;
        //            //rowLogLoad.TruckPunitId = rowLoad.TruckPunitId;
        //            //add note with non transferable values
        //            //////var newNoteRow = tblNotesLog.NewLoadNotes1Row();
        //            //////newNoteRow.NoteTypeId = 2;
        //            //////newNoteRow.LoadId = rowLogLoad.LoadId;
        //            //////newNoteRow.LoadStopid = 0;
        //            //////newNoteRow.NoteDate = DateTime.Now;
        //            //////newNoteRow.NotePersonId = auth.PersonId;

        //            //////StringBuilder sb = new StringBuilder();
        //            //////if (!rowLoad.Driver1()) sb.AppendLine()

        //            //////    newNoteRow.NoteText = sb.ToString();

        //            //////tblNotesLog.Rows.Add(newNoteRow);
        //            adaptNotesLog.Update(tblNotesLog);

        //            //move load status
        //            Datasets.dsDispatchTableAdapters.LoadStatusTableAdapter adaptStatus = new Datasets.dsDispatchTableAdapters.LoadStatusTableAdapter();
        //            Datasets.dsDispatch.LoadStatusDataTable tblStatus = adaptStatus.GetDataByLoadId(LoadId);

        //            Datasets.dsLogisticsTableAdapters.LoadStatusTableAdapter adaptStatusLog = new Datasets.dsLogisticsTableAdapters.LoadStatusTableAdapter();
        //            Datasets.dsLogistics.LoadStatusDataTable tblStatusLog = new dsLogistics.LoadStatusDataTable();
        //            //Datasets.dsDispatch_Files.LoadFileRow rowFiles = tblFiles[0];

        //            foreach (var recd in tblStatus)
        //            {
        //                //create new logistics record
        //                var row = tblStatusLog.NewLoadStatusRow();
        //                row.StatusTs = recd.StatusTs;
        //                row.LoadId = rowLogLoad.LoadId;
        //                row.LoadStatusTypeId = recd.LoadStatusTypeId;
        //                row.LstUpdtPersonId = recd.LstUpdtPersonId;
        //                tblStatusLog.Rows.Add(row);
        //            }

        //            adaptStatusLog.Update(tblStatusLog);


        //            //move loadstop
        //            Datasets.dsDispatchTableAdapters.LoadStopTransfTableAdapter adaptStops = new Datasets.dsDispatchTableAdapters.LoadStopTransfTableAdapter();
        //            Datasets.dsDispatch.LoadStopTransfDataTable tblStops = adaptStops.GetDataByLoad(LoadId);
        //            Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTransfTableAdapter adaptPendingTransf = new Datasets.dsDispatchTableAdapters.LoadStatusUpdate_PendingTransfTableAdapter();

        //            Datasets.dsLogisticsTableAdapters.LoadStopTransfTableAdapter adaptStopsLog = new Datasets.dsLogisticsTableAdapters.LoadStopTransfTableAdapter();
        //            Datasets.dsLogistics.LoadStopTransfDataTable tblStopsLog;

        //List<string> pendingIds = new List<string>();

        //            foreach (var stop in tblStops)
        //            {
        //                tblStopsLog = new dsLogistics.LoadStopTransfDataTable();
        //                //create new logistics stop record
        //                var row = tblStopsLog.NewLoadStopTransfRow();
        //                if (!stop.IsCurrentStopStatusTypeIdNull()) row.CurrentStopStatusTypeId = stop.CurrentStopStatusTypeId;
        //                row.LoadId = rowLogLoad.LoadId;
        //                if (!stop.IsCurrentStopStatusTypeIdNull()) row.CurrentStopStatusTypeId = stop.CurrentStopStatusTypeId;
        //                row.LoadStopTypeId = stop.LoadStopTypeId;
        //                row.StopNumber = stop.StopNumber;
        //                row.StopTypeNumber = stop.StopTypeNumber;
        //                if (!stop.IsEquipmentTypeIdNull()) row.EquipmentTypeId = stop.EquipmentTypeId;
        //                if (!stop.IsLoadApptTypeIdNull()) row.LoadApptTypeId = stop.LoadApptTypeId;
        //                if (!stop.IsClientIdNull()) row.ClientId = stop.ClientId;
        //                // row.Notes = stop.Notes;
        //                if (!stop.IsStartDateTimeNull()) row.StartDateTime = stop.StartDateTime;
        //                if (!stop.IsThroughDateTimeNull()) row.ThroughDateTime = stop.ThroughDateTime;
        //                if (!stop.IsPONumberNull()) row.PONumber = stop.PONumber;
        //                if (!stop.IsBillOfLadingNull()) row.BillOfLading = stop.BillOfLading;
        //                if (!stop.IsPUNumberNull()) row.PUNumber = stop.PUNumber;
        //                if (!stop.IsOtherNull()) row.Other = stop.Other;
        //                if (!stop.IsDeliveryNumber1Null()) row.DeliveryNumber1 = stop.DeliveryNumber1;
        //                if (!stop.IsDeliveryNumber2Null()) row.DeliveryNumber2 = stop.DeliveryNumber2;
        //                if (!stop.IsDeliveryNumber3Null()) row.DeliveryNumber3 = stop.DeliveryNumber3;
        //                if (!stop.IsDeliveryNumber4Null()) row.DeliveryNumber4 = stop.DeliveryNumber4;
        //                if (!stop.IsAdhocClientNameNull()) row.AdhocClientName = stop.AdhocClientName;
        //                if (!stop.IsAdhocClientAddressLine1Null()) row.AdhocClientAddressLine1 = stop.AdhocClientAddressLine1;
        //                if (!stop.IsAdhocClientAddressLine2Null()) row.AdhocClientAddressLine2 = stop.AdhocClientAddressLine2;
        //                if (!stop.IsAdhocClientCityNull()) row.AdhocClientCity = stop.AdhocClientCity;
        //                if (!stop.IsAdhocClientStateNull()) row.AdhocClientState = stop.AdhocClientState;
        //                if (!stop.IsAdhocClientZipCodeNull()) row.AdhocClientZipCode = stop.AdhocClientZipCode;
        //                if (!stop.IsAdhocTimeZoneNull()) row.AdhocTimeZone = stop.AdhocTimeZone;
        //                if (!stop.IsGasStationIdNull()) row.GasStationId = stop.GasStationId;
        //                if (!stop.IsStartDateTime_DisplayTimeIndNull()) row.StartDateTime_DisplayTimeInd = stop.StartDateTime_DisplayTimeInd;
        //                if (!stop.IsThroughDateTime_DisplayTimeIndNull()) row.ThroughDateTime_DisplayTimeInd = stop.ThroughDateTime_DisplayTimeInd;
        //                if (!stop.IsFuelGallonsNull()) row.FuelGallons = stop.FuelGallons;
        //                if (!stop.IsDEFGallonsNull()) row.DEFGallons = stop.DEFGallons;
        //                if (!stop.IsPaidMilesNull()) row.PaidMiles = stop.PaidMiles;
        //                if (!stop.IsPaidEmptyNull()) row.PaidEmpty = stop.PaidEmpty;
        //                if (!stop.IsDropStartDateTimeNull()) row.DropStartDateTime = stop.DropStartDateTime;
        //                if (!stop.IsDropStartDateTime_DisplayTimeIndNull()) row.DropStartDateTime_DisplayTimeInd = stop.DropStartDateTime_DisplayTimeInd;
        //                //row.OldStartActualDateTime = stop.OldStartActualDateTime;
        //                //  row.Driver1 = stop.Driver1;
        //                //row.Driver2 = stop.Driver2;
        //                //row.Truck = stop.Truck;
        //                //row.Trailer1 = stop.Trailer1;
        //                //row.Trailer2 = stop.Trailer2;
        //                //row.CarrierId = stop.CarrierId;
        //                if (!stop.IsArrivalDateTimeNull()) row.ArrivalDateTime = stop.ArrivalDateTime;
        //                if (!stop.IsDepartureDateTimeNull()) row.DepartureDateTime = stop.DepartureDateTime;
        //                if (!stop.IsLoadTypeIdNull()) row.LoadTypeId = stop.LoadTypeId;
        //                //row.HookTrailer1 = stop.HookTrailer1;
        //                if (!stop.IsTrailerDropDateTimeNull()) row.TrailerDropDateTime = stop.TrailerDropDateTime;
        //                if (!stop.IsPlanDateTimeNull()) row.PlanDateTime = stop.PlanDateTime;
        //                row.AppointmentConfirmationNumber = (!stop.IsPlanDateTimeNull()) ? stop.AppointmentConfirmationNumber : "";

        //                tblStopsLog.Rows.Add(row);
        //                adaptStopsLog.Update(tblStopsLog);
        //                int newStopId = (int)adaptStopsLog.getLatestLoadId(rowLogLoad.LoadId);

        //                //move any load status update pending records to this new stop id

        //                Datasets.dsDispatch.LoadStatusUpdate_PendingTransfDataTable tblPendingTransf = adaptPendingTransf.GetDataByStop(stop.LoadStopId);

        //                Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTransfTableAdapter adaptPendingTransfLog = new Datasets.dsLogisticsTableAdapters.LoadStatusUpdate_PendingTransfTableAdapter();
        //                Datasets.dsLogistics.LoadStatusUpdate_PendingTransfDataTable tblPendingTransfLog = new dsLogistics.LoadStatusUpdate_PendingTransfDataTable();

        //                foreach (var pendingRcrd in tblPendingTransf)
        //                {
        //                    pendingIds.Add(pendingRcrd.Id.ToString());
        //                    var rowPend = tblPendingTransfLog.NewLoadStatusUpdate_PendingTransfRow();
        //                    rowPend.BusinessUnitId = pendingRcrd.BusinessUnitId;
        //                    rowPend.OpenInd = pendingRcrd.OpenInd;
        //                    rowPend.StatusDate = pendingRcrd.StatusDate;
        //                    rowPend.DateType = pendingRcrd.DateType;
        //                    rowPend.LoadStopId = newStopId;
        //                    tblPendingTransfLog.Rows.Add(rowPend);
        //                }

        //                adaptPendingTransfLog.Update(tblPendingTransfLog);

        //                //move any load notes records for this loadstopid over as we bypassed them in the initial loadnotes migration loop
        //                var stopNotesTble = adaptNotesLog.GetDataByStop(stop.LoadStopId);

        //                foreach (var NotesRcrd in stopNotesTble)
        //                {
        //                    var newNoteRow = stopNotesTble.NewLoadNotes1Row();
        //                    newNoteRow.NoteTypeId = NotesRcrd.NoteTypeId;
        //                    newNoteRow.LoadId = rowLogLoad.LoadId;
        //                    newNoteRow.LoadStopid = newStopId;
        //                    newNoteRow.NoteDate = NotesRcrd.NoteDate;
        //                    newNoteRow.NotePersonId = NotesRcrd.NotePersonId;
        //                    newNoteRow.NoteText = NotesRcrd.NoteText;
        //                    newNoteRow.ArchivedInd = NotesRcrd.ArchivedInd;
        //                    newNoteRow.Action = NotesRcrd.Action;
        //                    newNoteRow.ActionPersonId = NotesRcrd.ActionPersonId;
        //                    newNoteRow.ActionDate = NotesRcrd.ActionDate;
        //                    stopNotesTble.Rows.Add(newNoteRow);
        //                }

        //                adaptNotesLog.Update(stopNotesTble);
        //           }

        //            //move loadstop ref numbers//////// none in db

        //            //move load to loadstatus substype
        //            Datasets.dsDispatchTableAdapters.LoadToLoadStatusSubTypeTableAdapter adaptLTLS = new Datasets.dsDispatchTableAdapters.LoadToLoadStatusSubTypeTableAdapter();
        //            Datasets.dsDispatch.LoadToLoadStatusSubTypeDataTable tblLTLS = adaptLTLS.GetDataByLoad(LoadId);

        //            Datasets.dsLogisticsTableAdapters.LoadToLoadStatusSubTypeTableAdapter adaptLTLSLog = new Datasets.dsLogisticsTableAdapters.LoadToLoadStatusSubTypeTableAdapter();
        //            Datasets.dsLogistics.LoadToLoadStatusSubTypeDataTable tblLTLSLog = adaptLTLSLog.GetDataByLoad(LoadId);

        //            foreach (var recd in tblLTLS)
        //            {
        //                //create new logistics record
        //                var row = tblLTLSLog.NewLoadToLoadStatusSubTypeRow();
        //                row.LoadStatusSubTypeId = recd.LoadStatusSubTypeId;
        //                row.LoadId = rowLogLoad.LoadId;
        //                row.CustomVal = recd.CustomVal;

        //                tblLTLSLog.Rows.Add(row);
        //            }

        //            adaptLTLSLog.Update(tblLTLSLog);

        //            //move loadtrace
        //            Datasets.dsDispatchTableAdapters.LoadTraceTableAdapter adaptTrace = new Datasets.dsDispatchTableAdapters.LoadTraceTableAdapter();
        //            Datasets.dsDispatch.LoadTraceDataTable tblTrace = adaptTrace.GetDataByLoad(LoadId);

        //            Datasets.dsLogisticsTableAdapters.LoadTraceTableAdapter adaptTraceLog = new Datasets.dsLogisticsTableAdapters.LoadTraceTableAdapter();
        //            Datasets.dsLogistics.LoadTraceDataTable tblTraceLog = adaptTraceLog.GetDataByLoad(LoadId);

        //            foreach (var recd in tblTrace)
        //            {
        //                //create new logistics record
        //                var row = tblTraceLog.NewLoadTraceRow();
        //                row.TraceNumber = recd.TraceNumber;
        //                row.LoadTraceTypeId = recd.LoadTraceTypeId;
        //                row.LoadId = rowLogLoad.LoadId;
        //                tblTraceLog.Rows.Add(row);
        //            }

        //            adaptTraceLog.Update(tblTraceLog);


        //            //delete old load info///////////////////////////////////////////////////////////////////
        //            foreach (var delRcd in tblTrace)
        //            {
        //                adaptTrace.Delete(delRcd.LoadTraceId);
        //            }

        //            foreach (var delRcd in tblLTLS)
        //            {
        //                adaptLTLS.Delete(delRcd.LoadToLoadStatusSubTypeId);
        //            }

        //            foreach (var delRcd in pendingIds)
        //            {
        //                adaptPendingTransf.Delete(int.Parse(delRcd));
        //            }

        //            foreach (var delRcd in tblStops)
        //            {
        //                adaptStops.Delete(delRcd.LoadStopId);
        //            }

        //            foreach (var delRcd in tblStatus)
        //            {
        //                adaptStatus.Delete(delRcd.LoadStatusId);
        //            }

        //            foreach (var delRcd in tblNotes)
        //            {
        //                adaptNotes.Delete(delRcd.NoteId);
        //            }

        //            foreach (var delRcd in tblFiles)
        //            {
        //                adaptFile.Delete(delRcd.LoadFileId);
        //            }

        //            foreach (var delRcd in tblBilling)
        //            {
        //                adaptBilling.Delete(delRcd.LoadId);
        //            }

        //            adaptLoad.Delete(LoadId);
        //        }
        //        catch (Exception ex)
        //        {
        //            retVal = 0;
        //        }

        //        return retVal;
        //    }

        private string getPersonName(int PersonId)
        {
            string retVal = "";

            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qAdapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            retVal = qAdapt.GetPersonName(PersonId);

            return retVal;
        }

        private string getTrailerName(int TrailerId)
        {
            string retVal = "";

            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qAdapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            retVal = qAdapt.GetTrailerName((Int16)TrailerId);

            return retVal;
        }

        private string getTruckPunitName(int PUnitId)
        {
            string retVal = "";
            Datasets.dsDispatchTableAdapters.QueriesTableAdapter qAdapt = new Datasets.dsDispatchTableAdapters.QueriesTableAdapter();
            retVal = (string)qAdapt.GetPunitTruckName(PUnitId);

            return retVal;
        }

        protected void SendStatusChangeToClient(int loadId, int stopId, int clientId, string statusCode, DateTime statusDate,
            string statusReason, EDIService.StatusDateType StatusDateType, EDIService.ShipmentStatusType shipmentStatusType, string mode)
        {
            //SendEdiStatus(0, Convert.ToInt32(HiddenField_LoadStopId.Value), 0, "AF", departureDateTime, "NS", EDIService.StatusDateType.Departure, EDIService.ShipmentStatusType.StatusChange, sender);
            //int loadId, int stopId, int clientId, string statusCode, DateTime statusDate, string statusReason, EDIService.StatusDateType StatusDateType, EDIService.ShipmentStatusType shipmentStatusType, object sender
            //if time change send as 214 transaction
            //if truck/trailer/driver... send as ??? transaction

            SendStatusUpdateArgs args = new SendStatusUpdateArgs()
            {
                LoadBussinessUnit = "T",
                TenderId = Convert.ToInt32(HiddenField_TenderId.Value),
                LoadId = loadId,
                StopId = stopId,
                ClientId = clientId,
                ShipmentNumber = HiddenField_CustomerLoadNumber.Value,
                StatusCode = statusCode,
                StatusDate = statusDate,
                StatusDateType = StatusDateType,
                StatusReason = statusReason,
                StatusType = shipmentStatusType,
                TruckNumber = RadComboBox_Truck1.SelectedValue,
                TrailerNumber = RadComboBox_Trailer1.SelectedValue
            };

            //args.LoadId = args.LoadId == 0 ? Convert.ToInt32(HiddenField_LoadId.Value) : args.LoadId;
            //args.ClientId = args.ClientId == 0 ? Convert.ToInt32(HiddenField_ClientId.Value) : args.ClientId;

            ////stop status changed so send EDI message to client based on current status type
            ////Services.EDIService.SendStatusChangeToClient("T", tripNumber, stopId, customerLoadNumber, HiddenField_ClientId.Value, "");

            Services.EDIService.SendStatusChangeToClient(true, "T", clientId, args, mode);
        }
    }
}