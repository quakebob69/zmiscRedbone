<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonEdit_Personal.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.PersonEdit_Personal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .hideWhenNew {
            display: none !important;
        }

        #AsyncUpload_ProfilePhoto, #BtnUploadPhoto {
            display: none !important;
        }

        .auto-style1 {
            width: 130px;
            text-align: right;
            padding-right: 5px;
            height: 23px;
        }

        .auto-style2 {
            height: 23px;
        }

        .auto-style3 {
            text-align: right;
            padding-right: 5px;
        }

        .auto-style4 {
            width: 500px;
            text-align: left;
            padding-left: 5px;
            height: 23px;
        }

        .auto-style5 {
            width: 130px;
            text-align: left;
            padding-left: 5px;
            height: 23px;
        }

        .rgCaption {
            font-size: medium;
            font-weight: bold;
            text-align: left;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 15px;
        }

        .requiredFieldLabel {
            padding-left: 5px;
        }

        .error {
            border: 2px solid red;
        }

        html body form .RadInput .MyInvalidTextBox {
            border-color: #f33;
            background: none #ff9;
        }

        html body form .RadInput .MyEnabledTextBox {
        }
    </style>
    <link href="../../Styles/common.css" rel="stylesheet" />
    <link href="../../Skins/MyCustomSkinLite/Button.MyCustomSkin.css" rel="stylesheet" />

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            //window.addEventListener('resize', cert_grid_resize);
            //window.addEventListener('resize', address_grid_resize);

            function pageLoad() {
                // this is to size the MultiPage on the parent page so that this content will then size to it and not be collapsed
                window.parent.MultiPage_resize();
                //cert_grid_resize();
                //address_grid_resize();
            }

            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
            }

            <%--function cert_grid_resize() {
                try {
                    var gridAddresses = $find('<%=RadGrid_Certifications.ClientID %>');
                    gridAddresses.get_element().style.height = (window.innerHeight - 5) + "px";
                    gridAddresses.repaint();
                }
                catch (e) {
                    // Do nothing... window may be minimized and grid unavailable when double clicked to restore
                }
            }

            function address_grid_resize() {
                try {
                    var gridAddresses = $find('<%=RadGrid_Addresses.ClientID %>');
                    gridAddresses.get_element().style.height = ((window.innerHeight / 2) - 48) + "px";
                    gridAddresses.repaint();

                    var gridPhoneNumbers = $find('<%=RadGrid_PhoneNumbers.ClientID %>');
                        gridPhoneNumbers.get_element().style.height = ((window.innerHeight / 2) - 48) + "px";
                        gridPhoneNumbers.repaint();

                    var gridEmailAddresses = $find("<%=RadGrid_EmailAddresses.ClientID %>");
                    gridEmailAddresses.get_element().style.height = ((window.innerHeight / 2) - 48) + "px";
                    gridEmailAddresses.repaint();
                }
                catch (e) {
                    // Do nothing... window may be minimized and grid unavailable when double clicked to restore
                }
            }--%>

            function RadGrid_OnCertificationsGridCreated(sender, args) {
                //  If any grid is in edit or insert mode, update parent that data has changed 
                //      otherwise, update parent that data hasn't changed.
                var gridCertifications = $find("<%=RadGrid_Certifications.ClientID %>");
                try {
                    if (gridCertifications.get_masterTableView().get_editItems().length > 0 || gridCertifications.get_masterTableView().get_insertItem() != undefined) {
                        window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("UnsavedData");

                    }
                    else {
                        window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("");
                    }
                }
                catch (e) {
                    alert(e);
                }
            }

            function HideNewPersonControls() {
                var dvCertifications = document.getElementById("dvCertifications");
                dvCertifications.classList.add("hideWhenNew");

                var dvMappings = document.getElementById("dvMappings");
                dvMappings.classList.add("hideWhenNew");

                var dvDriverInfo = document.getElementById("dvDriverInfo");
                dvDriverInfo.classList.add("hideWhenNew");

                var dvProfile = document.getElementById("dvProfile");
                dvProfile.classList.add("hideWhenNew");

                var dvAddresses = document.getElementById("dvAddresses");
                dvAddresses.classList.add("hideWhenNew");
            }

            function UnhideNewPersonControls() {
                var dvCertifications = document.getElementById("dvCertifications");
                dvCertifications.classList.remove("hideWhenNew");

                var dvMappings = document.getElementById("dvMappings");
                dvMappings.classList.remove("hideWhenNew");

                var dvDriverInfo = document.getElementById("dvDriverInfo");
                dvDriverInfo.classList.remove("hideWhenNew");

                var dvProfile = document.getElementById("dvProfile");
                dvProfile.classList.remove("hideWhenNew");

                var dvAddresses = document.getElementById("dvAddresses");
                dvAddresses.classList.remove("hideWhenNew");
            }

            function UpdateManagePeopleGrid(PersonId, firstName, lastName, bNewPerson, IsPersonLeaseOpOrOwnerOp) {
                if (bNewPerson == "True") {
                    UnhideNewPersonControls();
                }

                window.parent.RefreshGridFromPersonEdit(PersonId, firstName, lastName, bNewPerson, IsPersonLeaseOpOrOwnerOp);
            }

            function RadControl_OnValueChanged(sender, args) {
                // Update PersonEdit.aspx that this radwindow has an unsaved change. 
                window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("UnsavedData");
            }

            // Add an event listener to RadTextbox controls to track changes to ensure user saves when changing tabs or closing window.
            // reference: https://stackoverflow.com/questions/9906885/detect-backspace-and-del-on-input-event/9906991
            document.getElementById("<%= RadTextBox_FirstName.ClientID %>").addEventListener('keydown', function (event) { RadControl_OnValueChanged(); });
            document.getElementById("<%= RadTextBox_MiddleInitial.ClientID %>").addEventListener('keydown', function (event) { RadControl_OnValueChanged(); });
            document.getElementById("<%= RadTextBox_LastName.ClientID %>").addEventListener('keydown', function (event) { RadControl_OnValueChanged(); });
            document.getElementById("<%= RadTextBox_GoogleLogin.ClientID %>").addEventListener('keydown', function (event) { RadControl_OnValueChanged(); });
            document.getElementById("<%= RadMaskedTextBox_TIN.ClientID %>").addEventListener('keydown', function (event) { RadControl_OnValueChanged(); });

            (function (global, undefined) {
                function OnClientFileOpen(oExplorer, args) {

                    var item = args.get_item();

                    // Ensure user is not trying to open a folder..
                    // Had Issue with security when trying to open a folder thus the line below.
                    if (item.isDirectory()) return;

                    var fileExtension = item.get_extension();

                    // File is a image document, do not open a new window
                    args.set_cancel(true);

                    // Tell browser to open file directly
                    var requestImage = "Handler.ashx?path=" + item.get_url();
                    document.location = requestImage;
                }

                global.OnClientFileOpen = OnClientFileOpen;
            })(window);

            function RadAddressContactGrid_OnCommand(sender, args) {
                //  If any grid is in edit or insert mode, update parent that data has changed 
                //      otherwise, update parent that data hasn't changed.
                var gridAddresses = $find("<%=RadGrid_Addresses.ClientID %>");
                var gridPhoneNumbers = $find("<%=RadGrid_PhoneNumbers.ClientID %>");
                var gridEmailAddresses = $find("<%=RadGrid_EmailAddresses.ClientID %>");
                try {
                    if (gridAddresses.get_masterTableView().get_editItems().length > 0 || gridPhoneNumbers.get_masterTableView().get_editItems().length > 0 || gridEmailAddresses.get_masterTableView().get_editItems().length > 0 ||
                        gridAddresses.get_masterTableView().get_insertItem() != undefined || gridPhoneNumbers.get_masterTableView().get_insertItem() != undefined || gridEmailAddresses.get_masterTableView().get_insertItem() != undefined) {
                        window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("UnsavedData");
                    }
                    else {
                        window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("");
                    }
                }
                catch (e) {
                }
            }

            function formatValue(sender, args) {
                var intCurrentValue = sender.get_value();
                if (intCurrentValue < 10) {
                    sender.set_textBoxValue("0" + intCurrentValue);
                }
            }

            function ClickAsyncUpload(sender, args) {
                $telerik.$(".ruFileInput").click();
            }

            function OnProfilePhotoUploaded(sender, args) {
                $find("<%= BtnUploadPhoto.ClientID %>").click();
            }

            function OnClientProfilePhotoValidationFailed(sender, args) {
                var fileExtention = args.get_fileName().substring(args.get_fileName().lastIndexOf('.') + 1, args.get_fileName().length);
                if (args.get_fileName().lastIndexOf('.') != -1) {//this checks if the extension is correct
                    if (sender.get_allowedFileExtensions().indexOf(fileExtention) == -1) {
                        var oAlert = radalert("The image file extension must be jpg, jpeg, or gif.", 450, 100, "Incorrect File Extension");
                    }
                    else {
                        var oAlert = radalert("The image file size must be less than 128K.", 450, 100, "Incorrect File Size");
                    }
                }
                else {
                    var oAlert = radalert("The image file extension must be jpg, jpeg, or gif.", 450, 100, "Incorrect File Extension");
                }

                var upload = $telerik.$(".ruFileInput").click();
                upload.deleteAllFileInputs();
            }


            //function FuelCardNumber_OnValueChange(sender, eventArgs) {
            //    if (eventArgs.get_newValue() == "")
            //        eventArgs.set_cancel(true);
            //}
        </script>
    </telerik:RadScriptBlock>

</head>
<body style="margin: 0px;">
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField_PersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_CertificationTypeId" runat="server" />
        <asp:HiddenField ID="HiddenField_ShowInactiveCertifications" runat="server" />

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>

                <telerik:AjaxSetting AjaxControlID="RadTextBox_FuelCardNumber">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_FuelCardNumber" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>

                <telerik:AjaxSetting AjaxControlID="RadGrid_Addresses">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_PersonId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Addresses" UpdatePanelCssClass="" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>

                <telerik:AjaxSetting AjaxControlID="RadGrid_PhoneNumbers">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_PersonId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_DispatchPhoneNumber" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_EmergencyContactPhoneNumber" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_EmergencyContactName" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_PhoneNumbers" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGrid_EmailAddresses">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_PersonId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_EmailAddresses" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadGrid_Certifications">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_PersonId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_CertificationTypeId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_ShowInactiveCertifications" />
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_Certifications" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>

                <telerik:AjaxSetting AjaxControlID="RadButton_Save">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_PersonId" />
                        <telerik:AjaxUpdatedControl ControlID="RegularExpressionValidator_TIN" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_DriverId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_PowerUnit" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_PersonActive" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Save" LoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="Label_UpdateSuccess" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Name" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>

            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="500" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
        <telerik:RadSkinManager ID="RadSkinManager1" runat="server"></telerik:RadSkinManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />

        <div>
            <table style="padding: 0px; margin: 0px">
                <tr>
                    <td style="vertical-align: top">
                        <fieldset>
                            <legend style="font-size: small; font-weight: bold;">Employee Info</legend>
                            <table style="border-width: 0px; padding: 0px; margin: 0px">
                                <tr>
                                    <td>Name</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadTextBox ID="RadTextBox_FirstName" runat="server" EmptyMessage="First Name" MaxLength="50" Width="140px" LabelWidth="56px" Resize="None" />
                                        <telerik:RadTextBox ID="RadTextBox_MiddleInitial" runat="server" EmptyMessage="M.I." Width="20px" MaxLength="5" />
                                        <telerik:RadTextBox ID="RadTextBox_LastName" runat="server" EmptyMessage="Last Name" MaxLength="50" Width="140px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadDropDownList ID="RadDropDownList_Gender" runat="server" SelectedText="DropDownListItem1" DefaultMessage="-Select Gender-"
                                            OnClientSelectedIndexChanged="RadControl_OnValueChanged">
                                            <Items>
                                                <telerik:DropDownListItem runat="server" Text="Male" Value="1" />
                                                <telerik:DropDownListItem runat="server" Text="Female" Value="2" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Birthday</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadDatePicker ID="RadDatePicker_BirthDate" runat="server" Culture="en-US" MinDate="1900-01-01">
                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                            <DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%"></DateInput>
                                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                            <ClientEvents OnDateSelected="RadControl_OnValueChanged" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadTextBox ID="RadTextBox_GoogleLogin" runat="server" Width="243px" MaxLength="50"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SSN/TIN</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadMaskedTextBox ID="RadMaskedTextBox_TIN" runat="server" Mask="###-##-####" LabelWidth="64px" Width="80px"></telerik:RadMaskedTextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_TIN" runat="server" ErrorMessage="Incomplete!"
                                            ValidationExpression="\d{3}-\d{2}-\d{4}" ControlToValidate="RadMaskedTextBox_TIN" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>FedEx ID</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadNumericTextBox ID="RadNumericTextBox_FedExId" runat="server"
                                            Culture="en-US" DbValueFactor="1" MinValue="0" Width="120px">
                                            <NegativeStyle Resize="None"></NegativeStyle>
                                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                            <FocusedStyle Resize="None"></FocusedStyle>
                                            <DisabledStyle Resize="None"></DisabledStyle>
                                            <InvalidStyle Resize="None"></InvalidStyle>
                                            <HoveredStyle Resize="None"></HoveredStyle>
                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Availability</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadDropDownList ID="RadDropDownList_Availability" runat="server" DefaultMessage="-Select Availability-" OnClientSelectedIndexChanged="RadControl_OnValueChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Home Terminal</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadComboBox ID="RadDropDownList_HomeTerminal" runat="server"
                                            DataSourceID="ObjectDataSource_HomeTerminal" DataTextField="Location"
                                            DataValueField="LocationTypeId" AppendDataBoundItems="true"
                                            OnClientSelectedIndexChanged="RadControl_OnValueChanged" >
                                            <Items>
                                                <telerik:RadComboBoxItem runat="server" Text="-Select Home Terminal-" Value="0" />
                                            </Items>
                                        </telerik:RadComboBox>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td>Region</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadDropDownList ID="RadDropDownList_region" runat="server" DefaultMessage="-Select Region-" OnClientSelectedIndexChanged="RadControl_OnValueChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Dispatch</td>
                                    <td style="padding-left: 15px">
                                        <telerik:RadTextBox ID="RadTextBox_DispatchPhoneNumber" runat="server" Width="95px" ReadOnly="true" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    <td style="padding-left: 20px; vertical-align: top">
                        <div id="dvDriverInfo">
                            <fieldset>
                                <legend style="font-size: small; font-weight: bold;">Driver Info</legend>
                                <table>
                                    <tr>
                                        <td><span style="white-space: nowrap">Driver ID</span></td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadTextBox ID="RadTextBox_DriverId" runat="server" ReadOnly="true" Width="70px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="white-space: nowrap">Power Unit</span></td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadDropDownList ID="RadDropDownList_PowerUnit" runat="server" MarkFirstMatch="true"
                                                DataSourceID="ObjectDataSource_Punit" DropDownHeight="300px" OnClientSelectedIndexChanged="RadControl_OnValueChanged" AutoPostBack="true"
                                                DataTextField="Unit_ID" DataValueField="PunitId" AppendDataBoundItems="true" Width="70px" OnSelectedIndexChanged="RadDropDownList_PowerUnit_SelectedIndexChanged" >
                                                <Items>
                                                    <telerik:DropDownListItem runat="server" Text="-Select-" Value="0" />
                                                </Items>
                                            </telerik:RadDropDownList>
                                            <asp:ObjectDataSource ID="ObjectDataSource_Punit"
                                                runat="server"
                                                OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" DeleteMethod="Delete" TypeName="RedbonePlatform.Datasets.dsPersonEdit_DriverInfoTableAdapters.PunitTableAdapter">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_PunitId" Type="Int32" />
                                                </DeleteParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="white-space: nowrap">Fuel Card Number</span></td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadTextBox ID="RadTextBox_FuelCardNumber" runat="server" Width="45px" OnTextChanged="RadTextBox_FuelCardNumber_TextChanged" AutoPostBack="true" >
                                            <%--    <ClientEvents OnValueChanged="FuelCardNumber_OnValueChange" />--%>
                                            </telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="white-space: nowrap">Pet Deposit</span></td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadCheckBox ID="RadCheckBox_PaidPetDeposit" runat="server" Text="" AutoPostBack="false" style="padding: 0px;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="white-space: nowrap">Passenger Insurance</span></td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadCheckBox ID="RadCheckBox_HasPassengerInsurance" runat="server" Text="" AutoPostBack="false" style="padding: 0px;"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            <br />
                            <fieldset>
                                <legend style="font-size: small; font-weight: bold;">Emergency Info</legend>
                                <table>
                                    <tr>
                                        <td>Phone</td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadTextBox ID="RadTextBox_EmergencyContactPhoneNumber" runat="server" Width="95px" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Contact</td>
                                        <td style="padding-left: 15px">
                                            <telerik:RadTextBox ID="RadTextBox_EmergencyContactName" runat="server" Width="200px" ReadOnly="true"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                    <td style="padding-left: 20px; vertical-align: top">
                        <div id="dvProfile">
                            <fieldset>
                                <legend style="font-size: small; font-weight: bold;">Profile</legend>
                                <table>
                                    <tr>
                                        <td align="right">ACTIVE
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <telerik:RadCheckBox ID="RadCheckBox_PersonActive" runat="server" Text="" AutoPostBack="false"
                                                OnClientCheckedChanged="RadControl_OnValueChanged" Skin="MyCustomSkin" EnableEmbeddedSkins="false">
                                            </telerik:RadCheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadBinaryImage
                                                ID="ProfilePhotoImage"
                                                runat="server" Height="260px" Width="260px"
                                                ImageAlign="top"
                                                ResizeMode="Fit"
                                                AlternateText='Profile Photo'
                                                ImageUrl="~/images/redbone-coonhound-profile-photo.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 10px">
                                            <telerik:RadButton
                                                ID="BtnUploadPhoto"
                                                runat="server"
                                                OnClick="Upload_Photo_Click" />

                                            <telerik:RadAsyncUpload
                                                ID="AsyncUpload_ProfilePhoto"
                                                runat="server"
                                                RenderMode="Lightweight"
                                                HideFileInput="true"
                                                AllowedFileExtensions="jpg,jpeg,gif"
                                                MaxFileSize="132000"
                                                OnClientValidationFailed="OnClientProfilePhotoValidationFailed"
                                                OnClientFileUploaded="OnProfilePhotoUploaded"
                                                MaxFileInputsCount="1" />

                                            <telerik:RadButton
                                                ID="BtnAsyncUploadClicker"
                                                runat="server"
                                                Text="Update Photo"
                                                AutoPostBack="False"
                                                OnClientClicked="ClickAsyncUpload" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </td>
                </tr>
                <tr id="dvAddresses">
                    <td colspan="3">
                        <div style="padding-top: 5px">
                            <fieldset>
                                <legend style="font-size: small; font-weight: bold;">Addresses</legend>
                                <telerik:RadGrid ID="RadGrid_Addresses" runat="server" CellSpacing="-1"
                                    DataSourceID="ObjectDataSource_Address" GridLines="Both" AllowAutomaticDeletes="True"
                                    AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                    AutoGenerateColumns="False" Width="100%" Height="135px"
                                    OnItemCommand="RadGrid_AllGrids_ItemCommand">
                                    <ValidationSettings ValidationGroup="Address" />
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings Resizing-AllowColumnResize="true">
                                        <ClientEvents OnGridCreated="RadAddressContactGrid_OnCommand" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                        <Resizing AllowColumnResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" />
                                    </ClientSettings>
                                    <MasterTableView DataKeyNames="PersonAddressId" GridLines="None"
                                        DataSourceID="ObjectDataSource_Address" CommandItemDisplay="Top" EditMode="InPlace">
                                        <CommandItemSettings AddNewRecordText="Add Address" ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridEditCommandColumn InsertText="Add" UpdateText="Update" CancelText="Cancel">
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="PersonAddressId" DataType="System.Int32"
                                                FilterControlAltText="Filter PersonAddressId column" HeaderText="PersonAddressId"
                                                SortExpression="PersonAddressId" UniqueName="PersonAddressId" Visible="false" ReadOnly="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridDropDownColumn FilterControlAltText="Filter column column" UniqueName="AddressTypeId"
                                                DataSourceID="ObjectDataSource_AddressTypes" DataField="AddressTypeId" ListValueField="AddressTypeId"
                                                ListTextField="Description" HeaderText="Type" DropDownControlType="RadComboBox" AllowSorting="true"
                                                ItemStyle-Width="50px" ColumnEditorID="GridDropDownListColumnEditor_AddressType" EmptyListItemText="-Select-">
                                                <HeaderStyle Width="50px" />
                                            </telerik:GridDropDownColumn>
                                            <telerik:GridBoundColumn DataField="AddressLine1" FilterControlAltText="Filter AddressLine1 column" ColumnEditorID="GridTextBoxColumnEditor_Generic"
                                                HeaderText="Address Line 1" SortExpression="AddressLine1" UniqueName="AddressLine1" MaxLength="100">
                                                <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                                    <RequiredFieldValidator ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Address"><br />Required!</RequiredFieldValidator>
                                                </ColumnValidationSettings>
                                                <ItemStyle VerticalAlign="Top" />
                                                <HeaderStyle Width="150px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="AddressLine2" FilterControlAltText="Filter AddressLine2 column" ColumnEditorID="GridTextBoxColumnEditor_Generic"
                                                HeaderText="Address Line 2" SortExpression="AddressLine2" UniqueName="AddressLine2" MaxLength="100">
                                                <ItemStyle VerticalAlign="Top" />
                                                <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column"
                                                HeaderText="City" SortExpression="City" UniqueName="City" MaxLength="50" ColumnEditorID="GridTextBoxColumnEditor_Generic">
                                                <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                                    <RequiredFieldValidator ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ErrorMessage="<br />Required!"
                                                        ValidationGroup="Address"></RequiredFieldValidator>
                                                </ColumnValidationSettings>
                                                <ItemStyle VerticalAlign="Top" />
                                                <HeaderStyle Width="75px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="State" FilterControlAltText="Filter State column"
                                                HeaderText="State" SortExpression="State" UniqueName="State" MaxLength="2" ColumnEditorID="GridTextBoxColumnEditor_Generic">
                                                <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                                    <RequiredFieldValidator ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Address"><br />Required!</RequiredFieldValidator>
                                                </ColumnValidationSettings>
                                                <ItemStyle VerticalAlign="Top" />
                                                <HeaderStyle Width="20px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column" DataField="ZipCode"
                                                UniqueName="ZipCode" HeaderText="Zip">
                                                <EditItemTemplate>
                                                    <telerik:RadMaskedTextBox ID="RadMaskedTextBox_ZipCode" runat="server"
                                                        Mask="#####" ValidationGroup="Address" Text='<%# Bind("ZipCode") %>'
                                                        Width="50px">
                                                    </telerik:RadMaskedTextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br />Required!"
                                                        ForeColor="Red" Display="Dynamic" ControlToValidate="RadMaskedTextBox_ZipCode"
                                                        SetFocusOnError="True"
                                                        ValidationGroup="Address">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<br>Zip must be 5 digits!"
                                                        ValidationExpression="\d{5}"
                                                        ControlToValidate="RadMaskedTextBox_ZipCode" ForeColor="Red"
                                                        Display="Dynamic" Enabled="true" SetFocusOnError="true" ValidationGroup="Address">
                                                    </asp:RegularExpressionValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <%# Eval("ZipCode").ToString() %>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" />
                                                <HeaderStyle Width="30px" />
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this Address?" FooterStyle-HorizontalAlign="Right"
                                                CommandName="Delete" Text="Delete" ConfirmDialogType="RadWindow" ConfirmTitle="Delete Address?" ConfirmDialogHeight="150px">
                                                <FooterStyle HorizontalAlign="Right"></FooterStyle>
                                                <HeaderStyle Width="30px" />
                                            </telerik:GridButtonColumn>
                                        </Columns>
                                        <EditFormSettings>
                                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </fieldset>
                            <table style="border-collapse: collapse; border-width: 0; width: 100%">
                                <tr>
                                    <td style="width: 60%;">
                                        <fieldset>
                                            <legend style="font-size: small; font-weight: bold;">Phone Numbers</legend>
                                            <telerik:RadGrid ID="RadGrid_PhoneNumbers" runat="server" CellSpacing="-1"
                                                GridLines="Both" AllowAutomaticDeletes="True"
                                                AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                                AutoGenerateColumns="False" Width="100%" Height="155px"
                                                DataSourceID="ObjectDataSource_PersonPhoneNumbers"
                                                OnItemInserted="RadGrid_PhoneNumbers_ItemInserted"
                                                OnItemUpdated="RadGrid_PhoneNumbers_ItemUpdated"
                                                OnItemDeleted="RadGrid_PhoneNumbers_ItemDeleted"
                                                OnItemCommand="RadGrid_AllGrids_ItemCommand">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings Resizing-AllowColumnResize="true">
                                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                                    <Resizing AllowColumnResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" />
                                                    <ClientEvents OnGridCreated="RadAddressContactGrid_OnCommand" />
                                                </ClientSettings>
                                                <ValidationSettings ValidationGroup="Phone" />
                                                <MasterTableView GridLines="None"
                                                    CommandItemDisplay="Top" EditMode="InPlace" DataSourceID="ObjectDataSource_PersonPhoneNumbers"
                                                    DataKeyNames="PersonPhoneNumberId">
                                                    <CommandItemSettings AddNewRecordText="Add Phone Number" ShowRefreshButton="false" />
                                                    <Columns>
                                                        <telerik:GridEditCommandColumn InsertText="Add" UpdateText="Update" CancelText="Cancel">
                                                            <HeaderStyle Width="40px" />
                                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                                        </telerik:GridEditCommandColumn>
                                                        <telerik:GridBoundColumn DataField="PersonPhoneNumberId" DataType="System.Int16"
                                                            FilterControlAltText="Filter PersonPhoneNumberId column" HeaderText="PersonPhoneNumberId"
                                                            ReadOnly="True" SortExpression="PersonPhoneNumberId" UniqueName="PersonPhoneNumberId" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridDropDownColumn FilterControlAltText="Filter column column" UniqueName="PhoneNumberTypeId"
                                                            DataSourceID="ObjectDataSource_PhoneNumberType" DataField="PhoneNumberTypeId" ListValueField="PhoneNumberTypeId"
                                                            ListTextField="Description" HeaderText="Type" DropDownControlType="RadComboBox" AllowSorting="true"
                                                            ItemStyle-Width="30px" ColumnEditorID="GridDropDownListColumnEditor_AddressType" EmptyListItemText="-Select-">
                                                            <HeaderStyle Width="30px" />
                                                        </telerik:GridDropDownColumn>
                                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Phone Number column" DataField="PhoneNumber"
                                                            UniqueName="PhoneNumber" HeaderText="Number">
                                                            <EditItemTemplate>
                                                                <telerik:RadMaskedTextBox ID="RadMaskedTextBox_PhoneNumber" runat="server" TextWithLiterals='<%#Bind("PhoneNumber") %>'
                                                                    DisplayMask="(###) ###-####" Mask="(###) ###-####" Width="95px" ValidationGroup="Phone">
                                                                </telerik:RadMaskedTextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_PhoneNumber" runat="server" ErrorMessage="<br />Required!"
                                                                    ForeColor="Red" Display="Dynamic" ControlToValidate="RadMaskedTextBox_PhoneNumber" SetFocusOnError="True"
                                                                    ValidationGroup="Phone">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Phone Number Incomplete!"
                                                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ControlToValidate="RadMaskedTextBox_PhoneNumber"
                                                                    ForeColor="Red"
                                                                    Display="Dynamic" Enabled="true" SetFocusOnError="true" ValidationGroup="Phone">
                                                                </asp:RegularExpressionValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%# Eval("PhoneNumber").ToString() %>
                                                            </ItemTemplate>
                                                            <HeaderStyle Width="40px" />
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridDropDownColumn FilterControlAltText="Filter column column" UniqueName="CellCarrierId"
                                                            DataSourceID="ObjectDataSource_CellCarriers" DataField="CellCarrierId" ListValueField="CellCarrierId"
                                                            ListTextField="Carrier" HeaderText="Carrier" DropDownControlType="RadComboBox" AllowSorting="true" EnableEmptyListItem="true"
                                                            ColumnEditorID="GridDropDownListColumnEditor_CellCarrier" EmptyListItemText="-Select-">
                                                            <HeaderStyle Width="40px" />
                                                            <ItemStyle VerticalAlign="Top" />
                                                        </telerik:GridDropDownColumn>
                                                        <telerik:GridBoundColumn DataField="ContactName" FilterControlAltText="Filter ContactName column" ColumnEditorID="GridTextBoxColumnEditor_Generic"
                                                            HeaderText="Contact Name" SortExpression="ContactName" UniqueName="ContactName" MaxLength="50">
                                                            <ItemStyle VerticalAlign="Top" />
                                                            <HeaderStyle Width="80px" />
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridCheckBoxColumn UniqueName="UseForDispatch" HeaderText="Dispatch" DataField="UseForDispatch"
                                                            AllowSorting="true">
                                                            <HeaderStyle Width="25px" />
                                                        </telerik:GridCheckBoxColumn>
                                                        <telerik:GridCheckBoxColumn UniqueName="UseForQuickApps" HeaderText="Quick Apps" DataField="UseForQuickApps"
                                                            AllowSorting="true">
                                                            <HeaderStyle Width="30px" />
                                                        </telerik:GridCheckBoxColumn>
                                                        <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this Phone Number?" FooterStyle-HorizontalAlign="Right"
                                                            CommandName="Delete" Text="Delete" ConfirmDialogType="RadWindow" ConfirmTitle="Delete Phone Number?"
                                                            ConfirmDialogHeight="150px">
                                                            <FooterStyle HorizontalAlign="Right"></FooterStyle>
                                                            <HeaderStyle Width="20px" />
                                                        </telerik:GridButtonColumn>
                                                    </Columns>
                                                    <EditFormSettings>
                                                        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                                                        </EditColumn>
                                                    </EditFormSettings>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </fieldset>
                                    </td>
                                    <td style="width: 40%;">
                                        <fieldset>
                                            <legend style="font-size: small; font-weight: bold;">Email Addresses</legend>
                                            <%--fyi: had to remove the PersonId field from the grid when using in objectdatasource querystring parameter because it would--%>
                                            <%--somehow use the one from the grid that wasn't populated vs. using the query string parameter in an insert scenario--%>
                                            <telerik:RadGrid ID="RadGrid_EmailAddresses" runat="server" CellSpacing="-1"
                                                GridLines="Both" AllowAutomaticDeletes="True"
                                                AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                                AutoGenerateColumns="False" Width="100%" Height="155px"
                                                DataSourceID="ObjectDataSource_PersonEmailAddress"
                                                OnItemInserted="RadGrid_EmailAddresses_ItemInserted"
                                                OnItemUpdated="RadGrid_EmailAddresses_ItemUpdated"
                                                OnItemCommand="RadGrid_AllGrids_ItemCommand">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ClientSettings Resizing-AllowColumnResize="true">
                                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                                    <Resizing AllowColumnResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" />
                                                    <ClientEvents OnGridCreated="RadAddressContactGrid_OnCommand" />
                                                </ClientSettings>
                                                <ValidationSettings ValidationGroup="eMail" />
                                                <MasterTableView GridLines="None"
                                                    CommandItemDisplay="Top" EditMode="InPlace" DataKeyNames="PersonEmailAddressId"
                                                    DataSourceID="ObjectDataSource_PersonEmailAddress">
                                                    <CommandItemSettings AddNewRecordText="Add Email Address" ShowRefreshButton="false" />
                                                    <Columns>
                                                        <telerik:GridEditCommandColumn InsertText="Add" UpdateText="Update" CancelText="Cancel">
                                                            <HeaderStyle Width="85px" />
                                                            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                                        </telerik:GridEditCommandColumn>
                                                        <telerik:GridBoundColumn DataField="PersonEmailAddressId" DataType="System.Int16"
                                                            FilterControlAltText="Filter PersonEmailAddressId column" HeaderText="PersonEmailAddressId"
                                                            ReadOnly="True" SortExpression="PersonEmailAddressId" UniqueName="PersonEmailAddressId" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn FilterControlAltText="Filter Email Address column" DataField="EmailAddress"
                                                            UniqueName="EmailAddress" HeaderText="Email">
                                                            <EditItemTemplate>
                                                                <telerik:RadTextBox ID="RadTextBox_EmailAddress" runat="server" Width="100%" ValidationGroup="eMail"
                                                                    Text='<%#Bind("EmailAddress") %>' MaxLength="75">
                                                                </telerik:RadTextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_EmailAddress" runat="server" ErrorMessage="<br />Required!"
                                                                    ForeColor="Red" Display="Dynamic" ControlToValidate="RadTextBox_EmailAddress" SetFocusOnError="True"
                                                                    ValidationGroup="eMail">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_EmailAddress" runat="server" ErrorMessage="Email Address invalid or incomplete!"
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="RadTextBox_EmailAddress"
                                                                    ForeColor="Red"
                                                                    Display="Dynamic" Enabled="true" SetFocusOnError="true" ValidationGroup="eMail">
                                                                </asp:RegularExpressionValidator>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%# Eval("EmailAddress").ToString() %>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridCheckBoxColumn UniqueName="UseForDispatch" HeaderText="Dispatch" DataField="UseForDispatch"
                                                            AllowSorting="true">
                                                            <HeaderStyle Width="75px" />
                                                        </telerik:GridCheckBoxColumn>
                                                        <telerik:GridCheckBoxColumn UniqueName="UseForQuickApps" HeaderText="Quick Apps" DataField="UseForQuickApps"
                                                            AllowSorting="true">
                                                            <HeaderStyle Width="75px" />
                                                        </telerik:GridCheckBoxColumn>
                                                        <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this Email Address?" FooterStyle-HorizontalAlign="Right"
                                                            CommandName="Delete" Text="Delete" ConfirmDialogType="RadWindow" ConfirmTitle="Delete EmailAddress?"
                                                            ConfirmDialogHeight="150px">
                                                            <FooterStyle HorizontalAlign="Right"></FooterStyle>
                                                            <HeaderStyle Width="50px" />
                                                        </telerik:GridButtonColumn>
                                                    </Columns>
                                                    <EditFormSettings>
                                                        <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                                                        </EditColumn>
                                                    </EditFormSettings>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>

                            <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditor_State" runat="server" DropDownStyle-Width="75px"></telerik:GridDropDownListColumnEditor>
                            <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditor1" runat="server" DropDownStyle-Width="75px"></telerik:GridDropDownListColumnEditor>
                            <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditor_CellCarrier" runat="server">
                                <DropDownStyle Width="140px" />
                            </telerik:GridDropDownListColumnEditor>
                            <telerik:GridTextBoxColumnEditor ID="GridTextBoxColumnEditor1" runat="server">
                                <TextBoxStyle Width="100%" />
                            </telerik:GridTextBoxColumnEditor>
                        </div>
                    </td>
                </tr>
                <tr id="dvCertifications">
                    <td colspan="3">
                        <div>
                            <fieldset>
                                <legend style="font-size: small; font-weight: bold;">Certifications</legend>
                                <telerik:RadGrid ID="RadGrid_Certifications" runat="server" CellSpacing="-1" AllowAutomaticDeletes="True"
                                    AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True"
                                    AutoGenerateColumns="False" Width="100%" Height="170px"
                                    DataSourceID="ObjectDataSource_Certifications"
                                    OnItemCommand="RadGrid_AllGrids_ItemCommand"
                                    OnItemInserted="RadGrid_Certifications_ItemInserted"
                                    OnItemUpdated="RadGrid_Certifications_ItemUpdated"
                                    OnItemDataBound="RadGrid_Certifications_ItemDataBound"
                                    OnEditCommand="RadGrid_Certifications_EditCommand"
                                    OnCancelCommand="RadGrid_Certifications_CancelCommand"
                                    OnDataBound="RadGrid_Certifications_DataBound"
                                    OnNeedDataSource="RadGrid_Certifications_NeedDataSource">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <ClientSettings Resizing-AllowColumnResize="true">
                                        <ClientEvents OnGridCreated="RadGrid_OnCertificationsGridCreated" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                        <Resizing AllowColumnResize="true" AllowResizeToFit="true" EnableRealTimeResize="true" />
                                        <Selecting AllowRowSelect="True" />
                                    </ClientSettings>
                                    <MasterTableView GridLines="None"
                                        CommandItemDisplay="Top" DataSourceID="ObjectDataSource_Certifications"
                                        DataKeyNames="CertificationPersonMappingId,CertificationTypeId,CertificationDescription" EditMode="PopUp">
                                        <CommandItemSettings AddNewRecordText="Add a Certification" ShowRefreshButton="false" ShowAddNewRecordButton="true" />
                                        <RowIndicatorColumn Visible="False">
                                        </RowIndicatorColumn>
                                        <ExpandCollapseColumn Created="True">
                                        </ExpandCollapseColumn>

                                        <CommandItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <telerik:RadButton ID="Button" Text="Add Certification" runat="server" CommandName="InitInsert"></telerik:RadButton>
                                                    </td>
                                                    <td style="width: 1500px;"></td>
                                                    <td>
                                                        <telerik:RadCheckBox ID="RadCheckBox_ShowInactive" Text="Show Inactive Certifications" runat="server" OnClick="RadCheckBox_ShowInactive_Click"></telerik:RadCheckBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </CommandItemTemplate>

                                        <Columns>
                                            <telerik:GridEditCommandColumn EditText="Edit" InsertText="Add" UpdateText="Update" CancelText="Cancel">
                                                <HeaderStyle Width="25px" />
                                                <ItemStyle VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                            </telerik:GridEditCommandColumn>

                                            <telerik:GridBoundColumn DataField="CertificationDescription" FilterControlAltText="Filter CertificationDescription column"
                                                HeaderText="Type" SortExpression="Notes" UniqueName="CertificationDescription" ColumnEditorID="GridTextBoxColumnEditor_Generic">
                                                <HeaderStyle Width="75px" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridDateTimeColumn FilterControlAltText="Filter Received Date column" UniqueName="ReceivedDate"
                                                DataField="ReceivedDate" HeaderText="Received Date" PickerType="DatePicker" SortExpression="ReceivedDate"
                                                DataFormatString="{0:d}">
                                                <HeaderStyle Width="50px" />
                                            </telerik:GridDateTimeColumn>

                                            <telerik:GridDateTimeColumn FilterControlAltText="Filter Expire Date column" UniqueName="ExpireDate"
                                                DataField="ExpireDate" HeaderText="Expire Date" PickerType="DatePicker" SortExpression="ExpireDate"
                                                DataFormatString="{0:d}">
                                                <HeaderStyle Width="50px" />
                                            </telerik:GridDateTimeColumn>

                                            <telerik:GridBoundColumn DataField="Notes" FilterControlAltText="Filter Notes column" Visible="false"
                                                HeaderText="Notes" SortExpression="Notes" UniqueName="Notes" ColumnEditorID="GridTextBoxColumnEditor_Generic">
                                                <HeaderStyle Width="1px" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="CertificationCode"
                                                FilterControlAltText="Filter CertificationCode column" HeaderText="Code"
                                                SortExpression="CertificationCode" UniqueName="CertificationCode">
                                                <HeaderStyle Width="100px" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="CertificationState"
                                                FilterControlAltText="Filter CertificationState column" HeaderText="State"
                                                SortExpression="CertificationState" UniqueName="CertificationState">
                                                <HeaderStyle Width="30px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>

                                        <EditFormSettings EditFormType="Template">
                                            <PopUpSettings Width="710px" Height="303px" KeepInScreenBounds="False" />
                                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                                            </EditColumn>
                                            <FormTemplate>
                                                <div style="padding-top: 5px; width: 710px">
                                                    <fieldset>
                                                        <legend style="font-size: small; font-weight: bold;"><%# (Container is GridEditFormInsertItem) ? "Add Certification" : "Edit Certification" %></legend>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <table style="border-style: none; border-width: thin; border-color: inherit; padding-top: 5px">
                                                                        <tr>
                                                                            <td class="auto-style1">Certification Type:
                                                                            </td>
                                                                            <td class="auto-style2">
                                                                                <telerik:RadDropDownList ID="RadDropDownList_CertificationTypes" runat="server"
                                                                                    DefaultMessage="-Select Certification Type-" DataValueField="CertificationTypeId"
                                                                                    DataTextField="CertificationDescription" DataSourceID="ObjectDataSource_CertificationTypesForEditDropdown"
                                                                                    SelectedValue='<%# Bind("CertificationTypeId") %>' Width="180px">
                                                                                </telerik:RadDropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ForeColor="Red"
                                                                                    ControlToValidate="RadDropDownList_CertificationTypes" Display="Dynamic" Font-Bold="true"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td class="auto-style1">Received Date:</td>
                                                                            <td class="auto-style2">
                                                                                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" Culture="en-US"
                                                                                    DbSelectedDate='<%# Bind("ReceivedDate") %>'>
                                                                                </telerik:RadDatePicker>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style1">Expire Date:</td>
                                                                            <td class="auto-style2">
                                                                                <telerik:RadDatePicker ID="RadDatePicker2" runat="server" Culture="en-US"
                                                                                    DbSelectedDate='<%# Bind("ExpireDate") %>'>
                                                                                </telerik:RadDatePicker>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style1">Certification Code:</td>
                                                                            <td class="auto-style2">
                                                                                <telerik:RadTextBox ID="RadTextBox1" runat="server" LabelWidth="64px" Resize="None"
                                                                                    Text='<%# Bind("CertificationCode") %>' Width="160px" MaxLength="100">
                                                                                </telerik:RadTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style1">Certification State:</td>
                                                                            <td class="auto-style2">
                                                                                <telerik:RadTextBox ID="RadTextBox2" runat="server" LabelWidth="64px" Resize="None"
                                                                                    Text='<%# Bind("CertificationState") %>' Width="160px" MaxLength="100">
                                                                                </telerik:RadTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style5">Notes:</td>
                                                                            <td style="text-align: right;">
                                                                                <telerik:RadLabel ID="RadLabelActive" runat="server" Text="Active:"></telerik:RadLabel>
                                                                                <telerik:RadCheckBox Checked='<%# Bind("ActiveInd") %>' ID="RadCheckBox_Active" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style4" colspan="2">
                                                                                <telerik:RadTextBox ID="RadTextBox_CertifiationNotes" runat="server" Width="100%" LabelWidth="40%"
                                                                                    Resize="None" Rows="4" Text='<%# Bind("Notes") %>' TextMode="MultiLine">
                                                                                </telerik:RadTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="auto-style4" colspan="2" style="padding-top: 5px; padding-bottom: 5PX">
                                                                                <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                                                                                    runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                                                                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                                                                    CommandName="Cancel"></asp:Button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="vertical-align: top">
                                                                    <fieldset>
                                                                        <legend style="font-size: small; font-weight: bold;">Image Files</legend>
                                                                        <telerik:RadFileExplorer ID="RadFileExplorer_CertificationFiles" runat="server" Height="200px" Width="350px"
                                                                            EnableOpenFile="True" VisibleControls="Toolbar, ContextMenus, FileList" EnableCreateNewFolder="False"
                                                                            OnClientFileOpen="OnClientFileOpen" OnExplorerPopulated="CertificationFiles_ExplorerPopulated">
                                                                            <Configuration EnableAsyncUpload="True" SearchPatterns="*.*" />
                                                                        </telerik:RadFileExplorer>
                                                                        <asp:Label ID="Label_ToAddFiles" runat="server" Text="To add files, first Create this Certification then Edit it!"
                                                                            Visible="false"></asp:Label>
                                                                    </fieldset>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </div>
                                            </FormTemplate>
                                            <PopUpSettings Modal="True" />
                                        </EditFormSettings>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditor_CertificationType" runat="server"
                                    DropDownStyle-Width="120px">
                                </telerik:GridDropDownListColumnEditor>
                                <telerik:GridTextBoxColumnEditor ID="GridTextBoxColumnEditor_Generic" runat="server">
                                    <TextBoxStyle Width="100%" />
                                </telerik:GridTextBoxColumnEditor>
                            </fieldset>
                        </div>
                    </td>
                </tr>
                <tr id="dvMappings">
                    <td colspan="3">
                        <table style="padding: 0px; margin: 0px; width: 100%;">
                            <tr>
                                <td width="33%" style="vertical-align: top;">
                                    <fieldset>
                                        <legend style="font-size: small; font-weight: bold;">Person Types</legend>
                                        <telerik:RadListBox ID="RadListBox_PersonTypes" runat="server" CheckBoxes="True" Width="100%"
                                            Height="420px" OnClientItemChecked="RadControl_OnValueChanged">
                                        </telerik:RadListBox>
                                    </fieldset>
                                </td>
                                <td width="33%" style="vertical-align: top;">
                                    <fieldset>
                                        <legend style="font-size: small; font-weight: bold;">Division Mapping</legend>
                                        <telerik:RadListBox ID="RadListBox_DivisionMapping" runat="server" CheckBoxes="True" Width="100%"
                                            Height="110px" OnClientItemChecked="RadControl_OnValueChanged">
                                        </telerik:RadListBox>
                                    </fieldset>
                                </td>
                                <td width="34%" style="vertical-align: top;">
                                    <fieldset>
                                        <legend style="font-size: small; font-weight: bold;">Business Entity Mapping</legend>
                                        <telerik:RadListBox ID="RadListBox_BusinessEntityMapping" runat="server" CheckBoxes="True" Width="100%"
                                            Height="135px" OnClientItemChecked="RadControl_OnValueChanged">
                                        </telerik:RadListBox>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 20px;">
                        <table style="border-width: 0px; padding: 0px; margin: 0px">
                            <tr>
                                <td>
                                    <telerik:RadButton ID="RadButton_Save" runat="server" Text="Save Personal Info" OnClick="RadButton_Save_Click" Width="125px"></telerik:RadButton>
                                </td>
                                <td style="padding-left: 10px">
                                    <asp:Label ID="Label_UpdateSuccess" runat="server" Text="Personal Info Saved!" Visible="false"></asp:Label>
                                    <asp:CustomValidator ID="CustomValidator_Name" runat="server" ForeColor="Red" Display="Dynamic"
                                        OnServerValidate="CustomValidator_Name_ServerValidate" EnableClientScript="false" ValidateEmptyText="True">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

        <%--Certifications--%>
        <asp:ObjectDataSource ID="ObjectDataSource_Certifications" runat="server"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsCertificationsTableAdapters.CertificationPersonMappingTableAdapter"
            UpdateMethod="Update" OnUpdating="ObjectDataSource_Certifications_Updating"
            OnUpdated="ObjectDataSource_Certifications_Updated"
            OnInserting="ObjectDataSource_Certifications_Inserting">
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="CertificationTypeId" Type="Int16" />
                <asp:Parameter Name="ReceivedDate" Type="DateTime" />
                <asp:Parameter Name="ExpireDate" Type="DateTime" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="CertificationCode" Type="String" />
                <asp:Parameter Name="CertificationState" Type="String" />
                <asp:Parameter Name="ActiveInd" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:ControlParameter ControlID="HiddenField_ShowInactiveCertifications" Type="Boolean" Name="ActiveInd" PropertyName="Value" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="CertificationTypeId" Type="Int16" />
                <asp:Parameter Name="ReceivedDate" Type="DateTime" />
                <asp:Parameter Name="ExpireDate" Type="DateTime" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="CertificationCode" Type="String" />
                <asp:Parameter Name="CertificationState" Type="String" />
                <asp:Parameter Name="Original_CertificationPersonMappingId" Type="Int32" />
                <asp:Parameter Name="ActiveInd" Type="Boolean" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_CertificationTypesForGridRecords" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsCertificationsTableAdapters.CertificationTypeTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_CertificationTypesForEditDropdown" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsCertificationsTableAdapters.CertificationType_ActiveOrAssignedTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_CertificationTypeId"
                    Name="Assigned_CertificationTypeId" PropertyName="Value" Type="Int16" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <%--Address & Contact--%>
        <asp:ObjectDataSource ID="ObjectDataSource_Address" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.PersonAddressTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_PersonAddressId" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="AddressTypeId" Type="Int16" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="AddressTypeId" Type="Int16" />
                <asp:Parameter Name="Original_PersonAddressId" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_AddressTypes" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.AddressTypeTableAdapter"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_States" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.StateTableAdapter"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_PersonPhoneNumbers" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.PersonPhoneNumberTableAdapter"
            UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_PersonPhoneNumberId" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="PhoneNumberTypeId" Type="Int16" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="CellCarrierId" Type="Int16" />
                <asp:Parameter Name="UseForDispatch" Type="Boolean" />
                <asp:Parameter Name="UseForQuickApps" Type="Boolean" />
                <asp:Parameter Name="ContactName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="PhoneNumberTypeId" Type="Int16" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Original_PersonPhoneNumberId" Type="Int16" />
                <asp:Parameter Name="CellCarrierId" Type="Int16" />
                <asp:Parameter Name="UseForDispatch" Type="Boolean" />
                <asp:Parameter Name="UseForQuickApps" Type="Boolean" />
                <asp:Parameter Name="ContactName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_PhoneNumberType" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.PhoneNumberTypeTableAdapter">
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_PersonEmailAddress" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.PersonEmailAddressTableAdapter"
            UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_PersonEmailAddressId" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="UseForDispatch" Type="Boolean" />
                <asp:Parameter Name="UseForQuickApps" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Original_PersonEmailAddressId" Type="Int16" />
                <asp:ControlParameter ControlID="HiddenField_PersonId" Type="Int32" Name="PersonId" PropertyName="Value" />
                <asp:Parameter Name="EmailAddress" Type="String" />
                <asp:Parameter Name="UseForDispatch" Type="Boolean" />
                <asp:Parameter Name="UseForQuickApps" Type="Boolean" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_CellCarriers" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsPersonAddressContactTableAdapters.CellCarrierTableAdapter">
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource_HomeTerminal" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsLookupDataManagementTableAdapters.LocationTypeTableAdapter"
            filterexpression="Enabled=1" >
        </asp:ObjectDataSource>
    </form>
</body>
</html>
