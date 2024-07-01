<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="RedbonePlatform.Pages.Main1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%;">
<head runat="server">
    <%--RadSplitter which is 100% of the page and has margin applied--%>
    <%--https://www.telerik.com/support/kb/aspnet-ajax/splitter/details/radsplitter-which-is-100-of-the-page-and-has-margin-applied--%>
    <title></title>
	<link rel="apple-touch-icon" sizes="180x180" href="~/images/fav/apple-touch-icon.png" />
	<link rel="icon" type="image/png" sizes="32x32" href="~/images/fav/favicon-32x32.png" />
	<link rel="icon" type="image/png" sizes="16x16" href="~/images/fav/favicon-16x16.png" />
	<%--<link rel="manifest" href="~/images/fav/site.webmanifest" />--%>
	<link rel="mask-icon" href="~/images/fav/safari-pinned-tab.svg" color="#ff0000" />
	<link rel="shortcut icon" href="~/images/fav/favicon.ico" />
	<meta name="apple-mobile-web-app-title" content="Trucking Wizard" />
	<meta name="application-name" content="Trucking Wizard" />
	<meta name="msapplication-TileColor" content="#b91d47" />
	<meta name="msapplication-TileImage" content="~/images/fav/mstile-144x144.png" />
	<meta name="msapplication-config" content="~/images/fav/browserconfig.xml" />
	<meta name="theme-color" content="#feeded" />
	<script>
        if (window != window.top) window.top.location.href = window.location.href;
    </script>
	
	<script src="../Scripts/jquery-1.10.2.min.js"></script>
	<script src="../Scripts/jquery.signalR-2.2.2.min.js"></script>
	<script src="../SignalR/hubs"></script>
    <%--<script src="https://kit.fontawesome.com/6da34b9b23.js" crossorigin="anonymous"></script>--%>

    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <style type="text/css">
            html, body, form {
                height: 100%;
                margin: 0px;
                padding: 0px;
                overflow: hidden;
            }
            #RadSplitter_Main {
                margin-top: 75px;
            }
            div.RadRibbonBar .rrbButtonArea,
            div.RadRibbonBar .rrbButtonGroupIn,
            div.RadRibbonBar .rrbControlGroup {
                overflow: visible;
            }
			.rmGroup .rmGroup .rmText {
				margin: 0 0 0 -21px !important;
				padding: 0 54px 0 0px !important;
			}
			.RadMenu .rmGroup {
				background-image:none !important;
			}
			.RadMenu .rmGroup .rmLink .rmText { 
				text-align: left !Important;  
				padding-left:5px !Important;
				margin-left:2px !Important;  
			}
			.RadMenu .rmGroup .rmImage,
			.RadMenu .rmGroup .rmLeftImage {
				display: none;
			}
			.rmVertical {
				background-image: none!important;
			}
			.rmItem  .rmTemplate {
				padding-left:25px!important;
			}
			.rcbSlide { 
				z-index: 12000!important;
			}
			#divOpenTendersCount  {
				position: absolute;
				left: 230px;
				text-align: left;
				height: 0px;
				top: 25px;
				font-family: sans-serif;
				font-size: smaller;
				background-color: green!important;
			}
			#divOpenTendersCount label  {
				padding: 3px 3px 3px 3px!important;
				font-family: sans-serif;
				font-size: small;
				background-color: green!important;
				color: white;
			}
			#divOpenTendersCount label:hover {
				cursor: pointer;
			}
			#divExpiringTendersCount  {
				position: absolute;
				left: 345px;
				text-align: left;
				height: 0px;
				top: 25px;
				font-family: sans-serif;
				font-size: smaller;
				background-color: green!important;
			}
			#divExpiringTendersCount label  {
				padding: 3px 3px 3px 3px!important;
				font-family: sans-serif;
				font-size: small;
				background-color: green!important;
				color: white;
			}
			#divExpiringTendersCount label:hover {
				cursor: pointer;
			}

		</style>
	</telerik:RadCodeBlock>
</head>

<body style="height: 100%; margin: 0px;">
    <form id="form1" runat="server" style="height: 100%; margin: 0px">
        <asp:HiddenField ID="HiddenField_PersonId" runat="server" />
        <asp:HiddenField ID="HiddenField_AppLayoutId" runat="server" />
        <asp:HiddenField ID="HiddenField_AppLayoutId_ToLoad" runat="server" />
        <asp:HiddenField ID="HiddenField_AppLayoutJson" runat="server" />
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_AppLayoutId" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_AppLayoutId_ToLoad" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="HiddenField_AppLayoutJson" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="divOpenTendersCount" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="divExpiringTendersCount" UpdatePanelCssClass="" />
                        <telerik:AjaxUpdatedControl ControlID="lblOpenTendersCount" UpdatePanelCssClass="" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default" InitialDelayTime="1000" MinDisplayTime="500"></telerik:RadAjaxLoadingPanel>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>

        <div id="divTWLogo" style="position: absolute; left: 5px; text-align: left; height: 0px; top: 5px; font-family: sans-serif; z-index: 100;">
            <asp:Image ID="Image_TruckingWizard" runat="server" ImageUrl="~/images/tw-logo-dark.png" Height="40px" />
        </div>

		<div id="divOpenTendersCount" runat="server" onclick="openLoadManagement('tenders')"><label id="lblOpenTendersCount" runat="server"></label></div>
		<div id="divExpiringTendersCount" runat="server" onclick="openLoadManagement('tenders')"><label id="lblExpiringTendersCount" runat="server"></label></div>

        <div id="divTopLogo" style="position: relative; text-align: center; height: 0px; top: 7px; font-family: sans-serif; z-index: 100;">
            <asp:Image ID="Image_RedboneTrucking" runat="server" ImageUrl="~/images/internal-logo-crop.png" Height="40px" />
        </div>

        <div id="divRadMenu" style="position: relative; text-align: center; height: 0px; top: 48px; z-index: 10000; font-family: sans-serif;">
            <telerik:RadMenu ID="RadMenu_Lists" runat="server" Style="padding-left: 0px" RenderMode="Classic" IconColumnWidth="0px"
                OnClientItemClicked="RadMenu_Clicked">
                <Items>
                    <telerik:RadMenuItem Text="Operations"
                        Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Load Management" Value="LoadManagement" Style="padding-bottom: 2px" Font-Size="15px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Driver Manager" Font-Size="15px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Fuel" Font-Size="15px">
                                <Items>
                                    <telerik:RadMenuItem Text="Fuel Surcharge" Value="FuelSurcharge" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Fuel Import" Value="FuelImport" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="EDI Transactions" Value="EDITransactions" Style="padding-bottom: 2px" Font-Size="15px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Equipment" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Trailers" Value="Trailers" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Trucks" Value="Trucks" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Clients" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Client Management" Value="ClientManagement" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Vendors" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Vendor Management" Value="VendorManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Vendor Invoices" Value="LOInvoiceImport" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Payroll" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="FedEx" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="FedEx Import" Value="FedExSettlementImport"
                                        Style="padding-bottom: 2px" Font-Size="13px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="FedEx Review" Value="FedExPayroll"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="FedEx Processing"
                                        Value="PRSettlementProcessing"
                                        Style="padding-bottom: 2px" Font-Size="13px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="FedEx Pay"
                                        Value="PR_SettlementProcessing_SummaryReport"
                                        Style="padding-bottom: 2px" Font-Size="13px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="FedEx Revenue" Font-Size="13px">
                                        <Items>
                                            <telerik:RadMenuItem Text="Adjust Linehaul Revenue"
                                                Value="AdjustLinehaulRevenue"
                                                Style="padding-bottom: 2px" Font-Size="13px">
                                            </telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Adjust Spot Revenue"
                                                Value="AdjustSpotRevenue"
                                                Style="padding-bottom: 2px" Font-Size="13px">
                                            </telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem IsSeparator="true"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="FedEx Terminals" Value="TerminalsManagement" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="OTR" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="OTR Review" Value="OTRPayroll"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="OTR Summary" Value="DriverPaidMiles"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="OTR Pay" Value="OTRPay"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Time Clock"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                                <Items>
                                    <telerik:RadMenuItem Text="Time Clock" Value="Timeclock"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Time Clock Approvals" Value="TimeclockApprv"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                             
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Open Advances" Value="OpenAdvanceRec"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Human Resources"
                        Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Driver Point Mass Assignment"
                                Font-Size="13px" Value="DriverPointsMassAssignment"
                                Style="padding-bottom: 2px" Visible="false">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Pay Rates" Value="PayRates"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Pay Rates Master" Value="PayRatesMaster"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="People Management" Value="ManagePeople"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Employment History" Value="EmpHist"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Employment History Requests" Value="EmpHistReqs"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Trucking"
                        Font-Size="15px" Visible="false">
                        <Items>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Safety"
                        Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Calculate Monthly Safety Points" Value="DriverPointsMassAssignment"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                        
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Shop" Font-Size="15px"  Target="_blank">
                        <Items>
                            <telerik:RadMenuItem Text="Work Orders" Value="ServiceStatus"
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Part Assemblies" Value="PartAssembliesManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Parts Management" Value="PartsManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <%--<telerik:RadMenuItem Text="Logistics" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Loads" Value="LogisticsLoadStatus" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>--%>
                    <telerik:RadMenuItem Text="Recruiting"
                        Font-Size="15px">
                        <Items>
                          <telerik:RadMenuItem Text="Profile Management" Value="RecruitingProfile" 
                                Font-Size="13px"
                                Style="padding-bottom: 2px">
                              
                            </telerik:RadMenuItem>
                            </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Factoring" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Tracking Sheet" Value="FactoringTrackingSheet" Font-Size="13px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem IsSeparator="true"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Client Portal" Value="FactoringClientInvoices" Font-Size="13px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>


                    <telerik:RadMenuItem Text="Billing" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Load Billing" Value="LoadBilling" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="MoneyCode Modifications" Value="MoneyCodeModification" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Detention Request" Value="DetentionRequest" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>

                    <telerik:RadMenuItem Text="Reports"
                        Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Company" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Performance" Value="Performance" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
		                            <telerik:RadMenuItem Text="Truck Locations" Value="TruckLocations" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Owner Dashboard" Value="OwnerDashboardReport" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Driver Dashboard" Value="DriverDashboardReport" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Marketing Dashboard" Value="MarketingDashboardReport" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Owner="" Text="Usage Statistics" Value="UsageStatistics"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Owner="" Text="Entitlement Summary" Value="EntitlementSummary"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Owner="" Text="Entitlement By User" Value="EntitlementByUser"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Operations" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="MPG" Value="MPGReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Fuel Detail" Value="FuelDetailReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Target vs Actual" Value="TargetVsActual"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Pick Timing" Value="PickTiming"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Idle Percentages" Value="IdlePercentages"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Revenue by Unit" Value="RevenueUnit"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Fuel Export" Value="FuelExport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Miles Ranking" Value="MilesRanking"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Total Miles" Value="TotalMiles"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>                           
                                    <telerik:RadMenuItem Text="RPTPD-Report" Value="RPTPD"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem> 
                                    <telerik:RadMenuItem Text="Missing Fuel Surcharge" Value="MissingFSC"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                        <telerik:RadMenuItem Text="FedEx Data" Value="FedExDataReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                        <telerik:RadMenuItem Text="ACC Charges" Value="AccCharge"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                       <telerik:RadMenuItem Text="UnBilled Lumpers" Value="UnBilledLumpers"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem> 
                                    <telerik:RadMenuItem Text="Detention/Layover Audit" Value="DetentionLayover"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Reefer Temp Setting" Value="ReeferTemps"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="IFTA Gallons" Value="IFTAGallons" 
                                        Style="padding-bottom: 2px" Font-Size="13px">
                                    </telerik:RadMenuItem>


                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Equipment" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Truck Expirations" Value="TruckExpirations"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Clients" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Client Notes" Value="ClientNotes"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Client Fuel Margins" Value="ClientFuelMargins"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Client Types" Value="ClientTypes"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Vendors" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Lease Operators" Font-Size="13px">

                                        <Items>
                                            <telerik:RadMenuItem Text="Lease Operator Trips" Value="LeaseOperatorTrips"
                                                Font-Size="13px"
                                                Style="padding-bottom: 2px">
                                            </telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Pay Item Detail" Value="VendorAccountDetail"
                                                Font-Size="13px"
                                                Style="padding-bottom: 2px">
                                            </telerik:RadMenuItem> 
                                            <telerik:RadMenuItem Text="Open Advances" Value="VendorOpenAdvances"
                                                Font-Size="13px"
                                                Style="padding-bottom: 2px">
                                            </telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Payroll" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Driver Paid Miles Detail" Value="DriverPaidMilesDetail"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Driver Paid Miles OTR" Value="DriverPaidMilesOTR"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Payroll PTO" Value="PTOPayroll"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Person PTO" Value="PTOPerson"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Driver Pay Rates" Value="DriverPayRates"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="TimeClock Approvals" Value="TimeclockRpt"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="TimeClock Unapproved" Value="TimeclockRptU"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                     <telerik:RadMenuItem Text="Scheduled PTO" Value="ScheduledPTO"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem><telerik:RadMenuItem Text="Open Advances" Value="OpenAdvances"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Human Resources" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Employee Expirations" Value="EmployeeExpirations"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Employee List" Value="EmployeeListReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Employee Review" Value="EmployeeReviewReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Person Notes" Value="PersonNotes"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="PTO Anniversary" Value="PTOAnniversary"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Driver Licenses" Value="DriverLicense"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Quit Lists" Value="QuitList"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Safety" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Safety Points Recap" Value="SafetyPointsReport"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                          <telerik:RadMenuItem Text="CDL List" Value="cdlReport"
                                Style="padding-bottom: 2px">
                            </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Shop" Font-Size="13px" Target="_blank">
                                <Items>
                          
                                </Items>
                            </telerik:RadMenuItem>
                            <%--<telerik:RadMenuItem Text="Logistics" Font-Size="13px">
                                <Items>
                               </Items>
                            </telerik:RadMenuItem>--%>
                            <telerik:RadMenuItem Text="Recruiting" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Driver Rate Master" Value="DriverRateMaster"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Factoring" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Daily Factoring Advanced Amount" Value="FactoringAdvancedAmount"
                                        Font-Size="13px"
                                        Style="padding-bottom: 2px">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>

                    <telerik:RadMenuItem Text="Settings" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem Text="Company" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Owner="" Text="App Layout Management" Value="AppLayoutManagement"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="SkinManagement" Font-Size="13px" Style="padding-bottom: 2px;">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>Skin:</td>
                                                    <td>
                                                        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="True" Skin="Windows7"
                                                            OnSkinChanged="RadSkinManager_Main_SkinChanged" OnPreRender="RadSkinManager_Main_PreRender">
                                                        </telerik:RadSkinManager>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Business Entity Type" Value="BusinessEntityTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Division Type" Value="DivisionTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Operations" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Mileage Goals" Value="MileageGoals" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Commodity Types" Value="CommodityTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Charge Types" Value="ChargeTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Equipment" Font-Size="13px">
                                <Items>
											<telerik:RadMenuItem Text="Registrations" Value="Registrations" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
											<telerik:RadMenuItem Text="Service Intervals" Value="ServiceIntervals" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
											<telerik:RadMenuItem Text="Specifications" Value="Specifications" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Service Interval Unit" Value="ServiceIntervalUnit" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Specification Unit" Value="SpecificationUnit" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Make" Value="Make" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Model" Value="Model" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
											<telerik:RadMenuItem Text="Templates">
												<Items>
													<telerik:RadMenuItem Text="Registration" Value="RegistrationTemplate" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
		                                            <telerik:RadMenuItem Text="Service Intervals" Value="ServiceIntervalTemplate" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
				                                    <telerik:RadMenuItem Text="Specifications" Value="SpecificationTemplate" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
												</Items>
											</telerik:RadMenuItem>

                                    
                                </Items>
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Clients" Font-Size="13px">
                                <Items>
                                </Items>
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Vendors" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Vendor Types" Value="VendorTypes" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Vendor Document Types" Value="VendorDocumentTypes" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Vendor Pay Codes" Value="VendorPayCodes" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Payroll" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Employee Payroll Codes" Value="EmployeePayrollCodes" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Human Resources" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Availability Type" Value="AvailabilityTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Entitlements" Value="Entitlements" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Entitlement Groups" Value="EntitlementGroups" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Entitlement Groups Assign" Value="EntitlementGroupToEntitlement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Person Type Management" Value="PersonTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="PTO Type Management" Value="PTOTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Driver Pay Codes" Value="DriverPayCodes" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="QuitList Type Management" Value="QuitListTypesManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Safety" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Driver Point Types" Value="DriverPointTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                                <Items>
                                    <telerik:RadMenuItem Text="Certification Type" Value="CertificationTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Shop" Font-Size="13px" NavigateUrl="https://redbonetrucking.com/my-account" Target="_blank">
                                <Items>
                                     
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Logistics" Font-Size="13px">
                                <Items>
									<telerik:RadMenuItem Text="Settings" Value="LogisticsSettings" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Commodity Types" Value="CommodityTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Trailer Types" Value="TrailerTypeManagement" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                               <telerik:RadMenuItem Text="Recruiting" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Checklist Item Type" Value="CheckListItemType" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Commercial Equipment Type" Value="CommercialEquipmentType" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Commercial Work Type" Value="CommercialWorkType" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Lead Source" Value="LeadSource" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Moving Violation Charge" Value="MovingViolationCharge" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Position" Value="Position" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Profile Gender" Value="ProfileGender" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Profile Stage" Value="ProfileStage" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                     <telerik:RadMenuItem Text="Document Type" Value="DocumentType" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                     <telerik:RadMenuItem Text="Connectors" Value="RecConnectors" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Templates" Value="RecMsgTemplates" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Employers" Value="RecEmpContctTemplates" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                     <telerik:RadMenuItem Text="Event Triggers" Value="RecEvntTrigs" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                     <telerik:RadMenuItem Text="Event Actions" Value="RecEvntActs" Font-Size="13px" Style="padding-bottom: 2px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Factoring" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Settings" Value="FactoringSettings" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Submit Types" Value="SubmitTypesManagement" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Funding Types" Value="FundingTypesManagement" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="EDI" Font-Size="13px">
                                <Items>
                                    <telerik:RadMenuItem Text="Settings" Value="EDISettings" Style="padding-bottom: 2px" Font-Size="13px"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem Text="Help" Font-Size="15px">
                        <Items>
                            <telerik:RadMenuItem runat="server" Owner="" Text="Dispatch Documentation" Value="DispatchDocumentation"></telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Owner="" Text="Feature Requests" Value="Features"></telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Owner="" Text="Release Notes" Value="ReleaseNotes"></telerik:RadMenuItem>
                            <%--<telerik:RadMenuItem runat="server" Owner="" Text="Install QuickBooksSync" NavigateUrl="https://truckingwizard.com/Install/QuickBooksSync/publish.htm" Target="_blank"></telerik:RadMenuItem>--%>
                        </Items>
                    </telerik:RadMenuItem>
                </Items>
            </telerik:RadMenu>
        </div>
        <div style="position: relative; height: 0px; text-align: right; top: 7px; z-index: 1000; font-family: sans-serif; padding-right: 40px; z-index: 5010">
            <asp:Label ID="Label_User" runat="server" Text="User" Font-Size="Small"></asp:Label>
        </div>
        <div style="position: relative; height: 0px; text-align: right; top: 30px; z-index: 1000; font-family: sans-serif; padding-right: 40px; z-index: 5010">
            <asp:LinkButton ID="LinkButton_Logout" runat="server" Font-Size="9pt" OnClick="LinkButton_Logout_Click">Logout</asp:LinkButton>
        </div>
        <telerik:RadSplitter ID="RadSplitter_Main" runat="server" LiveResize="True" Width="100%"
            Height="100%" FullScreenMode="True" SplitBarsSize="" HeightOffset="55" ClientID="RadSplitter_Main">
            <telerik:RadPane ID="RadPane_Left" runat="server" Height="100%" Scrolling="Both" Width="250px" Collapsed="true">
                <telerik:RadTreeView ID="RadTreeView_Applications" runat="server"
                    TabIndex="1" EnableDragAndDrop="True"
                    OnClientNodeDropping="RadTreeView_Applications_NodeDropping"
                    OnClientDoubleClick="RadTreeView_Applications_DoubleClick"
                    OnClientContextMenuItemClicked="RadTreeView_Applications_ContextMenuItemClicked">
                    <ContextMenus>
                        <telerik:RadTreeViewContextMenu ID="RadTreeViewContextMenu_Customer" runat="server">
                            <Items>
                            </Items>
                        </telerik:RadTreeViewContextMenu>
                    </ContextMenus>
                    <Nodes>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Operations">
                            <Nodes>
                                <telerik:RadTreeNode Text="Load Management" Value="LoadManagement" runat="server"></telerik:RadTreeNode>
                                <%--<telerik:RadTreeNode Text="Loads" Value="LoadStatus" runat="server"></telerik:RadTreeNode>--%>
                                <telerik:RadTreeNode Text="Fuel Surcharge" Value="FuelSurcharge" runat="server"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="Fuel Import" Value="FuelImport" runat="server"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="FedEx Terminals" Value="TerminalsManagement" runat="server"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="Scheduling" Value="Scheduling" Font-Size="13px" runat="server"></telerik:RadTreeNode>
								<%--<telerik:RadTreeNode Text="Load Tenders" Value="EdiLoadTenders" Font-Size="13px" runat="server"></telerik:RadTreeNode>--%>
								<%--<telerik:RadTreeNode Text="Load Planner" Value="LoadPlanner" Font-Size="13px" runat="server"></telerik:RadTreeNode>--%>
								<%--<telerik:RadTreeNode Text="Pending Status Updates" Value="EdiPendingStatus" Font-Size="13px" runat="server"></telerik:RadTreeNode>--%>
								<telerik:RadTreeNode Text="Performance" Value="Performance" Font-Size="13px" runat="server"></telerik:RadTreeNode>
								<telerik:RadTreeNode Text="EDI Transactions" Value="EDITransactions" runat="server"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Equipment">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="Trailers" Value="Trailers"></telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="Trucks" Value="Trucks"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Clients">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Client Management" Value="ClientManagement"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Vendors">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Vendor Management" Value="VendorManagement"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Payroll">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Fedex">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Import" Value="FedExSettlementImport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Review" Value="FedExPayroll"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Processing" Value="PRSettlementProcessing"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Pay" Value="PR_SettlementProcessing_SummaryReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Linehaul Revenue" Value="AdjustLinehaulRevenue"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="FedEx Spot Revenue" Value="AdjustSpotRevenue"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="OTR">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="OTR Review" Value="OTRPayroll"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="OTR Summary" Value="DriverPaidMiles"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="OTR Pay" Value="OTRPay"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="Time Clock"
                                    Font-Size="13px"
                                    Style="padding-bottom: 2px">
                                <Nodes>
                                    <telerik:RadTreeNode Text="Time Clock" Value="Timeclock"></telerik:RadTreeNode>
                                    <telerik:RadTreeNode Text="Time Clock Approvals" Value="TimeclockApprv"></telerik:RadTreeNode>
                                </Nodes>
                            </telerik:RadTreeNode>

                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Human Resources">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="Pay Rates" Value="PayRates" Visible="true"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="Pay Rates Master" Value="PayRatesMaster"></telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="People Management" Value="ManagePeople"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Safety">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Calculate Monthly Safety Points" Value="DriverPointsMassAssignment"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Shop" Target="_blank">
                            <nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Work Orders" Value="ServiceStatus"></telerik:RadTreeNode>
                            </nodes>
                        </telerik:RadTreeNode>
                        <%--<telerik:RadTreeNode runat="server" Owner="" Text="Logistics"></telerik:RadTreeNode>--%>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Recruiting"></telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Factoring">
                            <Nodes>
                                <telerik:RadTreeNode Text="Tracking Sheet" Value="FactoringTrackingSheet" Font-Size="13px"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Text="Client Portal" Value="FactoringClientInvoices" Font-Size="13px"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Reports">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Company">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Driver Dashboard" Value="DriverDashboardReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Owner Dashboard" Value="OwnerDashboardReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Marketing Dashboard" Value="MarketingDashboardReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="Usage Statistics" Value="UsageStatistics"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="Entitlements" Value="Entitlements"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="Entitlement Summary" Value="EntitlementSummary"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="Entitlement By User" Value="EntitlementByUser"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Operations">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="MPG" Value="MPGReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Fuel Detail" Value="FuelDetailReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Target vs Actual" Value="TargetVsActual"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Pick Timing" Value="PickTiming"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Revenue by Unit" Value="RevenueUnit"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Fuel Export" Value="FuelExport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Miles Ranking" Value="MilesRanking"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Total Miles" Value="TotalMiles"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="RPTPD" NavigateUrl="https://10az.online.tableau.com/t/redbonetrucking/views/RPTPD_16511846942780/RPTPD_1?:origin=card_share_link&:embed=n" Target="contentFrame"></telerik:RadTreeNode>
                                      <telerik:RadTreeNode runat="server" Text="RPTPD-Report" Value="RPTPD"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Equipment">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Truck Expirations" Value="TruckExpirations"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Clients">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Client Notes" Value="ClientNotes"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Vendors">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="Lease Operators">
                                            <Nodes>
                                                <telerik:RadTreeNode runat="server" Text="Lease Operator Trips" Value="LeaseOperatorTrips"></telerik:RadTreeNode>
                                                <telerik:RadTreeNode runat="server" Text="Pay Item Detail" Value="VendorAccountDetail"></telerik:RadTreeNode>
                                            </Nodes>
                                        </telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Payroll">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Driver Paid Miles Detail" Value="DriverPaidMilesDetail"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Payroll PTO" Value="PTOPayroll"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Person PTO" Value="PTOPerson"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Driver Pay Rates" Value="DriverPayRates"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Time Clock Approvals" Value="TimeclockApprv"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Human Resources">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Employee Expirations" Value="EmployeeExpirations"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Employee List" Value="EmployeeListReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Employee Review" Value="EmployeeReviewReport"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="Person Notes" Value="PersonNotes"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="PTO Anniversary" Value="PTOAnniversary"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Driver Licenses" Value="DriverLicense"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Safety">
                                    <Nodes>
                                       <telerik:RadTreeNode runat="server" Text="Safety Points Recap" Value="SafetyPointsReport"></telerik:RadTreeNode>
                                    </Nodes>

                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Shop" NavigateUrl="https://redbonetrucking.com/my-account" Target="_blank"></telerik:RadTreeNode>
                                <%--<telerik:RadTreeNode runat="server" Owner="" Text="Logistics"></telerik:RadTreeNode>--%>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Recruiting">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Driver Rate Master" Value="DriverRateMaster"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Factoring">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Driver Rate Master" Value="FactoringAdvancedAmount"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                        <telerik:RadTreeNode runat="server" Owner="" Text="Settings">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Company">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Owner="" Text="App Layout Management" Value="AppLayoutManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Business Entity Types" Value="BusinessEntityTypeManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Division Types" Value="DivisionTypeManagement"></telerik:RadTreeNode>

                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Operations">
                                    <Nodes>
                                         <telerik:RadTreeNode Text="Mileage Goals" Value="MileageGoals"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Commodity Types" Value="CommodityTypeManagement"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Charge Types" Value="ChargeTypeManagement"></telerik:RadTreeNode>
                                   </Nodes>
                                 </telerik:RadTreeNode>


                                <telerik:RadTreeNode runat="server" Owner="" Text="Equipment">
                                    <Nodes>
                                         <telerik:RadTreeNode Text="Registrations" Value="Registrations"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="ServiceIntervals" Value="ServiceIntervals"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Specifications" Value="Specifications"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Service Interval Unit" Value="ServiceIntervalUnit"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Specification Unit" Value="SpecificationUnit"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Make" Value="Make"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Model" Value="Model"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Service Interval Template" Value="ServiceIntervalTemplate"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Registration Template" Value="RegistrationTemplate"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Specification Template" Value="SpecificationTemplate"></telerik:RadTreeNode>
<%--                                         <telerik:RadTreeNode Text="Trailer Specification Template" Value="TrailerSpecificationTemplate"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Trailer Service Interval Template" Value="TrailerServiceIntervalTemplate"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Trailer Registration Template" Value="TrailerRegistrationTemplate"></telerik:RadTreeNode>--%>
                                         <telerik:RadTreeNode Text="Goal Unit Description" Value="GoalUnitDescription" Visible="false"></telerik:RadTreeNode>
                                   </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Clients"></telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Vendors">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Vendor Types" Value="VendorTypes"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Vendor Document Types" Value="VendorDocumentTypes"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Vendor Pay Codes" Value="VendorPayCodes"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Payroll">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Employee Payroll Codes" Value="EmployeePayrollCodes"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Human Resources">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Availability Type" Value="AvailabilityTypeManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Entitlements" Value="Entitlements"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Entitlement Groups" Value="EntitlementGroups"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Entitlement Groups Assign" Value="EntitlementGroupToEntitlement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Person Type Management" Value="PersonTypeManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="PTO Type Management" Value="PTOTypeManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Driver Pay Codes" Value="DriverPayCodes"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="QuitList Type Management" Value="QuitListTypesManagement"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Safety">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Driver Point Types" Value="DriverPointTypeManagement"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Certification Type" Value="CertificationTypeManagement"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Shop" NavigateUrl="https://redbonetrucking.com/my-account" Target="_blank"></telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Logistics">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Settings" Value="LogisticsSettings" Visible="true"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Commodity Types" Value="CommodityTypeManagement"></telerik:RadTreeNode>
                                         <telerik:RadTreeNode Text="Trailer Types" Value="TrailerTypeManagement"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Recruiting"></telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="Factoring">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Settings" Value="FactoringSettings" Visible="true"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Submit Types" Value="SubmitTypesManagement" Visible="true"></telerik:RadTreeNode>
                                        <telerik:RadTreeNode Text="Funding Types" Value="FundingTypesManagement" Visible="true"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Owner="" Text="EDI">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="Settings" Value="EDISettings" Visible="true"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                    </Nodes>
                </telerik:RadTreeView>
            </telerik:RadPane>
            <telerik:RadSplitBar ID="RadSplitBar_Vertical" runat="server" EnableResize="True" Enabled="True" CollapseMode="Both">
            </telerik:RadSplitBar>
            <telerik:RadPane ID="RadPane_Right" runat="server" Height="100%" Scrolling="Both">
                <telerik:RadContextMenu ID="RadContextMenu_TabStrip" runat="server" OnClientItemClicked="RadContextMenu_TabStrip_ItemClicked">
                    <Targets>
                        <telerik:ContextMenuControlTarget ControlID="RadPane_Right" />
                    </Targets>
                    <Items>
                        <telerik:RadMenuItem runat="server" Value="saveLayout" Text="Save this App Layout">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="tile" Text="Tile Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="cascade" Text="Cascade Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="minimizeAll" Text="Minimize All Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="restoreAll" Text="Restore All Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="closeAll" Text="Close All Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="pinAll" Text="Pin all Windows">
                        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" Value="unpinAll" Text="Unpin all Windows">
                        </telerik:RadMenuItem>
                    </Items>
                </telerik:RadContextMenu>
            </telerik:RadPane>
        </telerik:RadSplitter>

		<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script src="../Scripts/Main.js?version=35"></script>
            
            <script>

				$("#divOpenTendersCount").on("click", function () {
					//alert("Open Tenders");
					openLoadManagement('tenders');
				});

				$("#divExpiringTendersCount").on("click", function () {
					//alert("Expiring Tenders");
					openLoadManagement('tenders');
				});

                function openVendorEdit(VendorId, VendorName) {

                    var oWnd = radopen("../Pages/ContainerPages/VendorEdit.aspx?VendorId=" + VendorId + "&VendorName=" + VendorName, "VendorEdit");
                    // Cast to RadWindow for intellisense
                    // oWnd = $telerik.toWindow(oWnd);

                    // Used to use browser dimensions duh now using the RadPane_Right dimensions which is less calculating and is the actual container
                    //  windows are going in
                    //var brwsrHeight = window.innerHeight
                    //    || document.documentElement.clientHeight
                    //    || document.body.clientHeight;

                    //var brwsrWidth = window.innerWidth
                    //    || document.documentElement.clientWidth
                    //    || document.body.clientWidth;

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                    // Set height
                    if (paneHeight >= 1020)
                        oWnd.set_height(1000);
                    else
                        oWnd.set_height(paneHeight - 20);

                    // set width
                    if ((paneWidth) >= 1420)

                        oWnd.set_width(1400);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);

                    oWnd.set_iconUrl("../images/16x16/User_16x.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }

                function openPersonEdit(PersonId, FirstName, LastName) {
                    window.setTimeout(function () {
                        var oWnd = radopen("../Pages/ContainerPages/PersonEdit.aspx?PersonId=" + PersonId + "&FirstName=" + FirstName + "&LastName=" + LastName, PersonId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(800);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1500 - 20);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);
                }

                function openRecruitProfileEdit(ProfileId, PersonName,openComs) {
                    window.setTimeout(function () {

                        var url = "";
                        if (openComs) {
                            url = "../Pages/ContainerPages/Recruiting_ProfileEdit.aspx?ProfileId=" + ProfileId + "&PersonName=" + PersonName + "&OpenComs=true"
                        }
                        else {
                            url =  "../Pages/ContainerPages/Recruiting_ProfileEdit.aspx?ProfileId=" + ProfileId + "&PersonName=" + PersonName
                        }
                        var oWnd = radopen(url, ProfileId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(1100);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);
                   
                }


                function OpenPersEmpHistWindowDets(PersonId, HistId) {
                    window.setTimeout(function () {

                        var url = "";

                        url = "../Pages/ContainerPages/PersonEdit_EmploymentHistory.aspx?PersonId=" + PersonId + "&EmpHistoryId=" + HistId;

                        var oWnd = radopen(url, "RadWindow_Rec_persEmp_" + PersonId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(900);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        // oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);

                 }

                function OpenPersEmpHistWindowCreate(PersonId) {
                    window.setTimeout(function () {

                        var url = "";

                        url = "../Pages/ContainerPages/PersonEdit_EmploymentHistory.aspx?PersonId=" + PersonId + "&Create=true";

                        var oWnd = radopen(url, "RadWindow_Rec_persEmp_" + PersonId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(900);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        // oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);

                  }


                function OpenPersEmpHistWindow(PersonId) {
                    window.setTimeout(function () {

                        var url = "";

                        url = "../Pages/ContainerPages/PersonEdit_EmploymentHistory.aspx?PersonId=" + PersonId;

                        var oWnd = radopen(url, "RadWindow_Rec_persEmp_" + PersonId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(900);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        // oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);

                }


                function openRecruitProfileVOE(ProfileId) {
                    window.setTimeout(function () {

                        var url = "";
                      
                        url = "../Pages/ContainerPages/Recruiting_Profile_VOE.aspx?ProfileId=" + ProfileId;
                      
                        var oWnd = radopen(url, "RadWindow_Rec_Voe_" + ProfileId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(1100);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                       // oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);

                  }




                function openRecruitProfilePersn(PersonId) {
                    window.setTimeout(function () {

                        var url = "";

                        url = "../Pages/ContainerPages/PersonEdit.aspx?PersonId=" + PersonId;

                        var oWnd = radopen(url, "RadWindow_Rec_Prsn_" + PersonId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(1100);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(1165);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        // oWnd.add_beforeClose(OnClientBeforeClose_PersonEdit);
                        oWnd.setActive(true);
                    }, 0);

                  }



                function openRecruitQuickApp(ProfileId) {
                    window.setTimeout(function () {
                        var oWnd = radopen("../Pages/ContainerPages/Recruiting_QuickApp_Detail.aspx?QuickAppId=" + ProfileId, ProfileId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(500);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1150)

                            oWnd.set_width(760);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.setActive(true);
                    }, 0);

                 }


                function openPUnitEdit(PUnitId, Unit_ID, EquipTypeId) {
                    window.setTimeout(function () {
                        var oWnd = radopen("../Pages/ContainerPages/Equipment_PUnitEdit.aspx?PUnitId=" + PUnitId + "&Unit_ID=" + Unit_ID + "&EquipTypeId=" + EquipTypeId, PUnitId);
                        //var oWnd = radopen("../Pages/ContainerPages/PersonEdit.aspx?PersonId=" + PersonId + "&FirstName=" + FirstName + "&LastName=" + LastName, PersonId);
                        //var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/Trucks_Management.aspx?PUnitId=" + PUnitId, PUnitId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(600);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1380)

                            oWnd.set_width(1380 - 20);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Reload +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.add_beforeClose(OnClientBeforeClose_PUnitEdit);
                        oWnd.setActive(true);
                    }, 0);
                }

<%--                function openTrailerEdit(TrailerId, Trailer_ID) {
                    window.setTimeout(function () {
                        var oWnd = radopen("../Pages/ContainerPages/Equipment_TrailerEdit.aspx?TrailerId=" + TrailerId + "&Trailer_ID=" + Trailer_ID, TrailerId);
                        //var oWnd = radopen("../Pages/ContainerPages/PersonEdit.aspx?PersonId=" + PersonId + "&FirstName=" + FirstName + "&LastName=" + LastName, PersonId);
                        //var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/Trucks_Management.aspx?TrailerId=" + TrailerId, TrailerId);
                        // Cast to RadWindow for intellisense
                        // oWnd = $telerik.toWindow(oWnd);

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                        // Set height
                        if (paneHeight >= 500)
                            oWnd.set_height(600);
                        else
                            oWnd.set_height(paneHeight - 20);

                        // set width
                        if ((paneWidth) >= 1380)

                            oWnd.set_width(1380 - 20);
                        else
                            oWnd.set_width(paneWidth - 20);

                        //oWnd.setSize(1150, 480);
                        //oWnd.setSize(1500, 800);
                        //oWnd.set_minWidth(1150);
                        //oWnd.set_minHeight(480);

                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Reload +
                            Telerik.Web.UI.WindowBehaviors.Pin);

                        oWnd.set_iconUrl("../images/16x16/User_16x.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.add_beforeClose(OnClientBeforeClose_TrailerEdit);
                        oWnd.setActive(true);
                    }, 0);
                }--%>

                function openAppLayoutManager(arg) {
                    var PersonId = document.getElementById('<%= HiddenField_PersonId.ClientID%>').value;
                    var AppLayoutId = document.getElementById('<%= HiddenField_AppLayoutId.ClientID%>').value;
                    if (AppLayoutId == "") AppLayoutId = "0";

                    var oWnd;

                    if (arg == undefined || arg == "")
                        oWnd = radopen("../Pages/ContainerPages/AppLayoutManager.aspx?PersonId=" + PersonId, "4");
                    else
                        oWnd = radopen("../Pages/ContainerPages/AppLayoutManager.aspx?PersonId=" + PersonId + "&AppLayoutId=" + AppLayoutId, "4");

                    oWnd.setSize(600, 250);
                    //Cast to RadWindow for intellisense
                    //oWnd = $telerik.toWindow();

                    oWnd.set_title("App Layout Management");
                    oWnd.set_iconUrl("../images/16x16/ApplicationGroup_16x.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }

                function openAdjustLinehaulRevenue() {
                    var oWnd = radopen("../Pages/ContainerPages/FedEx_Linehaul_Revenue.aspx", "RadWindow101");
                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(800);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1500)

                        oWnd.set_width(1500);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("Adjust Linehaul Revenue");
                    //oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function openAdjustSpotRevenue() {
                    var oWnd = radopen("../Pages/ContainerPages/FedEx_Spot_Revenue.aspx", "RadWindow102");
                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(800);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1500)

                        oWnd.set_width(1500);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("Adjust Spot Revenue");
                    //oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }


                function openTruckManagement() {
                    //var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/Trucks_Management.aspx", "RadWindow26");
                    var oWnd = radopen("../Pages/ContainerPages/Equipment_PUnitMaintenance.aspx", "RadWindow26");
                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(800);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1800)

                        oWnd.set_width(1800);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("Truck Management");
                    //oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

				function openTruckLocations() {
                    var oWnd = radopen("../Pages/ContainerPages/EquipmentLocation.aspx", "RadWindowTruckLocations");
                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();

                    oWnd.set_height(paneHeight - 30);
                    oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("Truck Locations");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function openTrailerManagement() {
                    var oWnd;
                    window.setTimeout(function () {
                        oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/Trailer_Management.aspx", "RadWindow27");
                        //oWnd = radopen("../Pages/ContainerPages/Equipment_TrailerMaintenance.aspx", "RadWindow27");

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                        // Set height
                        if (paneHeight >= 830)
                            oWnd.set_height(800);
                        else
                            oWnd.set_height(paneHeight - 30);

                        // set width
                        if ((paneWidth) >= 1220)

                            oWnd.set_width(1200);
                        else
                            oWnd.set_width(paneWidth - 20);

                        oWnd.set_title("Trailer Management");
                        oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Reload +
                            Telerik.Web.UI.WindowBehaviors.Pin);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                    }, 0);

                    return oWnd;
                }

                function openTrailerManagementTest() {
                    var oWnd;
                    window.setTimeout(function () {
                        //oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/Trailer_Management.aspx", "RadWindow27");
                        oWnd = radopen("../Pages/ContainerPages/Equipment_TrailerMaintenance.aspx", "RadWindow27");

                        // Get the RadPane_Right dimensions and fit the RadWindow in it
                        var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                        var pane = splitter.getPaneById("RadPane_Right");
                        var paneWidth = pane.get_width();
                        var paneHeight = pane.get_height();
                        // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                        // Set height
                        if (paneHeight >= 830)
                            oWnd.set_height(800);
                        else
                            oWnd.set_height(paneHeight - 30);

                        // set width
                        if ((paneWidth) >= 1220)

                            oWnd.set_width(1200);
                        else
                            oWnd.set_width(paneWidth - 20);

                        oWnd.set_title("Trailer Management");
                        oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                        oWnd.set_destroyOnClose(true);
                        oWnd.set_restrictionZoneID("RadPane_Right");
                        oWnd.set_minimizeZoneID("RadPane_Right");
                        oWnd.set_visibleStatusbar(false);
                        oWnd.set_behaviors(
                            Telerik.Web.UI.WindowBehaviors.Minimize +
                            Telerik.Web.UI.WindowBehaviors.Maximize +
                            Telerik.Web.UI.WindowBehaviors.Move +
                            Telerik.Web.UI.WindowBehaviors.Close +
                            Telerik.Web.UI.WindowBehaviors.Resize +
                            Telerik.Web.UI.WindowBehaviors.Reload +
                            Telerik.Web.UI.WindowBehaviors.Pin);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                    }, 0);

                    return oWnd;
                }

                function openMileageGoals() {
                    //var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/MileageGoals_Management.aspx", "RadWindow35");
                    var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/MileageGoals.aspx", "RadWindow35");

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                    oWnd.set_height(460);
                    oWnd.set_width(325);

                    oWnd.set_title("Mileage Goals");
                    oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
					oWnd.center();
					oWnd.setActive(true);
                    return oWnd;
                }

                function openPayRates() {
                    var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/PayRates_Management.aspx", "RadWindow39");

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(800);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1020)

                        oWnd.set_width(1000);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("PayRates");
                    oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function openPayRatesMaster() {
                    var oWnd = radopen("../Pages/ContainerPages/LookupDataManagement/PayRatesMaster_Management.aspx", "RadWindow71");

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(800);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1020)

                        oWnd.set_width(1000);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("PayRatesMaster");
                    oWnd.set_iconUrl("../images/16x16/truck-icon_24.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function AppLayout_Save(AppLayoutId) {
                    var oManager = GetRadWindowManager();
                    var windows = oManager.get_windows();
                    var wdw;
					var oWindows = [];

					//alert('AppLayout_Save');

                    // Create a Json Object
                    var AppLayout = {
                        "AppLayoutId": AppLayoutId,
                        "Apps": []
                    };

                    // Add array of windows to AppLayout.windows array
                    for (var i = 0; i < windows.length; i++) {
                        wdw = windows[i];
                        var bounds = wdw.getWindowBounds();
                        var oWin = {
                            AppName: wdw.get_name(),
                            AppTopPos: bounds.y,
                            AppLeftPos: bounds.x,
                            AppWidth: bounds.width,
                            AppHeight: bounds.height,
                            AppPinned: wdw.isPinned()
                        };
                        AppLayout.Apps.push(oWin);
                    }

                    JsonStr = JSON.stringify(AppLayout);

                    // Save json to hidden field to be used by server code
                    document.getElementById('<%=HiddenField_AppLayoutJson.ClientID %>').value = JsonStr;


                    // Save AppLayout on server..
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest("SaveAppLayout");
                }

                function AppLayout_Load(AppLayoutId) {
                    // Save the AppLayoutId to Load on server
                    document.getElementById('<%=HiddenField_AppLayoutId.ClientID %>').value = AppLayoutId;

                    // Close all open RadWindows except for the App Layout Manager and any other windows that aren't managed by the App Layout Manager..
                    var oManager = GetRadWindowManager();
                    var windows = oManager.get_windows();
                    var wdw;
                    var wdwName = "";
                    var oWindows = [];

					//alert('AppLayout_Load');
					//alert(AppLayoutId);

                    // Add windows to close to oWindows array
                    for (var i = 0; i < windows.length; i++) {
                        wdw = windows[i];
                        wdwName = wdw.get_name();
                        //if ((wdwName.indexOf('RadWindow') != -1) || wdwName == "4")
                        if (wdwName.indexOf('RadWindow') != -1)
                            oWindows.push(wdwName);
                    }

                    // Close the RadWindows based on their names in oWindows array (couldn't just close them in the loop above because closing a RadWindow effects the RadWindow collection)
                    for (var i in oWindows) {
                        oManager.getWindowById(oWindows[i]).close();
                    }
                    // Load AppLayout on server..
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest("LoadAppLayout");
                }

                function AppLayout_DoTheLoad() {
                    var sJson = document.getElementById("<%=HiddenField_AppLayoutJson.ClientID %>").value;
                    var AppLayout = JSON.parse(sJson);
                    var App;
                    var oWnd;
					var bWindowFound = false;

					//alert('AppLayout_DoTheLoad');
					//alert(sJson);

                    // Loop through Apps in AppLayout object and open each one
                    for (var index in AppLayout.Apps) {
                        bWindowFound = false;
                        //alert("App Name: " + AppLayout.Apps[index].AppName);
                        App = AppLayout.Apps[index];

                        // The number at the end of RadWindow is used to lookup the AppId from the AppDefinition table and needs to correspond to a record in that table.
                        // Also, the corresponding RadWindow needs to be named accordinlgy
                        switch (App.AppName) {
                            case "RadWindow1":
                                oWnd = openPersonMaintenance();
                                bWindowFound = true;
                                break;
                            case "RadWindow2":
                                oWnd = openUsageStatistics();
                                bWindowFound = true;
                                break;
                            case "RadWindow3":
                                oWnd = openReleaseNotes();
                                bWindowFound = true;
                                break;
                            case "RadWindow5":
                                oWnd = openCertificationTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow6":
                                oWnd = openPersonTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow7":
                                oWnd = openDivisionTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow8":
                                oWnd = openBusinessEntityTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow9":
                                oWnd = openAvailabilityTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow10":
                                oWnd = openDriverPointTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow11":
                                oWnd = openDriverPointsMassAssignment();
                                bWindowFound = true;
                                break;
                            case "RadWindow12":
                                oWnd = openClientManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow13":
                                oWnd = openFuelSurchargeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow14":
                                oWnd = openLoadStatus();
                                bWindowFound = true;
                                break;
                            case "RadWindow15":
                                oWnd = openGoogleDoc();
                                bWindowFound = true
                                break;
                            case "RadWindow16":
                                oWnd = openVendorManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow17":
                                oWnd = openRedboneTruckingQuickApp();
                                bWindowFound = true
                                break;
                            case "RadWindow18":
                                oWnd = openKSLQuickApp();
                                bWindowFound = true
                                break;
                            case "RadWindow19":
                                oWnd = openQuickAppLogs();
                                bWindowFound = true
                                break;
                            case "RadWindow20":
                                oWnd = openRedboneTruckingContactRequests();
                                bWindowFound = true
                                break;
                            case "RadWindow21":
                                oWnd = openTenstreetLeadsPlatformDocumention();
                                bWindowFound = true
                                break;
                            case "RadWindow22":
                                oWnd = openVendorDocumentTypeManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow23":
                                oWnd = openFuelImport();
                                bWindowFound = true
                                break;
                            case "RadWindow24":
                                oWnd = openVendorPayCodeManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow25":
                                oWnd = openDriverPayCodeManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow26":
                                oWnd = openTruckManagement();
                                bWindowFound = true
                                break;
                            case "RadWindowTruckLocations":
                                oWnd = openTruckLocations();
                                bWindowFound = true
                                break;
                            case "RadWindow27":
                                oWnd = openTrailerManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow28":
                                oWnd = openDriverPaidMilesReport();
                                bWindowFound = true
                                break;
                            case "RadWindow29":
                                oWnd = openMPGReport();
                                bWindowFound = true
                                break;
                            case "RadWindow30":
                                oWnd = openReportViewer_EmployeeExpirations();
                                bWindowFound = true
                                break;
                            case "RadWindow31":
                                oWnd = openLeaseOperatorTripsReport();
                                bWindowFound = true
                                break;
                            case "RadWindow32":
                                oWnd = openFuelDetailReport();
                                bWindowFound = true
                                break;
                            case "RadWindow33":
                                oWnd = openReportViewer_TargetVsActual();
                                bWindowFound = true
                                break;
                            case "RadWindow34":
                                oWnd = openEmployeeListReport();
                                bWindowFound = true
                                break;
                            case "RadWindow35":
                                oWnd = openMileageGoals();
                                bWindowFound = true
                                break;
                            case "RadWindow36":
                                oWnd = openReportViewer_TruckExpirations();
                                bWindowFound = true
                                break;
                            case "RadWindow37":
                                oWnd = openDriverPaidMilesDetailReport();
                                bWindowFound = true
                                break;
                            case "RadWindow38":
                                oWnd = openDriverPayRatesReport();
                                bWindowFound = true
                                break;
                            case "RadWindow39":
                                oWnd = openPayRates();
                                bWindowFound = true
                                break;
                            case "RadWindow40":
                                oWnd = openEmployeeReviewReport();
                                bWindowFound = true
                                break;
                            case "RadWindow41":
                                oWnd = openSafetyPointsReport();
                                bWindowFound = true
                                break;
                            case "RadWindow42":
                                oWnd = openQuitListTypesManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow43":
                                oWnd = openFedExSettlementImport();
                                bWindowFound = true;
                                break;
                            case "RadWindow44":
                                oWnd = openTerminalsManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow45":
                                oWnd = openFedExPayrollReport();
                                bWindowFound = true
                                break;
                            case "RadWindow46":
                                oWnd = openOTRPayrollReport();
                                bWindowFound = true
                                break;
                            case "RadWindow47":
                                oWnd = openPTOTypeManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow48":
                                oWnd = openPTOPayrollReport();
                                bWindowFound = true;
                                break;
                            case "RadWindow49":
                                oWnd = openPTOPersonReport();
                                bWindowFound = true;
                                break;
                            case "RadWindow50":
                                oWnd = openOTRPersonReport();
                                bWindowFound = true
                                break;
                            case "RadWindow51":
                                oWnd = openDriverDashboardReport();
                                bWindowFound = true
                                break;
                            case "RadWindow52":
                                oWnd = openPickTimingReport();
                                bWindowFound = true
                                break;
                            case "RadWindow53":
                                oWnd = openPayRollProcessing();
                                bWindowFound = true
                                break;
                            case "RadWindow54":
                                oWnd = openOwnerDashboardReport();
                                bWindowFound = true
                                break;
                            case "RadWindow55":
                                oWnd = openClientNotesReport();
                                bWindowFound = true
                                break;
                            case "RadWindow56":
                                oWnd = openPR_SettlementProcessing_SummaryReport();
                                bWindowFound = true
                                break;
                            case "RadWindow57":
                                oWnd = openMarketingDashboardReport();
                                bWindowFound = true
                                break;
                            case "RadWindow58":
                                oWnd = openPR_SettlementProcessing_ExceptionsReport();
                                bWindowFound = true
                                break;
                            case "RadWindow59":
                                oWnd = openEntitlementGroupsManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow60":
                                oWnd = openEntitlementGroupToEntitlementManagement();
                                bWindowFound = true
                                break;
							case "RadWindow61":
								oWnd = openFactoringTrackingSheet();
								bWindowFound = true
                                break;
							case "RadWindow_Factoring_Settings":
								oWnd = openFactoringSettings();
								bWindowFound = true
                                break;
							case "RadWindow_EDI_Settings":
								oWnd = openEDISettings();
								bWindowFound = true
                                break;
							case "RadWindow_Logistics_Settings":
								oWnd = openLogisticsSettings();
								bWindowFound = true
                                break;
							case "RadWindowLoadTenders":
								oWnd = openEdiLoadTenders();
								bWindowFound = true
                                break;
							case "RadWindowLoadPlanner":
								oWnd = openLoadPlanner();
								bWindowFound = true
                                break;
							case "RadWindowPendingStatus":
								oWnd = openEdiPendingStatus();
								bWindowFound = true
                                break;
							case "RadWindowPerformance":
								oWnd = openPerformance();
								bWindowFound = true
                                break;
                            case "RadWindow62":
                                oWnd = openScheduling();
                                bWindowFound = true
                                break;
							case "RadWindow63":
								oWnd = openSubmitTypesManagement();
								bWindowFound = true
								break;
							case "RadWindow64":
								oWnd = openFundingTypesManagement();
								bWindowFound = true
								break;
                            case "RadWindow65":
                                oWnd = openIdlePercentages();
                                bWindowFound = true
                                break;
							case "RadWindow66":
								oWnd = openFactoringClientInvoices();
								bWindowFound = true
                                break;
                            case "RadWindow67":
                                oWnd = openDriverDailyRateManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow68":
                                oWnd = openRevenueUnitReport();
                                bWindowFound = true;
                            case "RadWindow69":
                                oWnd = openPersonNotes();
                                bWindowFound = true
                                break;
                            case "RadWindow70":
                                oWnd = openFuelExportReport();
                                bWindowFound = true
                                break;
                            case "RadWindow71":
                                oWnd = openPayRatesMaster();
                                bWindowFound = true
                                break;
                            case "RadWindow72":
                                oWnd = openDriverRateMaster();
                                bWindowFound = true
                                break;
                            case "RadWindow73":
                                oWnd = openPTOAnniversary();
                                bWindowFound = true
                                break;
                            case "RadWindow74":
                                oWnd = openCompanyEdit();
                                bWindowFound = true;
                                break;
                            case "Radwindow75":
                                oWnd = openVendorAccountDetailReport();
                                bWindowFound = true;
                                break;
                            case "RadWindow76":
                                oWnd = openClientFuelMarginsReport();
                                break;
                            case "RadWindow77":
                                oWnd = openEmployeePayrollCodes();
                                break;
                            case "RadWindow78":
                                oWnd = openMilesRankingReport();
                                bWindowFound = true
                                break;
                            case "RadWindow79":
                                oWnd = openEntitlementSummaryReport();
                                bWindowFound = true
                                break;
                            case "RadWindow80":
                                oWnd = openEntitlementByUserReport();
                                bWindowFound = true
                                break;
                            case "RadWindow81":
                                oWnd = openCommodityTypeManagement();
                                bWindowFound = true
                                break;
                            case "windowTrailerManagement":
                                oWnd = openTrailerTypeManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow82":
                                oWnd = openTimeclock();
                                bWindowFound = true
                                break;
                            case "RadWindow83":
                                oWnd = openTimeClockApproval();
                                bWindowFound = true
                                break;
                            case "RadWindow84":
                                oWnd = openOTRPay();
                                bWindowFound = true
                                break;
                            case "RadWindow85":
                                oWnd = openEntitlementsManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow86":
                                oWnd = openChargeTypeManagement();
                                bWindowFound = true
                                break;
                            case "RadWindow89":
                                oWnd = openFactoringAdvancedAmount();
                                bWindowFound = true
                                break;
                            case "RadWindow90":
                                oWnd = openRegistrations();
                                bWindowFound = true;
                                break;
                            case "RadWindow91":
                                oWnd = openServiceIntervals();
                                bWindowFound = true;
                                break;
                            case "RadWindow92":
                                oWnd = openSpecifications();
                                bWindowFound = true;
                                break;
                            case "RadWindow93":
                                oWnd = openServiceIntervalUnit();
                                bWindowFound = true;
                                break;
                            case "RadWindow94":
                                oWnd = openSpecificationUnit();
                                bWindowFound = true;
                                break;
                            case "RadWindow95":
                                oWnd = openServiceStatus();
                                bWindowFound = true;
                                break;
                            case "RadWindow96":
                                oWnd = openServiceOrder();
                                bWindowFound = true;
                                break;
                            case "RadWindow97":
                                oWnd = openServiceIntervalTemplate();
                                bWindowFound = true;
                                break;
                            case "RadWindow98":
                                oWnd = openDriverLicense();
                                bWindowFound = true
                                break;
                            case "RadWindow99":
                                oWnd = openGoalUnit();
                                bWindowFound = true;
                                break;
                            case "RadWindow100":
                                oWnd = openRegistrationTemplate();
                                bWindowFound = true;
                                break;
                            case "RadWindow101":
                                oWnd = openAdjustLinehaulRevenue();
                                bWindowFound = true;
                                break;
                            case "RadWindow102":
                                oWnd = openAdjustSpotRevenue();
                                bWindowFound = true;
                                break;
                            case "RadWindow103":
                                oWnd = openRPTPDReport();
                                bWindowFound = true
                                break;
                            case "RadWindow104":
                                oWnd = openSpecificationTemplate();
                                bWindowFound = true;
                                break;
                            case "RadWindow105":
                                oWnd = openTotalMilesReport();
                                bWindowFound = true
                                break;
                            //case "RadWindow106":
                            //    oWnd = openTrailerRegistrations();
                            //    bWindowFound = true;
                            //    break;
                            //case "RadWindow107":
                            //    oWnd = openTrailerServiceIntervals();
                            //    bWindowFound = true;
                            //    break;
                            //case "RadWindow108":
                            //    oWnd = openTrailerSpecifications();
                            //    bWindowFound = true;
                            //    break;
                            //case "RadWindow109":
                            //    oWnd = openTrailerSpecificationTemplate();
                            //    bWindowFound = true;
                            //    break;
                            //case "RadWindow110":
                            //    oWnd = openTrailerRegistrationTemplate();
                            //    bWindowFound = true;
                            //    break;
                            //case "RadWindow111":
                            //    oWnd = openTrailerServiceIntervalTemplate();
                            //    bWindowFound = true;
                            //    break;
                            case "RadWindow112":
                                oWnd = openPartAssemblies();
                                bWindowFound = true;
                                break;
                            case "RadWindow113":
                                oWnd = openPartAssemblyDetail();
                                bWindowFound = true;
                                break;
                            case "RadWindow114":
                                oWnd = openMake();
                                bWindowFound = true;
                                break;
                            case "RadWindow115":
                                oWnd = openModel();
                                bWindowFound = true;
                                break;
                            case "RadWindow116":
                                oWnd = openPartsManagement();
                                bWindowFound = true;
                                break;
                            case "RadWindow117":
                                oWnd = openWorkOrderRpt();
                                bWindowFound = true;
                                break;
                            case "LoadBillingWindow":
                                oWnd = openLoadBilling();
                                bWindowFound = true;
                                break;
                            case "LoadManagementWindow":
                                oWnd = openLoadManagement();
                                bWindowFound = true;
                                break;
                            case "EDITransactionsWindow":
								oWnd = openEDITransactions();
                                bWindowFound = true;
                                break;
                            case "RadWindow118":
                                oWnd = openClientTypes();
                                bWindowFound = true;
                                break;
                            case "RadWindow119":
                                oWnd = opencdlReport();
                                bWindowFound = true;
                                break;
                            case "RadWindow120":
                                oWnd = openMissingFSCReport();
                                bWindowFound = true;
                                break; 
                            case "RadWindow120":
                                oWnd = openFedExDataReport();
                                bWindowFound = true;
                                break; 
                            case "RadWindow121":
                                oWnd = openAccCharges();
                                bWindowFound = true;
                                break;
                            case "RadWindow123":
                                oWnd = openUnbilledLumpers();
                                bWindowFound = true;
                                break; 
                            case "RadWindow124":
                                oWnd = openDetentionLayover();
                                bWindowFound = true;
                                break;
                            case "RadWindow125":
                                oWnd = openMoneyCodeModification();
                                bWindowFound = true;
                                break;                       
                            case "RadWindow130":
                                oWnd = openReeferTemps();
                                bWindowFound = true;
                                break;
                            case "RadWindow128":
                                oWnd = openScheduledPTO();
                                bWindowFound = true;
                                break;
                            case "RadWindow129":
                                oWnd = openAdvances();
                                bWindowFound = true;
                                break;
                            case "RadWindow130":
                                oWnd = VendorOpenAdvances();
                                bWindowFound = true;
                                break;
                            case "RadWindow131":
                                oWnd = OpenAdvanceRec();
                                bWindowFound = true;
                                break;
                            case "RadWindow132":
                                oWnd = OpenRequest();
                                bWindowFound = true;
                                break;
                            case "RadWindow133":
                                oWnd = LOInvoiceImport(); 
                                bWindowFound = true;
                                break;
                            case "RadWindow134":
                                oWnd = DriverPaidMilesOTR();
                                bWindowFound = true;
                                break;
							default:

	                        //Add to main.AppDefinition
                        }

                        if (bWindowFound) {
                            // alert("isPinned: " + oWnd.isPinned());
                            //oWnd.set_width(App.AppWidth);
                            //oWnd.set_height(App.AppHeight);
                            oWnd.setSize(App.AppWidth, App.AppHeight);

                            // oWnd.set_left(App.AppLeftPos);
                            // oWnd.set_top(App.AppTopPos);
                            oWnd.moveTo(App.AppLeftPos, App.AppTopPos);
                            if (App.AppPinned & oWnd.isPinned() == 0)
                                oWnd.togglePin();
                        }
                    }
                }

                function openTestPage() {
                    var oWnd = radopen("../Pages/ContainerPages/testPage.aspx", "RadWindowTestPage");  
                    oWnd.setSize(300, 300);
                    // Cast to RadWindow for intellisense
                    // oWnd = $telerik.toWindow();

                    oWnd.set_title("Test Page");
                    oWnd.set_iconUrl("../images/16x16/ImportFile_16x.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function CollapseRadPane_Left() {
                    // Hide RadPane_Left which contains the RadTreeView menu
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Left");
                    pane.collapse(2);
                    //splitter.set_width(0);
                }

                function openDriverDashboardReport() {

                    var sURI = "../Reports/ReportViewer_DriverDashboard.aspx";
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow51");

                    // Hide RadPane_Left which contains the RadTreeView menu
                    //CollapseRadPane_Left();

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();

                    oWnd.setSize(paneWidth, paneHeight); // width, height

                    oWnd.set_destroyOnClose(true);
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                    oWnd.set_title("Driver Dashboard Report");
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Resize);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }

                function openDriverRateMaster() {

                    var sURI = "../Reports/ReportViewer_DriverRateMaster.aspx";
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow72");

                    // Hide RadPane_Left which contains the RadTreeView menu
                    //CollapseRadPane_Left();

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();

                    oWnd.setSize(paneWidth, paneHeight); // width, height

                    oWnd.set_destroyOnClose(true);
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                    oWnd.set_title("Driver Rate Master");
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Resize);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }

                function openFactoringAdvancedAmount() {

                    var sURI = "../Reports/ReportViewer_FactoringAdvancedAmount.aspx";
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow89");

                    oWnd.setSize(700, 500);

                    oWnd.set_destroyOnClose(true);
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                    oWnd.set_title("Factoring Advanced Amount");
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Resize);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }


                function openOwnerDashboardReport() {

                    var sURI = "../Reports/ReportViewer_OwnerDashboard.aspx";
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow54");

                    // Hide RadPane_Left which contains the RadTreeView menu
                    //CollapseRadPane_Left();

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();

                    oWnd.setSize(paneWidth, paneHeight); // width, height

                    oWnd.set_destroyOnClose(true);
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                    oWnd.set_title("Owner Dashboard Report");
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Resize);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                }

                function openMarketingDashboardReport() {

                    var sURI = "../Reports/ReportViewer_MarketingDashboard.aspx";
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow54");

                    // Hide RadPane_Left which contains the RadTreeView menu
                    //CollapseRadPane_Left();

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                                    var pane = splitter.getPaneById("RadPane_Right");
                                    var paneWidth = pane.get_width();
                                    var paneHeight = pane.get_height();

                                    oWnd.setSize(paneWidth, paneHeight); // width, height

                                    oWnd.set_destroyOnClose(true);
                                    oWnd.set_visibleStatusbar(false);
                                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                                    oWnd.set_title("Marketing Dashboard Report");
                                    oWnd.set_behaviors(
                                        Telerik.Web.UI.WindowBehaviors.Move +
                                        Telerik.Web.UI.WindowBehaviors.Close +
                                        Telerik.Web.UI.WindowBehaviors.Reload +
                                        Telerik.Web.UI.WindowBehaviors.Resize);
                                    oWnd.set_restrictionZoneID("RadPane_Right");
                                    oWnd.set_minimizeZoneID("RadPane_Right");
                                    oWnd.set_visibleStatusbar(false);
                                    oWnd.moveTo(0, getNextAvailWinTopPos());
                                }

                function openPayRollProcessing() {
                    var oWnd = radopen("../Pages/ContainerPages/PRPayrollProcessing.aspx", "RadWindow53");

                    var splitter = $find("<%= RadSplitter_Main.ClientID %>"); 
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                                            
                    // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                    if (paneWidth >= 1380)
                        oWnd.set_width(1410); // width, height
                    else {
                        oWnd.set_width(paneWidth - 20); // width, height
                    }

                    if (paneHeight >= 1130)
                        oWnd.set_height(1115); // height
                    else
                        oWnd.set_height(paneHeight - 20); // height

                    oWnd.set_title("FedEx Processing");
                    oWnd.set_iconUrl("../images/16x16/truck-icon_16.png");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                    //oWnd.add_resizeEnd(OnWindowResizeEnd);

                    return oWnd;
                }


                function openOTRPay() {
                    var oWnd = radopen("../Pages/ContainerPages/PRPayrollProcessing_OTR.aspx", "RadWindow84");

                    var splitter = $find("<%= RadSplitter_Main.ClientID %>"); 
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();

                    // alert("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);

                    if (paneWidth >= 1380)
                        oWnd.set_width(1410); // width, height
                    else {
                        oWnd.set_width(paneWidth - 20); // width, height
                    }

                    if (paneHeight >= 1130)
                        oWnd.set_height(1115); // height
                    else
                        oWnd.set_height(paneHeight - 20); // height

                    oWnd.set_title("OTR Pay Processing");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.moveTo(0, getNextAvailWinTopPos());
                    //oWnd.add_resizeEnd(OnWindowResizeEnd);

                    return oWnd;
                }


                function openOTRPayReport(StartDt, ThroughDt) {
                    var sURI = "../Reports/ReportViewer_OTRPay.aspx?StartDate=" + StartDt + "&ThroughDate=" + ThroughDt;
                    // alert(sURI);
                    var oWnd = radopen(sURI, "RadWindow_OTRPayReport");

                    // oWnd.setSize(980, 1000); // width, height

                    // Get the RadPane_Right dimensions and fit the RadWindow in it
                    var splitter = $find("<%= RadSplitter_Main.ClientID %>");
                    var pane = splitter.getPaneById("RadPane_Right");
                    var paneWidth = pane.get_width();
                    var paneHeight = pane.get_height();
                    // console.log("paneWidth: " + paneWidth + " paneHeight: " + paneHeight);


                    // Set height
                    if (paneHeight >= 830)
                        oWnd.set_height(900);
                    else
                        oWnd.set_height(paneHeight - 30);

                    // set width
                    if ((paneWidth) >= 1020)

                        oWnd.set_width(1400);
                    else
                        oWnd.set_width(paneWidth - 20);

                    oWnd.set_title("OTR Pay Processing");
                    oWnd.set_destroyOnClose(true);
                    oWnd.set_restrictionZoneID("RadPane_Right");
                    oWnd.set_minimizeZoneID("RadPane_Right");
                    oWnd.set_visibleStatusbar(false);
                    oWnd.set_behaviors(
                        Telerik.Web.UI.WindowBehaviors.Minimize +
                        Telerik.Web.UI.WindowBehaviors.Maximize +
                        Telerik.Web.UI.WindowBehaviors.Move +
                        Telerik.Web.UI.WindowBehaviors.Close +
                        Telerik.Web.UI.WindowBehaviors.Resize +
                        Telerik.Web.UI.WindowBehaviors.Reload +
                        Telerik.Web.UI.WindowBehaviors.Pin);
                    oWnd.moveTo(0, getNextAvailWinTopPos());

                    return oWnd;
                }

                function openPdfViewer(filePath, id = 0, showEmailButton = true) {
                    window.setTimeout(function () {
						//alert(filePath);
						var oWnd = radopen("../Pages/ContainerPages/PdfViewer.aspx?file=" + filePath + "&id=" + id + "&showemailbutton=" + showEmailButton);

						// Get the RadPane_Right dimensions and fit the RadWindow in it
						var splitter = $find("<%= RadSplitter_Main.ClientID %>");
						var pane = splitter.getPaneById("RadPane_Right");
						var paneWidth = pane.get_width();
						var paneHeight = pane.get_height();

						// Set height
						if (paneHeight >= 665)
							oWnd.set_height(665);
						else
							oWnd.set_height(paneHeight - 20);

						// set width
						if ((paneWidth) >= 900)
							oWnd.set_width(900);
						else
							oWnd.set_width(paneWidth - 20);

						oWnd.set_behaviors(
							Telerik.Web.UI.WindowBehaviors.Minimize +
							Telerik.Web.UI.WindowBehaviors.Maximize +
							Telerik.Web.UI.WindowBehaviors.Move +
							Telerik.Web.UI.WindowBehaviors.Close +
							Telerik.Web.UI.WindowBehaviors.Resize +
							Telerik.Web.UI.WindowBehaviors.Pin);

						oWnd.set_iconUrl("../images/16x16/pdf-icon-16x16.png");
						oWnd.set_destroyOnClose(true);
						oWnd.set_restrictionZoneID("RadPane_Right");
						oWnd.set_minimizeZoneID("RadPane_Right");
						oWnd.set_visibleStatusbar(false);
                        oWnd.moveTo(0, getNextAvailWinTopPos());
                        oWnd.center();
						oWnd.setActive(true);
					}, 0);
				}

                function RadMenu_Clicked(sender, args) {
                    OpenAppBasedOnNodeValue(args.get_item().get_value());
                    setTimeout(function () {
                        sender.close();//close the menu
                    }, 0);
                }

               
                function pageLoad() {
                    // For testing and ease of access.  Ensure all are commented out for production release
                    //openKSLQuickApp();
                    //openAdditionsDeductionsEdit(1, 1);
                    //openDispatchSheet(4399);
                    //openClientEdit(1, '#1S');
                    //openFuelImport();
                    //openDispatchSheet(5511);
                    //openReleaseNotes('333');
                    //openDispatchSheet_LoadLockedViewer(6513);
                    //openDispatchSheet_Files(5511);
                    //openDispatchSheet_Files2(6513);
                    //openTrailerManagement();
                    //openTruckManagement();
                    //openDispatchSheet_TraceNumbers(61);
                    //openVendorPayCodeManagement();
                    //openVendorEdit(3, 'ALEXUS TRUCKING, LLC');
                    //openTestPage();
                    //openLeaseOperatorSettlementStatement('3', '2021-02-23', '2021-03-02');
                    //openDispatchSheet(81);
                    //openVendorEdit(98, 'BLUE GOOSE TRANSPORTATION, LLC');
                    //openLeaseOperatorSettlementStatement('96', '2021-03-9', '2021-03-11');
                    //openDispatchSheetReport(87);
                    // openDriverPaidMilesReport();
                    //openCrystalReportPOC();
                    //openReportViewer_EmployeeExpirations();
                    // openLeaseOperatorTripsReport();

                    // openClientEdit(7328, 'A&T TRANSPORTATION LLC');
                    // openDailyFuelReport('A&T1000', '2021-04-15', '2021-04-21');
                    // openDispatchSheet(664);
                    /*
                      openDispatchSheet(957);
                     */
                    //  openClientEdit(4412, 'NORPAC FOODS');
                    // openClientEdit(786, 'AUTOLIV CENTRAL LOGISTICS');
                    // comment from desktop
                    // comment from laptop
                      // openDispatchSheet(670);
                    //openPayRates();
                    //openLeaseOperatorSettlementStatement('3', '2021-06-23', '2021-06-30');
                    // openDispatchSheet(1320);
                    // openLeaseSettlementFuel(97, '06/16/2021', '6/22/2021');

                    //openLeaseSettlementFuel(23, '06/16/2021', '6/22/2021');
                    //openPersonEdit(1667, 'Dave', 'Baxter');
                //    openPersonEdit(1081, 'JEFFREY', 'ABRAMS');
                 //   openPayRates();
                    //openPRPayrollProcessing_Edit(0);
                     // openDriverDashboardReport();
                    // openVendorEdit(3, '');
                    // openPR_SettlementProcessing_SummaryReport();
                //    openPersonEdit(1074, '', '');
                     // openDispatchSheet(2734);
                      // openPayRollProcessing();
                     //openFedExSettlementImport();
                    // openFedExPayrollReport();
                    // openClientManagement();
                //    openClientEdit(1, '#1S');
                    //openChargeType_management;
                    //openLoadStatus();
                     // openDispatchSheet(3909);
                    //openPersonEdit(8, 'AL C', 'Jones');
                     // openPersonEdit(1323, 'Aaron', 'Kofoed');


                     // openDispatchSheet(5250); // Auto Rated with extra Stop
                    //openDispatchSheet(4232);
                    //openPersonEdit(73, 'Norris', 'John');
                     // openVendorEdit(103, 'DEEJAY LOGISTICS, LLC');
                     // openVendorEdit(100, 'CLEAR SKY ENTERPRISE, LLC');
                //    openPersonEdit(2146, 'Gregg', 'Ronda');
                    //openServiceOrder(2069);

                //    openDispatchSheet(5846);
                //    openVendorEdit(470, 'RABAR Industries, LLC');
                //    openPersonEdit(1794, 'Jones', 'Allen');
                    //openPartAssemblies();
                    //openPartAssemblyDetail();
                    //openPartsManagement();
					//window.radopen("ContainerPages/LoadNotes.aspx?type=stop&loadid=119");
					//window.radopen("ContainerPages/StopNotes.aspx?type=load&loadid=119");
                }

				$(function () {
					var notifs = $.connection.notificationHub;

					//function that the hub can call to refresh the tenders list view
					notifs.client.RefreshTenderCount = function () {
						//var cnt = $find("<%= lblOpenTendersCount.ClientID %>");
						var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
						ajaxManager.ajaxRequest("UpdateTenderCount");
						//cnt.innerHTML = "";
					};

					notifs.client.ExpiringTenders = function () {
						var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
						ajaxManager.ajaxRequest("UpdateExpiringCount");
					};

					notifs.client.RefreshExpiringCount = function () {
						var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
						ajaxManager.ajaxRequest("UpdateExpiringCount");
					};

					$.connection.hub.start().done(function () {
						notifs.server.joinGroup("tendercount");
						notifs.server.joinGroup("expiringtendercount");
					});
				});

                document.addEventListener("DOMContentLoaded", function () {
                    const params = new Proxy(new URLSearchParams(window.location.search), {
                        get: (searchParams, prop) => searchParams.get(prop),
                    });
                    // Get the value of "some_key" in eg "https://example.com/?some_key=some_value"
                    let value = params.RecrtPassId; // "some_value"
                    let nameValue = params.RecrtPassName;
                    if (value != null)
                    {
                        openRecruitProfileEdit(value, nameValue,true)
                    }

                });

			</script>
        </telerik:RadCodeBlock>
    </form>

</body>
</html>
    