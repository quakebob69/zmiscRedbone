using System;
using RedbonePlatform.Datasets.dsPayrollTableAdapters;
using Telerik.Web.UI;

namespace RedbonePlatform.Pages.ContainerPages
{
    public partial class PayrollOTRDataRefresh : System.Web.UI.Page
    {
        private Classes.Auth auth = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            auth = (Classes.Auth)Session["Auth"];

            if (auth == null)
            {
                Response.Redirect("~/Default.aspx?ShowLogin=true", true);
                return;
            }
            else
            {
                if (!auth.Entitlements.Contains(900))
                {
                    Response.Redirect("~/AccessDenied.aspx", true);
                    return;
                }
            }

            if (!Page.IsPostBack)
            {
                string dataSourceType = Request.QueryString["DataSourceType"];

                ApplyUserSettings();

                RefreshData(dataSourceType);
            }
        }
        private void ApplyUserSettings()
        {
            if (Session["GlobalSkin"] is null) Session["GlobalSkin"] = "Black";
            RadSkinManager1.Skin = Session["GlobalSkin"].ToString();
        }

        private void RefreshData(string dataSourceType)
        {
            switch (dataSourceType)
            {
                case "DriverPay":
                    RefreshDriverPayData();
                    break;
                case "Loads":
                    RefreshLoadsData();
                    break;
                case "All":
                    RefreshAllData();
                    break;
            }
        }

        private void RefreshDriverPayData()
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollDriverPay(auth.PersonId);
        }

        private void RefreshLoadsData()
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollLoad(auth.PersonId);
        }

        private void RefreshAllData()
        {
            QueriesTableAdapter qry = new QueriesTableAdapter();
            qry.CommandTimeoutQry = 1000000;
            qry.sp_Payroll_OTR_StagePayrollAll(auth.PersonId);
        }
    }
}