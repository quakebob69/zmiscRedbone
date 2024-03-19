<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayrollOTR.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.PayrollOTR" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
</script>
    </telerik:RadScriptBlock>
    <style>
        html {
            /*added to prevent scroll bars in radwindow - for slight css differences between different browsers, needed this*/
            overflow: hidden;
        }

        .PPDivOuter {
            display: flex;
            margin: 0px;
            padding: 0px;
        }

        .PPDivInner {
            flex: 1;
            margin: 0px;
            padding: 0px;
        }

            .PPDivInner ul {
                padding-left: 30px;
                padding-right: 0px;
            }

            .PPDivInner li {
                margin-right: 25px;
                margin-bottom: 10px;
                list-style-type: none;
            }

        .PPDivInnerDates {
            flex: 23;
            margin: 0px;
            padding: 0px;
        }

        .PPDivInnerPay {
            flex: 25;
            margin: 0px;
            padding: 0px;
        }

        .PPDivInnerLeave {
            flex: 28;
            margin: 0px;
            padding: 0px;
        }

        .PPDivInnerVariable {
            flex: 25;
            margin: 0px;
            padding: 0px;
        }

        .prOTRTitle {
            font-weight: bold;
            font-size: 2.0em;
            padding-left: 10px;
        }

        .prOTRActionsDataRefresh {
            padding: 20px 0px 10px 20px;
        }

        #radBtnOTRPR_RefreshAllPanel {
            display: inline !important;
        }

        #radBtnOTRPR_RefreshFromDriverPayPanel {
            display: inline !important;
        }

        #RadLabel111Panel {
            display: inline !important;
        }

        #radBtnOTRPR_RefreshFromLoadPanel {
            display: inline !important;
        }

        .prOTRLockData {
            float: right;
        }

        .prOTRActionsDataRefreshLast {
            padding: 20px 0px 20px 20px;
        }

        .containerValidateCenter {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #radBtnOTRPR_FailValidation_input {
            color: #FFBCD9;
        }

        .PPTopRightBtnReset {
            float: right;
            margin: 10px 15px 15px 15px;
        }

        #radBtnOTRPR_Reset_input {
            color: #bbb;
        }

        .PPTopRightBtnQB {
            float: right;
            margin: 5px 15px 5px 15px;
        }

            .PPTopRightBtnQB span {
                padding: 10px;
            }
    </style>
    <link href="../../Styles/common.css" rel="stylesheet" />
</head>
<body style="margin: 0px;">
    <form id="form1" runat="server" style="margin: 0px">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>





                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshAll">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshAll" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshFromDriverPay">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromDriverPay" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadLabelqwerty" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadLabel111" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshFromLoad">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromLoad" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshFromDriverPay">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="Panel2" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>

            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default" Modal="true">
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadSkinManager ID="RadSkinManager1" runat="server"></telerik:RadSkinManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
            <Windows>
                <telerik:RadWindow ID="RadWindow_PayrollOTRDataRefresh" runat="server" Title="Editing..." Height="490"
                    Width="500px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                    Modal="true">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

        <div id="divMain" style="width: 100%">

            <div class="PPDivOuter">
                <div style="float: left; margin: 30px 0px 0px 15px;">
                    <telerik:RadButton ID="radBtnOTRPR_Open" runat="server" OnClick="Open" Text="Open the Pay Period"></telerik:RadButton>
                </div>
            </div>


            <fieldset style="margin: 15px 45px 15px 45px; border: 4px solid #000;">
                <legend style="font-size: 1.2em; font-weight: bold;">Run</legend>

                <div class="PPDivOuter">
                    <div class="prOTRTitle PPDivInner">
                        <telerik:RadLabel ID="RadLabelPayrollOTRStatus" runat="server"></telerik:RadLabel>
                    </div>
                    <div class="PPDivInner">
                        <div class="PPTopRightBtnReset">
                            <telerik:RadButton ID="radBtnOTRPR_Reset" runat="server" Text="RESET THE PAY PERIOD"></telerik:RadButton>
                        </div>
                    </div>
                </div>

                <div class="PPDivOuter">

                    <div class="PPDivInner">
                        <fieldset style="border: 2px solid #111111; margin: 10px; background-color: #222 !important; background: #222 !important;">
                            <legend style="font-size: small; font-weight: bold;">STEPS</legend>
                            <telerik:RadListView ID="RadListViewSteps" runat="server" ItemPlaceholderID="PlaceHolderSteps">
                                <LayoutTemplate>
                                    <ul>
                                        <asp:PlaceHolder ID="PlaceHolderSteps" runat="server"></asp:PlaceHolder>
                                    </ul>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li class="stepslistview-item"><%# Container.DataItem %></li>
                                </ItemTemplate>
                            </telerik:RadListView>
                        </fieldset>
                    </div>
                    <div class="PPDivInner">
                        <fieldset style="border: 2px solid #111111; margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">Data</legend>
                            <div class="prOTRLockData">
                                <telerik:RadButton ID="radBtnOTRPR_LockData" Text="" runat="server" OnClick="LockDataToggle"></telerik:RadButton>
                            </div>
                            <div class="prOTRActionsDataRefresh" style="clear: both;">
                                <telerik:RadButton ID="radBtnOTRPR_RefreshAll" Text="get/refresh ALL data" runat="server" OnClientClicking="RefreshDataAll"></telerik:RadButton>
                                <div style="font-size: 1.5em; font-weight: bold; margin-top: 5px;">&nbsp;&nbsp;<telerik:RadLabel ID="RadLabel111" runat="server" />
                                    <span style="font-size: initial; font-weight: 100;">records</span></div>
                            </div>
                            <div class="prOTRActionsDataRefresh">
                                <telerik:RadButton ID="radBtnOTRPR_RefreshFromDriverPay" Text="only DRIVER PAY data" runat="server" OnClientClicking="RefreshDataDriverPayfd" OnClick="RefreshDataDriverPay"></telerik:RadButton>
                                &nbsp;&nbsp;0 records
                            </div>
                            <div class="prOTRActionsDataRefreshLast">
                                <telerik:RadButton ID="radBtnOTRPR_RefreshFromLoad" Text="only LOAD data" runat="server" OnClientClicking="RefreshDataLoads"></telerik:RadButton>
                                &nbsp;&nbsp;345 records
                            </div>
                        </fieldset>
                    </div>
                    <div class="PPDivInner">
                        <fieldset style="border: 2px solid #111111; height: 135px; margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">Validation</legend>
                            <div class="containerValidateCenter" style="margin: 20px 0px 30px 0px;">
                                <telerik:RadButton ID="radBtnOTRPR_SubmitForVal" runat="server" OnClick="SubmitForVal" Text="Submit For Validation"></telerik:RadButton>
                            </div>
                            <div class="PPDivOuter" style="margin: 20px 0px;">
                                <div class="PPDivInner containerValidateCenter">
                                    <telerik:RadButton ID="radBtnOTRPR_PassValidation" runat="server" OnClick="PassValidation" Text="Pass"></telerik:RadButton>
                                </div>
                                <div class="PPDivInner containerValidateCenter">
                                    <telerik:RadButton ID="radBtnOTRPR_FailValidation" runat="server" OnClick="FailValidation" Text="FAIL"></telerik:RadButton>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                </div>
            </fieldset>


            <fieldset style="margin: 15px 45px 15px 45px; border: 4px solid #fff;">
                <legend style="font-size: 1.2em; font-weight: bold;">Pay Period</legend>

                <div class="PPDivOuter">
                    <div class="PPDivInner prOTRTitle">
                        PP<telerik:RadLabel ID="RadLabelCode" runat="server"></telerik:RadLabel>
                    </div>
                    <div class="PPDivInner">
                        <div class="PPTopRightBtnQB">
                            <telerik:RadLinkButton ID="radBtnOTRPR_DownloadPDF" runat="server" Icon-Url="~/images/32x32/qb_round_green.png" />
                        </div>
                    </div>
                </div>

                <div class="PPDivOuter">

                    <div class="PPDivInnerDates">
                        <fieldset style="margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">Dates</legend>
                            <table style="width: 100%; padding: 10px;">
                                <tr>
                                    <td>Year</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelFY" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span>Week</span></td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelNumber" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Begin</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelBeginDate" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>End</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelEndDate" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>

                    <div class="PPDivInnerPay">
                        <fieldset style="margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">Pay</legend>
                            <table style="width: 100%; padding: 10px;">
                                <tr>
                                    <td>Earnings</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalEarningsAmount" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Other Items</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalOtherpayrollitemsAmount" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Held Amount</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalHeldAmount" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Payday</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelCheckDate" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>

                    <div class="PPDivInnerLeave">
                        <fieldset style="margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">Leave</legend>
                            <table style="width: 100%; padding: 10px;">
                                <tr>
                                    <td>UTO Days Accrued</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelUTOTotalDaysAccrual" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>UTO Total Value</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelUTOTotalDaysValue" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>

                    <div class="PPDivInnerVariable">
                        <fieldset style="margin: 10px;">
                            <legend style="font-size: small; font-weight: bold;">OTR</legend>
                            <table style="width: 100%; padding: 10px;">
                                <tr>
                                    <td>Miles</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalMiles" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Miles Value</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalMilesValue" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Driver Pay</td>
                                    <td style="text-align: right;">
                                        <telerik:RadLabel ID="RadLabelTotalDriverPayAmount" runat="server"></telerik:RadLabel>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>

                </div>
            </fieldset>

            <div style="float: left; margin: 15px 0px 15px 15px;">
                <telerik:RadButton ID="radBtnOTRPR_Finalize" runat="server" Text="Finalize the Pay Period" OnClick="Finalize" OnClientClicking="radBtnOTRPR_Finalize_Confirm"></telerik:RadButton>
            </div>

        </div>
        <asp:Button ID="Button1" runat="server" Text="Postback" OnClick="Button1_Click" />
        <asp:Panel ID="Panel1" runat="server" Width="200px">
            Panel 1
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Width="200px">
            Panel 2
        </asp:Panel>

        <telerik:RadWindow ID="modalPopup" runat="server" Width="360px" Title="asdf asdf d" Height="365px" Modal="true" OffsetElementID="main">
            <ContentTemplate>
                <div style="padding-top: 5px; width: 550px">
                    <telerik:RadLabel ID="RadLabelqwerty" runat="server" /> records retrieved
                    <telerik:RadButton ID="RadButton_Cancel" runat="server" Text="Close" OnClientClicked="closeLoadingWindow" Width="85px" Visible="true" />
                </div>
            </ContentTemplate>
        </telerik:RadWindow>

        <telerik:RadMonthYearPicker RenderMode="Lightweight" ID="RadMonthYearPicker1" runat="server" ShowPopupOnFocus="true">
            <DatePopupButton Visible="false" />
        </telerik:RadMonthYearPicker>

    </form>

    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
        <script type="text/javascript">
            function alertMe() {
                alert('Hello');
            }

            function showMontYearPopup(sender, args) {
                var picker = $find("<%= RadMonthYearPicker1.ClientID %>");
                picker.showPopup();
            }


            // resize the grid when browser is resized 
            window.addEventListener('resize', grid_resize);

            function pageLoad() {
                // This function will resize the grid columns to fit content
                //grid_resize();
            }

            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
            }

            function asdfasdf(sender, eventArgs) {
                eventArgs.set_cancel(!window.confirm("Are you sure you want to ---RESET--- blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah?"));
            }

            function RefreshDataAll(sender, eventArgs) {
                var confirmResult = window.confirm("Are you sure you ---ALL--- blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }
                var oWnd = window.radopen("PayrollOTRDataRefresh.aspx?DataSourceType=All", "RadWindow_PayrollOTRDataRefresh", null,);
            }

            function RefreshDataDriverPayfd(sender, eventArgs) {
                var modalPopupWnd = $find("<%= modalPopup.ClientID %>");
                modalPopupWnd.show();

                //var oWnd = window.radopen("PayrollOTRDataRefresh.aspx?DataSourceType=DriverPay", "RadWindow_PayrollOTRDataRefresh", null,);
            }

            function f() {
                var modalPopupWnd = $find("<%= modalPopup.ClientID %>");
                modalPopupWnd.show();

                //var oWnd = window.radopen("PayrollOTRDataRefresh.aspx?DataSourceType=DriverPay", "RadWindow_PayrollOTRDataRefresh", null,);
            }

            function asdflWindow(sender, eventArgs) {
                alert('1234');

                var manageWindow = GetRadWindowManager();
                if (manageWindow) {
                    var radWindow = manageWindow.open(null, "modalPopup");
                    if (radWindow) {
                        radWindow.set_initialBehaviors(Telerik.Web.UI.WindowBehaviors.None);
                        radWindow.set_behaviors(Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Resize);
                        radWindow.setActive(true);
                        radWindow.SetModal(true);
                        radWindow.center();
                        radWindow.set_visibleStatusbar(false);
                        radWindow.set_keepInScreenBounds(true);
                        radWindow.set_minWidth(640);
                        radWindow.set_minHeight(480);
                        radWindow.setSize(640, 480);
                        radWindow.set_destroyOnClose(true);
                        radWindow.add_close(closeMyDialog);//after closing the RadWindow, closeMyDialog will be called
                        radWindow.argument = args;//you can pass the value from parent page to RadWindow dialog as this line
                    }
                }


                //var radWindow = $find("<%= modalPopup.ClientID %>");
                //alert(radWindow);

                //radWindow.show();
            }

            function GetRadWindowManager() {
                return $find("<%=RadWindowManager1.ClientID%>");
            }

            function RefreshDataLoads(sender, eventArgs) {
                var confirmResult = window.confirm("Are you sure you ---Loads--- blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }
                var oWnd = window.radopen("PayrollOTRDataRefresh.aspx?DataSourceType=Loads", "RadWindow_PayrollOTRDataRefresh", null,);
            }

            function radBtnOTRPR_Finalize_Confirm(sender, eventArgs) {
                eventArgs.set_cancel(!window.confirm("Are you sure you want to ---FINALIZE--- blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah?"));
            }

            // Resize the grid when the window's height is changed otherwise the grid collapses when height is set at 100% (or not set)
            function grid_resize() {
                try {
                    <%--var grid = $find('<%=RadGrid_FuelTransactions.ClientID %>');
                    grid.get_element().style.height = (window.innerHeight - 205) + "px";
                    grid.get_element().style.width = (window.innerWidth - 45) + "px";

                    grid.repaint();--%>
                }
                catch (e) {
                    // Do nothing... window may be minimized and grid unavailable when double clicked to restore
                }
            }

            function closeLoadingWindow() {
                var radWindow = $find('<%=modalPopup.ClientID %>');
                radWindow.close();
            }
        </script>
    </telerik:RadScriptBlock>

</body>
</html>
