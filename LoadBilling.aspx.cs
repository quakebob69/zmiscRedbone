using DocumentFormat.OpenXml.Wordprocessing;
using System;

namespace RedbonePlatform.Pages.ContainerPages
{

    public partial class LoadBilling : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Authorization
            Classes.Auth auth = (Classes.Auth)Session["Auth"];
            if (auth == null)
            {
                Response.Redirect("~/Default.aspx?ShowLogin=true", true);
                return;
            }
            else
            {
                if (!auth.Entitlements.Contains(915)) // Main-Operations-OpenLoadBilledNoPrompt
                {
                    Response.Redirect("~/AccessDenied.aspx", true);
                    return;
                }
            }

            if (!IsPostBack)
            {
                LoadNotFoundDiv.Visible = false;

                ApplyUserSettings();
            }
        }

        private void ApplyUserSettings()
        {
            // Set RibbonBar Skin
            if (Session["GlobalSkin"] is null) Session["GlobalSkin"] = "Black";
            RadSkinManager1.Skin = Session["GlobalSkin"].ToString();
        }

        protected void RadButton_ReleaseLockAndOpen_Click(object sender, EventArgs e)
        {
            if (RadNumericTextBox_BilledLoadId.Value == null)
            {
                LoadNotFoundDiv.Visible = true;
            }
            else
            {
                LoadNotFoundDiv.Visible = false;

                Classes.Auth auth = (Classes.Auth)Session["Auth"];
                Datasets.dsPersonAddressContactTableAdapters.QueriesTableAdapter qry = new Datasets.dsPersonAddressContactTableAdapters.QueriesTableAdapter();
                int loadId = (int)RadNumericTextBox_BilledLoadId.Value;
                qry.UpdateLockedPersonId(auth.PersonId, loadId);
                RadAjaxManager1.ResponseScripts.Add("openBilledLoadDetails('" + loadId + "');");
            }
        }
    }
}