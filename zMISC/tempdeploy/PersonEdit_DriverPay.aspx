<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonEdit_DriverPay.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.PersonEdit_DriverPay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    </style>
    <link href="../../Skins/MyCustomSkinLite/Button.MyCustomSkin.css" rel="stylesheet" />
    <link href="../../Styles/common.css" rel="stylesheet" />
</head>
<body style="margin: 0px;">
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField_PersonId" runat="server" />
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid_AdditionsDeductions">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_AdditionsDeductions" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid_AdditionsDeductions" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"
            InitialDelayTime="500" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadSkinManager ID="RadSkinManager1" runat="server">
        </telerik:RadSkinManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
            <Windows>
                <telerik:RadWindow ID="RadWindow_AdditionsDeductionsEditDriver" runat="server" Title="Editing.." Height="490"
                    Width="500px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" 
                    Modal="true" Behaviors="Close,Move">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <fieldset>
                <legend style="font-size: small; font-weight: bold; padding-top: 3px">Additions and Deductions</legend>
                <telerik:RadGrid ID="RadGrid_AdditionsDeductions" runat="server" Width="100%"
                    DataSourceID="ObjectDataSource_AdditionsDeductions" 
                    AllowAutomaticDeletes="True" AllowSorting="True" AllowPaging="True"
                    OnItemCommand="RadGrid_AllGrids_ItemCommand" CellSpacing="-1"
                    OnItemCreated="RadGrid_AdditionsDeductions_ItemCreated" 
                    AllowFilteringByColumn="True" 
                    OnItemDataBound="RadGrid_AdditionsDeductions_ItemDataBound">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                        <Resizing AllowColumnResize="false" />
                        <ClientEvents OnRowDblClick="RadGrid_AdditionsDeductions_OnRowDblClick" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" PageSize="50" DataKeyNames="DriverPayId,LoadStatusTypeId" ClientDataKeyNames="DriverPayId,LoadStatusTypeId"
                        DataSourceID="ObjectDataSource_AdditionsDeductions" CommandItemDisplay="Top" EditMode="PopUp">
                                <SortExpressions>
                                          <telerik:GridSortExpression FieldName="PayDate" SortOrder="Descending" />
                                </SortExpressions>
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <CommandItemTemplate>
                            <table style="position: relative; top: 4px; width: 100%">
                                <tr>
                                    <td style="text-align: left; width: 140px; min-width: 140px; padding-bottom: 10px">
                                        <a href="#" onclick="return ShowInsertForm();"><u>New Addition / Deduction</u></a>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:LinkButton ID="LinkButton_RefreshAddress" runat="server" CommandName="RebindGrid" Font-Underline="true">Refresh</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </CommandItemTemplate>
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="False" UniqueName="TemplateEditColumn"
                                FilterControlAltText="Filter TemplateColumn column">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink_Edit" runat="server">Edit</asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Width="40px"></HeaderStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridButtonColumn ConfirmText="Are you sure you want to delete this Addition/Deduction?" Visible="false"
                                FooterStyle-HorizontalAlign="Right" 
                                CommandName="Delete" Text="Delete" ConfirmDialogType="RadWindow" ConfirmTitle="Delete Addition/Deduction?"
                                ConfirmDialogHeight="150px" UniqueName="GridButtonColumn_Delete">
                                <FooterStyle HorizontalAlign="Right"></FooterStyle>
                                <HeaderStyle Width="75px" />
                            </telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="DrvierPayId" DataType="System.Int32" FilterControlAltText="Filter DrvierPayId column"
                                HeaderText="Id" SortExpression="DrvierPayId" UniqueName="DrvierPayId" ColumnEditorID="GridNumericColumnEditor_Quantity" ReadOnly="true"
                                AutoPostBackOnFilter="true" FilterControlWidth="40px">
                                <HeaderStyle Width="75px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayDate" DataType="System.DateTime" FilterControlAltText="Filter PayDate column" HeaderText="Pay Date"
                                SortExpression="PayDate" UniqueName="PayDate" DataFormatString="{0:d}" AutoPostBackOnFilter="true" FilterControlWidth="70%">
                                <HeaderStyle Width="110px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TripNumber" DataType="System.Int32" FilterControlAltText="Filter TripNumber column"
                                HeaderText="Trip Number" SortExpression="TripNumber" UniqueName="TripNumber" AutoPostBackOnFilter="true" FilterControlWidth="70%">
                                <HeaderStyle Width="100px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayCode" FilterControlAltText="Filter PayCode column" HeaderText="Pay Code"
                                AutoPostBackOnFilter="true" FilterControlWidth="70%" SortExpression="PayCode" UniqueName="PayCode">
                                <HeaderStyle Width="200px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayCodeDescription" FilterControlAltText="Filter PayCodeDescription column"
                                HeaderText="Pay Description" ReadOnly="true" AutoPostBackOnFilter="true" FilterControlWidth="70%"
                                SortExpression="PayCodeDescription" UniqueName="PayCodeDescription" ColumnEditorID="GridTextBoxColumnEditor_Generic" MaxLength="255">
                                <HeaderStyle Width="300px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayQuantity" DataType="System.Decimal" FilterControlAltText="Filter PayQuantity column"
                                HeaderText="Pay Qty" SortExpression="PayQuantity" UniqueName="PayQuantity" AutoPostBackOnFilter="true" FilterControlWidth="60%">
                                <HeaderStyle Width="75px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayRate" DataType="System.Decimal" FilterControlAltText="Filter PayRate column"
                                HeaderText="Pay Rate" SortExpression="PayRate" UniqueName="PayRate" AutoPostBackOnFilter="true" FilterControlWidth="60%">
                                <HeaderStyle Width="75px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalPay" DataType="System.Decimal" FilterControlAltText="Filter TotalPay column"
                                HeaderText="Total Pay" SortExpression="TotalPay" UniqueName="TotalPay" AutoPostBackOnFilter="true" FilterControlWidth="60%">
                                <HeaderStyle Width="75px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PayNotes" FilterControlAltText="Filter PayNotes column" HeaderText="Pay Notes" SortExpression="PayNotes"
                                AutoPostBackOnFilter="true" FilterControlWidth="70%" UniqueName="PayNotes" ColumnEditorID="GridTextBoxColumnEditor_Generic">
                                <HeaderStyle Width="300px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UpdatedBy" FilterControlAltText="Filter UpdatedBy column"
                                HeaderText="Updated By" ReadOnly="True" SortExpression="UpdatedBy" UniqueName="UpdatedBy" AutoPostBackOnFilter="true" FilterControlWidth="70%">
                                <HeaderStyle Width="150px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UpdatedDate" DataType="System.DateTime" FilterControlAltText="Filter UpdatedDate column" AutoPostBackOnFilter="true" FilterControlWidth="70%"
                                HeaderText="Updated Date" SortExpression="UpdatedDate" UniqueName="UpdatedDate" DataFormatString="{0:d}">
                                <HeaderStyle Width="110px" />
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
        <asp:ObjectDataSource ID="ObjectDataSource_AdditionsDeductions" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByPersonId" TypeName="RedbonePlatform.Datasets.dsDriverPayTableAdapters.DriverPay_AdditionsAndDeductionsViewTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="PersonId" QueryStringField="PersonId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
            <script type="text/javascript">
                window.addEventListener('resize', grid_resize);

                function pageLoad() {
                    // this is to size the MultiPage on the parent page so that this content will then size to it and not be collapsed
                    window.parent.MultiPage_resize();
                    grid_resize();
                }

                function GetRadWindow() {
                    var oWindow = null; if (window.radWindow)
                        oWindow = window.radWindow; else if (window.frameElement.radWindow)
                        oWindow = window.frameElement.radWindow; return oWindow;
                }

                function RadControl_OnValueChanged(sender, args) {
                    // Inform parent RadWindow of a change in data
                    // var senderID = sender._clientStateFieldID;

                    // Update PersonEdit.aspx that this radwindow has an unsaved change. 
                    window.parent.UpdateHiddenField_PersonEdit_Personal_UnsavedData("UnsavedData");
                }

                function RadGrid_AdditionsDeductions_OnRowDblClick(sender, eventArgs) {

                    //if (eventArgs.getDataKeyValue("LoadStatusTypeId") == 8) {
                    //    var oAlert = radalert("The Trip is in Billed Status and this transaction cannot be edited!", 450, 100, "Trip is in Billed Status");
                    //    return;
                    //}

                    var PersonId = document.getElementById('<%= HiddenField_PersonId.ClientID%>').value;
                    window.radopen("PersonEdit_AdditionsDeductions.aspx?DriverPayId=" + eventArgs.getDataKeyValue("DriverPayId") + "&PersonId=" + PersonId, "RadWindow_AdditionsDeductionsEditDriver");
                }

                function grid_resize() {
                    try {
                        var grid = $find('<%=RadGrid_AdditionsDeductions.ClientID %>');
                        grid.get_element().style.height = (window.innerHeight - 45) + "px";
                        grid.get_element().style.width = (window.innerWidth - 35) + "px";
                        grid.repaint();
                    }
                    catch (e) {
                        // Do nothing... window may be minimized and grid unavailable when double clicked to restore
                    }
                }

                function openAdditionsDeductionsEdit(DriverPayId, rowIndex, PersonId) {
                    var grid = $find("<%= RadGrid_AdditionsDeductions.ClientID %>");

                    var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                    grid.get_masterTableView().selectItem(rowControl, true);

                    window.radopen("PersonEdit_AdditionsDeductions.aspx?DriverPayId=" + DriverPayId + "&PersonId=" + PersonId, "RadWindow_AdditionsDeductionsEditDriver");
                    return false;
                }

                function ShowInsertForm() {
                    var PersonId = document.getElementById('<%= HiddenField_PersonId.ClientID %>').value;
                    var oWnd = window.radopen("PersonEdit_AdditionsDeductions.aspx?DriverPayId=0&PersonId=" + PersonId, "RadWindow_AdditionsDeductionsEditDriver",null,);
                    return false;
                }

                function refreshGridAdditionsAndDeductions(arg) {
                    //alert("refreshGrid in VendorEdit_VendorPay.aspx");
                    if (!arg) {
                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAdditionsAndDeductions");
                    }
                    else {
                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigateAdditionsAndDeductions");
                    }
                }

            </script>
        </telerik:RadScriptBlock>
    </form>
</body>
</html>
