<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LEG.ascx.cs" Inherits="RedbonePlatform.UserControls.LEG" %>
<style>
    .nospacing {
        border-spacing: 0;
        padding: 0;
        border-style: none;
    }
    .auto-style1 {
        width: 108px;
    }
	.rightAlign {
		text-align: right;
		padding-right:5px;
	}
	span.RadButtonGreen, span.RadButtonGreen input {
		background-image:none!important;
		background-color:Green!important;
		color:White!important;
	}
</style>

<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript"></script>
</telerik:RadCodeBlock>--%>

<telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Customer">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Customer" />
                <telerik:AjaxUpdatedControl ControlID="Label_ClientAddress"
                    LoadingPanelID="RadAjaxLoadingPanel1" />
                  <telerik:AjaxUpdatedControl ControlID="HiddenField_TrailerShowThirdParty" />
                <telerik:AjaxUpdatedControl ControlID="Label_CustomerThirdParty" />
                 <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                 <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                <%--<telerik:AjaxUpdatedControl ControlID="RadEditor_Notes" />--%>
                <%--<telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientName" />
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientAddressLine1" />
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientAddressLine2" />
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientCity" />
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientState" />
                <telerik:AjaxUpdatedControl ControlID="RadMaskedTextBox_AdhocClientZip" />--%>
                <telerik:AjaxUpdatedControl ControlID="tblAdhoc" />
                <telerik:AjaxUpdatedControl ControlID="HiddenField_ClientId" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocClientName">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientName" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocClientAddressLine1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientAddressLine1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocClientAddressLine2">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientAddressLine2" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocClientCity">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientCity" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocClientState">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocClientState" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadMaskedTextBox_AdhocClientZip">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadMaskedTextBox_AdhocClientZip" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTextBox_AdhocTimezone">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTextBox_AdhocTimezone" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadDatePicker_StartDate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadDatePicker_StartDate" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTimePicker_StartTime">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTimePicker_StartTime" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadDatePicker_ThroughDate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadDatePicker_ThroughDate" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTimePicker_ThroughTime">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTimePicker_ThroughTime" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadDropDownList_ApptOrFCFS">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadDropDownList_ApptOrFCFS" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <%--<telerik:AjaxSetting AjaxControlID="RadEditor_Notes">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadEditor_Notes" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>--%>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Driver1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Driver2">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Trailer1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer2" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Trailer2">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer2" />
                <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadComboBox_Truck1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Truck1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox_FleetManager" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="ImageButton_OpenClientEdit">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="ImageButton_OpenClientEdit" UpdatePanelCssClass="" />
                <telerik:AjaxUpdatedControl ControlID="HiddenField_ClientId" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadDatePicker_DropStartDate">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadDatePicker_DropStartDate" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadTimePicker_DropStartTime">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTimePicker_DropStartTime" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_PaidLoaded">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidLoaded" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_EmptyMiles">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_EmptyMiles" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadButton_DispatchLEG">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadButton_DispatchLEG" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadDateTimePicker_StartActualDateTime">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadDateTimePicker_StartActualDateTime" UpdatePanelCssClass="" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="RadButton_Notes">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadButton_Notes" UpdatePanelCssClass="" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="100" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
<telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>

<asp:HiddenField ID="HiddenField_LoadStopId" runat="server" />
<asp:HiddenField ID="HiddenField_ClientId" runat="server" />
<asp:HiddenField ID="HiddenField_Driver1PersonId" runat="server" />
<asp:HiddenField ID="HiddenField_Driver2PersonId" runat="server" />
<asp:HiddenField ID="HiddenField_PunitId" runat="server" />
<asp:HiddenField ID="HiddenField_TrailerId1" runat="server" />
<asp:HiddenField ID="HiddenField_TrailerId2" runat="server" />
<asp:HiddenField ID="HiddenField_Truck1" runat="server" />
<asp:HiddenField ID="HiddenField_LoadId" runat="server" />
  <asp:HiddenField ID="HiddenField_TrailerShowThirdParty" runat="server" />
<asp:HiddenField ID="HiddenField_FleetManagerPersonId" runat="server" />

<table style="width: 100%">
    <tr>
        <td style="vertical-align: top; width: 310px">
            <fieldset style="height: 150px; width: 290px" id="fldSet_Location">
                <legend style="font-size: small;">Location</legend>
                <div>
                    <table class="nospacing">
                        <tr>
                            <td class="nospacing">
                                <telerik:RadComboBox ID="RadComboBox_Customer" runat="server" AutoPostBack="True" Width="270px" DropDownWidth="900px" CausesValidation="False" ValidationGroup="Dispatch"
                                    DataSourceID="ObjectDataSource_Customer" DataTextField="ClientName" DataValueField="ClientId" Filter="Contains"
                                    HighlightTemplatedItems="True" EmptyMessage="-Select Customer-" AllowCustomText="True" EnableAutomaticLoadOnDemand="True" AppendDataBoundItems="True"
                                    MarkFirstMatch="True" EnableVirtualScrolling="true" ItemsPerRequest="50"
                                    OnClientKeyPressing="radComboKeyPress" OnClientFocus="OnClientFocusHandler" OnSelectedIndexChanged="RadComboBox_Customer_SelectedIndexChanged">
                                    <HeaderTemplate>
                                        <table style="width: 890px;" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="width: 300px;">Customer Name</td>
                                                <td style="width: 50px; padding-left: 5px">Client ID</td>
                                                <td style="width: 100px; padding-left: 5px">City</td>
                                                <td style="width: 50px; padding-left: 5px">State</td>
                                                <td style="width: 150px; padding-left: 5px">Address 1</td>
                                                <td style="width: 150px; padding-left: 5px">Address 2</td>
                                                <td style="width: 50px; padding-left: 5px">Zip</td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table style="width: 890px;" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="width: 300px;"><%# DataBinder.Eval(Container.DataItem, "ClientName") %></td>
                                                <td style="width: 50px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "Client_Id") %></td>
                                                <td style="width: 100px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "City") %></td>
                                                <td style="width: 50px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "State") %></td>
                                                <td style="width: 150px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "AddressLine1") %></td>
                                                <td style="width: 150px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "AddressLine2") %></td>
                                                <td style="width: 50px; padding-left: 5px"><%# DataBinder.Eval(Container.DataItem, "ZipCode") %></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadComboBox>
                            </td>
                            <td style="width: 25px">
                                <asp:ImageButton ID="ImageButton_OpenClientEdit" runat="server" Style="top: 2px; position: relative"
                                    ImageUrl="~/images/16x16/Business_16x.png" OnClick="ImageButton_OpenClientEdit_Click" />
                            </td>
                            <td class="nospacing" style="padding-left: 2px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Customer" runat="server" ErrorMessage="*" InitialValue=""
                                    ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadComboBox_Customer" ValidationGroup="Dispatch">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="padding-top: 5px; padding-left: 2px; font-size:smaller;">
                       <table>
                           <tr>
                               <td>
                                   <asp:Label ID="Label_ClientAddress" runat="server"></asp:Label>
                               </td>

                           </tr>
                           <tr>
                               <td>
                                     <div style="padding-top: 5px; padding-left: 2px; text-align: left; font: normal; font-weight:bold; color:crimson; font-size: 12px; font-family: 'Segoe UI',Arial,Verdana">
                                                    <asp:Label ID="Label_CustomerThirdParty" runat="server"></asp:Label>
                                                </div>
                               </td>
                           </tr>

                       </table>
                    
                    
                    <table id="tblAdhoc" runat="server" class="nospacing" border="0">
                        <tr>
                            <td style="width:60px; text-align: right; padding-right: 5px">Client:</td>
                            <td colspan="4">
                                <telerik:RadTextBox ID="RadTextBox_AdhocClientName" runat="server" MaxLength="100" Visible="false" Width="100%"
                                    OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True" CausesValidation="false">
                                </telerik:RadTextBox>
                            </td>
                            <td style="padding-left: 2px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadTextBox_AdhocClientName" runat="server" Display="Dynamic"
                                    ErrorMessage="*" InitialValue="" ForeColor="Red" Font-Bold="true" ControlToValidate="RadTextBox_AdhocClientName" ValidationGroup="Dispatch">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px">Address 1:</td>
                            <td colspan="4">
                                <telerik:RadTextBox ID="RadTextBox_AdhocClientAddressLine1" runat="server" MaxLength="100" Visible="false"
                                    Width="100%" OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True" CausesValidation="false">
                                </telerik:RadTextBox>
                            </td>
                            <td style="padding-left: 2px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadTextBox_AdhocClientAddressLine1" runat="server" ValidationGroup="Dispatch"
                                    ErrorMessage="*" InitialValue="" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadTextBox_AdhocClientAddressLine1">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px">Address 2:</td>
                            <td colspan="4">
                                <telerik:RadTextBox ID="RadTextBox_AdhocClientAddressLine2" runat="server" MaxLength="100" Visible="false"
                                    Width="100%" OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True">
                                </telerik:RadTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px">City:</td>
                            <td>
                                <telerik:RadTextBox ID="RadTextBox_AdhocClientCity" runat="server" MaxLength="50" Visible="false" Width="100px"
                                    OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True" CausesValidation="false">
                                </telerik:RadTextBox>
                            </td>
                            <td style="padding-left: 2px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadTextBox_AdhocClientCity" runat="server" ErrorMessage="*" InitialValue=""
                                    ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadTextBox_AdhocClientCity" ValidationGroup="Dispatch">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td style="text-align: right; padding-right: 5px;" >State:</td>
                            <td>
                                <telerik:RadTextBox ID="RadTextBox_AdhocClientState" runat="server" MaxLength="10" Visible="false" Width="100%"
                                    OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True" CausesValidation="false">
                                </telerik:RadTextBox>
                            </td>
                            <td style="padding-left: 2px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadTextBox_AdhocClientState" runat="server" ErrorMessage="*" InitialValue=""
                                    ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadTextBox_AdhocClientState" ValidationGroup="Dispatch">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
							<td style="text-align: right; padding-right: 5px;">Zip:</td>
                            <td>
								<telerik:RadMaskedTextBox ID="RadMaskedTextBox_AdhocClientZip" runat="server" Mask="#####-####" Visible="false"
									Width="70px" OnTextChanged="RadTextBox_TextChanged" AutoPostBack="True" CausesValidation="false" >
								</telerik:RadMaskedTextBox>
							</td>
							<td style="padding-left: 2px">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadMaskedTextBox_AdhocClientZip" runat="server" ErrorMessage="*" InitialValue=""
									ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadMaskedTextBox_AdhocClientZip" ValidationGroup="Dispatch">
								</asp:RequiredFieldValidator>
							</td>
                            <td style="text-align: right; padding-right: 5px;">Time Zone:</td>
                            <td>
                                <telerik:RadTextBox ID="RadTextBox_AdhocTimezone" runat="server" MaxLength="4" Width="100%" AutoPostBack="true" CausesValidation="false"
									OnTextChanged="RadTextBox_TextChanged">
                                </telerik:RadTextBox>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </td>

        <td style="vertical-align: top; padding-top: 5px; padding-left: 5px;">
            <table style="width: 100%" border="0">
                <tr>
                    <td class='rightAlign' style="width:90px;">Drop Trailer</td>
					<td class="nospacing">
                         <table class="nospacing">
                            <tr>
                                <td class="nospacing">
                                    <table class="nospacing">
                                        <tr>
                                            <td class="nospacing">
											   <telerik:RadDatePicker ID="RadDatePicker_DropStartDate" runat="server" Width="99px" Culture="en-US" AutoPostBack="True" 
													OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
													<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
													<DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
														<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
														<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
														<FocusedStyle Resize="None"></FocusedStyle>
														<DisabledStyle Resize="None"></DisabledStyle>
														<InvalidStyle Resize="None"></InvalidStyle>
														<HoveredStyle Resize="None"></HoveredStyle>
														<EnabledStyle Resize="None"></EnabledStyle>
													</DateInput>
													<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
												</telerik:RadDatePicker>
						                    </td>
											<td>
												<telerik:RadTimePicker ID="RadTimePicker_DropStartTime" runat="server" Width="70px" Culture="en-US"
													AutoPostBack="True" OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
													<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
													<DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
													<TimeView TimeFormat="HH:mm"></TimeView>
													<TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
													<DateInput Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
														<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
														<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
														<FocusedStyle Resize="None"></FocusedStyle>
														<DisabledStyle Resize="None"></DisabledStyle>
														<InvalidStyle Resize="None"></InvalidStyle>
														<HoveredStyle Resize="None"></HoveredStyle>
														<EnabledStyle Resize="None"></EnabledStyle>
													</DateInput>
												</telerik:RadTimePicker>
											</td>
											<td class="nospacing" style="padding-left: 2px">
												<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadDateTimePicker_DropPickStartDate" runat="server" ValidationGroup="Dispatch"
													ErrorMessage="*" InitialValue="" ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadDatePicker_DropStartDate">
												</asp:RequiredFieldValidator>
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class='rightAlign' style="width:90px;">Through</td>
                    <td style="width:180px;">
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
                                    <table class="nospacing">
                                        <tr>
											<td class="nospacing" style="padding-top: 3px">
												<telerik:RadDatePicker ID="RadDatePicker_ThroughDate" runat="server" Width="99px" AutoPostBack="True"
													OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
													<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
													<DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
														<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
														<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
														<FocusedStyle Resize="None"></FocusedStyle>
														<DisabledStyle Resize="None"></DisabledStyle>
														<InvalidStyle Resize="None"></InvalidStyle>
														<HoveredStyle Resize="None"></HoveredStyle>
														<EnabledStyle Resize="None"></EnabledStyle>
													</DateInput>
													<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
												</telerik:RadDatePicker>
											</td>
											<td class="nospacing" style="padding-top: 5px">
												<telerik:RadTimePicker ID="RadTimePicker_ThroughTime" runat="server" Width="70px" AutoPostBack="True"
													OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
													<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
													<DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
													<TimeView TimeFormat="HH:mm"></TimeView>
													<TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
													<DateInput Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
														<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
														<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
														<FocusedStyle Resize="None"></FocusedStyle>
														<DisabledStyle Resize="None"></DisabledStyle>
														<InvalidStyle Resize="None"></InvalidStyle>
														<HoveredStyle Resize="None"></HoveredStyle>
														<EnabledStyle Resize="None"></EnabledStyle>
													</DateInput>
												</telerik:RadTimePicker>
											</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
					<td style="text-align:right; padding-right:5px">Truck</td>
					<td class="nospacing">
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
									<telerik:RadComboBox ID="RadComboBox_Truck1" runat="server" AutoPostBack="True" CausesValidation="False" Width="100%" DropDownAutoWidth="Enabled"
										ToolTip="Truck" Filter="Contains" AppendDataBoundItems="true" MarkFirstMatch="true"
										DataSourceID="ObjectDataSource_Trucks" DataTextField="Unit_ID" DataValueField="PunitId"
										OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" 
										OnClientKeyPressing="radComboKeyPress"
										OnClientFocus="OnClientFocusHandler">
										<Items>
											<telerik:RadComboBoxItem runat="server" Text="-Truck #1-" Value="0" />
										</Items>
									</telerik:RadComboBox>
									<telerik:RadToolTip ID="RadToolTip_RadComboBox_Truck1" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
										Text="-Truck #1-" TargetControlID="RadComboBox_Truck1" Position="TopCenter">
									</telerik:RadToolTip>
								</td>
								<td class="nospacing" style="padding-left: 2px">
									<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadComboBox_Truck1" runat="server" ErrorMessage="&nbsp;*" InitialValue="-Truck #-"
										Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Truck1" ValidationGroup="Dispatch">
									</asp:RequiredFieldValidator>
								</td>
							</tr>
						</table>
					</td>
					<td style="padding-left:10px;">
						<telerik:RadButton ID="RadButton_Notes" runat="server" CssClass="RadButtonGreen" Text="Notes" Width="100%" OnClientClicked="OpenLegNotes" CausesValidation="false"></telerik:RadButton>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 3px" class='rightAlign'>LEG Scheduled</td>
                    <td>
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
                                    <telerik:RadDatePicker ID="RadDatePicker_StartDate" runat="server" Width="99px" Culture="en-US" AutoPostBack="True" 
										OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                        <DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                            <FocusedStyle Resize="None"></FocusedStyle>
                                            <DisabledStyle Resize="None"></DisabledStyle>
                                            <InvalidStyle Resize="None"></InvalidStyle>
                                            <HoveredStyle Resize="None"></HoveredStyle>
                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>
                                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                    </telerik:RadDatePicker>
                                </td>
                                <td class="nospacing">
                                    <telerik:RadTimePicker ID="RadTimePicker_StartTime" runat="server" Width="70px" Culture="en-US" AutoPostBack="True" 
										OnSelectedDateChanged="RadTimePicker_SelectedDateChanged">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                        <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                        <TimeView TimeFormat="HH:mm"></TimeView>
                                        <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
                                        <DateInput Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                            <FocusedStyle Resize="None"></FocusedStyle>
                                            <DisabledStyle Resize="None"></DisabledStyle>
                                            <InvalidStyle Resize="None"></InvalidStyle>
                                            <HoveredStyle Resize="None"></HoveredStyle>
                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>
                                    </telerik:RadTimePicker>
								</td>
 								<td class="nospacing" style="padding-left: 2px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadDateTimePicker_PickStartDate" runat="server" ErrorMessage="*" InitialValue=""
                                        ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadDatePicker_StartDate" ValidationGroup="Dispatch">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
					<td class='rightAlign' style="width:80px;">Appt/FCFS</td>
                    <td>
                        <table class="nospacing" style="width:80px;">
                            <tr>
                                <td class="nospacing">
									<telerik:RadDropDownList ID="RadDropDownList_ApptOrFCFS" runat="server" Width="100%" AutoPostBack="True" ValidationGroup="Dispatch"
										DefaultMessage="-Appt/FCFS-" DataSourceID="ObjectDataSource_ApptType" DataTextField="ApptTypeNm" DataValueField="LoadApptTypeId"
										OnSelectedIndexChanged="RadDropDownList_ApptOrFCFS_SelectedIndexChanged">
									</telerik:RadDropDownList>
								</td>
								<td class="nospacing">
									<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadDropDownList_ApptOrFCFS" runat="server" ValidationGroup="Dispatch"
										ErrorMessage="*" InitialValue="" ForeColor="Red" Font-Bold="true" Display="Dynamic" ControlToValidate="RadDropDownList_ApptOrFCFS" >
									</asp:RequiredFieldValidator>
								</td>
							</tr>
						</table>
                    </td>
					<td style="text-align: right; padding-right: 5px; width:60px;">Driver 1</td>
                    <td class="nospacing" style="width:120px;">
                         <table class="nospacing">
                            <tr>
                                <td class="nospacing">
								   <telerik:RadComboBox ID="RadComboBox_Driver1" runat="server" AutoPostBack="True" Width="100%" DropDownAutoWidth="Enabled" CausesValidation="false"
										DataSourceID="ObjectDataSource_Driver1" DataTextField="DriverName" DataValueField="PersonId" Filter="Contains" 
										AppendDataBoundItems="True" ValidationGroup="Dispatch" MarkFirstMatch="true" HighlightTemplatedItems="True"
										OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
										OnClientKeyPressing="radComboKeyPress"
										OnClientFocus="OnClientFocusHandler">
										<Items>
											<telerik:RadComboBoxItem runat="server" Text="-Driver #1-" Value="0" />
										</Items>
									</telerik:RadComboBox>
									<telerik:RadToolTip ID="RadToolTip_RadComboBox_Driver1" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
										Text="Driver 1 (OTR, Lease Operator, Owner Operator)" TargetControlID="RadComboBox_Driver1" Position="TopCenter">
									</telerik:RadToolTip>
								</td>
 								<td class="nospacing" style="padding-left: 2px">
									<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadComboBox_Driver1" runat="server" ErrorMessage="&nbsp;*" InitialValue="-Driver #1-" 
										Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Driver1" ValidationGroup="Dispatch">
									</asp:RequiredFieldValidator>
									<asp:CustomValidator ID="CustomValidator_Driver1" runat="server" ErrorMessage="Not Unique" ValidationGroup="Dispatch" ControlToValidate="RadComboBox_Driver1" 
										ForeColor="Red" Font-Bold="true" Display="Dynamic" EnableClientScript="false" Enabled="false" style="padding-left: 5px" 
										OnServerValidate="CustomValidator_Drivers_ServerValidate">
									</asp:CustomValidator>
								</td>
							</tr>
						</table>
                    </td>
					<td style="padding-left:10px;">
						<telerik:RadButton ID="RadButton_DispatchLEG" runat="server" Text="Dispatch" ValidationGroup="Dispatch"
							OnClick="RadButton_DispatchLEG_Click" OnClientClicking="RadButton_DispatchLEG_Clicking" Width="100%">
						</telerik:RadButton>
					</td>
				</tr>
				<tr>
					<td class='rightAlign'>LEG Arrival</td>
                    <td class="nospacing" style="width:210px;">
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
                                    <telerik:RadDatePicker ID="RadDatePicker_ArrivalDate" runat="server" Width="99px" Culture="en-US" AutoPostBack="True" 
										OnSelectedDateChanged="RadDatePicker_ArrivalDate_SelectedDateChanged">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                        <DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                            <FocusedStyle Resize="None"></FocusedStyle>
                                            <DisabledStyle Resize="None"></DisabledStyle>
                                            <InvalidStyle Resize="None"></InvalidStyle>
                                            <HoveredStyle Resize="None"></HoveredStyle>
                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>
                                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                    </telerik:RadDatePicker>
                                </td>
                                <td class="nospacing">
                                    <telerik:RadTimePicker ID="RadTimePicker_ArrivalTime" runat="server" Width="70px" Culture="en-US" AutoPostBack="True" 
										OnSelectedDateChanged="RadTimePicker_ArrivalTime_SelectedDateChanged">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                        <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
										<%-- <TimeView TimeView-TimeFormat="HH:mm" CellSpacing="-1"></TimeView>--%>
                                        <TimeView TimeFormat="HH:mm"></TimeView>
                                        <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
                                        <%--<DateInput Width="" DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="64px" AutoPostBack="True">--%>
										<DateInput Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" AutoPostBack="True" IncrementSettings-InterceptMouseWheel="false">
                                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                            <FocusedStyle Resize="None"></FocusedStyle>
                                            <DisabledStyle Resize="None"></DisabledStyle>
                                            <InvalidStyle Resize="None"></InvalidStyle>
                                            <HoveredStyle Resize="None"></HoveredStyle>
                                            <EnabledStyle Resize="None"></EnabledStyle>
                                        </DateInput>
                                    </telerik:RadTimePicker>
								</td>
								<%--<td class="nospacing" style="padding-left: 2px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_RadDatePicker_ArrivalDate" runat="server" Display="Dynamic"
                                        ErrorMessage="*" InitialValue="" Font-Bold="true" ForeColor="Red" ControlToValidate="RadDatePicker_ArrivalDate" ValidationGroup="Dispatch">
                                    </asp:RequiredFieldValidator>
                                </td>--%>
                            </tr>
                        </table>
                    </td>
					<td colspan="2"></td>
					<td style="text-align: right; padding-right: 5px">Driver 2</td>
                    <td>
                        <telerik:RadComboBox ID="RadComboBox_Driver2" runat="server" HighlightTemplatedItems="true" AutoPostBack="True" Filter="Contains" Width="100%" DropDownAutoWidth="Enabled"
                            DataSourceID="ObjectDataSource_Driver2" DataTextField="DriverName" DataValueField="PersonId" AppendDataBoundItems="true" MarkFirstMatch="true"
                            OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
                            OnClientKeyPressing="radComboKeyPress"
                            OnClientFocus="OnClientFocusHandler">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="-Driver #2-" Value="0" />
                            </Items>
                        </telerik:RadComboBox>
                        <telerik:RadToolTip ID="RadToolTip_RadComboBox_Driver2" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
                            Text="Driver 2 (OTR, Lease Operator, Owner Operator)" TargetControlID="RadComboBox_Driver2" Position="TopCenter">
                        </telerik:RadToolTip>
                    </td>
					<td style="padding-left:10px;">
						<telerik:RadButton ID="RadButton_Charges" runat="server" Text="Charges" Width="100%" OnClick="RadButton_Charges_Click"></telerik:RadButton>
					</td>
				</tr>
				<tr>
					<td colspan="4"></td>
					<td style="text-align:right; padding-right:5px">Dvr Man</td>
					<td class="nospacing">
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
								    <telerik:RadComboBox ID="RadComboBox_FleetManager" runat="server" DataSourceID="ObjectDataSource_FleetManager" HighlightTemplatedItems="true"
									    OnClientKeyPressing="radComboKeyPress" TabIndex="17" AutoPostBack="True" CausesValidation="false" Filter="Contains" 
									    DataTextField="Name" DataValueField="DispatchFleetManagerId" MarkFirstMatch="true" AppendDataBoundItems="true"
									    OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" OnClientFocus="OnClientFocusHandler">
									    <Items>
										    <telerik:RadComboBoxItem runat="server" Text="-Driver Manager-" Value="0" />
									    </Items>
								    </telerik:RadComboBox>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td style="text-align: right; padding-right: 5px">Empty Miles</td>
					<td style="padding-left: 5px" >
						<telerik:RadNumericTextBox ID="RadNumericTextBox_EmptyMiles" runat="server" Culture="en-US" AutoPostBack="True" Width="120px"
							DbValueFactor="1" MaxValue="10000" MinValue="0" OnTextChanged="RadNumericTextBox_TextChanged">
							<NegativeStyle Resize="None"></NegativeStyle>
							<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
							<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
							<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
							<FocusedStyle Resize="None"></FocusedStyle>
							<DisabledStyle Resize="None"></DisabledStyle>
							<InvalidStyle Resize="None"></InvalidStyle>
							<HoveredStyle Resize="None"></HoveredStyle>
							<EnabledStyle Resize="None"></EnabledStyle>
						</telerik:RadNumericTextBox>
					</td>
					<td style="text-align:right; padding-right:5px">Trailer 1</td>
					<td class="nospacing">
                        <table class="nospacing">
                            <tr>
                                <td class="nospacing">
									<telerik:RadComboBox ID="RadComboBox_Trailer1" runat="server" AutoPostBack="True" Width="100%" DropDownAutoWidth="Enabled" Filter="Contains" 
										DataSourceID="ObjectDataSource_Trailer1" DataTextField="Trailer_ID" DataValueField="TrailerId" 
										AppendDataBoundItems="false" CausesValidation="False" MarkFirstMatch="true" OnDataBound="RadComboBox_Trailer1_DataBound"
										OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
										OnClientKeyPressing="radComboKeyPress"
										OnClientFocus="OnClientFocusHandler">
										<Items>
											<telerik:RadComboBoxItem runat="server" Text="-Trailer #1-" Value="0" />
										</Items>
									</telerik:RadComboBox>
									<telerik:RadToolTip ID="RadToolTip_RadComboBox_Trailer1" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
										Text="Trailer 1" TargetControlID="RadComboBox_Trailer1" Position="TopCenter">
									</telerik:RadToolTip>
								</td>
								<td class="nospacing" style="padding-left: 2px">
									<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadComboBox_Trailer1" runat="server" ErrorMessage="&nbsp;*" InitialValue="-Trailer #1-"
										Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Trailer1" ValidationGroup="Dispatch">
									</asp:RequiredFieldValidator>
									<asp:CustomValidator ID="CustomValidator_Trailer1" runat="server" ErrorMessage="Not Unique" ValidationGroup="Dispatch" Enabled="false" 
										Style="padding-left: 5px" ControlToValidate="RadComboBox_Trailer1" ForeColor="Red" Font-Bold="true" Display="Dynamic"
										OnServerValidate="CustomValidator_Trailers_ServerValidate" EnableClientScript="false">
									</asp:CustomValidator>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td style="text-align:right; padding-right:5px">Loaded Miles</td>
					<td style="padding-left: 5px">
						<telerik:RadNumericTextBox ID="RadNumericTextBox_PaidLoaded" runat="server" Culture="en-US" AutoPostBack="True" Width="120px"
							DbValueFactor="1" MaxValue="10000" MinValue="0" OnTextChanged="RadNumericTextBox_TextChanged">
							<NegativeStyle Resize="None"></NegativeStyle>
							<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
							<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
							<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
							<FocusedStyle Resize="None"></FocusedStyle>
							<DisabledStyle Resize="None"></DisabledStyle>
							<InvalidStyle Resize="None"></InvalidStyle>
							<HoveredStyle Resize="None"></HoveredStyle>
							<EnabledStyle Resize="None"></EnabledStyle>
						</telerik:RadNumericTextBox>
					</td>
					<td style="text-align:right; padding-right:5px">Trailer 2</td>
					<td>
						<telerik:RadComboBox ID="RadComboBox_Trailer2" runat="server"  ValidationGroup="Dispatch" Filter="Contains" Width="100%" DropDownAutoWidth="Enabled"
							DataSourceID="ObjectDataSource_Trailer2" DataTextField="Trailer_ID" DataValueField="TrailerId" 
							AutoPostBack="True" AppendDataBoundItems="false" CausesValidation="False" MarkFirstMatch="true"
							OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" OnDataBound="RadComboBox_Trailer2_DataBound"
							OnClientKeyPressing="radComboKeyPress"
							OnClientFocus="OnClientFocusHandler">
							<Items>
								<telerik:RadComboBoxItem runat="server" Text="-Trailer #2-" Value="0" />
							</Items>
						</telerik:RadComboBox>
						<telerik:RadToolTip ID="RadToolTip_RadComboBox_Trailer2" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
							Text="Trailer 2" TargetControlID="RadComboBox_Trailer2" Position="TopCenter">
						</telerik:RadToolTip>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<asp:ObjectDataSource ID="ObjectDataSource_Customer" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.ClientLEGTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_ApptType" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.LoadApptType_LEGTableAdapter"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Driver1" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.DriverTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_Driver1PersonId" Name="AssignedPersonId" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Driver2" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.DriverTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_Driver2PersonId" Name="AssignedPersonId" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Trucks" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.PunitTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_PunitId" Name="InUsePunitId" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Trailer1" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByThirdPartyFilter"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TrailerTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_TrailerId1" Name="InUseTrailerId" PropertyName="Value" Type="Int16" />
          <asp:ControlParameter ControlID="HiddenField_TrailerShowThirdParty" Name="ShowThirdParty" PropertyName="Value" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Trailer2" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByThirdPartyFilter"
    TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TrailerTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_TrailerId2" Name="InUseTrailerId" PropertyName="Value" Type="Int16" />
          <asp:ControlParameter ControlID="HiddenField_TrailerShowThirdParty" Name="ShowThirdParty" PropertyName="Value" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_FleetManager" runat="server" SelectMethod="GetData"
    TypeName="RedbonePlatform.Datasets.dsPersonEdit_DriverInfoTableAdapters.DispatchFleetManagerTableAdapter">
</asp:ObjectDataSource>

<telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
    <script type="text/javascript">
        //function CloseMe() {
        //    window.close();
        //}
    </script>
</telerik:RadCodeBlock>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">

		function OpenLegNotes() {
			var loadId = HiddenField_LoadId.value;
			if (loadId != "") {
				window.radopen("StopNotes.aspx?type=stop&loadid=" + loadId, "RadWindow_StopNotes");
			}
			return false;
		}

        function RadButton_DispatchLEG_Clicking(sender, args) {
            //args.set_cancel(!Page_ClientValidate("Dispatch"));
            args.set_cancel(!Page_ClientValidate(""));
        }

        function RadButton_Charges_Clicking(sender, args) {
            //args.set_cancel(!Page_ClientValidate("Dispatch"));
            // args.set_cancel(false);
        }

        function openDispatchSheetReport(LoadId, LoadStopId) {
            GetRadWindow().BrowserWindow.openDispatchSheetReport(LoadId, LoadStopId);
        }


        //Telerik.Web.UI.Editor.CommandList["Save"] = function (commandName, editor, oTool) {
        //    var noth;
        //}

        function openCharges(LoadId, LoadStopId) {
            <%--var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;
            var LoadStopId = document.getElementById('<%= HiddenField_LoadStopId.ClientID %>').value;--%>
            // alert('LoadStopId=' + LoadStopId);

            //alert(LoadId);
            var oWnd = radopen("DispatchSheet_AccCharges.aspx?LoadId=" + LoadId + "&LoadStopId=" + LoadStopId, "RadWindow_Charges");

            oWnd.setSize(1050, 300); // width, height
            oWnd.set_minWidth(800);
            oWnd.set_minHeight(300);
            oWnd.set_destroyOnClose(true);
            oWnd.set_visibleStatusbar(false);
            oWnd.set_iconUrl("../../images/16x16/truck-icon_16.png");
            oWnd.set_title("Charges");
            oWnd.set_behaviors(
                Telerik.Web.UI.WindowBehaviors.Move +
                Telerik.Web.UI.WindowBehaviors.Close);
            oWnd.add_close(RadWindow_accCharges_OnClientClose);
            oWnd.center();
            oWnd.set_modal(true);
        }

	</script>
    
</telerik:RadScriptBlock>
