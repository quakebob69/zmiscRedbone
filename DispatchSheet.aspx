<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DispatchSheet.aspx.cs" Inherits="RedbonePlatform.Pages.ContainerPages.DispatchSheet" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html {
            /*added to prevent scroll bars in radwindow - for slight css differences between different browsers, needed this*/
            /*overflow: hidden;*/
        }
        html, body {
            height: 100%;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
			font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			font-size: 14px;
        }
        .DispatchSheetCol1-style {
            /*width: 100px;*/
            text-align: right;
            padding-Right: 5px;
        }
        .DispatchSheetTable-style {
        }
        .fieldsetDispatchSheet-style {
            width: 236px;
            vertical-align: top;
        }
        .DispatchSheetTableTD1-style1 {
        }
        .nospacing {
            border-spacing: 0;
            padding: 0;
            border-style: none;
        }
        .nospacingTable {
            border-width: 0px;
            padding: 0px;
            margin: 0px;
            border-collapse: collapse;
            border-spacing: 0;
        }
        .LoadDetails_tbl1_Col1 {
            width: 169px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style4 {
            left: 0px;
            top: 1px;
            /*width: 115px;*/
            /*direction: rtl;*/
        }
        .auto-style5 {
            width: 169px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
        .RadPicker {
            vertical-align: middle
        }
        .RadPicker {
            vertical-align: middle
        }
        .RadPicker {
            vertical-align: middle
        }
		.RadPicker .rcTable {
			table-layout: auto
		}
		.RadPicker .rcTable {
			table-layout: auto
		}
		.RadPicker .rcTable {
			table-layout: auto
		}
        .RadPicker_Default .rcCalPopup {
            background-position: 0 0
        }
        .RadPicker_Default .rcCalPopup {
            background-image: url('mvwres://Telerik.Web.UI, Version=2019.2.514.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Calendar.sprite.gif')
        }
        .RadPicker .rcCalPopup {
            display: block;
            overflow: hidden;
            width: 22px;
            height: 22px;
            background-color: transparent;
            background-repeat: no-repeat;
            text-indent: -2222px;
            text-align: center;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box
        }
        .RadPicker_Default .rcCalPopup {
            background-position: 0 0
        }
        .RadPicker_Default .rcCalPopup {
            background-image: url('mvwres://Telerik.Web.UI, Version=2019.2.514.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Calendar.sprite.gif')
        }
        .RadPicker .rcCalPopup {
            display: block;
            overflow: hidden;
            width: 22px;
            height: 22px;
            background-color: transparent;
            background-repeat: no-repeat;
            text-indent: -2222px;
            text-align: center;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box
        }
        .RadPicker_Default .rcCalPopup {
            background-position: 0 0
        }
        .RadPicker_Default .rcCalPopup {
            background-image: url('mvwres://Telerik.Web.UI, Version=2019.2.514.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.Default.Calendar.sprite.gif')
        }
        .RadPicker .rcCalPopup {
            display: block;
            overflow: hidden;
            width: 22px;
            height: 22px;
            background-color: transparent;
            background-repeat: no-repeat;
            text-indent: -2222px;
            text-align: center;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box
        }
        .auto-style7 {
            left: 0px;
            top: 0px;
            width: 28px;
        }
        .auto-style12 {
            padding-left: 3px;
            text-align: left;
        }
        .auto-style13 {
            width: 95px;
            text-align: right;
        }
        .rspResizeBarHorizontal, .rspSlideContainerResizeHorizontal {
            border-color: #505050 !important;
            color: #00B159 !important;
            background-color: #00B159 !important;
            background-image: none !important;
        }
        .rspCollapseBarHorizontalExpand, .rspCollapseBarHorizontalCollapse {
            border-color: #fff !important;
            color: #fff !important;
            background-color: #336633 !important;
            background-image: none !important;
        }
		span.RadButtonGreen, span.RadButtonGreen input {
			background-image:none!important;
			background-color:Green!important;
			color:White!important;
		}
		span.RadButtonRed, span.RadButtonRed input {
			background-image:none!important;
			background-color:Red!important;
			color:White!important;
		}
    </style>
    <link href="../../Styles/common.css" rel="stylesheet" />
</head>
<body style="height: 100%; margin: 0px;">
    <form id="form1" runat="server" style="height: 100%; margin: 0px">
        <asp:HiddenField ID="HiddenField_TenderId" runat="server" />
        <asp:HiddenField ID="HiddenField_LoadId" runat="server" />
        <asp:HiddenField ID="HiddenField_PageGUID" runat="server" />
        <asp:HiddenField ID="HiddenField_StopToLoadNextOnPostback" runat="server" />
        <asp:HiddenField ID="HiddenField_UpdateDockTitles" runat="server" />
        <asp:HiddenField ID="HiddenField_ClientId" runat="server" />
        <asp:HiddenField ID="HiddenField_CustomerLoadNumber" runat="server" />
        <asp:HiddenField ID="HiddenField_Driver1PersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_Driver2PersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_PunitId" runat="server" />
        <asp:HiddenField ID="HiddenField_TrailerId1" runat="server" />
        <asp:HiddenField ID="HiddenField_TrailerId2" runat="server" />
        <asp:HiddenField ID="HiddenField_DispatcherPersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_LoadPlannerPersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_Mode" runat="server" />
        <%--<asp:HiddenField ID="HiddenField_LockedPersonId" runat="server" />--%>
        <%--<asp:HiddenField ID="HiddenField_RPM" runat="server" />--%>
        <%--<input type="hidden" id="draggedRadDockField" runat="server"/>--%>
        <%--<asp:HiddenField ID="HiddenField_PickDockCount" runat="server" />--%>

        <telerik:RadButton ID="RadButton_RefreshACCTotal" runat="server" Text="RadButton_RefreshACCTotal" Visible="false" OnClick="RadButton_RefreshACCTotal_Click"></telerik:RadButton>

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
            <script type="text/javascript">
                function RefreshDockLayout() {
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequestWithTarget('<%= HiddenField_StopToLoadNextOnPostback.UniqueID %>', '');
                }
            </script>
        </telerik:RadScriptBlock>

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
            <AjaxSettings>
				<telerik:AjaxSetting AjaxControlID="RadButton_TenderDetails">
					<UpdatedControls>
						<telerik:AjaxUpdatedControl ControlID="RadButton_TenderDetails" UpdatePanelCssClass="" />
					</UpdatedControls>
				</telerik:AjaxSetting>
				<telerik:AjaxSetting AjaxControlID="RadButton_Notes">
					<UpdatedControls>
						<telerik:AjaxUpdatedControl ControlID="RadButton_Notes" UpdatePanelCssClass="" />
					</UpdatedControls>
				</telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadAjaxManager1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_FileManagement" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_TraceNumber" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_RefreshACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_BillableTotal" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_Dispatch">
                    <UpdatedControls>
                        <%--<telerik:AjaxUpdatedControl ControlID="HiddenField_PageGUID" UpdatePanelCssClass="" />--%>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Dispatch" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Status" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver2" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RequiredFieldValidator_RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_TempModeEquipment" />
                        <telerik:AjaxUpdatedControl ControlID="RequiredFieldValidator_TrailerType" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="HiddenField_StopToLoadNextOnPostback">
                    <UpdatedControls>
                        <%--<telerik:AjaxUpdatedControl ControlID="HiddenField_PageGUID" UpdatePanelCssClass="" />--%>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_RefreshACCTotal">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_RefreshACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_Pick">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Pick" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_RefreshACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />

                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_Drop">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Drop" LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_RefreshACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_Leg">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback"
                            UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Leg" UpdatePanelCssClass=""
                            LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_FuelStop">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback"
                            UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_FuelStop" UpdatePanelCssClass=""
                            LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_EmptyMiles">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_EmptyMiles" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidEmpty" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_LoadedMiles">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_LoadedMiles" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidLoaded" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_PaidEmpty">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidEmpty" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_EmptyMiles" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_PaidLoaded">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidLoaded" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_LoadedMiles" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Customer">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Customer" />
                        <telerik:AjaxUpdatedControl ControlID="Label_CustomerAddressContact"
                            LoadingPanelID="RadAjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_ClientId" />
                        <%--<telerik:AjaxUpdatedControl ControlID="RadEditor_LoadDetailNotes" />--%>
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_CustomerMain" />
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_AutoRatingInd" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_LoadPlanner">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_LoadPlanner" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Driver1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Driver2" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Driver2" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Dispatcher">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Dispatcher" />
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
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Commodity">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Commodity" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Trailer1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Truck1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_TrailerType">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Trailer2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="CustomValidator_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Truck1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_Temperature">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Truck1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RadToolTip_RadComboBox_Truck1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDropDownList_TempMode">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadComboBox_Status">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_StatusMoveNext" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Dispatch" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_HoldSub" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_LoadedMiles" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_EmptyMiles" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Customer" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Pick" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Drop" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Leg" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_FuelStop" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_LoadPlanner" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Dispatcher" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Driver2" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Commodity" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Truck1" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_TrailerType" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer1" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Trailer2" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                        <%--<telerik:AjaxUpdatedControl ControlID="RadEditor_LoadDetailNotes" />--%>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidEmpty" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidLoaded" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Pieces" />
                        <telerik:AjaxUpdatedControl ControlID="RadDatePicker_PaperworkReceivedDate" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_CustomerLoadNumber" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericText_Weight" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_FlatRate" />
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_SendOriginals" />
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_BillingApproval" />
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_AllowPerBOL" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="RadComboBox_HoldSub">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_HoldSub" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_SubOther" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_StatusHistory">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_StatusHistory" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_StatusMoveNext">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_Status" />
                        <telerik:AjaxUpdatedControl ControlID="RadComboBox_HoldSub" />
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_SubOther" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_StatusMoveNext" />
                        <telerik:AjaxUpdatedControl ControlID="RadButton_Dispatch" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadTextBox_CustomerLoadNumber">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTextBox_CustomerLoadNumber" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_AccCharges">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_AccCharges" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericText_Weight">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericText_Weight" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_FlatRate">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_FlatRate" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="Label_BillableTotal" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDockLayout1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_StopToLoadNextOnPostback" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_UpdateDockTitles" />
                        <telerik:AjaxUpdatedControl ControlID="RadDockLayout1" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_Rate" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <%--<telerik:AjaxSetting AjaxControlID="RadEditor_LoadDetailNotes">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadEditor_LoadDetailNotes" />
                    </UpdatedControls>
                </telerik:AjaxSetting>--%>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_Pieces">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Pieces" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCheckBox_SendOriginals">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_SendOriginals" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCheckBox_AllowPerBOL">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_AllowPerBOL" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCheckBox_BillingApproval">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_BillingApproval" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCheckbox_AutoRatingInd">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCheckbox_AutoRatingInd" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_Temperature" />
                        <telerik:AjaxUpdatedControl ControlID="RadDropDownList_TempMode" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadNumericTextBox_TripNumber">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_TripNumber" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadDatePicker_PaperworkReceivedDate">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadDatePicker_PaperworkReceivedDate" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_FileManagement">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_FileManagement" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadButton_TraceNumber">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadButton_TraceNumber" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadCheckBox_MileageOverride">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCheckBox_MileageOverride" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_EmptyMiles" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_LoadedMiles" />
                        <telerik:AjaxUpdatedControl ControlID="Label_GrossRevenue" />
                        <telerik:AjaxUpdatedControl ControlID="Label_RPM1" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidEmpty" />
                        <telerik:AjaxUpdatedControl ControlID="RadNumericTextBox_PaidLoaded" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCBillable" />
                        <telerik:AjaxUpdatedControl ControlID="Label_BillableTotal" />
                        <telerik:AjaxUpdatedControl ControlID="Label_ACCTotal" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
            <ClientEvents OnRequestStart="RequestStart" OnResponseEnd="ResponseEnd" />
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" MinDisplayTime="1000" Modal="true" />
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" MinDisplayTime="3000" Modal="true" />

        <telerik:RadSkinManager ID="RadSkinManager1" runat="server"></telerik:RadSkinManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="RadWindow_TenderDetails" runat="server" Title="Tender" Height="600px" Width="1300px" CenterIfModal="true"
                    ReloadOnShow="true" ShowContentDuringLoad="false" Modal="true" InitialBehaviors="Close,Move" Behaviors="Maximize,Minimize,Close,Move,Resize" 
					KeepInScreenBounds="true" VisibleStatusbar="false" OnClientClose="HidingTenderDetails">
                </telerik:RadWindow>
                <telerik:RadWindow ID="RadWindow_accCharges" runat="server" Title="Charges" Width="1100px" Height="500px" MinWidth="800px" MinHeight="300px"
					KeepInScreenBounds="true" ReloadOnShow="true" ShowContentDuringLoad="false" DestroyOnClose="false" Modal="true" CenterIfModal="true"
					IconUrl="../../images/16x16/truck-icon_16.png" VisibleStatusbar="false"
					OnClientClose="RadWindow_accCharges_OnClientClose" InitialBehaviors="Close,Move,Resize" Behaviors="Close,Move,Resize">
                </telerik:RadWindow>
                <telerik:RadWindow ID="RadWindow_DispatchSheet_Files" runat="server"></telerik:RadWindow>
				<telerik:RadWindow ID="RadWindow_LoadNotes" runat="server" Title="Load Notes" Height="600px" Width="1000px" MinWidth="600px" MinHeight="400px" Modal="true" 
					ReloadOnShow="true" ShowContentDuringLoad="false" InitialBehaviors="Reload,Close,Move,Resize" Behaviors="Reload,Close,Move,Resize" VisibleStatusbar="false" OnClientClose="HidingLoadNotes">
				</telerik:RadWindow>
				<telerik:RadWindow ID="RadWindow_StopNotes" runat="server" Title="Stop Notes" Height="600px" Width="600px" MinWidth="300px" MinHeight="200px" Modal="true" 
					ReloadOnShow="true" ShowContentDuringLoad="false" InitialBehaviors="Reload,Close,Move,Resize" Behaviors="Reload,Close,Move,Resize" VisibleStatusbar="false" OnClientClose="HidingStopNotes">
				</telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

        <telerik:RadSplitter RenderMode="Lightweight" ID="Radsplitter1" runat="server" Height="100%" Width="100%" Orientation="Horizontal" LiveResize="true">
            <telerik:RadPane ID="RadpaneTop" runat="server" Height="460" MaxHeight="460" Scrolling="None">
                <div id="divMain" runat="server" style="height: 400px; width: 100%;">
                    <table style="width: 100%;">
                        <tr>
                            <td id="logo" style="vertical-align: top; padding-left: 5px">
                                <table>
                                    <tr>
                                        <td style="vertical-align: top; width:">
                                            <asp:Image ID="Image_Logo" runat="server" ImageUrl="~/images/logo.png" Width="150px" />
                                        </td>
										<td id="currentStatus" style="vertical-align: top; padding-left:300px; padding-top:15px;">
											<fieldset>
												<legend style="font-size: small;text-align: left"><strong>LOAD STATUS</strong></legend>
												<table>
													<tr>
														<td style="width:140px;">
															<telerik:RadComboBox ID="RadComboBox_Status" runat="server" OnClientFocus="OnClientFocusHandler" OnClientKeyPressing="radComboKeyPress"
																EmptyMessage="-Status-" ToolTip="Status" MarkFirstMatch="true" BackColor="Green" ForeColor="White"
																Filter="Contains" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" DropDownAutoWidth="Enabled"
																AutoPostBack="True" DataSourceID="ObjectDataSource_LoadStatusType"
																DataTextField="LoadStatusTypeNm" DataValueField="LoadStatusTypeId" Width="140px"
																OnClientSelectedIndexChanging="RadComboBox_Status_SelectedIndexChanging" TabIndex="25">
															</telerik:RadComboBox>
														</td>
														<td class="nospacing" style="padding-left: 5px">
															<telerik:RadButton ID="RadButton_StatusMoveNext" runat="server" Text=">" Width="20px"
																OnClick="RadButton_StatusMoveNext_Click" TabIndex="27" ToolTip="Move to next Status">
															</telerik:RadButton>
														</td>
													</tr>
													<tr>
                                                        <td colspan="2">
															<table class="nospacing">
																<tr>
																	<td class="nospacing">
																		<telerik:RadComboBox ID="RadComboBox_HoldSub" runat="server" OnClientFocus="OnClientFocusHandler" OnClientKeyPressing="radComboKeyPress"
																			EmptyMessage="-Select SubType-" ToolTip="Sub Type" MarkFirstMatch="true" OnDataBinding="RadComboBox_HoldSub_DataBinding"
																			Filter="Contains" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
																			AutoPostBack="True" Visible="false" DataTextField="Name" DataValueField="LoadStatusSubTypeId" Width="130px"
																			TabIndex="26" CheckBoxes="true" EnableCheckAllItemsCheckBox="true">
																		</telerik:RadComboBox>
																	</td>
																	<td class="nospacing">
																		<telerik:RadTextBox ID="RadTextBox_SubOther" runat="server" ToolTip="SubType Other"
																			EmptyMessage="-Subtype Detail-" Width="120px" OnTextChanged="RadNumericTextBox_TextChanged"
																			AutoPostBack="True" LabelWidth="48px" Resize="None" TabIndex="29" MaxLength="25" Visible="false">
																		</telerik:RadTextBox>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
                                                        <td colspan="2">
															<table class="nospacing">
																<tr>
																	<td style="font-size: small; padding-top:7px;">
																		<telerik:RadButton ID="RadButton_StatusHistory" OnClientClicking="RadButton_StatusHistory_Clicking" runat="server"
																			Text="Status History" Width="100px" TabIndex="26" ToolTip="Load Status History">
																		</telerik:RadButton>
																	</td>
																	<td style="font-size: small; padding-top:7px;">
																		<telerik:RadButton ID="RadButton_TraceNumber" runat="server" Text="Trace History" Width="100px"
																			OnClientClicking="RadButton_TraceNumber_Clicking">
																		</telerik:RadButton>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</fieldset>
										</td>
									</tr>
                                    <tr>
										<td style="padding-top: 10px; padding-left: 5px" colspan="2">
											<table id="tblAddStops">
                                                <tr>
													<td width="80px" style="font-size: 14px;">
														<asp:Label ID="lblCounter" runat="server"></asp:Label>
                                                        <telerik:RadButton ID="RadButton_Pick" runat="server" Text="Pick" Font-Bold="true" OnClick="RadButton_Pick_Click" TabIndex="0">
                                                            <Icon PrimaryIconUrl="../../images/16x16/Add_16x.png" PrimaryHoveredIconUrl="../../images/16x16/Add_inverse_16x.png" />
                                                        </telerik:RadButton>
                                                    </td>
													<td width="80px" style="font-size: 14px;">
                                                        <telerik:RadButton ID="RadButton_Drop" runat="server" Text="Drop" Font-Bold="true" OnClick="RadButton_Drop_Click" TabIndex="1">
                                                            <Icon PrimaryIconUrl="../../images/16x16/Add_16x.png" PrimaryHoveredIconUrl="../../images/16x16/Add_inverse_16x.png" />
                                                        </telerik:RadButton>
                                                    </td>
													<td width="80px" style="font-size: 14px;">
                                                        <telerik:RadButton ID="RadButton_Leg" runat="server" Text="LEG" Font-Bold="true" OnClick="RadButton_Leg_Click" TabIndex="3">
                                                            <Icon PrimaryIconUrl="../../images/16x16/Add_16x.png" PrimaryHoveredIconUrl="../../images/16x16/Add_inverse_16x.png" />
                                                        </telerik:RadButton>
                                                    </td>
													<td style="font-size: 14px;">
                                                        <telerik:RadButton ID="RadButton_FuelStop" runat="server" Text="Fuel" Font-Bold="true" OnClick="RadButton_FuelStop_Click" TabIndex="4">
                                                            <Icon PrimaryIconUrl="../../images/16x16/Add_16x.png" PrimaryHoveredIconUrl="../../images/16x16/Add_inverse_16x.png" />
                                                        </telerik:RadButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <table class="nospacing">
                                                            <tr class="nospacing">
                                                                <td class="nospacing">
                                                                    <telerik:RadButton ID="RadButton_NewCustomer" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New/Edit Customer"
                                                                        Font-Bold="true" TabIndex="5" Width="175px" OnClientClicked="openClientAddEdit" Enabled="true">
                                                                        <Icon PrimaryIconUrl="../../images/16x16/Add_16x.png" PrimaryHoveredIconUrl="../../images/16x16/Add_inverse_16x.png" />
                                                                    </telerik:RadButton>
                                                                </td>
                                                                <td class="nospacing" style="padding-left: 5px">
                                                                    <telerik:RadButton ID="RadButton_FileManagement" runat="server" Text="Files" Font-Bold="true" 
																		OnClientClicking="RadButton_FileManagement_Clicking"></telerik:RadButton>
                                                                </td>
                                                                <td style="padding-left: 7px">Auto Rating:</td>
                                                                <td>
                                                                    <telerik:RadCheckBox ID="RadCheckBox_AutoRatingInd" runat="server" TabIndex="6" CssClass="auto-style7"
																		OnClick="RadCheckBox_AutoRatingInd_Click">
                                                                    </telerik:RadCheckBox>
                                                                </td>
                                                                <td style="padding-left: 7px">Mileage Override:</td>
                                                                <td>
                                                                    <telerik:RadCheckBox ID="RadCheckBox_MileageOverride" runat="server" TabIndex="6" CssClass="auto-style7" 
																		OnCheckedChanged="RadCheckBox_MileageOverride_CheckedChanged">
                                                                    </telerik:RadCheckBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
 							<td id="companyPerf" style="vertical-align: top; text-align: center; padding-top:17px; padding-right: 15px;">
								<fieldset>
									<legend style="font-size: small;text-align: left"><strong>LOAD DETAILS</strong></legend>
									<table style="vertical-align: top; width: 100%">
										<tr>
											<td style="text-align: center;">
												<table style="width: 100%;">
													<tr>
														<td class="DispatchSheetCol1-style">Trip #:</td>
														<td style="text-align: left">
															<asp:Label ID="Label_TripNumber" runat="server" ToolTip=""></asp:Label>
														</td>
														<%--<td style="text-align: left">
															<asp:Label ID="Label_TripNumber" runat="server" Text="21057"></asp:Label>
															<telerik:RadNumericTextBox ID="RadNumericTextBox_TripNumber" runat="server" Width="60px" MinValue="1" Culture="en-US" 
																OnTextChanged="RadNumericTextBox_TextChanged" AutoPostBack="true" TabIndex="10" >
																<NegativeStyle Resize="None"></NegativeStyle>
																<NumberFormat DecimalDigits="0" GroupSeparator="" />
																<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
																<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
																<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
																<FocusedStyle Resize="None"></FocusedStyle>
																<DisabledStyle Resize="None"></DisabledStyle>
																<InvalidStyle Resize="None"></InvalidStyle>
																<HoveredStyle Resize="None"></HoveredStyle>
																<EnabledStyle Resize="None"></EnabledStyle>
															</telerik:RadNumericTextBox>
														</td>--%>
	                                                </tr>
		                                            <tr>
	                                                    <td class="DispatchSheetCol1-style">Empty Miles:</td>
														<td style="text-align: left">
															<table style="border-spacing: 0; border-collapse: collapse;">
																<tr>
																	<td style="padding: 0;">
																		<telerik:RadNumericTextBox ID="RadNumericTextBox_EmptyMiles" runat="server" Width="60px" Culture="en-US" DbValueFactor="1"
																			MaxValue="10000" MinValue="0" AutoPostBack="True" TabIndex="10" ReadOnly="True"
																			OnTextChanged="RadNumericTextBox_EmptyMiles_TextChanged">
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
																	<td style="padding: 0; padding-left: 2px">
																		<%--relocated RadNumericTextBox_PaidEmpty--%>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td class="DispatchSheetCol1-style">Loaded Miles:</td>
														<td style="text-align: left">
															<table class="nospacing">
																<tr>
																	<td class="nospacing">
																		<telerik:RadNumericTextBox ID="RadNumericTextBox_LoadedMiles" runat="server" Width="60px" AutoPostBack="True"
																			Culture="en-US" DbValueFactor="1" MaxValue="10000" MinValue="0" TabIndex="11" ReadOnly="True"
																			OnTextChanged="RadNumericTextBox_LoadedMiles_TextChanged">
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
																	<td class="nospacing" style="padding-left: 2px">
																		<asp:RequiredFieldValidator ID="RequiredFieldValidator_LoadedMiles" runat="server" ErrorMessage="*"
																			InitialValue="0" Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadNumericTextBox_LoadedMiles" 
																			ValidationGroup="Dispatch">
																		</asp:RequiredFieldValidator>
																	</td>
																	<td class="nospacing">
																		<%--relocated RadNumericTextBox_PaidLoaded--%>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td class="DispatchSheetCol1-style">Gross Revenue:</td>
														<td style="text-align: left">
															<asp:Label ID="Label_GrossRevenue" runat="server" ToolTip="Gross Revenue = (ACC Revenue Charges + Flat Rate)"></asp:Label>
														</td>
													</tr>
													<tr>
														<td class="DispatchSheetCol1-style">RPM:</td>
														<td style="text-align: left">
															<%--<telerik:RadNumericTextBox ID="RadNumericTextBox_RPM" runat="server" Culture="en-US" DbValueFactor="1"
																MaxValue="10000" MinValue="0" Width="60px" OnTextChanged="RadNumericTextBox_TextChanged" AutoPostBack="True">
															</telerik:RadNumericTextBox>--%>
															<asp:Label ID="Label_RPM1" runat="server" ToolTip="RPM = Gross Revenue / (Loaded Miles + Empty Miles)"></asp:Label>
														</td>
													</tr>
													<tr>
														<td class="DispatchSheetCol1-style" colspan="2">
															<telerik:RadButton ID="RadButton_Dispatch" runat="server" Text="Dispatch" Width="100%" ValidationGroup="Dispatch" CausesValidation="true"
																OnClick="RadButton_Dispatch_Click" OnClientClicking="RadButton_Dispatch_Clicking" Style="position: relative;" TabIndex="12">
															</telerik:RadButton>
														</td>
													</tr>
	                                            </table>
		                                    </td>
			                            </tr>
				                    </table>
								</fieldset>
				            </td>
                            <td style="vertical-align: top; text-align: right; width: 350px;">
                                <table>
                                    <tr>
                                        <td style="vertical-align: central; text-align: right; padding-right: 0px; width: 245px">
                                            <h3></h3>
                                        </td>
                                        <td style="text-align: right; padding-right: 7px">
                                            <%--<telerik:RadNumericTextBox ID="RadNumericTextBox_Rate" runat="server" Width="110px" Font-Size="Large"
												Height="30px" Value="123.45" OnTextChanged="RadNumericTextBox_TextChanged">
											</telerik:RadNumericTextBox>--%>
                                            <asp:Label ID="Label_Rate" runat="server" Font-Size="Large" ToolTip="All ACC Charges" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <fieldset style="height: 140px; width: 320px">
												<legend style="font-size: small;text-align: left"><strong>CUSTOMER INFORMATION</strong></legend>
                                                <div style="text-align: left">
                                                    <table class="nospacing">
                                                        <tr>
                                                            <td class="nospacing">
                                                                <telerik:RadComboBox ID="RadComboBox_Customer" runat="server" AutoPostBack="True" Width="290px" DropDownWidth="900px" ValidationGroup="Dispatch"
                                                                    DataSourceID="ObjectDataSource_CustomerInfo" DataTextField="ClientName" DataValueField="ClientId" Filter="Contains" TabIndex="13"
                                                                    HighlightTemplatedItems="True" CausesValidation="False" MarkFirstMatch="true" EnableVirtualScrolling="true" ItemsPerRequest="50"
                                                                    EmptyMessage="-Customer-" AllowCustomText="True" EnableAutomaticLoadOnDemand="True" AppendDataBoundItems="true"
                                                                    OnClientFocus="OnClientFocusHandler" OnClientKeyPressing="radComboKeyPress" OnSelectedIndexChanged="RadComboBox_Customer_SelectedIndexChanged">
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
                                                                <telerik:RadToolTip ID="RadToolTip_CustomerMain" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
                                                                    Text="Customer" TargetControlID="RadComboBox_Customer" Position="TopCenter">
                                                                </telerik:RadToolTip>
                                                            </td>
                                                            <td style="width: 50px">
                                                                <%--<telerik:RadButton ID="RadButton_CustomerLoad" runat="server" Width="20" Text="C" ></telerik:RadButton>--%>
                                                                <%--<asp:ImageButton ID="ImageButton_CustomerLoad" runat="server" ImageUrl="~/images/16x16/Business_16x.png" 
		                                                            OnClientClick="OpenPersonEdit" style="top: 2px; position: relative" TabIndex="-1" />--%>
                                                                <img src="../../images/16x16/Business_16x.png" onclick="OpenClientEditForLoad()"
                                                                    onmouseover="this.style.cursor = 'pointer';" style="top: 2px; position: relative" />
                                                            </td>
                                                            <td class="nospacing" style="padding-left: 2px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Customer" runat="server" ErrorMessage="*" InitialValue=""
                                                                    Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Customer" ValidationGroup="Dispatch">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="padding-top: 5px; padding-left: 2px; text-align: left; font: normal; font-size: 12px; font-family: 'Segoe UI',Arial,Verdana">
                                                    <asp:Label ID="Label_CustomerAddressContact" runat="server"></asp:Label>
                                                </div>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
										<td colspan="2" style="font-size: small; padding-top:7px; padding-left:3px; text-align:left;">
											<telerik:RadButton ID="RadButton_busUnitConv" OnClick="RadButton_busUnitConv_Click" runat="server" 
												ConfirmSettings-ConfirmText="Move load to Logistics?" ConfirmSettings-Title="Move Load" ConfirmSettings-UseRadConfirm="true" ConfirmSettings-Height="120"
												Text="Move Load to Logistics" Width="170px" TabIndex="26" ToolTip="Convert to logistics load">
											</telerik:RadButton>
										</td>
									</tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <fieldset>
                        <legend style="font-size: small; font-weight: bold;">LOAD DETAILS</legend>
                        <table>
                            <tr>
                                <td style="padding-top:0px;vertical-align:top; width:260px;">
									<fieldset>
										<legend style="font-size: small; font-weight: bold;">Planning</legend>
										<table style="width:260px;">
											<tr>
												<td class='rightAlign' style="width: 80px;"><label id="lblTrailer1" runat="server">Planner</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_LoadPlanner" runat="server" CausesValidation="False" Filter="Contains" AutoPostBack="True" TabIndex="14"
																	DataSourceID="ObjectDataSource_LoadPlanner" DataTextField="PersonName" DataValueField="PersonId" AppendDataBoundItems="True"
																	ToolTip="Load Planner" MarkFirstMatch="True" OnClientFocus="OnClientFocusHandler" OnClientKeyPressing="radComboKeyPress"
																	OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Load Planner-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_LoadPlanner" runat="server" ErrorMessage="*" InitialValue="-Load Planner-"
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_LoadPlanner" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label1" runat="server">Dispatcher</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Dispatcher" runat="server" OnClientKeyPressing="radComboKeyPress"
																	DataSourceID="ObjectDataSource_Dispatchers" HighlightTemplatedItems="True"
																	DataTextField="PersonName" DataValueField="PersonId" OnClientFocus="OnClientFocusHandler"
																	Filter="Contains" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
																	AutoPostBack="True" CausesValidation="false" AppendDataBoundItems="true"
																	ToolTip="Dispatcher" MarkFirstMatch="true" TabIndex="15">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Dispatcher-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_Dispatcher" runat="server" ErrorMessage="*" InitialValue="-Dispatcher-"
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Dispatcher" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label2" runat="server">Driver 1</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Driver1" runat="server" DataSourceID="ObjectDataSource_Driver1" HighlightTemplatedItems="True"
																	OnClientKeyPressing="radComboKeyPress" TabIndex="16"
																	DataTextField="DriverName" DataValueField="PersonId" ValidationGroup="Dispatch"
																	Filter="Contains" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" AutoPostBack="True"
																	AppendDataBoundItems="True" MarkFirstMatch="True" OnClientFocus="OnClientFocusHandler" CausesValidation="False">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Driver #1-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
																<telerik:RadToolTip ID="RadToolTip_RadComboBox_Driver1" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
																	Text="Driver 1 (OTR, Lease Operator, Owner Operator)" TargetControlID="RadComboBox_Driver1" Position="TopCenter">
																</telerik:RadToolTip>
															</td>
															<td style="width: 50px">
																<%--<telerik:RadButton ID="RadButton_CustomerLoad" runat="server" Width="20" Text="C" ></telerik:RadButton>--%>
																<%--<asp:ImageButton ID="ImageButton_CustomerLoad" runat="server" ImageUrl="~/images/16x16/Business_16x.png" 
																OnClientClick="OpenPersonEdit" style="top: 2px; position: relative" TabIndex="-1" />--%>
																<img src="../../images/16x16/Business_16x.png" onclick="OpenDriver_1Edit()"
																	onmouseover="this.style.cursor = 'pointer';" style="top: 2px; position: relative" />
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_Driver1" runat="server" ErrorMessage="*" InitialValue="-Driver #1-"
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Driver1" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
																<asp:CustomValidator ID="CustomValidator_Driver1" runat="server" ErrorMessage="Not Unique" ValidationGroup="Dispatch"
																	ControlToValidate="RadComboBox_Driver1" ForeColor="Red" Font-Bold="true" Display="Dynamic" Enabled="false"
																	OnServerValidate="CustomValidator_Drivers_ServerValidate" EnableClientScript="false"
																	ClientValidationFunction="CustomValidator_Drivers_ClientValidate">
																</asp:CustomValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label3" runat="server">Driver 2</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Driver2" runat="server" DataSourceID="ObjectDataSource_Driver2" HighlightTemplatedItems="true"
																	OnClientKeyPressing="radComboKeyPress" TabIndex="17" AutoPostBack="True" CausesValidation="false" Filter="Contains" 
																	DataTextField="DriverName" DataValueField="PersonId" MarkFirstMatch="true" AppendDataBoundItems="true"
																	OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" OnClientFocus="OnClientFocusHandler">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Driver #2-" Value="0" />
																	</Items>
																</telerik:RadComboBox>

																<telerik:RadToolTip ID="RadToolTip_RadComboBox_Driver2" runat="server" ShowEvent="OnMouseOver" AutoCloseDelay="10000"
																	Text="Driver 2 (OTR, Lease Operator, Owner Operator)" TargetControlID="RadComboBox_Driver2" Position="TopCenter">
																</telerik:RadToolTip>
															</td>
															<td style="width: 50px">
																<%--<telerik:RadButton ID="RadButton_CustomerLoad" runat="server" Width="20" Text="C" ></telerik:RadButton>--%>
																<%--<asp:ImageButton ID="ImageButton_CustomerLoad" runat="server" ImageUrl="~/images/16x16/Business_16x.png" 
																OnClientClick="OpenPersonEdit" style="top: 2px; position: relative" TabIndex="-1" />--%>
																<img src="../../images/16x16/Business_16x.png" onclick="OpenDriver_2Edit()"
																	onmouseover="this.style.cursor = 'pointer';" style="top: 2px; position: relative" />
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label15" runat="server">Paid Loaded</label></td>
												<td class="nospacingTable" style="padding-top: 6px; padding-left: 2px">
													<telerik:RadNumericTextBox ID="RadNumericTextBox_PaidLoaded" runat="server" Culture="en-US" AutoPostBack="True" TabIndex="18"
														DbValueFactor="1" ToolTip="Paid Loaded" MinValue="0" Width="120px" OnTextChanged="RadNumericTextBox_TextChanged" EmptyMessage="Paid">
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
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label16" runat="server">Paid Empty</label></td>
												<td class="nospacingTable" style="padding-top: 3px; padding-left: 2px">
													<telerik:RadNumericTextBox ID="RadNumericTextBox_PaidEmpty" runat="server" Culture="en-US" AutoPostBack="True" TabIndex="19"
														EmptyMessage="Paid Empty" DbValueFactor="1" ToolTip="Paid Empty" MaxValue="10000" MinValue="0" Width="120px" 
														OnTextChanged="RadNumericTextBox_TextChanged">
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
											</tr>
										</table>
									</fieldset>
								</td>

                                <td style="padding-top:0px;vertical-align: top; width: 260px;">
									<fieldset>
										<legend style="font-size: small; font-weight: bold;">Equipment</legend>
										<table style="width:260px;">
											<tr>
												<td class='rightAlign' style="width: 80px;"><label id="Label4" runat="server">Truck</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Truck1" runat="server" MarkFirstMatch="true" CausesValidation="false" AutoPostBack="True" 
																	DataSourceID="ObjectDataSource_Trucks" DataTextField="Unit_ID" DataValueField="PunitId" Filter="Contains" 
																	AppendDataBoundItems="true" ValidationGroup="Dispatch" TabIndex="20" OnClientKeyPressing="radComboKeyPress"
																	OnClientFocus="OnClientFocusHandler" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged">
																	<%--<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Truck #1-" Value="0" />
																	</Items>--%>
																</telerik:RadComboBox>
																<telerik:RadToolTip ID="RadToolTip_RadComboBox_Truck1" runat="server" ShowEvent="OnMouseOver"
																	AutoCloseDelay="10000" Text="Truck" TargetControlID="RadComboBox_Truck1" Position="TopCenter">
																</telerik:RadToolTip>
															</td>
															<td style="width: 50px">
																<%--<telerik:RadButton ID="RadButton_CustomerLoad" runat="server" Width="20" Text="C" ></telerik:RadButton>--%>
																<%--<asp:ImageButton ID="ImageButton_CustomerLoad" runat="server" ImageUrl="~/images/16x16/Business_16x.png" 
																OnClientClick="OpenPersonEdit" style="top: 2px; position: relative" TabIndex="-1" />--%>
																<img src="../../images/16x16/Business_16x.png" onclick="OpenTruck()"
																	onmouseover="this.style.cursor = 'pointer';" style="top: 2px; position: relative" />
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_RadComboBox_Truck1" runat="server" Display="Dynamic" ErrorMessage="*"
																	InitialValue="-Truck-" Font-Bold="true" ForeColor="Red" ControlToValidate="RadComboBox_Truck1" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label5" runat="server">Trailer 1</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Trailer1" runat="server" MarkFirstMatch="true" TabIndex="21"
																	DataSourceID="ObjectDataSource_Trailer1" DataTextField="Trailer_ID" DataValueField="TrailerId" Filter="Contains"
																	AutoPostBack="True" AppendDataBoundItems="true" CausesValidation="False" ValidationGroup="Dispatch"
																	OnClientKeyPressing="radComboKeyPress" OnClientFocus="OnClientFocusHandler" 
																	OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Trailer #1-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
																<telerik:RadToolTip ID="RadToolTip_RadComboBox_Trailer1" runat="server" ShowEvent="OnMouseOver"
																	AutoCloseDelay="10000" Text="Trailer 1" TargetControlID="RadComboBox_Trailer1" Position="TopCenter">
																</telerik:RadToolTip>
															</td>
															<td style="width: 50px">
																<%--<telerik:RadButton ID="RadButton_CustomerLoad" runat="server" Width="20" Text="C" ></telerik:RadButton>--%>
																<%--<asp:ImageButton ID="ImageButton_CustomerLoad" runat="server" ImageUrl="~/images/16x16/Business_16x.png" 
																OnClientClick="OpenPersonEdit" style="top: 2px; position: relative" TabIndex="-1" />--%>
																<img src="../../images/16x16/Business_16x.png" onclick="OpenTrailer()"
																	onmouseover="this.style.cursor = 'pointer';" style="top: 2px; position: relative" />
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:CustomValidator ID="CustomValidator_Trailer1" runat="server" ErrorMessage="Not Unique" ValidationGroup="Dispatch" Enabled="false"
																	ControlToValidate="RadComboBox_Trailer1" ForeColor="Red" Font-Bold="true" Display="Dynamic"
																	OnServerValidate="CustomValidator_Trailers_ServerValidate" EnableClientScript="false">
																</asp:CustomValidator>
																<%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="Dispatch"
																	Display="Dynamic" ControlToValidate="RadComboBox_Trailer1" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>--%>
																<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_Trailer1" runat="server" ErrorMessage="*" InitialValue="-Trailer #1-"
																	Font-Bold="true" Enabled="false"
																	ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Trailer1" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>--%>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label6" runat="server">Trailer 2</label></td>
												<td>
													<telerik:RadComboBox ID="RadComboBox_Trailer2" runat="server" MarkFirstMatch="true" TabIndex="22" AutoPostBack="True"
														DataSourceID="ObjectDataSource_Trailer2" DataTextField="Trailer_ID" DataValueField="TrailerId" Filter="Contains" AppendDataBoundItems="true"
														OnClientKeyPressing="radComboKeyPress" OnClientFocus="OnClientFocusHandler" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged" >
														<Items>
															<telerik:RadComboBoxItem runat="server" Text="-Trailer #2-" Value="0" />
														</Items>
													</telerik:RadComboBox>
													<telerik:RadToolTip ID="RadToolTip_RadComboBox_Trailer2" runat="server" ShowEvent="OnMouseOver"
														AutoCloseDelay="10000" Text="Trailer 2" TargetControlID="RadComboBox_Trailer2" Position="TopCenter">
													</telerik:RadToolTip>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label7" runat="server">Trailer Type</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_TrailerType" runat="server" HighlightTemplatedItems="true" OnClientKeyPressing="radComboKeyPress"
																	AppendDataBoundItems="true" ToolTip="Trailer Type" MarkFirstMatch="true" OnClientFocus="OnClientFocusHandler"
																	Filter="Contains" DataSourceID="ObjectDataSource_Equipment" DataTextField="EquipmentType"
																	DataValueField="EquipmentTypeId" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
																	AutoPostBack="True" ValidationGroup="Dispatch" CausesValidation="false" TabIndex="23">
																	<Items>
																		<telerik:RadComboBoxItem runat="server" Text="-Trailer Type-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_TrailerType" runat="server" ErrorMessage="*" InitialValue="-Trailer Type-"
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_TrailerType" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</fieldset>
									<span>
										<telerik:RadButton ID="RadButton_TenderDetails" ButtonType="StandardButton" Text="Tender Details" runat="server" CausesValidation="false"
											style="margin-top:10px; margin-left:5px;" Width="120px" OnClientClicked="ViewTenderDetails" />
									</span>
								</td>

                                <td style="vertical-align: top; width: 245px;">
									<fieldset>
										<legend style="font-size: small; font-weight: bold;">Cargo</legend>
										<table style="width:245px;">
											<tr>
												<td class='rightAlign'><label id="Label11" runat="server">Commodity</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadComboBox ID="RadComboBox_Commodity" runat="server" MarkFirstMatch="True" OnClientKeyPressing="radComboKeyPress" AutoPostBack="True"
																	DataSourceID="ObjectDataSource_Commidity" DataTextField="Commodity" DataValueField="CommodityTypeId" AppendDataBoundItems="True" 
																	HighlightTemplatedItems="True" Filter="Contains" ToolTip="Commodiy"  CausesValidation="False" TabIndex="24"
																	OnClientFocus="OnClientFocusHandler" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged">
																	<%--<HeaderTemplate>
																		<table style="width: 300px;">
																			<tr>
																				<td style="width: 150px">Commodity</td>
																				<td>Description</td>
																			</tr>
																		</table>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<table style="width: 300px;">
																			<tr>
																				<td style="width: 150px"><%# DataBinder.Eval(Container.DataItem, "Commodity") %></td>
																				<td><%# DataBinder.Eval(Container.DataItem, "CommodityDescription") %></td>
																			</tr>
																		</table>
																	</ItemTemplate>--%>
																	<Items>
																		<telerik:RadComboBoxItem Text="-Commodity-" Value="0" />
																	</Items>
																</telerik:RadComboBox>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<asp:RequiredFieldValidator ID="RequiredFieldValidator_Commodity" runat="server" ErrorMessage="*" InitialValue="-Commodity-"
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadComboBox_Commodity" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label8" runat="server">Temperature</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<table class="nospacing" style="width: 100%">
																	<tr>
																		<td class="nospacing">
																			<telerik:RadNumericTextBox ID="RadNumericTextBox_Temperature" runat="server" CausesValidation="false" TabIndex="25"
																				ToolTip="Temperature - Required for non Grocery/Dry Freight loads" EmptyMessage="-Temperature-"  LabelWidth="64px" Width="70px"
																				AutoPostBack="True" Culture="en-US" DbValueFactor="1" OnTextChanged="RadNumericTextBox_TextChanged">
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
																		<td class="nospacing" style="padding-left: 5px;">Per BOL</td>
																		<td class="nospacing" style="text-align: right; padding-left: 5px">
																			<telerik:RadCheckBox ID="RadCheckBox_AllowPerBOL" runat="server" Text="" Width="20px" TabIndex="26" 
																				OnCheckedChanged="RadCheckBox_CheckedChanged">
																			</telerik:RadCheckBox>
																		</td>
																	</tr>
																</table>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_Temperature" runat="server" ErrorMessage="*" InitialValue=""
																	Font-Bold="true" ForeColor="Red" Display="Dynamic" ControlToValidate="RadNumericTextBox_Temperature" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>--%>
																<asp:CustomValidator ID="CustomValidator_Temperature" runat="server" ErrorMessage="*" EnableClientScript="false"
																	Font-Bold="true" ForeColor="Red" ControlToValidate="RadComboBox_TrailerType"
																	ToolTip="When Trailer Type is not 53 REEFER DRY, 53 DRY VAN, AND POWER ONLY Then Temperature is Required!"
																	ClientValidationFunction="CustomValidator_Temperature_ClientValidate" ValidationGroup="Dispatch"
																	Display="Dynamic" OnServerValidate="CustomValidator_Temperature_ServerValidate">
																</asp:CustomValidator>
																<%--<asp:CustomValidator ID="CustomValidator_TempEquipment" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="Dispatch"
																	ClientValidationFunction="CustomValidator_TempEquipment_ClientValidate" Display="Dynamic" ToolTip="When Trailer Type is 53 REEFER Then Temperature is Required!">
																</asp:CustomValidator>--%>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label9" runat="server">Temp Mode</label></td>
												<td>
													<table class="nospacing">
														<tr>
															<td class="nospacing">
																<telerik:RadDropDownList ID="RadDropDownList_TempMode" runat="server" MarkFirstMatch="true" CausesValidation="false" TabIndex="27"
																	DataSourceID="ObjectDataSource_TempTypes" ValidationGroup="Dispatch" ToolTip="Temp Mode"
																	DataTextField="TemperatureType" DataValueField="TemperatureTypeId" AppendDataBoundItems="true"
																	OnSelectedIndexChanged="RadDropDownList_TempMode_SelectedIndexChanged" AutoPostBack="True">
																	<Items>
																		<telerik:DropDownListItem runat="server" Text="-Temp Mode-" Value="0" />
																	</Items>
																</telerik:RadDropDownList>
															</td>
															<td class="nospacing" style="padding-left: 2px">
																<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator_TempMode" runat="server" ErrorMessage="*" InitialValue="-Temp Mode-"
																	Font-Bold="true"
																	ForeColor="Red" Display="Dynamic" ControlToValidate="RadDropDownList_TempMode" ValidationGroup="Dispatch">
																</asp:RequiredFieldValidator>--%>
																<asp:CustomValidator ID="CustomValidator_TempModeEquipment" runat="server" ErrorMessage="*" EnableClientScript="false"
																	Font-Bold="true" ForeColor="Red" ValidationGroup="Dispatch" ControlToValidate="RadComboBox_TrailerType"
																	ToolTip="When Trailer Type is not 53 REEFER DRY, 53 DRY VAN, AND POWER ONLY Then Temp Mode is Required!"
																	ClientValidationFunction="CustomValidator_TempModeEquipment_ClientValidate" Display="Dynamic" 
																	OnServerValidate="CustomValidator_TempModeEquipment_ServerValidate">
																</asp:CustomValidator>
															</td>
														</tr>
													</table>
												</td>
											</tr>
                                            <tr>
												<td class='rightAlign'><label id="Label13" runat="server">Weight</label></td>
                                                <td>
                                                    <table class="nospacing">
                                                        <tr>
                                                            <td class="nospacing">
                                                                <telerik:RadNumericTextBox ID="RadNumericText_Weight" runat="server" Culture="en-US" DbValueFactor="1"
                                                                    LabelWidth="64px" MinValue="0" Width="120px" EmptyMessage="-Weight-" ToolTip="Weight" TabIndex="28"
                                                                    OnTextChanged="RadNumericTextBox_TextChanged" AutoPostBack="True" ValidationGroup="InTransit">
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
                                                            <td class="nospacing" style="padding-left: 2px">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Weight" runat="server" ErrorMessage="*"
                                                                    InitialValue="" Font-Bold="true" Enabled="false"
                                                                    ForeColor="Red" Display="Dynamic" ControlToValidate="RadNumericText_Weight" ValidationGroup="InTransit"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label12" runat="server">Pieces</label></td>
												<td>
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox_Pieces" runat="server" MinValue="0" AutoPostBack="true"
                                                        EmptyMessage="-Pieces-" ToolTip="Pieces" OnTextChanged="RadNumericTextBox_TextChanged" TabIndex="29" Width="120px">
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
										</table>
									</fieldset>
								</td>

                                <td style="padding-top:0px;vertical-align: top; width: 150px;">
									<fieldset>
										<legend style="font-size: small; font-weight: bold;">ACC Charges</legend>
										<table style="width:150px;">
											<tr>
												<td colspan="2" style="padding-left: 3px;" class="nospacing">
													<telerik:RadButton ID="RadButton_AccCharges" runat="server" TabIndex="31" Text="Charges" Width="100%"
														OnClientClicking="RadButton_AccCharges_Clicking">
													</telerik:RadButton>
												</td>
											</tr>
											<tr>
												<td style="padding-top:10px;" class="auto-style13"><label runat="server">ACC Billable:</label></td>
												<td style="padding-top:10px;" class="auto-style12">
													<strong><asp:Label ID="Label_ACCBillable" runat="server" ToolTip="ACC Billable = All Revnuue ACC Charges"></asp:Label></strong>
												</td>
											</tr>
											<tr>
												<td style="text-align: right;"><label runat="server">Billable Total:</label></td>
												<td>
													<strong><asp:Label ID="Label_BillableTotal" runat="server" ToolTip="Billable Total"></asp:Label></strong>
												</td>
											</tr>
											<tr>
												<td class="auto-style13"><label runat="server">ACC Total:</label></td>
												<td class="auto-style12">
													<strong><asp:Label ID="Label_ACCTotal" runat="server" ToolTip="ACC Total = All ACC Charges"></asp:Label></strong>
												</td>
											</tr>
										</table>
									</fieldset>
									<div style="padding-top:20px;text-align:center;">
										<telerik:RadButton ID="RadButton_Notes" runat="server" CssClass="RadButtonGreen" Text="Notes" Width="120px" OnClientClicked="OpenLoadNotes" CausesValidation="false"></telerik:RadButton>
									</div>
								</td>

                                <td style="padding-top:0px;vertical-align: top; width: 225px;">
									<fieldset>
										<legend style="font-size: small; font-weight: bold;">Billing</legend>
										<table style="width:225px">
											<tr>
												<td class='rightAlign'><label id="Label10" runat="server">Cust Load #</label></td>
												<td class="auto-style2" style="width: 75px">
                                                    <telerik:RadTextBox ID="RadTextBox_CustomerLoadNumber" runat="server" ToolTip="Customer Load Number"
                                                        EmptyMessage="-Customer Load #-" Width="120px" OnTextChanged="RadNumericTextBox_TextChanged"
                                                        AutoPostBack="True" LabelWidth="48px" Resize="None" TabIndex="30" MaxLength="25">
                                                    </telerik:RadTextBox>
                                                </td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label14" runat="server">Flat Rate</label></td>
                                                <td style="padding-left: 3px;">
                                                    <telerik:RadNumericTextBox ID="RadNumericTextBox_FlatRate" runat="server" EmptyMessage="-Flat Rate-"
                                                        Culture="en-US" DbValueFactor="1" MinValue="0" Width="100px" ToolTip="Flat Rate" TabIndex="31"
                                                        OnTextChanged="RadNumericTextBox_TextChanged" AutoPostBack="True">
                                                    </telerik:RadNumericTextBox>
                                                </td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label17" runat="server">Paperwork Rcvd</label></td>
												<td style="text-align: left; padding-left: 5px; width: 107px">
													<telerik:RadDatePicker ID="RadDatePicker_PaperworkReceivedDate" runat="server" Width="105px" Culture="en-US" ToolTip="Paperwork Received Date" AutoPostBack="True" 
														OnSelectedDateChanged="RadDatePicker_PaperworkReceivedDate_SelectedDateChanged" TabIndex="32" DateInput-EmptyMessage="Paper Rcv Dt">
														<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
														<DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="0%" AutoPostBack="True" TabIndex="33">
															<EmptyMessageStyle Resize="None"></EmptyMessageStyle>
															<ReadOnlyStyle Resize="None"></ReadOnlyStyle>
															<FocusedStyle Resize="None"></FocusedStyle>
															<DisabledStyle Resize="None"></DisabledStyle>
															<InvalidStyle Resize="None"></InvalidStyle>
															<HoveredStyle Resize="None"></HoveredStyle>
															<EnabledStyle Resize="None"></EnabledStyle>
														</DateInput>
														<DatePopupButton ImageUrl="" HoverImageUrl="" TabIndex="34"></DatePopupButton>
													</telerik:RadDatePicker>
												</td>
											</tr>
											<tr style="display: none;">
												<td class='rightAlign'><label id="Label18" runat="server">Send Original</label></td>
												<td>
													<telerik:RadCheckBox ID="RadCheckBox_SendOriginals" runat="server" TabIndex="35" AutoPostBack="True" Text=""
														OnCheckedChanged="RadCheckBox_CheckedChanged" CssClass="auto-style4">
													</telerik:RadCheckBox>
												</td>
											</tr>
											<tr>
												<td class='rightAlign'><label id="Label19" runat="server">Billing Approved</label></td>
												<td>
													<telerik:RadCheckBox ID="RadCheckBox_BillingApproval" runat="server" TabIndex="36" AutoPostBack="True" Text="" 
														ToolTip="Billing Approval" OnCheckedChanged="RadCheckBox_CheckedChanged" CssClass="auto-style4">
													</telerik:RadCheckBox>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>

							</tr>
						</table>
					</fieldset>
                </div>
            </telerik:RadPane>  

            <%--  <tr>
                                            <td class="LoadDetails_tbl1_Col1">
                                                <table class="nospacing">
                                                    <tr>
                                                        <td class="nospacing">
                                                            <telerik:RadDropDownList ID="RadDropDownList_TempMode" runat="server" MarkFirstMatch="true"
                                                                DataSourceID="ObjectDataSource_TempTypes" ValidationGroup="Dispatch" ToolTip="Temp Mode"
                                                                DataTextField="TemperatureType" DataValueField="TemperatureTypeId" AppendDataBoundItems="true"
                                                                OnSelectedIndexChanged="RadDropDownList_TempMode_SelectedIndexChanged" AutoPostBack="True"
                                                                CausesValidation="false" TabIndex="19">
                                                                <Items>
                                                                    <telerik:DropDownListItem runat="server" Text="-Temp Mode-" Value="0" />
                                                                </Items>
                                                            </telerik:RadDropDownList>
                                                        </td>
                                                        <td class="nospacing" style="padding-left: 2px">
                                                         
                                                            <asp:CustomValidator ID="CustomValidator_TempModeEquipment" runat="server" ErrorMessage="*" EnableClientScript="false"
                                                                Font-Bold="true" ForeColor="Red" ValidationGroup="Dispatch" ControlToValidate="RadComboBox_TrailerType"
                                                                ToolTip="When Trailer Type is not 53 REEFER DRY, 53 DRY VAN, AND POWER ONLY Then Temp Mode is Required!"
                                                                ClientValidationFunction="CustomValidator_TempModeEquipment_ClientValidate"
                                                                Display="Dynamic"
                                                                OnServerValidate="CustomValidator_TempModeEquipment_ServerValidate"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </td>
                                            <td>
                                                <table class="nospacing">
                                                    <tr>
                                                        <td class="nospacing">
                                                            <telerik:RadComboBox ID="RadComboBox_Status" runat="server" OnClientFocus="OnClientFocusHandler" OnClientKeyPressing="radComboKeyPress"
                                                                EmptyMessage="-Status-" ToolTip="Status" MarkFirstMatch="true"
                                                                Filter="Contains" OnSelectedIndexChanged="RadComboBox_SelectedIndexChanged"
                                                                AutoPostBack="True" DataSourceID="ObjectDataSource_LoadStatusType"
                                                                DataTextField="LoadStatusTypeNm" DataValueField="LoadStatusTypeId" Width="110px"
                                                                OnClientSelectedIndexChanging="RadComboBox_Status_SelectedIndexChanging" TabIndex="25">
                                                            </telerik:RadComboBox>
                                                        </td>
                                                        <td class="nospacing" style="padding-left: 5px">
                                                            <telerik:RadButton ID="RadButton_StatusHistory" OnClientClicking="RadButton_StatusHistory_Clicking" runat="server"
                                                                Text="..." Width="20px" TabIndex="26" ToolTip="Load Status History">
                                                            </telerik:RadButton>
                                                        </td>
                                                        <td class="nospacing" style="padding-left: 5px">
                                                            <telerik:RadButton ID="RadButton_StatusMoveNext" runat="server" Text="->" Width="20px"
                                                                OnClick="RadButton_StatusMoveNext_Click" TabIndex="27" ToolTip="Move to next Status">
                                                            </telerik:RadButton>
                                                        </td>
                                                    </tr>
                                                </table>
              
                                            </td>
                                        </tr>--%>
			<%--<td style="width: 100%" class="nospacingTable">
                                                            <telerik:RadEditor ID="RadEditor_LoadDetailNotes" runat="server"
                                                                EditModes="Design" OnClientLoad="DispatchNotes_OnClientLoad"
                                                                Width="100%" Height="100px" NewLineMode="Div" EmptyMessage="-Notes-"
                                                                ToolTip="Load Notes" TabIndex="28" NewLineBr="False">
                                                                <Tools>
                                                                    <telerik:EditorToolGroup>
                                                                        <telerik:EditorTool Name="Save" />
                                                                        <telerik:EditorTool Name="FontName" />
                                                                        <telerik:EditorTool Name="FontSize" />
                                                                        <telerik:EditorTool Name="ForeColor" />
                                                                        <telerik:EditorTool Name="BackColor" />
                                                                        <telerik:EditorTool Name="Bold" />
                                                                        <telerik:EditorTool Name="Italic" />
                                                                        <telerik:EditorTool Name="Underline" />
                                                                        <telerik:EditorTool Name="StrikeThrough" />
                                                                        <telerik:EditorTool Name="Indent" />
                                                                        <telerik:EditorTool Name="Outdent" />
                                                                        <telerik:EditorTool Name="InsertOrderedList" />
                                                                        <telerik:EditorTool Name="InsertUnorderedList" />
                                                                        <telerik:EditorTool Name="Undo" />
                                                                        <telerik:EditorTool Name="Cut" />
                                                                        <telerik:EditorTool Name="Paste" />
                                                                        <telerik:EditorTool Name="ToggleScreenMode" />
                                                                    </telerik:EditorToolGroup>
                                                                </Tools>
                                                            </telerik:RadEditor>
                                                        </td>--%>

            <telerik:RadSplitBar ID="Radsplitbar1" runat="server" CollapseMode="Forward" Height="6px" ForeColor="Red" BackColor="Green"></telerik:RadSplitBar>
            
            <telerik:RadPane ID="RadpaneBottom" runat="server" OnClientResized="bottomPane_Resized" Scrolling="Y">
                <div id="divRoute" style="width: 100%; padding-top: 5px;">
                    <fieldset id="fldRoute">
                        <legend style="font-size: small; font-weight: bold;">ROUTE - drag up or down to re-order</legend>
                        <div id="divRouteSections" class="nospacing" style="overflow-y: auto;">
                            <table id="tblRoute" class="nospacing">
                                <tr>
                                    <td>
                                        <telerik:RadDockLayout ID="RadDockLayout1" runat="server" StoreLayoutInViewState="True"
                                            OnLoadDockLayout="RadDockLayout1_LoadDockLayout" OnSaveDockLayout="RadDockLayout1_SaveDockLayout">
                                            <telerik:RadDockZone ID="RadDockZone1" runat="server" Height="100%">
												<%--<telerik:RadDock ID="RadDock1" runat="server" DockHandle="TitleBar" DockMode="Docked" Height="193px"
													Title="Pick #1" Width="100%" EnableAnimation="True">
													<ContentTemplate>
														<Picker:Pick runat="server" id="Pick" />
													</ContentTemplate>
												</telerik:RadDock>
												<telerik:RadDock ID="RadDock2" runat="server" DockHandle="TitleBar" DockMode="Docked" Height="193px"
													Title="Drop #1" Width="100%">
												</telerik:RadDock>--%>
											</telerik:RadDockZone>
                                        </telerik:RadDockLayout>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                </div>
            </telerik:RadPane>
        </telerik:RadSplitter>

        <telerik:RadNotification ID="RadNotif_Info" runat="server" Width="250" Position="Center" TitleIcon="info" Title="Confirmation" 
            ContentIcon="ok" Text="" LoadContentOn="EveryShow" AutoCloseDelay="3000" Animation="Fade" VisibleTitlebar="true" AnimationDuration="500"
			EnableRoundedCorners="true" EnableShadow="true" ShowCloseButton="true">
		</telerik:RadNotification>

		<telerik:RadNotification ID="RadNotificationFail" runat="server" VisibleOnPageLoad="False" AutoCloseDelay="0" 
			EnableRoundedCorners="true" EnableShadow="True" Title="Error" Position="Center" TitleIcon="none">
		</telerik:RadNotification>
        
		<asp:ObjectDataSource ID="ObjectDataSource_Commidity" runat="server" SelectMethod="GetData" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.CommodityTypeTableAdapter" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="Original_CommodityTypeId" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Commodity" Type="String" />
                <asp:Parameter Name="CommodityDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Commodity" Type="String" />
                <asp:Parameter Name="CommodityDescription" Type="String" />
                <asp:Parameter Name="Original_CommodityTypeId" Type="Int16" />
            </UpdateParameters>
        </asp:ObjectDataSource>
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
        <asp:ObjectDataSource ID="ObjectDataSource_Dispatchers" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.DispatcherTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_DispatcherPersonId" Name="AssignedPersonId" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_Equipment" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.EquipmentTypeTableAdapter"></asp:ObjectDataSource>

        <%--<asp:ObjectDataSource ID="ObjectDataSource_Trailers" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TrailerTableAdapter"></asp:ObjectDataSource>--%>

        <asp:ObjectDataSource ID="ObjectDataSource_Trailer1" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TrailerTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_TrailerId1" Name="InUseTrailerId" PropertyName="Value" Type="Int16" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_Trailer2" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TrailerTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_TrailerId2" Name="InUseTrailerId" PropertyName="Value" Type="Int16" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_Trucks" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.PunitTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_PunitId" Name="InUsePunitId" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_CustomerInfo" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.CustomerInfoTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_LoadPlanner" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.LoadPlannerTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField_LoadPlannerPersonId" Name="AssignedPersonId"
                    PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_TempTypes" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsDispatchTableAdapters.TemperatureTypeTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource_LoadStatusType" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="RedbonePlatform.Datasets.dsLoadStatusTableAdapters.LoadStatusTypeTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="LoadStatusTypeId" Type="Int16" DefaultValue="-1" />
            </SelectParameters>
		</asp:ObjectDataSource>

    </form>
    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
        <script type="text/javascript">
            window.addEventListener('resize', editor_resize);
            function pageLoad() {
                editor_resize();
            }

			//prevent ESC key from doing anything
			//window.addEventListener('keydown', function (e) {
			//	if (e.key === 'Escape' || e.key === 'Esc' || e.keyCode == 27) {
			//		const isNotCombinedKey = !(e.ctrlKey || e.altKey || e.shiftKey);
			//		if (isNotCombinedKey) {
			//			console.log('Escape key was pressed with out any group keys')
			//			e.preventDefault();
			//			return false;
			//		}
			//	}
			//});

			function GetRadWindow() {
				var oWindow = null;
				if (window.radWindow)
					oWindow = window.radWindow;
				else if (window.frameElement.radWindow)
					oWindow = window.frameElement.radWindow;
				return oWindow;
            }

			function ViewTenderDetails(sender, eventArgs) {
				var tenderId = document.getElementById('<%= HiddenField_TenderId.ClientID %>').value;
				//alert(tenderId);
				if (tenderId > 0) {
					var oWnd = window.radopen("EDILoadTenderDetails.aspx?tenderId=" + tenderId, "RadWindow_TenderDetails");
				}

				return false;
			}

			function HidingTenderDetails() {
			}

            function editor_resize() {
                try {
                    document.getElementById("divRouteSections").style.height = (window.innerHeight - 510) + "px";
                }
                catch (e) {
                    alert(e);
                }
            }

            function bottomPane_Resized(sender, args) {
                try {
                    var bottomPaneHeight = document.getElementById("RadpaneBottom").style.height;
                    document.getElementById("divRouteSections").style.height = (window.innerHeight - bottomPaneHeight) + "px";
                }
                catch (e) {
                    alert(e);
                }
            }

			function OpenLoadNotes() {
				var loadId = HiddenField_LoadId.value;
				if (loadId != "") {
					window.radopen("LoadNotes.aspx?type=load&loadid=" + loadId, "RadWindow_LoadNotes");
				}
				return false;
			}

            function openClientAddEdit(sender, args) {
				GetRadWindow().BrowserWindow.openClientManagement();
                args.set_cancel(true);
            }

            // Was playing with a Delete Dock confirmation. Will revisit if requirement surfaces.
            function RadDock_Client_Command(sender, args) {
                // dock.doPostBack('Close');

                //if (args.command == "Close") {
                //    args.set_cancel(true);
                //    //Set up the callback function - called on return of dialog 
                //    var callbackFn = function (arg) {
                //        if (arg) { //if dialog returned true, close the dock 
                //            dock.set_closed(true);
                //            dock.doPostBack('Close');
                //        }
                //    }
                //    //Call the confirm dialog 
                //    radconfirm('Are you sure you want to Delete this Stop?', callbackFn, 330, 100);
                //}
            }

            function refreshDocks() {
                // Cause postback in order to enable the Pick/Drop/LEG button postbacks.. for some reason after a stop is deleted, these buttons would be non responsive..
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(arguments);
            }

            function LoadPopulate() {
                // this is not working. When called from within the Pick.ascx control, the RadAjaxManager1 is null.

                console.log("LoadPopulate Executing");
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                console.log(ajaxManager);
                ajaxManager.ajaxRequest('LoadPopulate');
                console.log("LoadPopulate Executed");
            }

            function openAccCharges() {
                var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;

                //alert(LoadId);
                var oWnd = radopen("DispatchSheet_AccCharges.aspx?LoadId=" + LoadId + "&LoadStopId=0", "RadWindow_accCharges");

                //oWnd.setSize(1050, 500); // width, height
                //oWnd.set_minWidth(800);
                //oWnd.set_minHeight(300);
                //oWnd.set_destroyOnClose(true);
                //oWnd.set_visibleStatusbar(true);
                //oWnd.set_iconUrl("../../images/16x16/truck-icon_16.png");
                //oWnd.set_title("Charges");
                //oWnd.set_behaviors(
                //    Telerik.Web.UI.WindowBehaviors.Move +
                //    Telerik.Web.UI.WindowBehaviors.Resize +
                //    Telerik.Web.UI.WindowBehaviors.Close);
                //oWnd.add_close(RadWindow_accCharges_OnClientClose);
                //oWnd.center();
                //oWnd.set_modal(true);
            }

            function RadButton_AccCharges_Clicking(sender, args) {
                openAccCharges();
                args.set_cancel(true);
                return false;
            }

            function openStatusHistory() {
                var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;

                //alert(LoadId);
                var oWnd = radopen("DispatchSheet_StatusHistory.aspx?LoadId=" + LoadId, "RadWindow_LoadStatusHistory");

                oWnd.setSize(500, 300); // width, height
                oWnd.set_minWidth(500);
                oWnd.set_destroyOnClose(true);
                oWnd.set_visibleStatusbar(true);
                oWnd.set_iconUrl("../../images/16x16/truck-icon_16.png");
                oWnd.set_title("Load Status History");
                oWnd.set_behaviors(
                    Telerik.Web.UI.WindowBehaviors.Move +
                    Telerik.Web.UI.WindowBehaviors.Close +
                    Telerik.Web.UI.WindowBehaviors.Resize);
                oWnd.center();
                oWnd.set_modal(true);
            }

            function RadButton_FileManagement_Clicking(sender, args) {
                var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;
                openDispatchSheet_Files_In(LoadId);

                args.set_cancel(true);
                return false;
            }

            function openDispatchSheet_Files_In(LoadId) {
                //console.log("LoadId " + LoadId);
                var oWnd = radopen("DispatchSheet_Files2.aspx?LoadId=" + LoadId, "RadWindow_DispatchSheet_Files");

                oWnd.setSize(1000, 500); // width, height
                oWnd.set_minWidth(600);
                oWnd.set_minHeight(430);
                oWnd.set_destroyOnClose(true);
                oWnd.set_visibleStatusbar(true);
                oWnd.set_iconUrl("../../images/16x16/CompilableFile_16x.png");
                oWnd.set_title("Document Management");
                oWnd.set_behaviors(
                    Telerik.Web.UI.WindowBehaviors.Move +
                    Telerik.Web.UI.WindowBehaviors.Close +
                    Telerik.Web.UI.WindowBehaviors.Reload +
                    Telerik.Web.UI.WindowBehaviors.Resize);
                oWnd.add_close(RadWindow_DispatchSheet_Files_OnClientClose);
                oWnd.center();
                oWnd.set_modal(true);

                //oWnd.add_resizeEnd(OnWindowResizeEnd);
            }

            function RadButton_TraceNumber_Clicking(sender, args) {
                var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;
                openDispatchSheet_TraceNumbers_In(LoadId);

                args.set_cancel(true);
                return false;
            }

            function openDispatchSheet_TraceNumbers_In(LoadId) {
                //console.log("LoadId " + LoadId);
                var oWnd = radopen("DispatchSheet_TraceNumbers.aspx?LoadId=" + LoadId, "RadWindow_DispatchSheet_TraceNumbers");

                oWnd.setSize(600, 400); // width, height
                oWnd.set_destroyOnClose(true);
                oWnd.set_visibleStatusbar(true);
                oWnd.set_iconUrl("../../images/16x16/CompilableFile_16x.png");
                oWnd.set_title("Trace # Management");
                oWnd.set_behaviors(
                    Telerik.Web.UI.WindowBehaviors.Move +
                    Telerik.Web.UI.WindowBehaviors.Close +
                    Telerik.Web.UI.WindowBehaviors.Reload +
                    Telerik.Web.UI.WindowBehaviors.Resize);
                oWnd.add_close(RadWindow_DispatchSheet_Files_OnClientClose);
                oWnd.center();
                oWnd.set_modal(true);

                //oWnd.add_resizeEnd(OnWindowResizeEnd);
            }


            function RadButton_StatusHistory_Clicking(sender, args) {
                openStatusHistory();
                args.set_cancel(true);
                return false;
            }

            function RadWindow_accCharges_OnClientClose(sender, args) {
                // Refresh the ACC Total label
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                //ajaxManager.ajaxRequestWithTarget('<%= RadButton_RefreshACCTotal.UniqueID %>', '');
                ajaxManager.ajaxRequest("RefreshACCTotal");
            }

            function RadWindow_DispatchSheet_Files_OnClientClose(sender, args) {
                // Refresh the RadButton_FileManagement label
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest("RefreshFileCount");
            }

            function RadButton_Dispatch_Clicking(sender, args) {
                //args.set_cancel(!Page_ClientValidate("Dispatch"));
                args.set_cancel(!Page_ClientValidate(""));
            }

            function RadComboBox_Status_SelectedIndexChanging(sender, args) {
                // todo: Question to Al and team pending
                // Prevent skipping statuses (unless going straight to Cancel or coming from cancel)
                // get current status and compare with new status. If current status = 1 through 5

				var ToBeSelectedValue = args.get_item().get_value();

				//check if there are selected items in substatus box, is there? dont allow postback
				//status 'Awaiting Cust Appr' (9) can have sub-statuses selected
                var cmboSub = $find("RadComboBox_HoldSub");

				//alert(cmboSub);
				//alert(ToBeSelectedValue);

				if (cmboSub != null && ToBeSelectedValue != "9") {
					var checkedItems = cmboSub.get_checkedItems();

					if (checkedItems.length > 0)
					{
	                    radalert('Status may not be changed until all substatuses have been removed');
						sender.set_cancel(true);
					}
                }

				// Prevent "In Transit" Load Status change when Customer Load #, Weight, ACC Charges, or Rate is null
                if (ToBeSelectedValue == "4") {
                    <%--document.getElementById("<%= RequiredFieldValidator_Weight.ClientID %>").enabled = true;
                    var bValid = Page_ClientValidate("InTransit");--%>

                    var RadTextBox_CustomerLoadNumber = $find("RadTextBox_CustomerLoadNumber");
                    var RadNumericText_Weight = $find("RadNumericText_Weight");
					<%--var Label_ACCTotal = document.getElementById("<%= Label_ACCTotal.ClientID %>");--%>
                    var RadNumericTextBox_FlatRate = $find("RadNumericTextBox_FlatRate");

                    if (RadTextBox_CustomerLoadNumber.get_value() == "" || RadNumericText_Weight.get_value() == ""
                        || RadNumericTextBox_FlatRate.get_value() == "") {
                        radalert('Customer Load #, Weight, and Flat Rate are all required before you can change the status to In Transit!', "", "", 'Missing Fields!');
                        sender.set_cancel(true);
                    }
                }

                //if (ToBeSelectedValue == "6") //on hold
                //{
                //    document.getElementById("RadComboBox_HoldSub").style.display = "block";
                //}
                //else {
                //    document.getElementById("RadComboBox_HoldSub").style.display = "none";
                //}
            }

            function openDispatchSheetReport(LoadId, LoadStopId) {
				GetRadWindow().BrowserWindow.openDispatchSheetReport(LoadId, LoadStopId);
            }

            //function LEGNotes_OnClientLoad(editor, args) {
            //    // This is used by Notes on the DispatchSheet page as well as for each stop. 
            //    var element = editor.get_contentArea();
            //    $telerik.addExternalHandler(element, "blur", function (e) {
            //        SaveNotes("SaveLEGNotes");
            //    });

            //    preventTabbingOnRadEditorToolbarControls(editor);

            //    // Decided to just use Auto Save functionality triggered by the events above..
            //    //Telerik.Web.UI.Editor.CommandList["Save"] = function (commandName, editor, args) {
            //    //    // Do nothing. This is just to suppress the "The command Save is not implemented yet." message
            //    //};
            //}

            //function PickNotes_OnClientLoad(editor, args) {
            //    var element = editor.get_contentArea();
            //    $telerik.addExternalHandler(element, "blur", function (e) {
            //        SaveNotes("SavePickNotes");
            //    });

            //    preventTabbingOnRadEditorToolbarControls(editor);
            //}

            //function DropNotes_OnClientLoad(editor, args) {
            //    var element = editor.get_contentArea();
            //    $telerik.addExternalHandler(element, "blur", function (e) {
            //        SaveNotes("SaveDropNotes");
            //    });

            //    preventTabbingOnRadEditorToolbarControls(editor);
            //}

            //function FuelStopNotes_OnClientLoad(editor, args) {
            //    var element = editor.get_contentArea();
            //    $telerik.addExternalHandler(element, "blur", function (e) {
            //        SaveNotes("SaveFuelStopNotes");
            //    });

            //    preventTabbingOnRadEditorToolbarControls(editor);
            //}

            //function DispatchNotes_OnClientLoad(editor, args) {
            //    var element = editor.get_contentArea();
            //    $telerik.addExternalHandler(element, "blur", function (e) {
            //        SaveNotes("SaveDispatchNotes");
            //    });

            //    preventTabbingOnRadEditorToolbarControls(editor);
            //}

            function preventTabbingOnRadEditorToolbarControls(editor) {
                // Fix tab stop formatting and allow tabing through radeditor similar to other controls.
                // editor.get_contentArea().tabIndex = "30"; //set the tabIndex to the content area
                //disable the built-in InsertTab feature which inserts 4 empty spaces on Tab press like in MS Word
                //editor.removeShortCut("InsertTab");
                //editor.removeShortCut("InsertShiftTab");

                //disable tabbing through the toolbar buttons
                var buttonsHolder = $get(editor.get_id() + "Top"); //get a reference to the top toolbar zone of the editor
                var buttons = buttonsHolder.getElementsByTagName("A"); //get a reference to all A elements on the toolbar and disable the tabbing through them
                for (var i = 0; i < buttons.length; i++) {
                    var a = buttons[i];
                    a.tabIndex = -1;
                    a.tabStop = false;
                }
            }



            <%--function LEGNotes_OnClientCommandExecuted(editor, args) {
                switch (args.get_commandName()) {
                    case "Save":
                        // Cause postback to save notes. This will post back and raise RadAjaxManager1_AjaxRequest on this page as well as Manager_AjaxRequest in LEG user control
                        $find("<%= RadAjaxManager.GetCurrent(Page).ClientID %>").ajaxRequest("SaveLEG_Notes");
                        break;
                    default:
                }
            }--%>

            <%--function SaveNotes(NotesToSave) {
                // Cause postback to save notes. This will post back and raise RadAjaxManager1_AjaxRequest on this page as well as Manager_AjaxRequest in LEG user control
                $find("<%= RadAjaxManager.GetCurrent(Page).ClientID %>").ajaxRequest(NotesToSave);
            }--%>

            function CloseDock(dock, args) {
                // not in use
                args.set_cancel(true);

                var callbackFn = function (arg) {
                    if (arg) {
                        dock.doPostBack(args.Command.get_name());
                    }
                }

                radconfirm('Are you sure you want to remove this Stop?', callbackFn, 330, 100);
            }

            // Cause the combo box to dropdown when receiving focus, allowing instant typing to search.
            function OnClientFocusHandler(sender, eventArgs) {
                console.log(this);
                if (!sender.get_dropDownVisible()) {
                    sender.showDropDown();
                }
            }

            // Select the currently highlighted item when pressing Enter or tabbing out of the combo..
            function radComboKeyPress(comboBox, eventArgs) {
                console.log(this);
                var keyCode = eventArgs.get_domEvent().keyCode;
                if (keyCode == 9 || keyCode == 13) {
                    try {
                        comboBox.get_highlightedItem().select();
                    }
                    catch (err) {
                        return;
                    }
                }
            }

            function OpenClientEditForLoad() {
                window.setTimeout(function () {
                    var combo = $find("<%= RadComboBox_Customer.ClientID %>");
                    var SelectedValue = combo.get_value();
                    var SelectedText = combo.get_text();

                    OpenClientEditInMain(SelectedValue, SelectedText)
                }, 0);
                oWnd.setActive(true);
            }

            function OpenClientEditInMain(SelectedValue, SelectedText) {

                if (SelectedValue == "0")
					GetRadWindow().BrowserWindow.openClientManagement();
                else
					GetRadWindow().BrowserWindow.openClientEdit(SelectedValue, SelectedText);
            }

            function OpenDriver_1Edit() {
                var combo = $find("<%= RadComboBox_Driver1.ClientID %>");
                var Driver1Value = combo.get_value();
                var Driver1Text = combo.get_text();

                //GetRadWindow().BrowserWindow.openPersonEdit(1667, 'Dave', 'Baxter');
                OpenDriver_1EditInMain(Driver1Value, Driver1Text, Driver1Text);
            }

            function OpenDriver_1EditInMain(Driver1Value, Driver1Text, Driver1Text) {

                if (Driver1Value == "0")
					GetRadWindow().BrowserWindow.openPersonMaintenance();
                else
                    //GetRadWindow().BrowserWindow.openPersonEdit(1667, 'Dave', 'Baxter');
                    //GetRadWindow().BrowserWindow.openPersonEdit(SelectedValue, SelectedText);
					GetRadWindow().BrowserWindow.openPersonEdit(Driver1Value, Driver1Text, '');
            }

            function OpenDriver_2Edit() {
                var combo = $find("<%= RadComboBox_Driver2.ClientID %>");
                var Driver2Value = combo.get_value();
                var Driver2Text = combo.get_text();

                //GetRadWindow().BrowserWindow.openPersonEdit(1667, 'Dave', 'Baxter');
                OpenDriver_2EditInMain(Driver2Value, Driver2Text, Driver2Text);
            }

            function OpenDriver_2EditInMain(Driver2Value, Driver2Text, Driver2Text) {

                if (Driver2Value == "0")
					GetRadWindow().BrowserWindow.openPersonMaintenance();
                else
                    //GetRadWindow().BrowserWindow.openPersonEdit(1667, 'Dave', 'Baxter');
                    //GetRadWindow().BrowserWindow.openPersonEdit(SelectedValue, SelectedText);
					GetRadWindow().BrowserWindow.openPersonEdit(Driver2Value, Driver2Text, '');
            }

            //function OpenClientEditInMain(combo) {
            //    alert(combo);
            //    var SelectedValue = combo.get_value();
            //    var SelectedText = combo.get_text();

            //    if (SelectedValue == "0") 
            //        GetRadWindow().BrowserWindow.openClientManagement();
            //    else
            //        GetRadWindow().BrowserWindow.openClientEdit(SelectedValue, SelectedText);
            //}

            // prevent ESC key from doing anything  (not working in raddock)
            // window.addEventListener('keydown', function (e) { if (e.keyCode == 27) return false; });

            function OpenTruck() {

				GetRadWindow().BrowserWindow.openTruckManagement();
                //OpenDriver_2EditInMain(Driver2Value, Driver2Text, Driver2Text);
            }

            function OpenTrailer() {

				GetRadWindow().BrowserWindow.openTrailerManagement();
                //OpenDriver_2EditInMain(Driver2Value, Driver2Text, Driver2Text);
            }

            function CustomValidator_Temperature_ClientValidate(src, args) {
                /* If trailer type is REEFER DRY 6, Dry Van 1, & Power Only 5
                    * temp and mode are not required!
                */
                args.IsValid = true;

                var combo = $find("<%= RadComboBox_TrailerType.ClientID %>");
                var trailertype = combo.get_value();

                if (trailertype == "6" || trailertype == "5" || trailertype == "1")
                    args.IsValid = true;
                else {

                    // if Per BOL is checked, don't validate temp or temp type
                    var RadCheckBox_AllowPerBOL = $find("<%= RadCheckBox_AllowPerBOL.ClientID %>")
                    if (RadCheckBox_AllowPerBOL.get_checked() == true) {
                        args.IsValid = true;
                    }
                    else {
                        // require Temperature
                        var temp = $find("<%= RadNumericTextBox_Temperature.ClientID %>");
                        args.IsValid = (temp.get_value() != '');
                    }

                }
                console.log("TrailerType: " + trailertype);
                console.log("temperature: " + temp.get_value());
            }

<%--            function CustomValidator_TempEquipment_ClientValidate(src, args) {
                // Require temp and cycle for 53 Reefer Equipment Type.
                args.IsValid = true;
                var combo = $find("<%= RadComboBox_TrailerType.ClientID %>");
                var trailertype = combo.get_value();

                var temperature = $find("<%= RadNumericTextBox_Temperature.ClientID %>");
                console.log("trailertype " + trailertype);
                console.log("temperature " + temperature.get_value());
                if (trailertype == "2") // 53 Reefer
                    args.IsValid = (temperature.get_value() != '');

            }--%>

            function CustomValidator_TempModeEquipment_ClientValidate(src, args) {
                // alert(2);
                // Require temp and cycle for 53 Reefer Equipment Type.

                /* If trailer type is REEFER DRY 6, Dry Van 1, & Power Only 5
                    * temp and mode are not required! 
                */
                args.IsValid = true;
                var combo = $find("<%= RadComboBox_TrailerType.ClientID %>");
                var trailertype = combo.get_value();

                if (trailertype == "6" || trailertype == "5" || trailertype == "1")
                    args.IsValid = true;
                else {
                    alert(temp.get_value());
                    // if Per BOL is checked, don't validate temp or temp type
                    var RadCheckBox_AllowPerBOL = $find("<%= RadCheckBox_AllowPerBOL.ClientID %>")
                    if (RadCheckBox_AllowPerBOL.get_checked() == true) {
                        args.IsValid = true;
                    }
                    else {
                        // require TempMode (temp type)
                        var tempType = $find("<%= RadDropDownList_TempMode.ClientID %>");
                        args.IsValid = (tempType.get_selectedItem().get_value() != "0");
                    }
                }

                console.log("TrailerType: " + trailertype);
                console.log("temp type: " + tempType.get_selectedItem().get_value());
            }

            function CustomValidator_Drivers_ClientValidate(src, args) {
                // Ensure Driver1 and Drvier2 are unique
                var cboDriver1 = $find("<%= RadComboBox_Driver1.ClientID %>");
                var cboDriver2 = $find("<%= RadComboBox_Driver2.ClientID %>");

                var Driver1Index = cboDriver1.get_selectedIndex();
                var Driver2Index = cboDriver2.get_selectedIndex();
                var Driver1Val = cboDriver1.get_value();
                var Driver2Val = cboDriver2.get_value();

                if (Driver1Index == "0" || Driver2Index == "0")
                    args.IsValid = true;
                else
                    args.IsValid = (Driver1Val != Driver2Val);
            }

            function CloseMe2() {
                var LoadId = document.getElementById('<%= HiddenField_LoadId.ClientID %>').value;
				GetRadWindow().BrowserWindow.openDispatchSheet_LoadLockedViewer(LoadId);
                GetRadWindow().close();
            }

            function OnClientDragStart(dock, args) {
                //Get the dragged RadDock's UniqueName. 
                var uniqueName = dock.get_uniqueName();
                var hiddenInput = $get("draggedRadDockField");
                hiddenInput.value = uniqueName;
            }

            //Telerik.Web.UI.Editor.CommandList["Save"] = function (commandName, editor, oTool) {
            //    var noth;
            //}

            function SaveStopDrop() {
                // Cause postback to save stop. This will post back and raise RadAjaxManager1_AjaxRequest on this page as well as Manager_AjaxRequest in LEG user control
                $find("<%= RadAjaxManager.GetCurrent(Page).ClientID %>").ajaxRequest('SaveStopDrop');
            }

            function SaveStopPick() {
                // Cause postback to save stop. This will post back and raise RadAjaxManager1_AjaxRequest on this page as well as Manager_AjaxRequest in LEG user control
                $find("<%= RadAjaxManager.GetCurrent(Page).ClientID %>").ajaxRequest('SaveStopPick');
            }

			function HidingLoadNotes() {
			}

			function HidingStopNotes() {
			}

			//function HidingNoteAdd() {
			//}

            //Show Loading Panel when updating any control
            var currentLoadingPanel = null;
            var currentUpdatedControl = null;
            var LOAD_STOP_TARGET = 'HiddenField_StopToLoadNextOnPostback';
            function RequestStart(sender, eventArgs) {
                var eventTarget = eventArgs.get_eventTarget();
                if (eventTarget != null && eventTarget == LOAD_STOP_TARGET) {
                    currentLoadingPanel = $find("<%=RadAjaxLoadingPanel2.ClientID%>");
                } else {
                    currentLoadingPanel = $find("<%=RadAjaxLoadingPanel1.ClientID%>");
                }


                if (currentLoadingPanel != null) {
                    currentUpdatedControl = "<%= divMain.ClientID %>";
                    try {
                        currentLoadingPanel.show(currentUpdatedControl);
                    }
                    catch (err) {
                        alert(err.message);
                    }
                } else {
                    alert('didnt find loading page');
                }
            }
            function ResponseEnd() {
                //hide the loading panel and clean up the global variables
                if (currentLoadingPanel != null) {
                    currentLoadingPanel.hide(currentUpdatedControl);
                }
                currentUpdatedControl = null;
                currentLoadingPanel = null;
            }

        </script>
    </telerik:RadScriptBlock>
</body>
</html>
