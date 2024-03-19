﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Telerik.Web.UI;
using System.Text.Json;
using System.Data;
using RedbonePlatform.Datasets.dsPayrollTableAdapters;
using iText.Kernel.Pdf.Filters;
using System.Threading;
using static QRCoder.PayloadGenerator;

namespace RedbonePlatform.Pages.ContainerPages
{
    public partial class PayrollOTR : System.Web.UI.Page
    {
        private Classes.Auth auth = null;
        static String BTN_TEXT_LOCK = "LOCK";
        static String BTN_TEXT_UNLOCK = "UNLOCK";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Authorization
            auth = (Classes.Auth)Session["Auth"];
            if (auth == null)
            {
                Response.Redirect("~/Default.aspx?ShowLogin=true", true);
                return;
            }
            else
            {
                if (!auth.Entitlements.Contains(1200))
                {
                    Response.Redirect("~/AccessDenied.aspx", true);
                    return;
                }
            }

            if (!Page.IsPostBack)
            {
                auth.LogUsageStatistic(Classes.Auth.UsageStatisticType.AccessedFuelImport);
                ApplyUserSettings();

                LoadForm();

            }
        }

        private void ApplyUserSettings()
        {
            // Set RibbonBar Skin 
            if (Session["GlobalSkin"] is null) Session["GlobalSkin"] = "Black";
            RadSkinManager1.Skin = Session["GlobalSkin"].ToString();
        }

        private void LoadForm()
        {
            Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter payrollOTRPayPeriodAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter();
            Datasets.dsPayroll.PayrollOTRPayPeriodRow activePayPer = payrollOTRPayPeriodAdapter.GetData().Where(pp => pp.IsActive == true).FirstOrDefault();

            //gerneral
            RadLabelFY.Text = activePayPer.FY;
            RadLabelNumber.Text = activePayPer.Number;
            RadLabelCode.Text = activePayPer.Code;
            RadLabelBeginDate.Text = activePayPer.BeginDate.ToString("MM/dd/yy HH:mm");
            RadLabelEndDate.Text = activePayPer.EndDate.ToString("MM/dd/yy HH:mm");
            RadLabelCheckDate.Text = activePayPer.CheckDate.ToString("MM/dd");

            //pay
            if (!activePayPer.IsTotalEarningsAmountNull()) RadLabelTotalEarningsAmount.Text = string.Format("{0:C2}", activePayPer.TotalEarningsAmount);
            if (!activePayPer.IsTotalOtherpayrollitemsAmountNull()) RadLabelTotalOtherpayrollitemsAmount.Text = string.Format("{0:C2}", activePayPer.TotalOtherpayrollitemsAmount);
            if (!activePayPer.IsTotalHeldAmountNull()) RadLabelTotalHeldAmount.Text = string.Format("{0:C2}", activePayPer.TotalHeldAmount);

            //leave
            if (!activePayPer.IsUTOTotalDaysAccrualNull()) RadLabelUTOTotalDaysAccrual.Text = activePayPer.UTOTotalDaysAccrual.ToString("#,##0");
            if (!activePayPer.IsUTOTotalDaysValueNull()) RadLabelUTOTotalDaysValue.Text = string.Format("{0:C2}", activePayPer.UTOTotalDaysValue);

            //OTR
            if (!activePayPer.IsTotalMilesNull()) RadLabelTotalMiles.Text = activePayPer.TotalMiles.ToString("#,##0");
            if (!activePayPer.IsTotalMilesValueNull()) RadLabelTotalMilesValue.Text = string.Format("{0:C2}", activePayPer.TotalMilesValue);
            if (!activePayPer.IsTotalDriverPayAmountNull()) RadLabelTotalDriverPayAmount.Text = string.Format("{0:C2}", activePayPer.TotalDriverPayAmount);

            Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter payrollOTRStatusAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter();
            Datasets.dsPayroll.PayrollOTRStatusDataTable payrollOTRStatusTable = payrollOTRStatusAdapter.GetData();
            Datasets.dsPayroll.PayrollOTRStatusRow ppStatus = payrollOTRStatusTable.FindByPayrollOTRStatusId(activePayPer.PayrollOTRStatusId);
            RadLabelPayrollOTRStatus.Text = ppStatus.ShortDescription;

            RadListViewSteps.DataSource = getJsonUserStepsDataSources(activePayPer);
            RadListViewSteps.DataBind();

            setButtonStates(ppStatus.Name);

            RadLabeldataRefreshPopup.Text = "0";
            RadLabeRefreshDataAll.Text = "0";
            RadLabeRefreshDataDriverPay.Text = "0";
            RadLabeRefreshDataLoad.Text = "0";
        }

        protected List<string> getJsonUserStepsDataSources(Datasets.dsPayroll.PayrollOTRPayPeriodRow activePayPer)
        {
            Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter payrollOTRStatusAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter();
            Datasets.dsPayroll.PayrollOTRStatusDataTable payrollOTRStatusTable = payrollOTRStatusAdapter.GetData();
            Datasets.dsPayroll.PayrollOTRStatusRow ppStatus = payrollOTRStatusTable.FindByPayrollOTRStatusId(activePayPer.PayrollOTRStatusId);

            return JsonSerializer.Deserialize<List<string>>(ppStatus.UserStepsJson);
        }

        protected void setButtonStates(string state)
        {
            switch (state)
            {
                case "NOTOPENED":
                    radBtnOTRPR_LockData.Text = BTN_TEXT_LOCK;
                    radBtnOTRPR_Open.Enabled = true;
                    radBtnOTRPR_Reset.Enabled = false;
                    radBtnOTRPR_LockData.Enabled = false;
                    radBtnOTRPR_RefreshAll.Enabled = false;
                    radBtnOTRPR_RefreshFromDriverPay.Enabled = false;
                    radBtnOTRPR_RefreshFromLoad.Enabled = false;
                    radBtnOTRPR_SubmitForVal.Enabled = false;
                    radBtnOTRPR_PassValidation.Enabled = false;
                    radBtnOTRPR_FailValidation.Enabled = false;
                    radBtnOTRPR_DownloadPDF.Enabled = false;
                    radBtnOTRPR_Finalize.Enabled = false;
                    break;
                case "STAGING":
                    setLockBtns();
                    radBtnOTRPR_Open.Enabled = false;
                    radBtnOTRPR_Reset.Enabled = true;
                    radBtnOTRPR_PassValidation.Enabled = false;
                    radBtnOTRPR_FailValidation.Enabled = false;
                    radBtnOTRPR_Finalize.Enabled = false;
                    break;
                case "VALIDATING":
                    radBtnOTRPR_Open.Enabled = false;
                    radBtnOTRPR_Reset.Enabled = false;
                    radBtnOTRPR_LockData.Enabled = false;
                    radBtnOTRPR_RefreshAll.Enabled = false;
                    radBtnOTRPR_RefreshFromDriverPay.Enabled = false;
                    radBtnOTRPR_RefreshFromLoad.Enabled = false;
                    radBtnOTRPR_SubmitForVal.Enabled = false;
                    radBtnOTRPR_PassValidation.Enabled = true;
                    radBtnOTRPR_FailValidation.Enabled = true;
                    radBtnOTRPR_DownloadPDF.Enabled = true;
                    radBtnOTRPR_Finalize.Enabled = false;
                    break;
                case "VALIDATION_FAILED":
                    setLockBtns();
                    radBtnOTRPR_Open.Enabled = false;
                    radBtnOTRPR_Reset.Enabled = true;
                    radBtnOTRPR_PassValidation.Enabled = false;
                    radBtnOTRPR_FailValidation.Enabled = false;
                    radBtnOTRPR_Finalize.Enabled = false;
                    break;
                case "VALIDATION_PASSED":
                    setLockBtns();
                    radBtnOTRPR_Open.Enabled = false;
                    radBtnOTRPR_Reset.Enabled = true;
                    radBtnOTRPR_PassValidation.Enabled = false;
                    radBtnOTRPR_FailValidation.Enabled = false;
                    radBtnOTRPR_Finalize.Enabled = true;
                    break;
                default:
                    radBtnOTRPR_Open.Enabled = false;
                    radBtnOTRPR_Reset.Enabled = true;
                    radBtnOTRPR_LockData.Enabled = false;
                    radBtnOTRPR_RefreshAll.Enabled = false;
                    radBtnOTRPR_RefreshFromDriverPay.Enabled = false;
                    radBtnOTRPR_RefreshFromLoad.Enabled = false;
                    radBtnOTRPR_SubmitForVal.Enabled = false;
                    radBtnOTRPR_PassValidation.Enabled = false;
                    radBtnOTRPR_FailValidation.Enabled = false;
                    radBtnOTRPR_DownloadPDF.Enabled = false;
                    radBtnOTRPR_Finalize.Enabled = false;
                    break;
            }
        }
        protected void setLockBtns()
        {
            Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter payrollOTRPayPeriodAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter();
            Datasets.dsPayroll.PayrollOTRPayPeriodRow activePayPer = payrollOTRPayPeriodAdapter.GetData().Where(pp => pp.IsActive == true).FirstOrDefault();

            if (activePayPer.IsDataLocked)
            {
                radBtnOTRPR_LockData.Text = BTN_TEXT_UNLOCK;
                radBtnOTRPR_RefreshAll.Enabled = false;
                radBtnOTRPR_RefreshFromDriverPay.Enabled = false;
                radBtnOTRPR_RefreshFromLoad.Enabled = false;
                radBtnOTRPR_SubmitForVal.Enabled = true;
                radBtnOTRPR_DownloadPDF.Enabled = true;
            }
            else
            {
                radBtnOTRPR_LockData.Text = BTN_TEXT_LOCK;
                radBtnOTRPR_RefreshAll.Enabled = true;
                radBtnOTRPR_RefreshFromDriverPay.Enabled = true;
                radBtnOTRPR_RefreshFromLoad.Enabled = true;
                radBtnOTRPR_SubmitForVal.Enabled = false;
                radBtnOTRPR_DownloadPDF.Enabled = false;
            }

            Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter payrollOTRStatusAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter();
            Datasets.dsPayroll.PayrollOTRStatusRow statusValidationPassed = payrollOTRStatusAdapter.GetData().Where(stat => stat.Name == "VALIDATION_PASSED").FirstOrDefault();

            if (activePayPer.PayrollOTRStatusId == statusValidationPassed.PayrollOTRStatusId)
            {
                radBtnOTRPR_SubmitForVal.Enabled = false;
            }

            radBtnOTRPR_LockData.Enabled = true;
        }

        protected void Open(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodOpen(auth.PersonId);
            LoadForm();
        }

        protected void Reset(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodReset(auth.PersonId);
            LoadForm();
        }

        protected void LockDataToggle(object sender, EventArgs e)
        {
            Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter payrollOTRPayPeriodAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRPayPeriodTableAdapter();
            Datasets.dsPayroll.PayrollOTRPayPeriodRow activePayPer = payrollOTRPayPeriodAdapter.GetData().Where(pp => pp.IsActive == true).FirstOrDefault();

            if (String.Equals(radBtnOTRPR_LockData.Text, BTN_TEXT_LOCK))
            {
                activePayPer.IsDataLocked = true;
            }
            else
            {
                activePayPer.IsDataLocked = false;
            }

            Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter payrollOTRStatusAdapter = new Datasets.dsPayrollTableAdapters.PayrollOTRStatusTableAdapter();
            Datasets.dsPayroll.PayrollOTRStatusDataTable payrollOTRStatusTable = payrollOTRStatusAdapter.GetData();
            Datasets.dsPayroll.PayrollOTRStatusRow activePayPerStatus = payrollOTRStatusTable.FindByPayrollOTRStatusId(activePayPer.PayrollOTRStatusId);

            string activePayPerStatusName = activePayPerStatus.Name;
            if (String.Equals(activePayPerStatusName, "VALIDATION_FAILED") || String.Equals(activePayPerStatusName, "VALIDATION_PASSED"))
            {
                Datasets.dsPayroll.PayrollOTRStatusRow statusStaging = payrollOTRStatusAdapter.GetData().Where(stat => stat.Name == "STAGING").FirstOrDefault();
                activePayPer.PayrollOTRStatusId = statusStaging.PayrollOTRStatusId;
            }

            payrollOTRPayPeriodAdapter.Update(activePayPer);

            LoadForm();
        }

        protected void RefreshDriverPayData(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollLoad(auth.PersonId);

            string recsRetrieved = "100";
            RadLabeldataRefreshPopup.Text = recsRetrieved + " 'DriverPay'";
            RadLabeRefreshDataLoad.Text = recsRetrieved;
        }

        protected void RefreshLoadsData(object sender, EventArgs e)
        {
            Thread.Sleep(2000);
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollLoad(auth.PersonId);

            string recsRetrieved = "100";
            RadLabeldataRefreshPopup.Text = recsRetrieved + " 'Load'";
            RadLabeRefreshDataDriverPay.Text = recsRetrieved;
        }

        protected void RefreshAllData(object sender, EventArgs e)
        {
            Thread.Sleep(3000);
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollAll(auth.PersonId);

            string recsRetrieved = "100";
            RadLabeldataRefreshPopup.Text = recsRetrieved + " 'Total'";
            RadLabeRefreshDataAll.Text = recsRetrieved;
        }

        protected void SubmitForVal(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodSubmitForValidation(auth.PersonId);
            LoadForm();
        }

        protected void PassValidation(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodValidate(1, auth.PersonId);
            LoadForm();
        }

        protected void FailValidation(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodValidate(0, auth.PersonId);
            LoadForm();
        }

        protected void DownloadPDF(object sender, EventArgs e)
        {
            LoadForm();
        }

        protected void Finalize(object sender, EventArgs e)
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodFinalize(auth.PersonId);
            LoadForm();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Thread.Sleep(4000);
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.sp_Payroll_OTR_PayPeriodFinalize(auth.PersonId);
            LoadForm();
        }
    }
}