using RedbonePlatform.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;

namespace RedbonePlatform.Services
{
	public class MailService
	{
		private MailConfig _mailConfig = new MailConfig();
		private string _baseUrl = "";
		private string _rootDirectory = "";

		public MailService()
		{
			_baseUrl = this.GetBaseUrl();
			_rootDirectory = AppDomain.CurrentDomain.BaseDirectory;

			GetMailConfig();
		}

		/// <summary>
		/// Email is sent to factoring when a withdrawal is requested by a client
		/// </summary>
		/// <param name="withdrawalRow">A withdrawal row</param>
		public void SendWithdrawalEmailToFactoring(int ClientId, Datasets.dsFactoring.sp_Factoring_InvoicesRow Transaction)
		{
			try
			{
				//build the html version
				//get the base template
				string htmlBody = GetBaseEmailTemplate();

				//get the email template
				Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
				Datasets.dsFactoring.EmailTemplatesDataTable emailTable = emailAdapter.GetDataByTemplateName(Transaction.PlanTypeId, "QB Client Withdrawal Created Notification");
				Datasets.dsFactoring.EmailTemplatesRow emailRow = emailTable.FirstOrDefault();

				Datasets.dsFactoringTableAdapters.sp_Factoring_GetClientDetailsTableAdapter clientAdapt = new Datasets.dsFactoringTableAdapters.sp_Factoring_GetClientDetailsTableAdapter();
				Datasets.dsFactoring.sp_Factoring_GetClientDetailsRow clientRow = clientAdapt.GetData(ClientId).FirstOrDefault();

				htmlBody = htmlBody.Replace("##CONTENT##", emailRow.EmailBody);

				var clientAddress = clientRow.AddressLine1 + "<br>" +
									(!clientRow.IsAddressLine2Null() ? clientRow.AddressLine2 + "<br>" : "") +
									clientRow.City + ", " +
									clientRow.State + "  " +
									clientRow.ZipCode;

				htmlBody = htmlBody.Replace("##CLIENTNAME##", clientRow.ClientName);
				htmlBody = htmlBody.Replace("##CLIENTADDRESS##", clientAddress);
				htmlBody = htmlBody.Replace("##WITHDRAWALAMOUNT##", (Transaction.CurrentReserveFee * -1).ToString("C"));
				htmlBody = htmlBody.Replace("##COMPANYNAME##", _mailConfig.FactoringCompanyName);

				using (MailMessage msg = new MailMessage())
				{
					msg.To.Add(_mailConfig.FactoringFromEmail);
					msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
					msg.Subject = emailRow.EmailSubject;
					msg.Body = htmlBody;
					msg.IsBodyHtml = true;

					SendEmail(msg);
				}
			}
			catch (Exception ex)
			{
			}
		}

		/// <summary>
		/// Email is sent to the person who uploaded new factoring invoice(s)
		/// </summary>
		/// <param name="ToAddress">Address to send the email to</param>
		/// <param name="invoicesSent">An array of InvoiceSent objects</param>
		public void SendInvoiceReceiptEmail(string ToAddress, List<InvoiceSent> invoicesSent)
		{
			//build the html version
			//get the base template
			string htmlBody = GetBaseEmailTemplate();
			string htmlOut = "";
			decimal totalAmount = 0;
			decimal totalFee = 0;
			decimal totalAdvanced = 0;
			decimal totalReserve = 0;

			//get the email template
			Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
			Datasets.dsFactoring.EmailTemplatesDataTable settingsTable = emailAdapter.GetDataByTemplateName(invoicesSent[0].PlanTypeId, "Client Invoice Submit Receipt");
			Datasets.dsFactoring.EmailTemplatesRow row = settingsTable.FirstOrDefault();

			//StreamReader str = new StreamReader(_rootDirectory + "\\EmailTemplates\\InvoiceSubmitReceiptEmail.html");
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());
			//str.Close();

			htmlBody = htmlBody.Replace("##CONTENT##", row.EmailBody);

			//add the table header row
			htmlOut = "<tr style='background-color:lightblue;'>";
			htmlOut += "<td><b>Number</b></td>";
			htmlOut += "<td><b>Date</b></td>";
			htmlOut += "<td><b>Amount</b></td>";
			htmlOut += "<td><b>Fee</b></td>";
			if (invoicesSent[0].ReserveTotal > 0) htmlOut += "<td><b>Total Reserve</b></td>";
			htmlOut += "<td><b>Advanced Amount</b></td>";
			htmlOut += "</tr>";

			htmlBody = htmlBody.Replace("##TABLEHEADER##", htmlOut);

			htmlOut = "";

			//add invoice rows
			foreach (InvoiceSent invoice in invoicesSent)
			{
				htmlOut += "<tr>";
				htmlOut += "<td>" + invoice.Number + "</td>";
				htmlOut += "<td>" + invoice.Date.ToString("M/dd/yyyy") + "</td>";
				htmlOut += "<td>" + invoice.Amount.ToString("C") + "</td>";
				htmlOut += "<td>" + invoice.Fee.ToString("C") + "</td>";
				if (invoice.ReserveTotal > 0) htmlOut += "<td>" + invoice.ReserveTotal.ToString("C") + "</td>";
				htmlOut += "<td>" + invoice.Advanced.ToString("C") + "</td>";
				htmlOut += "</tr>";
				totalAmount += invoice.Amount;
				totalFee += invoice.Fee;
				//totalReserve += invoice.ReserveTotal;
				totalAdvanced += invoice.Advanced;
			}

			htmlBody = htmlBody.Replace("##INVOICES##", htmlOut);

			//add footer row
			htmlOut = "<tr style='background-color:lightblue;'>";
			htmlOut += "<td>&nbsp;</td>";
			htmlOut += "<td><b>Totals</b></td>";
			htmlOut += "<td>" + totalAmount.ToString("C") + "</td>";
			htmlOut += "<td>" + totalFee.ToString("C") + "</td>";
			if (invoicesSent[0].ReserveTotal > 0) htmlOut += "<td>&nbsp;</td>";
			htmlOut += "<td>" + totalAdvanced.ToString("C") + "</td>";
			htmlOut += "</tr>";

			htmlBody = htmlBody.Replace("##TABLEFOOTER##", htmlOut);

			htmlBody = htmlBody.Replace("##PLANTYPE##", invoicesSent[0].PlanName);

			using (MailMessage msg = new MailMessage())
			{
				var toAddresses = ToAddress.Split(',');
				foreach (string to in toAddresses)
				{
					msg.To.Add(to);
				}

				msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
				//msg.Subject = "Invoices Received";
				msg.Subject = row.EmailSubject;
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				SendEmail(msg);
			}
		}


		/// <summary>
		/// Email is sent to "MailSettings.AccountingFrom" setting in web.config
		/// when new invoices are upload by a client
		/// </summary>
		/// <param name="invoicesSent">An array of InvoiceSent objects</param>
		/// <remarks>ReserveTotal column is only shown for Option 2 plans types</remarks>
		public void SendInvoiceSubmittedNotificationEmail(InvoiceSent invoiceSent)
		{
			//build the html version
			//get the base template
			string htmlBody = GetBaseEmailTemplate();
			string htmlOut = "";

			//get the email template
			Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
			Datasets.dsFactoring.EmailTemplatesDataTable settingsTable = emailAdapter.GetDataByTemplateName(invoiceSent.PlanTypeId, "Client Invoice Submit Notification");
			Datasets.dsFactoring.EmailTemplatesRow row = settingsTable.FirstOrDefault();

			htmlBody = htmlBody.Replace("##CONTENT##", row.EmailBody);

			//add the table header row
			htmlOut = "<tr style='background-color:lightblue;'>";
			htmlOut += "<td><b>Number</b></td>";
			htmlOut += "<td><b>Date</b></td>";
			htmlOut += "<td><b>Amount</b></td>";
			htmlOut += "<td><b>Fee</b></td>";
			htmlOut += "<td><b>Fee %</b></td>";
			if (invoiceSent.ReserveTotal > 0) htmlOut += "<td><b>Total Reserve</b></td>";
			htmlOut += "<td><b>Advanced Amount</b></td>";
			htmlOut += "</tr>";

			htmlBody = htmlBody.Replace("##TABLEHEADER##", htmlOut);

			htmlOut = "";

			//add invoice row
			htmlOut += "<tr>";
			htmlOut += "<td>" + invoiceSent.Number + "</td>";
			htmlOut += "<td>" + invoiceSent.Date.ToString("M/dd/yyyy") + "</td>";
			htmlOut += "<td>" + invoiceSent.Amount.ToString("C") + "</td>";
			htmlOut += "<td>" + invoiceSent.Fee.ToString("C") + "</td>";
			htmlOut += "<td>" + invoiceSent.FeePercent.ToString("P") + "</td>";
			if (invoiceSent.ReserveTotal > 0) htmlOut += "<td>" + invoiceSent.ReserveTotal.ToString("C") + "</td>";
			htmlOut += "<td>" + invoiceSent.Advanced.ToString("C") + "</td>";
			htmlOut += "</tr>";

			htmlBody = htmlBody.Replace("##INVOICES##", htmlOut);

			htmlBody = htmlBody.Replace("##TABLEFOOTER##", htmlOut);

			htmlBody = htmlBody.Replace("##CLIENTNAME##", invoiceSent.ClientName);
			htmlBody = htmlBody.Replace("##PLANTYPE##", invoiceSent.PlanName);
			htmlBody = htmlBody.Replace("##CLIENTPERSON##", invoiceSent.UploaderName);

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(_mailConfig.FactoringFromEmail);
				msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = row.EmailSubject.Replace("##CLIENTNAME##", invoiceSent.ClientName);
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				msg.Attachments.Clear();

				//attach the uploaded invoice
				string attachmentPath = invoiceSent.AttachmentPath;
				string[] pathparts = attachmentPath.Split('/');
				var attachment = new Attachment(_rootDirectory + attachmentPath, MediaTypeNames.Application.Pdf);
				attachment.ContentDisposition.FileName = pathparts[pathparts.Length - 1];
				msg.Attachments.Add(attachment);

				SendEmail(msg);
			}
		}




		/// <summary>
		/// Email is sent as "MailSettings.From" setting in web.config
		/// when a link is sent to a user to complete their application
		/// </summary>
		/// <param name="ToAddress">Recipient</param>
		/// <param name="Code">Unique code</param>
		/// <param name="FirstName">Recipient's Firstname</param>
		/// <remarks></remarks>
		public void SendRecruitingSignatureEmail(String ToAddress, String code, string firstName)
		{
			String htmlBody = "";

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(_rootDirectory + "\\EmailTemplates\\FinishApplication.html");
			htmlBody = str.ReadToEnd();
			str.Close();
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());

			htmlBody = htmlBody.Replace("{{FirstName}}", firstName);
			htmlBody = htmlBody.Replace("{{code}}", code);

			string portalUrl = ConfigurationManager.AppSettings["PortalUrl"];

			string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToAddress);
				msg.From = new MailAddress(_mailConfig.From, _mailConfig.FromDisplayName);
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "Please complete your RedBone Trucking Application";
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				msg.Attachments.Clear();

				SendEmail(msg);
			}
		}


		/// <summary>
		/// Email is sent as "MailSettings.RecruitingFrom" setting in web.config
		/// when a new external message of email type is sent from recruiting
		/// </summary>
		/// <param name="ToAddress">Recipient</param>
		/// <param name="Code">Unique code</param>
		/// <param name="FirstName">Recipient's Firstname</param>
		/// <remarks></remarks>
		public void SendRecruitingExternalMessageEmail(int ProfileId, int senderId, String ToAddress, string fullName, string MessageTxt, string attachMime = "", string attachLocalPath = "")
		{
			String htmlBody = "";

			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(_rootDirectory + "\\EmailTemplates\\RecruitingExternalMessage.html");
			htmlBody = str.ReadToEnd();
			str.Close();
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());

			htmlBody = htmlBody.Replace("{{fullName}}", fullName);
			htmlBody = htmlBody.Replace("{{MessageTxt}}", MessageTxt);

			//string portalUrl = ConfigurationManager.AppSettings["PortalUrl"]; 


			//  string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			//  htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToAddress);
				msg.From = new MailAddress(_mailConfig.RecruitingFrom, _mailConfig.RecruitingFromDisplayName);
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "You have received a new message about your recruitment";
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				msg.Attachments.Clear();

				if (!string.IsNullOrEmpty(attachMime) && !string.IsNullOrEmpty(attachLocalPath))
				{
					var attachment = new Attachment(attachLocalPath, attachMime);
					attachment.ContentDisposition.FileName = Path.GetFileName(attachLocalPath);
					msg.Attachments.Add(attachment);
				}


				//foreach(var attch in tblAttch)
				//            {
				//	var attachment = new Attachment(attch.Path, attch.MimeType);
				//	attachment.ContentDisposition.FileName = attch.FileName;
				//	msg.Attachments.Add(attachment);
				//}

				//string attachmentPath = invoiceRow.Attachment;
				//string[] pathparts = attachmentPath.Split('/');
				//var attachment = new Attachment(_rootDirectory + attachmentPath, MediaTypeNames.Application.Pdf);
				//attachment.ContentDisposition.FileName = pathparts[pathparts.Length - 1];
				//msg.Attachments.Add(attachment);

				SendEmail(msg, "smtp.gmail.com", "587", "recruiting@redbonetrucking.com", "gWFA7k!X00mL");
			}

			//Create External Message Object after sending
			//get Email message type
			Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Email");
			Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow emailType = tblTypes[0];


			//add this to the db at this point
			Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();


			newRow.ExternalAddress = ToAddress;
			newRow.ProfileId = ProfileId;
			newRow.MessageText = MessageTxt;
			newRow.Sent = true;
			newRow.Received = false;
			newRow.ExternalMessageTypeId = emailType.ExternalMessageTypeId;
			newRow.MessageDate = DateTime.Now;
			newRow.SenderId = senderId;
			newRow.ExternalId = Guid.NewGuid().ToString();

			tblMsgs.AddExternalMessageRow(newRow);
			//tblMsgs.ImportRow(newRow);
			//tblMsgs.AcceptChanges();


			msgAdapt.Update(tblMsgs);

			tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
			newRow = tblMsgs[0];

			if (!string.IsNullOrEmpty(attachMime) && !string.IsNullOrEmpty(attachLocalPath))
			{
				Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newAttchRow = tblAttch.NewExternalMessageAttachmentRow();

				newAttchRow.Path = attachLocalPath;
				newAttchRow.MimeType = attachMime;
				newAttchRow.FileName = Path.GetFileName(attachLocalPath);
				newAttchRow.ExternalMessageId = newRow.ExternalMessageId;
				tblAttch.AddExternalMessageAttachmentRow(newAttchRow);
				//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable addedRows = (Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable)tblAttch.GetChanges(DataRowState.Added);
				attchAdapt.Update(tblAttch);
			}

		}



		/// <summary>
		/// Email is sent to "MailSettings.AccountingFrom" setting in web.config
		/// when the invoice Notes field is changed by a client
		/// </summary>
		/// <param name="TransactionId">The id of the invoice transaction</param>
		/// <param name="Notes">Notes field content</param>
		/// <remarks></remarks>
		public void SendClientChangedNotesEmail(string ClientName, int PlanTypeId, string InvoiceNumber, string Notes)
		{
			//build the html version
			//get the base template
			string htmlBody = GetBaseEmailTemplate();

			//get the email template
			Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
			Datasets.dsFactoring.EmailTemplatesDataTable settingsTable = emailAdapter.GetDataByTemplateName(PlanTypeId, "Client Note Added");
			Datasets.dsFactoring.EmailTemplatesRow row = settingsTable.FirstOrDefault();

			//StreamReader str = new StreamReader(_rootDirectory + "\\EmailTemplates\\ClientNoteAddedEmail.html");
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());
			//str.Close();

			htmlBody = htmlBody.Replace("##CONTENT##", row.EmailBody);

			htmlBody = htmlBody.Replace("##CLIENTNAME##", ClientName);
			htmlBody = htmlBody.Replace("##INVOICENUMBER##", InvoiceNumber);
			htmlBody = htmlBody.Replace("##NOTE##", Notes.Replace("\r\n", "<br />"));

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(_mailConfig.FactoringFromEmail);
				msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
				//msg.Subject = "Note was updated by '" + ClientName + "' for existing invoice number " + InvoiceNumber;
				msg.Subject = row.EmailSubject.Replace("##CLIENTNAME##", ClientName).Replace("##INVOICENUMBER##", InvoiceNumber);
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				SendEmail(msg);
			}
		}

		/// <summary>
		/// Email is sent to Factoring Client when an invoice is reversed
		/// </summary>
		/// <param name="ClientEmailAddress">The client's email address</param>
		/// <param name="Transaction">The transaction row</param>
		/// <remarks></remarks>
		public void SendReversalNoticeToClient(string ClientEmailAddress, decimal OriginalFee, Datasets.dsFactoring.sp_Factoring_InvoicesRow Transaction)
		{
			//build the html version
			//get the base template
			string htmlBody = GetBaseEmailTemplate();
			int planTypeId = Transaction.PlanTypeId;

			Datasets.dsFactoringTableAdapters.SettingsTableAdapter settings = new Datasets.dsFactoringTableAdapters.SettingsTableAdapter();
			Datasets.dsFactoring.SettingsRow settingsRow = (Datasets.dsFactoring.SettingsRow)settings.GetData(Transaction.PlanTypeId).FirstOrDefault();

			//get the email template
			Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
			Datasets.dsFactoring.EmailTemplatesDataTable emailTable = emailAdapter.GetDataByTemplateName(planTypeId, "Invoice Reversed");
			Datasets.dsFactoring.EmailTemplatesRow emailRow = emailTable.FirstOrDefault();

			htmlBody = htmlBody.Replace("##CONTENT##", emailRow.EmailBody);

			htmlBody = htmlBody.Replace("##TODAY##", DateTime.Today.ToString("M/dd/yyyy"));
			htmlBody = htmlBody.Replace("##CLIENTNAME##", Transaction.ClientName);
			htmlBody = htmlBody.Replace("##INVOICENUMBER##", Transaction.InvoiceNumber);
			htmlBody = htmlBody.Replace("##LOADNUMBER##", Transaction.LoadNumber);
			htmlBody = htmlBody.Replace("##INVOICEPURCHASEDDATE##", Transaction.InvoicePurchasedDate.ToString("M/dd/yyyy"));
			htmlBody = htmlBody.Replace("##DISTRIBUTIONDATE##", Transaction.IsDisbursedPaymentDateNull() ? "" : Transaction.DisbursedPaymentDate.ToString("M/dd/yyyy"));
			htmlBody = htmlBody.Replace("##ORIGINALINVOICEFEE##", OriginalFee.ToString("C"));
			htmlBody = htmlBody.Replace("##ADVANCEDAMOUNT##", Transaction.AdvancedAmount.ToString("C"));
			htmlBody = htmlBody.Replace("##REVERSEFEE##", settingsRow.ReverseFee.ToString("C"));
			htmlBody = htmlBody.Replace("##TOTALRESERVEDEDUCTION##", (Transaction.AdvancedAmount + settingsRow.ReverseFee + OriginalFee).ToString("C"));
			htmlBody = htmlBody.Replace("##COMPANYNAME##", _mailConfig.FactoringCompanyName);

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(_mailConfig.FactoringFromEmail);
				msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
				//msg.Subject = "Note was updated by '" + ClientName + "' for existing invoice number " + InvoiceNumber;
				msg.Subject = emailRow.EmailSubject;
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				SendEmail(msg);
			}
		}

		/// <summary>
		/// NOA Email is sent to the factoring debtor
		/// </summary>
		/// <param name="ToAddress">Address to send the email to</param>
		/// <param name="invoiceRow">An invoice row</param>
		/// <param name="pdfFile">Stamped PDF of the factored invoice with it's NOA page</param>
		public string SendEmailNoticeToDebtor(int TransactionId)
		{
			string returnValue = "";

			try
			{
				//build the html version
				//get the base template
				string htmlBody = GetBaseEmailTemplate();

				//get the invoice details
				Datasets.dsFactoringTableAdapters.sp_Factoring_InvoicesTableAdapter invoiceAdapt = new Datasets.dsFactoringTableAdapters.sp_Factoring_InvoicesTableAdapter();
				Datasets.dsFactoring.sp_Factoring_InvoicesRow invoiceRow = invoiceAdapt.GetData(0, 0, true, false, 9999, "").Where(i => i.TransactionId == TransactionId).FirstOrDefault();

				if (invoiceRow.IsFactoringDebtorEmailAddressNull() || string.IsNullOrEmpty(invoiceRow.FactoringDebtorEmailAddress))
				{
					return "Debtor email address is missing.";
				}

				//get the client details
				Datasets.dsFactoringTableAdapters.sp_Factoring_GetClientDetailsTableAdapter cAdapt = new Datasets.dsFactoringTableAdapters.sp_Factoring_GetClientDetailsTableAdapter();
				Datasets.dsFactoring.sp_Factoring_GetClientDetailsRow clientRow = (Datasets.dsFactoring.sp_Factoring_GetClientDetailsRow)cAdapt.GetData(invoiceRow.ClientId).FirstOrDefault();

				//get the email template
				Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter emailAdapter = new Datasets.dsFactoringTableAdapters.EmailTemplatesTableAdapter();
				Datasets.dsFactoring.EmailTemplatesDataTable settingsTable = emailAdapter.GetDataByTemplateName(invoiceRow.PlanTypeId, "QB Notice Of Assignment To Debtor");
				Datasets.dsFactoring.EmailTemplatesRow row = settingsTable.FirstOrDefault();

				htmlBody = htmlBody.Replace("##CONTENT##", row.EmailBody);

				var clientAddress = clientRow.AddressLine1 + "<br>" +
									((!clientRow.IsAddressLine2Null()) ? clientRow.AddressLine2 + "<br>" : "") +
									clientRow.City + ", " +
									clientRow.State + "  " +
									clientRow.ZipCode;

				htmlBody = htmlBody.Replace("##CLIENTNAME##", invoiceRow.ClientName);
				htmlBody = htmlBody.Replace("##COMPANYNAME##", _mailConfig.FactoringCompanyName);
				htmlBody = htmlBody.Replace("##INVOICENUMBER##", invoiceRow.CustomerInvoiceNumber);
				htmlBody = htmlBody.Replace("##LOADNUMBER##", invoiceRow.LoadNumber);

				using (MailMessage msg = new MailMessage())
				{
					var toAddresses = invoiceRow.FactoringDebtorEmailAddress.Split(',');
					foreach (string to in toAddresses)
					{
						msg.To.Add(to);
					}
					//msg.To.Add(invoiceRow.FactoringDebtorEmailAddress);

					if (!string.IsNullOrEmpty(_mailConfig.FactoringCCEmailAddress))
					{
						msg.CC.Add(new MailAddress(_mailConfig.FactoringCCEmailAddress));
					}
					msg.From = new MailAddress(_mailConfig.FactoringFromEmail, _mailConfig.FactoringFromDisplayName);
					//msg.Subject = invoiceRow.ClientName + "; INVOICE # " + invoiceRow.CustomerInvoiceNumber + ", Pro # " + invoiceRow.LoadNumber;
					msg.Subject = row.EmailSubject.Replace("##CLIENTNAME##", invoiceRow.ClientName)
													.Replace("##INVOICENUMBER##", invoiceRow.CustomerInvoiceNumber)
													.Replace("##LOADNUMBER##", invoiceRow.LoadNumber);
					msg.Body = htmlBody;
					msg.IsBodyHtml = true;

					//attach the invoice
					string attachmentPath = invoiceRow.Attachment;
					string[] pathparts = attachmentPath.Split('/');
					var attachment = new Attachment(_rootDirectory + attachmentPath, MediaTypeNames.Application.Pdf);
					attachment.ContentDisposition.FileName = pathparts[pathparts.Length - 1];
					msg.Attachments.Add(attachment);

					SendEmail(msg);
				}
			}
			catch (Exception ex)
			{
			}

			return returnValue;
		}

		/// <summary>
		/// Email is sent logistics carrier
		/// </summary>
		/// <param name="TransactionId">The id of the invoice transaction</param>
		/// <param name="Notes">Notes field content</param>
		/// <remarks></remarks>
		public void SendRateConfirmationToCarrier(string ToAddress, string TripNumber, Stream Attachment)
		{
			//build the html version
			//get the base template
			string htmlBody = GetBaseEmailTemplate();

			//get the email template
			StreamReader str = new StreamReader(_rootDirectory + "\\EmailTemplates\\LogisticsRateConfirmation.html");
			htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());
			str.Close();

			htmlBody = htmlBody.Replace("##CONTENT##", htmlBody);

			//get the logistics email settings
			Datasets.dsLogisticsTableAdapters.SettingsTableAdapter settingsAdapt = new Datasets.dsLogisticsTableAdapters.SettingsTableAdapter();
			Datasets.dsLogistics.SettingsDataTable settingsTable = settingsAdapt.GetData();
			Datasets.dsLogistics.SettingsRow settingsRow = (Datasets.dsLogistics.SettingsRow)settingsTable.Rows[0];

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToAddress);
				msg.From = new MailAddress(settingsRow.EmailUserName, "Redbone Logistics");
				msg.Subject = "Redbone Logistics Trip# " + TripNumber;
				msg.Body = htmlBody;
				msg.IsBodyHtml = true;

				msg.Attachments.Clear();

				//attach the uploaded invoice
				var attachment = new Attachment(Attachment, MediaTypeNames.Application.Pdf);
				attachment.ContentDisposition.FileName = "RateConfirmation_" + DateTime.Now.Month.ToString() + "." + DateTime.Now.Day.ToString() + "." + DateTime.Now.Year.ToString() + ".pdf";
				msg.Attachments.Add(attachment);

				SendEmail(msg, settingsRow.EmailHost, settingsRow.EmailPort, settingsRow.EmailUserName, settingsRow.EmailUserPassword);
			}
		}

		private void SendEmail(MailMessage MailMessage, string MailHost = "", string MailHostPort = "", string MailHostUserName = "", string MailHostPassword = "")
		{
			//strip the dic coloring (red) for undeditable sections in the RadEditor
			MailMessage.Body = MailMessage.Body.Replace("<div style=\"border: red 1px solid;\" contenteditable=\"false\" unselectable=\"on\">", "<div>");

			if (_mailConfig.SendMailToDedicatedUser)
			{
				var actualRecipients = MailMessage.To;
				var bodyPrefix = (MailMessage.IsBodyHtml ? "<font color='red'>" : "") +
									"*** This email would have been sent to " +
									MailMessage.To.ToString() +
									(MailMessage.IsBodyHtml ? "<br><br>" : "\r\n\r\n") +
									(MailMessage.IsBodyHtml ? "</font>" : "");

				MailMessage.To.Clear();
				MailMessage.To.Add(_mailConfig.DedicatedUserEmailAddress);

				MailMessage.Body = bodyPrefix + MailMessage.Body;
			}

			using (SmtpClient client = new SmtpClient())
			{
				client.EnableSsl = true;
				client.Host = MailHost == "" ? _mailConfig.Host : MailHost;
				client.Port = MailHostPort == "" ? _mailConfig.HostPort : Convert.ToInt32(MailHostPort);
				client.Credentials = new NetworkCredential(MailHostUserName == "" ? _mailConfig.HostUserName : MailHostUserName,
															MailHostPassword == "" ? _mailConfig.HostPassword : MailHostPassword);

				client.Send(MailMessage);
			}
		}

		private void GetMailConfig()
		{
			_mailConfig.IsDevelopment = Convert.ToBoolean(ConfigurationManager.AppSettings["MailSettings.IsDevelopment"]);
			_mailConfig.AdminToEmails = ConfigurationManager.AppSettings["MailSettings.AdminToEmails"];
			_mailConfig.SupportToEmails = ConfigurationManager.AppSettings["MailSettings.SupportToEmails"];
			_mailConfig.DispatchFrom = ConfigurationManager.AppSettings["MailSettings.DispatchFrom"];
			_mailConfig.DispatchFromDisplayName = ConfigurationManager.AppSettings["MailSettings.DispatchFromDisplayName"];
			_mailConfig.RecruitingFrom = ConfigurationManager.AppSettings["MailSettings.RecruitingFrom"];
			_mailConfig.RecruitingFromDisplayName = ConfigurationManager.AppSettings["MailSettings.RecruitingFromDisplayName"];
			_mailConfig.From = ConfigurationManager.AppSettings["MailSettings.From"];
			_mailConfig.FromDisplayName = ConfigurationManager.AppSettings["MailSettings.FromDisplayName"];

			_mailConfig.Host = ConfigurationManager.AppSettings["MailSettings.Host"];
			_mailConfig.HostPort = Convert.ToInt32(ConfigurationManager.AppSettings["MailSettings.HostPort"]);
			_mailConfig.HostUserName = ConfigurationManager.AppSettings["MailSettings.HostUserName"];
			_mailConfig.HostPassword = ConfigurationManager.AppSettings["MailSettings.HostPassword"];
			_mailConfig.HostSecret = ConfigurationManager.AppSettings["MailSettings.HostSecret"];
			//_mailConfig.Logo = ConfigurationManager.AppSettings["MailSettings.Logo"];

			_mailConfig.SendMailToDedicatedUser = ConfigurationManager.AppSettings["MailSettings.SendMailToDedicatedUser"] == "True";
			_mailConfig.DedicatedUserEmailAddress = ConfigurationManager.AppSettings["MailSettings.DedicatedUserEmailAddress"];

			//get the factoring specific mail info
			Datasets.dsFactoringTableAdapters.SettingsTableAdapter settingsAdapter = new Datasets.dsFactoringTableAdapters.SettingsTableAdapter();
			Datasets.dsFactoring.SettingsDataTable settingsTable = settingsAdapter.GetData(1);
			Datasets.dsFactoring.SettingsRow row = settingsTable.FirstOrDefault();

			_mailConfig.FactoringFromEmail = row.FromEmailAddress;
			_mailConfig.FactoringFromDisplayName = row.FromEmailAddress + " <" + row.FromEmailAddress + ">";

			_mailConfig.FactoringCompanyName = row.CompanyName;
			_mailConfig.FactoringLogo = row.IsEmailLogoNull() ? null : row.EmailLogo;
			_mailConfig.FactoringLogoType = row.IsEmailLogoImageTypeNull() ? "jpg" : row.EmailLogoImageType;
		}

		private string GetBaseEmailTemplate()
		{
			string filePath = _rootDirectory + "\\EmailTemplates\\EmailTemplate.html";
			string baseTemplate = "";

			using (StreamReader str = new StreamReader(filePath))
			{
				baseTemplate = str.ReadToEnd();
			}

			var imgData = Convert.ToBase64String(_mailConfig.FactoringLogo);

			baseTemplate = baseTemplate.Replace("##BASEURL##", _baseUrl);
			//baseTemplate = baseTemplate.Replace("##IMGURL##", _baseUrl + _mailConfig.Logo);
			baseTemplate = baseTemplate.Replace("##IMGDATA##", String.Format("data:image/{0};base64,{1}", _mailConfig.FactoringLogoType, imgData));
			baseTemplate = baseTemplate.Replace("##COMPANYNAME##", _mailConfig.FactoringCompanyName);

			return baseTemplate;
		}

		private string GetBaseUrl()
		{
			var request = HttpContext.Current.Request;
			var t = request.Url.GetLeftPart(UriPartial.Authority);
			return request.Url.Scheme + "://" + request.Url.Host + request.ApplicationPath;
		}
	}
}