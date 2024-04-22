<%@ Page EnableViewState="True" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body style="margin: 0px;">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadDockZone1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadDockZone1" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" MinDisplayTime="2000" Skin="Vista"
        runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadDockLayout ID="RadDockLayout1" runat="server">
        <telerik:RadSplitter ID="RadSplitter1" runat="server">
            <telerik:RadPane ID="RadPane1" runat="server">
                <telerik:RadDockZone ID="RadDockZone1" runat="server">
                    <telerik:RadDock ID="RadDock1" runat="server" Title="RadDock1">
                        <ContentTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Submit" />
                        </ContentTemplate>
                    </telerik:RadDock>
                </telerik:RadDockZone>
            </telerik:RadPane>
        </telerik:RadSplitter>
    </telerik:RadDockLayout>
    </form>
</body>
</html>
