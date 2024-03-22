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

        .RadAjaxPanel {
            display: inline !important;
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
                        <telerik:AjaxUpdatedControl ControlID="RadLabeldataRefreshPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshFromDriverPay">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromDriverPay" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadLabeldataRefreshPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_RefreshFromLoad">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromLoad" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadLabeldataRefreshPopup" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_LockData">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshAll" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromDriverPay" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_RefreshFromLoad" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_SubmitForVal" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_DownloadPDF" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_SubmitForVal">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_SubmitForVal" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_PassValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_FailValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_FailValidation">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_FailValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_PassValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_SubmitForVal" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="radBtnOTRPR_PassValidation">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_PassValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_FailValidation" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_SubmitForVal" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_LockData" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="radBtnOTRPR_Finalize" LoadingPanelID="RadAjaxLoadingPanel1" />
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
                            <telerik:RadButton ID="radBtnOTRPR_Reset" runat="server" Text="RESET THE PAY PERIOD" OnClick="Reset" OnClientClicking="radBtnOTRPR_Reset_Confirm"></telerik:RadButton>
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
                                <telerik:RadButton ID="radBtnOTRPR_RefreshAll" Text="get/refresh ALL data" runat="server" OnClientClicking="RefreshDataAll" OnClick="RefreshAllData" />
                                <div style="font-size: 1.5em; font-weight: bold; margin-top: 5px;">
                                    &nbsp;&nbsp;<telerik:RadLabel ID="RadLabeRefreshDataAll" runat="server" />
                                    <span style="font-size: initial; font-weight: 100;">RECORDS LOADED</span>
                                </div>
                            </div>
                            <div class="prOTRActionsDataRefresh">
                                <telerik:RadButton ID="radBtnOTRPR_RefreshFromDriverPay" Text="only DRIVER PAY data" runat="server" OnClientClicking="RefreshDataDriverPay" OnClick="RefreshDriverPayData" />
                                &nbsp;&nbsp;<telerik:RadLabel ID="RadLabeRefreshDataDriverPay" runat="server" />
                                recs
                            </div>
                            <div class="prOTRActionsDataRefreshLast">
                                <telerik:RadButton ID="radBtnOTRPR_RefreshFromLoad" Text="only LOAD data" runat="server" OnClientClicking="RefreshDataLoad" OnClick="RefreshLoadsData" />
                                &nbsp;&nbsp;<telerik:RadLabel ID="RadLabeRefreshDataLoad" runat="server" />
                                recs
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

        <telerik:RadWindow ID="dataRefreshPopup" runat="server" Title="Data Retrieval" Width="375px" Height="200px" Modal="true" OffsetElementID="main">
            <ContentTemplate>
                <div style="font-size: 1.5em; font-weight: bold; margin-top: 5px; padding: 30px;">
                    &nbsp;&nbsp;<telerik:RadLabel ID="RadLabeldataRefreshPopup" runat="server" />
                    <span style="font-size: initial; font-weight: 100;">records retrieved</span>
                    <div style="float: right; margin-top: 30px;">
                        <telerik:RadButton ID="RadButton_Cancel" runat="server" Text="Close" OnClientClicked="closeLoadingWindow" Width="85px" Visible="true" />
                    </div>
                </div>

            </ContentTemplate>
        </telerik:RadWindow>

    </form>

    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
        <script type="text/javascript">

            // resize the grid when browser is resized 
            window.addEventListener('resize', grid_resize);

            function pageLoad() {
                // This function will resize the grid columns to fit content
                //grid_resize();
            }

            function radBtnOTRPR_Reset_Confirm(sender, eventArgs) {
                var confirmResult = window.confirm("\nAre you sure you want to RESET this pay period?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }
            }

            function ShowDataRefreshPopup(sender, eventArgs) {
                var dataRefreshPopupWnd = $find("<%= dataRefreshPopup.ClientID %>");
                dataRefreshPopupWnd.show();
            }

            function RefreshDataAll(sender, eventArgs) {
                var confirmResult = window.confirm("\nRetrieving ALL data may take up to 10 minutes.\n\nAre you sure you want to continue?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }

                ShowDataRefreshPopup(sender, eventArgs);
            }


            function RefreshDataDriverPay(sender, eventArgs) {
                ShowDataRefreshPopup(sender, eventArgs);
            }

            function RefreshDataLoad(sender, eventArgs) {
                var confirmResult = window.confirm("\nRetrieving LOAD data may take up to 10 minutes.\n\nAre you sure you want to continue?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }

                ShowDataRefreshPopup(sender, eventArgs);
            }

            function radBtnOTRPR_Finalize_Confirm(sender, eventArgs) {
                var confirmResult = window.confirm("\nFINALIZING the pay period can not be undone.\n\nAre you sure you want to continue?");
                eventArgs.set_cancel(!confirmResult);
                if (!confirmResult) {
                    return false;
                }
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
                var radWindow = $find('<%=dataRefreshPopup.ClientID %>');
                radWindow.close();
            }
        </script>
    </telerik:RadScriptBlock>

</body>
</html>
