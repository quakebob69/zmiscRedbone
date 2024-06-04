using RedbonePlatform.Datasets.dsCertificationsTableAdapters;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections.Generic;
using static RedbonePlatform.Datasets.dsCertifications;
using static RedbonePlatform.Datasets.dsPersonAddressContact;
using System.Text;
using Telerik.Web.UI.Widgets;
using System.Windows.Forms.VisualStyles;

namespace RedbonePlatform.Pages.ContainerPages
{
    public partial class PersonEdit_Personal : System.Web.UI.Page
    {
        private Classes.Auth auth = null;
        // ToDo: Add regex validation to Google Login Email.

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
                if (!auth.Entitlements.Contains(200)) // RedbonePlatform-Main-ManagePeople
                {
                    Response.Redirect("~/AccessDenied.aspx", true);
                    return;
                }
            }

            if (!Page.IsPostBack)
            {
                ApplyUserSettings();

                string PersonId = Request.QueryString["PersonId"];
                HiddenField_PersonId.Value = PersonId;

                //certificates
                HiddenField_ShowInactiveCertifications.Value = "False";
                // for dev purposes for ease of validation
                //RadGrid_Certifications.MasterTableView.IsItemInserted = true;
                //RadGrid_Certifications.Rebind();

                // Load Availability Types (avoid disabled ones that are not assigned to this user)
                Datasets.dsPartyMaintenanceTableAdapters.sp_AvailabilityTypesWithPartyMappingTableAdapter adaptAvailabilityTypeMapping = new Datasets.dsPartyMaintenanceTableAdapters.sp_AvailabilityTypesWithPartyMappingTableAdapter();
                Datasets.dsPartyMaintenance.sp_AvailabilityTypesWithPartyMappingDataTable tblAvailabilityTypeMapping = adaptAvailabilityTypeMapping.GetData(Convert.ToInt32(PersonId));

                foreach (Datasets.dsPartyMaintenance.sp_AvailabilityTypesWithPartyMappingRow row in tblAvailabilityTypeMapping)
                {
                    if (row.Enabled || row.Assigned)
                    {
                        DropDownListItem itm = new DropDownListItem(row.Description, row.AvailabilityTypeId.ToString());
                        RadDropDownList_Availability.Items.Add(itm);
                    }
                }

                //Mappings
                LoadMappings(Convert.ToInt32(PersonId));

                //populate regions list
                Datasets.dsPersonAddressContactTableAdapters.RegionTableAdapter adaptRegion = new Datasets.dsPersonAddressContactTableAdapters.RegionTableAdapter();
                Datasets.dsPersonAddressContact.RegionDataTable tblRegion = adaptRegion.GetData();
                foreach (Datasets.dsPersonAddressContact.RegionRow row in tblRegion)
                {
                    DropDownListItem itm = new DropDownListItem(row.RegionName, row.RegionId.ToString());
                    RadDropDownList_region.Items.Add(itm);
                }

                if (PersonId == "0")
                {
                    // Setup form for new person entry
                    RadAjaxManager1.ResponseScripts.Add("HideNewPersonControls();");
                }
                else
                {
                    // Load employee fields
                    Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adaptPerson = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
                    Datasets.dsPartyMaintenance.PersonDataTable prsns = adaptPerson.GetData(Convert.ToInt32(PersonId));
                    Datasets.dsPartyMaintenance.PersonRow prsn;

                    if (prsns.Rows.Count > 0)
                    {
                        prsn = prsns[0];
                        RadTextBox_FirstName.Text = prsn.FirstName;
                        if (!prsn.IsMiddleInitialNull()) RadTextBox_MiddleInitial.Text = prsn.MiddleInitial;
                        RadTextBox_LastName.Text = prsn.LastName;
                        if (!prsn.IsIsActiveNull()) RadCheckBox_PersonActive.Checked = prsn.IsActive;
                        if (!prsn.IsPersonGenderIdNull()) RadDropDownList_Gender.SelectedValue = prsn.PersonGenderId.ToString();
                        if (!prsn.IsBirthdayNull()) RadDatePicker_BirthDate.SelectedDate = prsn.Birthday;
                        if (!prsn.IsLoginIdNull()) RadTextBox_GoogleLogin.Text = prsn.LoginId;

                        if (auth.Entitlements.Contains(202))    //Main-Human Resources-People Management-PII
                        {
                            RadMaskedTextBox_TIN.ReadOnly = false;
                            RegularExpressionValidator_TIN.Enabled = true;
                            RadMaskedTextBox_TIN.Mask = "###-##-####";
                            if (!prsn.IsTINNull()) RadMaskedTextBox_TIN.TextWithLiterals = prsn.TIN;
                        }
                        else
                        {
                            RegularExpressionValidator_TIN.Enabled = false;
                            RadMaskedTextBox_TIN.Mask = "***-**-****";
                            RadMaskedTextBox_TIN.ReadOnly = true;
                            if (!prsn.IsTINNull()) RadMaskedTextBox_TIN.ToolTip = "Last Four: " + prsn.TIN.Substring(prsn.TIN.Length - 4);
                        }

                        PopulateDispatchPhoneNumber();
                        PopulateEmergencyContactInfo();

                        // Set Home Terminal
                        Datasets.dsPartyMaintenanceTableAdapters.sp_LocationTypesWithPartyMappingTableAdapter locationMappingAdapter =
                            new Datasets.dsPartyMaintenanceTableAdapters.sp_LocationTypesWithPartyMappingTableAdapter();
                        Datasets.dsPartyMaintenance.sp_LocationTypesWithPartyMappingDataTable locationMappingTable = locationMappingAdapter.GetData(prsn.PersonId);
                        foreach (Datasets.dsPartyMaintenance.sp_LocationTypesWithPartyMappingRow row in locationMappingTable)
                        {
                            if (row.Assigned)
                            {
                                RadDropDownList_HomeTerminal.SelectedValue = row.LocationTypeId.ToString();
                            }
                        }

                        if (!prsn.IsAvailabilityTypeIdNull()) RadDropDownList_Availability.SelectedValue = prsn.AvailabilityTypeId.ToString();
                        if (!prsn.IsRegionIdNull()) RadDropDownList_region.SelectedValue = prsn.RegionId.ToString();
                        if (!prsn.IsFedExIdNull()) RadNumericTextBox_FedExId.Value = prsn.FedExId;

                        LoadProfilePhoto(prsn.IsPersonProfileFileIdNull() ? -1 : prsn.PersonProfileFileId);
                    }
                    else
                    {
                        // This should never happen
                        RadWindowManager1.RadAlert("Employee not found", 200, 200, "Error!", "");
                    }

                    RadAjaxManager1.ResponseScripts.Add("UnhideNewPersonControls();");
                }

                // Load Person Type Mappings (avoid disabled ones that are not in use)
                Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter adaptPersonTypeMapping = new Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter();
                Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingDataTable tblPersonTypeMapping = adaptPersonTypeMapping.GetData(Convert.ToInt32(PersonId));
                foreach (Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingRow row in tblPersonTypeMapping)
                {
                    if (row.Enabled || row.Assigned)
                    {
                        RadListBoxItem itm = new RadListBoxItem(row.PersonType, row.PersonTypeId.ToString());
                        itm.Checked = row.Assigned;
                        RadListBox_PersonTypes.Items.Add(itm);
                    }
                }

                PopulateDriverInfo();
            }
        }

        private void ApplyUserSettings()
        {
            // Set RibbonBar Skin 
            if (Session["GlobalSkin"] is null) Session["GlobalSkin"] = "Black";
            RadSkinManager1.Skin = Session["GlobalSkin"].ToString();
        }

        private void LoadMappings(Int32 PersonId)
        {
            // Load Division mappings that are enabled or assigned
            Datasets.dsPartyMaintenanceTableAdapters.sp_DivisionTypesWithPartyMappingTableAdapter adapt1 =
                new Datasets.dsPartyMaintenanceTableAdapters.sp_DivisionTypesWithPartyMappingTableAdapter();
            Datasets.dsPartyMaintenance.sp_DivisionTypesWithPartyMappingDataTable tbl1 = adapt1.GetData(PersonId);

            foreach (Datasets.dsPartyMaintenance.sp_DivisionTypesWithPartyMappingRow row in tbl1)
            {
                if (row.Enabled || row.Assigned)
                {
                    RadListBoxItem itm = new RadListBoxItem(row.Division, row.DivisionTypeId.ToString());
                    itm.Checked = row.Assigned;
                    RadListBox_DivisionMapping.Items.Add(itm);
                }
            }

            // Load Business Entity Person Mappings that are enabled or assigned
            Datasets.dsPartyMaintenanceTableAdapters.sp_BusinessEntityTypesWithPartyMappingTableAdapter adapt2 =
                new Datasets.dsPartyMaintenanceTableAdapters.sp_BusinessEntityTypesWithPartyMappingTableAdapter();
            Datasets.dsPartyMaintenance.sp_BusinessEntityTypesWithPartyMappingDataTable tbl2 = adapt2.GetData(PersonId);

            foreach (Datasets.dsPartyMaintenance.sp_BusinessEntityTypesWithPartyMappingRow row in tbl2)
            {
                if (row.Enabled || row.Assigned)
                {
                    RadListBoxItem itm = new RadListBoxItem(row.BusinessEntity, row.BusinessEntityTypeId.ToString());
                    itm.Checked = row.Assigned;
                    RadListBox_BusinessEntityMapping.Items.Add(itm);
                }
            }
        }

        public string FormatZipCode(string ZipCode)
        {
            string ret = ZipCode;
            if (ZipCode.Trim().Length == 5)
            {
                ret = ZipCode;
            }
            else if (ZipCode.Trim().Length > 5)
            {
                ret = ZipCode.Substring(0, 5) + "-" + ZipCode.Substring(5);
            }
            return ret;
        }

        protected void RadGrid_AllGrids_ItemCommand(object sender, GridCommandEventArgs e)
        {
            // If a grid is in Insert or Edit mode, prevent clicking Insert or Edit on a different record (which wipes out the record that is being edited or inserted when not saved).
            Boolean bIsItemBeingEditedOrCreated = false;
            if (e.CommandName == "InitInsert" || e.CommandName == "Edit")
            {
                if (((RadGrid)sender).EditItems.Count > 0) bIsItemBeingEditedOrCreated = true;

                if ((sender as RadGrid).MasterTableView.IsItemInserted) bIsItemBeingEditedOrCreated = true;

                if (bIsItemBeingEditedOrCreated) e.Canceled = true;
            }
        }

        protected void RadGrid_Certifications_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this Certification Type!", 300, 100, "Duplicate Certification Type entered!", "");
                }
            }
        }

        protected void RadGrid_Certifications_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    // e.SuppressRebind = true;
                    e.ExceptionHandled = true;
                    // RadWindowManager1.RadAlert("You have already added this Certification Type!", 300, 100, "Duplicate Certification Type entered!", "");
                }
            }
        }

        protected void RadGrid_Certifications_ItemDataBound(object sender, GridItemEventArgs e)
        {
            // only display the first X amount of characters in the Notes field.
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item["Notes"].Text.Length > 89)
                {
                    item["Notes"].ToolTip = item["Notes"].Text.ToString(); // Set the Tooltip
                    item["Notes"].Text = (item["Notes"].Text).Substring(0, 90) + "...";
                }
            }

            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                GridEditableItem itm = e.Item as GridEditableItem;
                RadFileExplorer explr = itm.FindControl("RadFileExplorer_CertificationFiles") as RadFileExplorer;
                Label lbl = itm.FindControl("Label_ToAddFiles") as Label;

                // ignore when in insert mode.
                if (e.Item is GridEditFormInsertItem || e.Item is GridDataInsertItem)
                {
                    explr.Visible = false;
                    lbl.Visible = true;
                    return;
                }

                Int16 CertificationTypeId = (Int16)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CertificationTypeId"];
                string CertificationDescription = (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CertificationDescription"];
                HiddenField_CertificationTypeId.Value = CertificationTypeId.ToString();

                Classes.Auth auth = (Classes.Auth)Session["Auth"];


                if (auth.Entitlements.Contains(215))
                {
                    // Get reference to RadFileExplorer

                    // Setup RadFileExplorer
                    string PersonId = HiddenField_PersonId.Value;

                    // Create the folder structure for this user if it doesn't already exist
                    string sTopDirectory = Request.PhysicalApplicationPath + @"UserFiles\" + PersonId.ToString();

                    if (!Directory.Exists(sTopDirectory)) Directory.CreateDirectory(sTopDirectory);

                    sTopDirectory += @"\Qualification";
                    if (!Directory.Exists(sTopDirectory)) Directory.CreateDirectory(sTopDirectory);

                    sTopDirectory += @"\Certifications";
                    if (!Directory.Exists(sTopDirectory)) Directory.CreateDirectory(sTopDirectory);

                    sTopDirectory += @"\" + CertificationDescription;
                    if (!Directory.Exists(sTopDirectory)) Directory.CreateDirectory(sTopDirectory);

                    string path = "~/UserFiles/" + PersonId.ToString() + "/Qualification/Certifications/" + CertificationDescription;

                    explr.Configuration.UploadPaths = new string[] { path };
                    explr.Configuration.DeletePaths = new string[] { path };
                    explr.Configuration.ViewPaths = new string[] { path };
                    explr.Configuration.MaxUploadFileSize = 20480 * 1024; // 20 MB
                }
                else
                {
                    explr.Visible = false;
                }

            }
        }

        protected void CertificationFiles_ExplorerPopulated(object sender, RadFileExplorerPopulatedEventArgs e)
        {
            if (e.ControlName == "grid")
            {
                String fileNameToShow = "";
                foreach (GridItem item in RadGrid_Certifications.MasterTableView.Items)
                {
                    try
                    {
                        int certificationPersonMappingId = ((RedbonePlatform.Datasets.dsCertifications.CertificationPersonMappingRow)((DataRowView)((Telerik.Web.UI.GridDataItem)item).EditFormItem.DataItem).Row).CertificationPersonMappingId;
                        Datasets.dsCertificationsTableAdapters.QueriesTableAdapter dsCertificationsTableAdaptersQueriesTableAdapter = new Datasets.dsCertificationsTableAdapters.QueriesTableAdapter();
                        fileNameToShow = dsCertificationsTableAdaptersQueriesTableAdapter.getFileName(certificationPersonMappingId);
                    }
                    catch (Exception ex)
                    {
                        String blah = ex.Message;
                    }
                }

                if (!String.IsNullOrEmpty(fileNameToShow))
                {
                    List<FileBrowserItem> items = e.List;

                    int i = 0;
                    while (i < items.Count)
                    {
                        if (items[i].Name != fileNameToShow)
                            items.Remove(items[i]);
                        else
                            i++;
                    }
                }
            }
            if (e.ControlName == "tree")
            {
                String fileNameToSave = "asdasdfasdf";
                int? certificationPersonMappingId = -1;
                foreach (GridItem item in RadGrid_Certifications.MasterTableView.Items)
                {
                    try
                    {
                        certificationPersonMappingId = ((RedbonePlatform.Datasets.dsCertifications.CertificationPersonMappingRow)((DataRowView)((Telerik.Web.UI.GridDataItem)item).EditFormItem.DataItem).Row).CertificationPersonMappingId;
                        Datasets.dsCertificationsTableAdapters.QueriesTableAdapter dsCertificationsTableAdaptersQueriesTableAdapter = new Datasets.dsCertificationsTableAdapters.QueriesTableAdapter();
                        fileNameToSave = dsCertificationsTableAdaptersQueriesTableAdapter.getFileName((int)certificationPersonMappingId);
                    }
                    catch (Exception ex)
                    {
                        String blah = ex.Message;
                    }
                }

                if (!String.IsNullOrEmpty(fileNameToSave) && (certificationPersonMappingId.HasValue && certificationPersonMappingId.Value > 0))
                {
                    //HiddenField_ShowInactiveCertifications.Value
                    //Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);


                    RedbonePlatform.Datasets.dsCertificationsTableAdapters.CertificationPersonMapping1TableAdapter cpmta1 = new RedbonePlatform.Datasets.dsCertificationsTableAdapters.CertificationPersonMapping1TableAdapter();
                    CertificationPersonMapping1Row eefefe = cpmta1.GetData().Where(p => p.CertificationPersonMappingId == certificationPersonMappingId).FirstOrDefault();
                    eefefe.FileName = "asdasdfasdf";

                    cpmta1.Update(eefefe);

                    String asdf = "";
                }
            }
        }

        protected void RadGrid_Certifications_EditCommand(object sender, GridCommandEventArgs e)
        {
            Int16 CertificationTypeId = (Int16)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["CertificationTypeId"];
            HiddenField_CertificationTypeId.Value = CertificationTypeId.ToString();
        }

        protected void ObjectDataSource_Certifications_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            // Remove parameter per DataKeyName CertificationTypeId being added to reference for only displaying active Certificatin Types when the Inactive item may be assigned.
            //  This was causing this input parameter to be created and passed to the object data source when it doesn't exist there.
            e.InputParameters.Remove("original_CertificationTypeId");
            e.InputParameters.Remove("CertificationDescription");
            e.InputParameters.Remove("original_CertificationDescription");
        }

        protected void ObjectDataSource_Certifications_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //e.InputParameters.Remove("original_CertificationTypeId");
            //e.InputParameters.Remove("original_CertificationDescription");
        }

        protected void RadGrid_Certifications_CancelCommand(object sender, GridCommandEventArgs e)
        {
            // Set hidden field back to nothing so that when adding or editing another Certification Type, the disabled cert type won't be in the Cert Type dropdown.
            HiddenField_CertificationTypeId.Value = "";
        }

        protected void RadGrid_Certifications_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            //GridDataItem item = (GridDataItem)e.Item;
            //string certificationDescription = item["CertificationDescription"].Text;

            //if (isPersonADriverAndActive() && (certificationDescription == "Medical Card" || certificationDescription == "Driver License - Class A"))
            //{
            //    RadWindowManager1.RadAlert("Required certification cannot be deleted for an active driver", 300, 150, "Certification Deletion Error", "");
            //    e.Canceled = true;
            //}
            //else
            //{
            //    // Set hidden field back to nothing so that when adding or editing another Certification Type, the disabled cert type won't be in the Cert Type dropdown.
            //    HiddenField_CertificationTypeId.Value = "";
            //}
        }

        protected bool isPersonADriverAndActive()
        {
            bool isPersonADriverAndActive = false;

            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
            if (PersonId > 0)
            {
                Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adaptPerson = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
                Datasets.dsPartyMaintenance.PersonDataTable prsns = adaptPerson.GetData(Convert.ToInt32(PersonId));
                Datasets.dsPartyMaintenance.PersonRow prsn = prsns[0];

                if (prsn != null)
                {
                    bool dbActiveStatus = prsn.IsActive;

                    Boolean isADriver = false;
                    Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter adaptPersonTypeMapping = new Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter();
                    Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingDataTable tblPersonTypeMapping = adaptPersonTypeMapping.GetData(Convert.ToInt32(PersonId));
                    foreach (Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingRow row in tblPersonTypeMapping)
                    {
                        if ((row.Assigned) && (row.PersonTypeId >= 3 && row.PersonTypeId <= 6))
                        {
                            isADriver = true;
                            break;
                        }
                    }

                    if (isADriver && dbActiveStatus)
                    {
                        isPersonADriverAndActive = true;
                    }
                }
            }

            return isPersonADriverAndActive;
        }

        protected void ObjectDataSource_Certifications_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this Certification Type!", 300, 100, "Duplicate Certification Type entered!", "");
                }
            }

        }

        protected void ObjectDataSource_Certifications_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters.Remove("CertificationDescription");

        }

        protected void RadCheckBox_ShowInactive_Click(object sender, EventArgs e)
        {
            HiddenField_ShowInactiveCertifications.Value = ((RadCheckBox)sender).Checked.ToString();
            RadGrid_Certifications.Rebind();
        }

        protected void RadGrid_Certifications_DataBound(object sender, EventArgs e)

        {
            GridItem commandItem = RadGrid_Certifications.MasterTableView.GetItems(GridItemType.CommandItem)[0];
            RadCheckBox chk = commandItem.FindControl("RadCheckBox_ShowInactive") as RadCheckBox;
            chk.Checked = HiddenField_ShowInactiveCertifications.Value != "" && Convert.ToBoolean(HiddenField_ShowInactiveCertifications.Value);
        }

        protected void RadGrid_Certifications_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

        }

        protected void RadButton_Save_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            auth = (Classes.Auth)Session["Auth"];
            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
            var bNewPerson = false; // this is used to tell parent to unhide and update other tabs upon new Person being created.

            //Person Data
            Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adapt = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
            Datasets.dsPartyMaintenance.PersonDataTable tbl = new Datasets.dsPartyMaintenance.PersonDataTable();
            Datasets.dsPartyMaintenance.PersonRow row;
            Datasets.dsPartyMaintenanceTableAdapters.QueriesTableAdapter qry = new Datasets.dsPartyMaintenanceTableAdapters.QueriesTableAdapter();

            //Driver Data
            Datasets.dsPersonEdit_DriverInfoTableAdapters.DriverTableAdapter adaptDriver = new Datasets.dsPersonEdit_DriverInfoTableAdapters.DriverTableAdapter();
            Datasets.dsPersonEdit_DriverInfo.DriverDataTable tblDriver = null;
            Datasets.dsPersonEdit_DriverInfo.DriverRow rowDriver = null;

            //Mappings
            foreach (RadListBoxItem itm in RadListBox_DivisionMapping.Items)
            {
                qry.usp_DivisionPersonMapping_Update(PersonId, Convert.ToInt16(itm.Value), itm.Checked);
            }

            foreach (RadListBoxItem itm in RadListBox_BusinessEntityMapping.Items)
            {
                qry.usp_BusinessEntityPersonMapping_Update(PersonId, Convert.ToInt16(itm.Value), itm.Checked);
            }

            if (PersonId == 0)
            {
                row = tbl.NewPersonRow();
            }
            else
            {
                tbl = adapt.GetData(PersonId);
                row = tbl[0];
            }

            row.LastName = RadTextBox_LastName.Text.Trim();
            row.FirstName = RadTextBox_FirstName.Text.Trim();
            if (RadTextBox_MiddleInitial.Text.Trim() != "") row.MiddleInitial = RadTextBox_MiddleInitial.Text.Trim(); else row.SetMiddleInitialNull();
            if (RadTextBox_GoogleLogin.Text.Trim() != "") row.LoginId = RadTextBox_GoogleLogin.Text.Trim(); else row.SetLoginIdNull();
            if (!(RadDatePicker_BirthDate.SelectedDate is null)) row.Birthday = Convert.ToDateTime(RadDatePicker_BirthDate.SelectedDate); else row.SetBirthdayNull();
            if (!(RadDropDownList_Gender.SelectedItem is null)) row.PersonGenderId = Convert.ToInt16(RadDropDownList_Gender.SelectedValue); else row.SetPersonGenderIdNull();
            if (!(RadDropDownList_region.SelectedItem is null)) row.RegionId = Convert.ToInt16(RadDropDownList_region.SelectedValue); else row.SetRegionIdNull();

            if (PersonId == 0)
            {
                if (RadMaskedTextBox_TIN.Text.Trim() != "") row.TIN = RadMaskedTextBox_TIN.TextWithLiterals; else row.SetTINNull();
            }
            else if (auth.Entitlements.Contains(202))    //Main-Human Resources-People Management-PII required to save SSN
            {
                //updating - set SSN if have permissions, otherwise leave as is. If no permission then textbox will be readonly
                if (!RadMaskedTextBox_TIN.ReadOnly) row.TIN = RadMaskedTextBox_TIN.TextWithLiterals;
            }

            if (!(RadDropDownList_Availability.SelectedItem is null)) row.AvailabilityTypeId = Convert.ToInt16(RadDropDownList_Availability.SelectedValue); else row.SetAvailabilityTypeIdNull();
            if (RadNumericTextBox_FedExId.Text.Trim() != "") row.FedExId = Convert.ToInt32(RadNumericTextBox_FedExId.Value); else row.SetFedExIdNull();
            row.IsActive = Convert.ToBoolean(RadCheckBox_PersonActive.Checked);

            if (PersonId == 0)
            {
                tbl.AddPersonRow(row);
                bNewPerson = true;
            }

            adapt.Update(tbl);

            // Get new PersonId
            PersonId = row.PersonId;

            if (bNewPerson)
            {
                // Generate Driver Record with a unique DriverId (e.q. BYE1000)
                string DriverId = "";

                Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter qry2 = new Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter();
                qry2.sp_CreateDriverId(PersonId, ref DriverId);

                // Create the Driver Record
                tblDriver = new Datasets.dsPersonEdit_DriverInfo.DriverDataTable();
                rowDriver = null;
                rowDriver = tblDriver.NewDriverRow();
                rowDriver.PersonId = PersonId;
                rowDriver.StartingPoints = 0;
                rowDriver.DriverId = DriverId;
                tblDriver.Rows.Add(rowDriver);
                adaptDriver.Update(tblDriver);
            }

            if (bNewPerson)
            {
                auth = (Classes.Auth)Session["Auth"];
                int UpdatedBy = auth.PersonId;

                Datasets.dsPersonEdit_DriverPointsTableAdapters.QueriesTableAdapter qry3 = new Datasets.dsPersonEdit_DriverPointsTableAdapters.QueriesTableAdapter();
                qry3.sp_DriverMonthlySafetyPoints_NewHire(PersonId, UpdatedBy);
            }

            // Update New PersonId in hiddenfield.
            HiddenField_PersonId.Value = PersonId.ToString();

            qry.usp_LocationPersonMapping_Update(PersonId, Convert.ToInt16(RadDropDownList_HomeTerminal.SelectedValue), true);

            Boolean PersonIsLeaseOpOrOwnerOp = false;
            //// Update PersonTypeMappings
            foreach (RadListBoxItem itm in RadListBox_PersonTypes.Items)
            {
                qry.usp_PersonTypeMapping_Update(PersonId, Convert.ToInt16(itm.Value), itm.Checked);
                if ((Convert.ToInt16(itm.Value) == 5 && itm.Checked) || (Convert.ToInt16(itm.Value) == 6 && itm.Checked))
                {
                    PersonIsLeaseOpOrOwnerOp = true;
                }
            }
            // Check if person is a Lease Op or Owner Op and disable Driver Pay tab
            // Call javascript function that will get parent window's tab control and set 

            //Driver Info
            tblDriver = adaptDriver.GetDataBy(Convert.ToInt32(HiddenField_PersonId.Value));
            rowDriver = null;

            if (tblDriver.Rows.Count > 0)
                rowDriver = tblDriver[0];
            else
                rowDriver = tblDriver.NewDriverRow();


            if (RadDropDownList_PowerUnit.SelectedValue == "0")
                rowDriver.SetPunitIdNull();
            else
                rowDriver.PunitId = Convert.ToInt32(RadDropDownList_PowerUnit.SelectedValue);



            if (RadTextBox_FuelCardNumber.Text == null || RadTextBox_FuelCardNumber.Text == "")
            {
                rowDriver.SetFuelCardNumberNull();
            }
            else
            {
                if (auth.Entitlements.Contains(2508))    //Fuel-Card-Number
                {
                    if (!RadTextBox_FuelCardNumber.ReadOnly) rowDriver.FuelCardNumber = Convert.ToInt32(RadTextBox_FuelCardNumber.Text);
                }
            }

            rowDriver.PaidPetDeposit = Convert.ToBoolean(RadCheckBox_PaidPetDeposit.Checked);
            rowDriver.HasPassengerInsurance = Convert.ToBoolean(RadCheckBox_HasPassengerInsurance.Checked);

            if (tblDriver.Rows.Count == 0)
            {
                rowDriver.StartingPoints = 0;
                rowDriver.PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
                tblDriver.Rows.Add(rowDriver);
            }

            adaptDriver.Update(tblDriver);

            PopulateDriverInfo();

            // This will trigger the Manage People grid in sibling RadWindow to refresh along with other things..
            RadAjaxManager1.ResponseScripts.Add("UpdateManagePeopleGrid(" + PersonId.ToString() + ",'" + row.FirstName + "','" + row.LastName + "','" + bNewPerson + "','" + PersonIsLeaseOpOrOwnerOp + "');");
            Session["UpdatedPersonId"] = PersonId;

            // Show update successful msg.
            Label_UpdateSuccess.Visible = true;
            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "ShowUpdateSuccess",
                "window.setTimeout(function() { document.getElementById('" + Label_UpdateSuccess.ClientID + "').style.display = 'none' }, 2000);", true);
        }

        protected void CustomValidator_Name_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string firstName = RadTextBox_FirstName.Text.Trim();
            string lastName = RadTextBox_LastName.Text.Trim();
            string homeTerminal = RadDropDownList_HomeTerminal.SelectedValue;
            string TIN = RadMaskedTextBox_TIN.TextWithLiterals;
            CustomValidator vld = (CustomValidator)source;
            args.IsValid = true;
            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);

            // Set background back to default.
            RadTextBox_FirstName.BorderColor = default(System.Drawing.Color);
            RadTextBox_LastName.BorderColor = default(System.Drawing.Color);
            RadMaskedTextBox_TIN.BorderColor = default(System.Drawing.Color);
            Label_UpdateSuccess.Visible = false; // Making this invisible because it shows up in rare validation scenario.

            if (firstName == "" && lastName != "")
            {
                vld.ErrorMessage = "First Name is Required!";
                RadTextBox_FirstName.Focus();
                RadTextBox_FirstName.BorderColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }

            else if (firstName != "" && lastName == "")
            {
                vld.ErrorMessage = "Last Name is Required!";
                RadTextBox_LastName.Focus();
                RadTextBox_LastName.BorderColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }

            else if (firstName == "" && lastName == "")
            {
                vld.ErrorMessage = "First and Last Name are Required!";
                RadTextBox_FirstName.Focus();
                RadTextBox_FirstName.BorderColor = System.Drawing.Color.Red;
                RadTextBox_LastName.BorderColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }

            else if (homeTerminal == "0")
            {
                vld.ErrorMessage = "Home Terminal is Required!";
                RadDropDownList_HomeTerminal.Focus();
                RadDropDownList_HomeTerminal.BorderColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }

            else if (TIN == "" || TIN == "--")
            {
                vld.ErrorMessage = "SSN/TIN is Required!";
                RadMaskedTextBox_TIN.Focus();
                RadMaskedTextBox_TIN.BorderColor = System.Drawing.Color.Red;
                args.IsValid = false;
            }

            else if (TIN != "" && TIN != "--")
            {
                // Ensure the TIN isn't used by another employee
                Datasets.dsPartyMaintenanceTableAdapters.sp_Person_TIN_Dupe_CheckTableAdapter adapt = new Datasets.dsPartyMaintenanceTableAdapters.sp_Person_TIN_Dupe_CheckTableAdapter();
                Datasets.dsPartyMaintenance.sp_Person_TIN_Dupe_CheckDataTable tbl = adapt.GetData(PersonId, TIN);
                if (tbl.Rows.Count > 0)
                {
                    vld.ErrorMessage = "SSN/TIN already in use by: " + tbl[0].FirstName + " " +
                        (tbl[0].IsMiddleInitialNull() ? "" : tbl[0].MiddleInitial) + " " + tbl[0].LastName + ", PersonId: " + tbl[0].PersonId;
                    RadMaskedTextBox_TIN.Focus();
                    RadMaskedTextBox_TIN.BorderColor = System.Drawing.Color.Red;
                    args.IsValid = false;
                }
            }

            if (PersonId > 0)
            {
                Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adaptPerson = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
                Datasets.dsPartyMaintenance.PersonDataTable prsns = adaptPerson.GetData(Convert.ToInt32(PersonId));
                Datasets.dsPartyMaintenance.PersonRow prsn = prsns[0];

                if (prsn != null)
                {
                    bool checkBoxActiveStatus = Convert.ToBoolean(RadCheckBox_PersonActive.Checked);
                    bool dbActiveStatus = prsn.IsActive;
                    if (!dbActiveStatus && checkBoxActiveStatus)
                    {
                        Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter adaptPersonTypeMapping = new Datasets.dsPartyMaintenanceTableAdapters.sp_PersonTypesWithPartyMappingTableAdapter();
                        Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingDataTable tblPersonTypeMapping = adaptPersonTypeMapping.GetData(Convert.ToInt32(PersonId));

                        Boolean isADriver = false;
                        foreach (Datasets.dsPartyMaintenance.sp_PersonTypesWithPartyMappingRow row in tblPersonTypeMapping)
                        {
                            if ((row.Assigned) && (row.PersonTypeId >= 3 && row.PersonTypeId <= 6))
                            {
                                isADriver = true;
                                break;
                            }
                        }

                        Boolean doesntHaveDriverLicenseClassA = true;
                        Boolean doesntHaveMedicalCard = true;
                        if (isADriver)
                        {
                            CertificationPersonMappingTableAdapter adapterCertificationPersonMapping = new CertificationPersonMappingTableAdapter();
                            CertificationPersonMappingDataTable certificationMappings = adapterCertificationPersonMapping.GetData(Convert.ToInt32(PersonId), false);

                            if (certificationMappings != null)
                            {
                                foreach (Datasets.dsCertifications.CertificationPersonMappingRow row in certificationMappings)
                                {
                                    if (row.CertificationTypeId == 4)
                                    {
                                        doesntHaveDriverLicenseClassA = false;
                                    }
                                    if (row.CertificationTypeId == 5)
                                    {
                                        doesntHaveMedicalCard = false;
                                    }
                                }
                            }
                        }

                        Boolean personActiveStatus = Convert.ToBoolean(RadCheckBox_PersonActive.Checked);
                        if (personActiveStatus && isADriver && (doesntHaveDriverLicenseClassA || doesntHaveMedicalCard))
                        {
                            RadCheckBox_PersonActive.Checked = false;

                            vld.ErrorMessage = "Drivers can only be activated if they have the required documents:<br/>&nbsp;&nbsp;&nbsp;1) 'Driver License - Class A'<br/>&nbsp;&nbsp;&nbsp;2) 'Medical Card'";
                            RadCheckBox_PersonActive.Focus();
                            RadCheckBox_PersonActive.BorderColor = System.Drawing.Color.Red;
                            args.IsValid = false;
                        }
                    }
                }
            }
        }

        private void PopulateDispatchPhoneNumber()
        {
            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
            Datasets.dsPersonAddressContactTableAdapters.PersonPhoneNumberTableAdapter adapterPhoneNumber = new Datasets.dsPersonAddressContactTableAdapters.PersonPhoneNumberTableAdapter();
            PersonPhoneNumberDataTable tblPhoneNumber = adapterPhoneNumber.GetData(Convert.ToInt32(PersonId));

            RadTextBox_DispatchPhoneNumber.Text = "";
            foreach (PersonPhoneNumberRow row in tblPhoneNumber)
            {
                if (row.UseForDispatch)
                {
                    RadTextBox_DispatchPhoneNumber.Text = row.PhoneNumber;
                    break;
                }
                else
                {
                    RadTextBox_DispatchPhoneNumber.Text = "";
                }
            }

            UpdateDispatchPhoneNumber(RadTextBox_DispatchPhoneNumber.Text);
        }

        private void PopulateEmergencyContactInfo()
        {
            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
            Datasets.dsPersonAddressContactTableAdapters.PersonPhoneNumberTableAdapter adapterPhoneNumber = new Datasets.dsPersonAddressContactTableAdapters.PersonPhoneNumberTableAdapter();
            PersonPhoneNumberDataTable tblPhoneNumber = adapterPhoneNumber.GetData(Convert.ToInt32(PersonId));

            RadTextBox_EmergencyContactPhoneNumber.Text = "";
            foreach (PersonPhoneNumberRow row in tblPhoneNumber)
            {
                if (row.PhoneNumberTypeId == 7)
                {
                    RadTextBox_EmergencyContactPhoneNumber.Text = row.PhoneNumber;
                    try
                    {
                        RadTextBox_EmergencyContactName.Text = row.ContactName;
                    }
                    catch (Exception e)
                    {
                        RadTextBox_EmergencyContactName.Text = "";
                    }

                    break;
                }
                else
                {
                    RadTextBox_EmergencyContactPhoneNumber.Text = "";
                    RadTextBox_EmergencyContactName.Text = "";
                }
            }

            UpdateEmergencyContactPhoneNumber(RadTextBox_EmergencyContactPhoneNumber.Text);
            UpdateEmergencyContactName(RadTextBox_EmergencyContactName.Text);
        }

        private void PopulateDriverInfo()
        {
            Datasets.dsPersonEdit_DriverInfoTableAdapters.DriverTableAdapter adapt = new Datasets.dsPersonEdit_DriverInfoTableAdapters.DriverTableAdapter();
            Datasets.dsPersonEdit_DriverInfo.DriverDataTable tbl = adapt.GetDataBy(Convert.ToInt32(HiddenField_PersonId.Value));
            Datasets.dsPersonEdit_DriverInfo.DriverRow driver = null;

            if (tbl.Rows.Count == 0)
            {
                return;
            }

            driver = tbl[0];
            RadDropDownList_PowerUnit.SelectedValue = driver.IsPunitIdNull() ? null : driver.PunitId.ToString();
            if (!driver.IsFuelCardNumberNull()) RadTextBox_FuelCardNumber.Text = driver.FuelCardNumber.ToString();
            if (auth.Entitlements.Contains(2508))    //Fuel-Card-Number
            {
                RadTextBox_FuelCardNumber.ReadOnly = false;

            }
            else
            {
                RadTextBox_FuelCardNumber.ReadOnly = true;
            }
            if (!driver.IsDriverIdNull()) RadTextBox_DriverId.Text = driver.DriverId;
            else RadTextBox_DriverId.Text = "";

            if (!driver.IsPaidPetDepositNull()) RadCheckBox_PaidPetDeposit.Checked = driver.PaidPetDeposit;
            if (!driver.IsHasPassengerInsuranceNull()) RadCheckBox_HasPassengerInsurance.Checked = driver.HasPassengerInsurance;
        }

        private void LoadProfilePhoto(int PersonProfileFileId)
        {
            if (PersonProfileFileId > 0)
            {
                Datasets.dsPartyMaintenanceTableAdapters.PersonProfileFileTableAdapter personProfileFileAdapter = new Datasets.dsPartyMaintenanceTableAdapters.PersonProfileFileTableAdapter();
                Datasets.dsPartyMaintenance.PersonProfileFileDataTable personProfileFileTable = personProfileFileAdapter.GetData(PersonProfileFileId);
                Datasets.dsPartyMaintenance.PersonProfileFileRow row = personProfileFileTable.FirstOrDefault();

                ProfilePhotoImage.Visible = true;
                ProfilePhotoImage.DataValue = row.Data;
                ProfilePhotoImage.DataBind();
            }
        }

        protected void RadGrid_EmailAddresses_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.SuppressRebind = true;
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this eMail Address!", 300, 100, "Duplicate eMail Address entered!", "");
                }
            }
        }

        protected void RadGrid_EmailAddresses_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this eMail Address!", 300, 100, "Duplicate eMail Address entered!", "");
                }
            }
        }
        protected void RadGrid_PhoneNumbers_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            PopulateDispatchPhoneNumber();
            PopulateEmergencyContactInfo();
        }

        protected void RadGrid_PhoneNumbers_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this Phone Number!", 300, 100, "Duplicate Phone Numbeer entered!", "");
                }
            }

            PopulateDispatchPhoneNumber();
            PopulateEmergencyContactInfo();
        }

        protected void RadGrid_PhoneNumbers_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.InnerException.Message.Contains("Violation of UNIQUE KEY"))
                {
                    e.SuppressRebind = true;
                    e.ExceptionHandled = true;
                    RadWindowManager1.RadAlert("You have already added this Phone Number!", 300, 100, "Duplicate Phone Numbeer entered!", "");
                }
            }

            PopulateDispatchPhoneNumber();
            PopulateEmergencyContactInfo();
        }

        protected void UpdateDispatchPhoneNumber(string phoneNumber)
        {
            ClientScript.RegisterStartupScript(GetType(), "UpdateDispatchPhoneNumber", "function UpdateDispatchPhoneNumber() { const elem = document.getElementById('RadTextBox_DispatchPhoneNumber'); elem.textContent = '" + phoneNumber + "'; }", true);
            ClientScript.RegisterStartupScript(GetType(), "UpdateDispatchPhoneNumber", "function UpdateDispatchPhoneNumber() { const elem = document.getElementById('RadTextBox_DispatchPhoneNumber'); elem.textContent = '" + phoneNumber + "'; }", false);
        }

        protected void UpdateEmergencyContactPhoneNumber(string phoneNumber)
        {
            ClientScript.RegisterStartupScript(GetType(), "UpdateEmergencyContactPhoneNumber", "function UpdateEmergencyContactPhoneNumber() { const elem = document.getElementById('RadTextBox_EmergencyContactPhoneNumber'); elem.textContent = '" + phoneNumber + "'; }", true);
            ClientScript.RegisterStartupScript(GetType(), "UpdateEmergencyContactPhoneNumber", "function UpdateEmergencyContactPhoneNumber() { const elem = document.getElementById('RadTextBox_EmergencyContactPhoneNumber'); elem.textContent = '" + phoneNumber + "'; }", false);
        }

        protected void UpdateEmergencyContactName(string contactName)
        {
            //contactName = String.IsNullOrEmpty(contactName) ? string.Empty : contactName;

            ClientScript.RegisterStartupScript(GetType(), "UpdateEmergencyContactName", "function UpdateEmergencyContactName() { const elem = document.getElementById('RadTextBox_EmergencyContactName'); elem.textContent = '" + contactName + "'; }", true);
            ClientScript.RegisterStartupScript(GetType(), "UpdateEmergencyContactName", "function UpdateEmergencyContactName() { const elem = document.getElementById('RadTextBox_EmergencyContactName'); elem.textContent = '" + contactName + "'; }", false);
        }

        protected void Upload_Photo_Click(object sender, EventArgs e)
        {
            Int32 PersonId = Convert.ToInt32(HiddenField_PersonId.Value);
            if (PersonId > 0 && AsyncUpload_ProfilePhoto.UploadedFiles.Count > 0)
            {
                Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter adaptPerson = new Datasets.dsPartyMaintenanceTableAdapters.PersonTableAdapter();
                Datasets.dsPartyMaintenance.PersonDataTable prsns = adaptPerson.GetData(Convert.ToInt32(PersonId));
                Datasets.dsPartyMaintenance.PersonRow prsn = prsns[0];

                byte[] fileData = new byte[] { };
                UploadedFile file = AsyncUpload_ProfilePhoto.UploadedFiles[0];
                fileData = new byte[file.InputStream.Length];
                file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);

                if (prsns.Rows.Count > 0)
                {
                    Datasets.dsPartyMaintenanceTableAdapters.PersonProfileFileTableAdapter personProfileFileAdapter = new Datasets.dsPartyMaintenanceTableAdapters.PersonProfileFileTableAdapter();
                    Datasets.dsPartyMaintenance.PersonProfileFileDataTable personProfileFileTable;
                    Datasets.dsPartyMaintenance.PersonProfileFileRow row;

                    Int32 personProfileFileId = !prsn.IsPersonProfileFileIdNull() ? prsn.PersonProfileFileId : 0;
                    if (personProfileFileId > 0)
                    {
                        //get the exising file record and modify it
                        personProfileFileTable = personProfileFileAdapter.GetData(personProfileFileId);
                        row = personProfileFileTable.FirstOrDefault();

                        row.Data = fileData;
                        row.MimeType = file.ContentType;
                        //row.Name = file.FileName;

                        personProfileFileAdapter.Update(personProfileFileTable);
                    }
                    else
                    {
                        //create a new row
                        personProfileFileTable = new Datasets.dsPartyMaintenance.PersonProfileFileDataTable();
                        row = personProfileFileTable.NewPersonProfileFileRow();

                        row.Data = fileData;
                        row.MimeType = file.ContentType;
                        //row.Name = file.FileName;

                        personProfileFileTable.Rows.Add(row);
                        personProfileFileAdapter.Update(personProfileFileTable);

                        //FK
                        personProfileFileAdapter.FillByNewest(personProfileFileTable);
                        row = personProfileFileTable.FirstOrDefault();
                        prsn.PersonProfileFileId = row.PersonProfileFileId;
                        adaptPerson.Update(prsn);
                    }
                }

                LoadProfilePhoto(prsn.IsPersonProfileFileIdNull() ? -1 : prsn.PersonProfileFileId);
            }
        }

        protected void RadTextBox_FuelCardNumber_TextChanged(object sender, EventArgs e)
        {   //get newly entered fuel card number and person id

            string fuelCardValue = RadTextBox_FuelCardNumber.Text;

            int newlyEnteredFuelCard = fuelCardValue == "" ? 0 : Convert.ToInt32(fuelCardValue);

            int personId = Convert.ToInt16(HiddenField_PersonId.Value);

            Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter qry = new Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter();


            string existingFuelCard = qry.FuelCardLookup(personId).ToString();

            Datasets.dsPersonEdit_DriverInfoTableAdapters.DuplicateFuelCardTableAdapter duplicateFuelCardTableAdapter = new Datasets.dsPersonEdit_DriverInfoTableAdapters.DuplicateFuelCardTableAdapter();
            Datasets.dsPersonEdit_DriverInfo.DuplicateFuelCardDataTable table = duplicateFuelCardTableAdapter.GetData(newlyEnteredFuelCard);

            //populate list with names for existing fuel card
            List<DataRow> rows = table.Rows.Cast<DataRow>().ToList();



            if (rows.Count > 0)
            {
                StringBuilder s = new StringBuilder();
                foreach (DataRow row in rows)
                {
                    s.Append(row[0].ToString() + "<br>");

                }


                string result = "Fuel Card Number " + newlyEnteredFuelCard + " Already Exists for <br><br>" + s.ToString();

                //show people with the same fuel card #
                RadWindowManager1.RadAlert(result, 350, 200, "Duplicate Warning", "");

                RadTextBox_FuelCardNumber.Text = existingFuelCard;


            }
            else { return; };

        }

        protected void RadDropDownList_PowerUnit_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {

            int personId = Convert.ToInt16(HiddenField_PersonId.Value);

            string newlyEnteredUnit = RadDropDownList_PowerUnit.SelectedText; //truck number
            int newEnteredUnitId = Convert.ToInt16(RadDropDownList_PowerUnit.SelectedValue); //truck id



            Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter qry = new Datasets.dsPersonEdit_DriverInfoTableAdapters.QueriesTableAdapter();



            int existingUnit = (int)qry.FindPunitId(personId);

            Datasets.dsPersonEdit_DriverInfoTableAdapters.DuplicateUnitTableAdapter duplicateUnitTableAdapter = new Datasets.dsPersonEdit_DriverInfoTableAdapters.DuplicateUnitTableAdapter();
            Datasets.dsPersonEdit_DriverInfo.DuplicateUnitDataTable table = duplicateUnitTableAdapter.GetData(newEnteredUnitId);

            //add existing units to list
            List<DataRow> rows = table.Rows.Cast<DataRow>().ToList();

            if (rows.Count > 0)
            {
                StringBuilder s = new StringBuilder();
                foreach (DataRow row in rows)
                {
                    s.Append(row[0].ToString() + "<br>");

                }


                //show warning if others have the same unit assigned to them
                string result = "Unit Number " + newlyEnteredUnit + " Already Exists for <br>" + s.ToString();

                RadWindowManager1.RadAlert(result, 350, 200, "Duplicate Warning", "");

                //set unit value back to the original
                if (existingUnit == 0) RadDropDownList_PowerUnit.SelectedIndex = 0; else RadDropDownList_PowerUnit.SelectedValue = existingUnit.ToString();


                RadDropDownList_PowerUnit.SelectedValue = existingUnit.ToString();

            }


        }
    }
}