<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadBilling.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.LoadBilling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" />

        <div style="border-width: 0px; padding: 20px; margin: 0px">
            <fieldset>
                <legend style="font-size: small; font-weight: bold;">'Billed Load' Search</legend>
                <table style="border-width: 0px; padding: 20px; margin: 0px">
                    <tr>
                        <td>Trip #</td>
                        <td style="padding-left: 15px">
                            <telerik:RadNumericTextBox ID="RadNumericTextBox_BilledLoadId" runat="server"
                                Culture="en-US" DbValueFactor="1" MinValue="0" Width="75px">
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
                        <td>
                            <telerik:RadButton ID="RadButton_ReleaseLockAndOpen" runat="server" Text="Open 'Billed Load'" OnClick="RadButton_ReleaseLockAndOpen_Click" />
                        </td>
                    </tr>
                </table>

                <div id="LoadNotFoundDiv" runat="server" style="border-width: 0px; padding: 20px; margin: 0px">
                    <span style="color: red;">Trip '<%=RadNumericTextBox_BilledLoadId.Text %>' either doesn't exist or is not in 'BILLED' status.</span>
                </div>
            </fieldset>
        </div>

        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="BilledLoadDetails" runat="server" />
            </Windows>
        </telerik:RadWindowManager>
    </form>

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script>
            window.addEventListener('resize', editor_resize);
            function pageLoad() {
                editor_resize();
            }

            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
            }

            function editor_resize() {
                try {
                }
                catch (e) {
                    alert(e);
                }
            }

            function openBilledLoadDetails(LoadId) {
                var oWnd = radopen("../ContainerPages/DispatchSheet.aspx?LoadId=" + LoadId, "BilledLoadDetails");
                oWnd.set_title("'Billed Load' Details");

                var brwsrHeight = window.innerHeight
                    || document.documentElement.clientHeight
                    || document.body.clientHeight;
                if (brwsrHeight >= 1400) {
                    oWnd.setSize(1355, 1100); // width, height
                }
                else {
                    oWnd.setSize(1355, brwsrHeight - 100); // width, height
                }
                oWnd.set_minWidth(1355);
                oWnd.set_minHeight(600);
                oWnd.set_maxWidth(1355);

                oWnd.set_behaviors(
                    Telerik.Web.UI.WindowBehaviors.Minimize +
                    Telerik.Web.UI.WindowBehaviors.Maximize +
                    Telerik.Web.UI.WindowBehaviors.Move +
                    Telerik.Web.UI.WindowBehaviors.Close +
                    Telerik.Web.UI.WindowBehaviors.Resize +
                    Telerik.Web.UI.WindowBehaviors.Reload +
                    Telerik.Web.UI.WindowBehaviors.Pin);

                oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                oWnd.set_destroyOnClose(true);
                oWnd.set_restrictionZoneID("RadPane_Right");
                oWnd.set_minimizeZoneID("RadPane_Right");
                oWnd.set_visibleStatusbar(false);
                oWnd.moveTo(0, getNextAvailWinTopPos());
            }
        </script>
    </telerik:RadScriptBlock>
</body>
</html>

