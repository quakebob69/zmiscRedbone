<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayrollOTRDataRefresh.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.PayrollOTRDataRefresh" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" InitialDelayTime="500" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server"></telerik:RadSkinManager>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
    <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />

    <div style="color: white;">345 records retrieved</div>
    <telerik:RadButton ID="RadButton_Cancel" runat="server" Text="Close" OnClientClicked="closeMe" Width="85px" Visible="true" />

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow;
                else if (window.frameElement && window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                return oWindow;
            }

            function closeMe() {
                GetRadWindow().close();
            }
        </script>
    </telerik:RadScriptBlock>
</body>
</html>
