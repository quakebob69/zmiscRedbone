using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Gmail.v1;
using Google.Apis.Gmail.v1.Data;
using Google.Apis.Services;
using MimeKit;
using RedbonePlatform.Entities.AzBlob;
using RedbonePlatform.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using static Google.Apis.Gmail.v1.UsersResource.MessagesResource.GetRequest;

namespace RedbonePlatform.Services.Email
{
	public class GMailClient
	{
		static string[] Scopes = { GmailService.Scope.GmailReadonly, GmailService.Scope.GmailSend };
		GmailService svc;

		private readonly GmailConnectionOptions _config;

		public GMailClient()
		{
			//////////UserCredential credential;
			//////////// Load client secrets.
			//////////using (var stream =
			//////////       new FileStream(AppDomain.CurrentDomain.BaseDirectory + "\\client_secret_705216678693-mj6s7qftk5j9m183fjgfg2s5smnodid3.apps.googleusercontent.com.json", FileMode.Open, FileAccess.Read))
			//////////{
			//////////    /* The file token.json stores the user's access and refresh tokens, and is created
			//////////     automatically when the authorization flow completes for the first time. */
			//////////    string credPath = AppDomain.CurrentDomain.BaseDirectory + "\\GTokens\\token.json";
			//////////    credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
			//////////        GoogleClientSecrets.FromStream(stream).Secrets,
			//////////        Scopes,
			//////////        "user",
			//////////        CancellationToken.None,
			//////////        new FileDataStore(credPath, true)).Result;
			//////////    Console.WriteLine("Credential file saved to: " + credPath);
			//////////}

			//////////// Create Gmail API service.
			//////////svc = new GmailService(new BaseClientService.Initializer
			//////////{
			//////////    HttpClientInitializer = credential,
			//////////    ApplicationName = "rbplatform"
			//////////});

			_config = new GmailConnectionOptions();
			_config.RecruitingRToken = ConfigurationManager.AppSettings["GmailConnectionOptions.RefreshToken"];
			_config.RecruitingClientId = ConfigurationManager.AppSettings["GmailConnectionOptions.ClientId"];
			_config.RecruitingClientSecret = ConfigurationManager.AppSettings["GmailConnectionOptions.ClientSecret"];




			//UserCredential credential;
			//// Load client secrets.




			//ClientSecrets secrets = new ClientSecrets()
			//{
			//    ClientId = "705216678693-mj6s7qftk5j9m183fjgfg2s5smnodid3.apps.googleusercontent.com",
			//    ClientSecret = "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"
			//};

			//var token = new TokenResponse { RefreshToken = _config.RecruitingRToken };

			//// var token = new TokenResponse { RefreshToken = "1//06P8HHX1qPjJbCgYIARAAGAYSNwF-L9IrFc5HVjbJn83eX3dxkWyHMmHixrXJjw7di4Y74tneXMO0uydiZGxkchUcgx8ZQtRx18Q" };
			//var credentials = new UserCredential(new GoogleAuthorizationCodeFlow(
			//    new GoogleAuthorizationCodeFlow.Initializer
			//    {
			//        ClientSecrets = secrets
			//    }),
			//    "user",
			//    token);

			//svc = new GmailService(new BaseClientService.Initializer
			//{
			//    HttpClientInitializer = credentials,
			//    ApplicationName = "rbplatform"
			//});





		}



		private void InitRecruitingAuth()
		{
			UserCredential credential;
			// Load client secrets.




			ClientSecrets secrets = new ClientSecrets()
			{
				ClientId = _config.RecruitingClientId,
				ClientSecret = _config.RecruitingClientSecret
			};

			var token = new TokenResponse { RefreshToken = _config.RecruitingRToken };

			// var token = new TokenResponse { RefreshToken = "1//06P8HHX1qPjJbCgYIARAAGAYSNwF-L9IrFc5HVjbJn83eX3dxkWyHMmHixrXJjw7di4Y74tneXMO0uydiZGxkchUcgx8ZQtRx18Q" };
			var credentials = new UserCredential(new GoogleAuthorizationCodeFlow(
				new GoogleAuthorizationCodeFlow.Initializer
				{
					ClientSecrets = secrets
				}),
				"user",
				token);

			svc = new GmailService(new BaseClientService.Initializer
			{
				HttpClientInitializer = credentials,
				ApplicationName = "rbplatform"
			});
		}

		private Stream GetMessageDetails(string messageId, FormatEnum format)
		{
			var req = svc.Users.Messages.Get("me", messageId);
			req.Format = format;
			return req.ExecuteAsStream();
		}




		public static Stream GenerateStreamFromString(string s)
		{
			var stream = new MemoryStream();
			var writer = new StreamWriter(stream);
			writer.Write(s);
			writer.Flush();
			stream.Position = 0;
			return stream;
		}


		public string SyncConversation(int ProfileId)
		{


			InitRecruitingAuth();

			string retVal = "";

			Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Email");
			Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow emailType = tblTypes[0];


			//get profile email
			Datasets.dsRecruitingBackgroundTableAdapters.ProfileInfoTableAdapter adapt = new Datasets.dsRecruitingBackgroundTableAdapters.ProfileInfoTableAdapter();
			Datasets.dsRecruitingBackground.ProfileInfoDataTable tbl = new Datasets.dsRecruitingBackground.ProfileInfoDataTable();
			Datasets.dsRecruitingBackground.ProfileInfoRow profile;
			// Datasets.dsRecruitingBackground.ProfileInfoRow initialRow = tbl.NewProfileInfoRow();
			tbl = adapt.GetData(ProfileId);
			profile = tbl[0];

			//get all gmail messages to/from that email
			Google.Apis.Gmail.v1.UsersResource.MessagesResource.ListRequest request = svc.Users.Messages.List("me");
			request.Q = $"from:{profile.Email}||to:{profile.Email}";
			var result = request.Execute();


			//get all local messages
			Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageWTypeTableAdapter msgWTAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageWTypeTableAdapter();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageWTypeDataTable tblMsgsWT = msgWTAdapt.GetDataByProfileEmails(ProfileId);

			//List<Datasets.dsRecruiting_ExtMessages.ExternalMessageRow> currdbMsgs = tblMsgs.Where(x => x.ExternalId != null).ToList();

			List<Message> listToCreate = new List<Message>();
			if (result.Messages != null && result.Messages.Count() > 0)
			{
				listToCreate = result.Messages.Where(x => tblMsgsWT.Where(y => y.ExternalId == x.Id).Any() == false).ToList();
			}
			//compare to db

			MailboxAddress localAddr = new MailboxAddress("Redbone Recruiting", "recruiting@redbonetrucking.com");
			Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
			Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
			//create missing
			foreach (var msg in listToCreate)
			{
				//get gmail message
				Google.Apis.Gmail.v1.UsersResource.MessagesResource.GetRequest gtReq = svc.Users.Messages.Get("me", msg.Id);
				gtReq.Format = FormatEnum.Raw;
				var currGMsg = gtReq.Execute();
				//   var currGMsg = currGMsgLst.Messages[0];
				//currGMsg.Raw

				string converted = currGMsg.Raw.Replace('-', '+');
				converted = converted.Replace('_', '/');

				byte[] data = Convert.FromBase64String(converted);

				Stream stream22 = new MemoryStream(data);
				MimeMessage mimeMsg = MimeMessage.Load(stream22);

				//create new db ext message
				Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();
				string bodyTxt = String.IsNullOrEmpty(mimeMsg.TextBody) ? mimeMsg.HtmlBody : mimeMsg.TextBody;

				if (!String.IsNullOrEmpty(mimeMsg.TextBody) && bodyTxt.IndexOf('<') > 0)
				{
					bodyTxt = bodyTxt.Substring(0, bodyTxt.IndexOf('<'));
				}

				newRow.ExternalAddress = profile.Email;
				newRow.ProfileId = ProfileId;
				newRow.MessageText = bodyTxt;
				newRow.Sent = mimeMsg.From.Contains(localAddr) ? true : false;
				newRow.Received = mimeMsg.From.Contains(localAddr) ? false : true;
				newRow.ExternalMessageTypeId = emailType.ExternalMessageTypeId;
				DateTime dte = mimeMsg.Date.UtcDateTime;
				dte = dte.ToLocalTime();
				newRow.MessageDate = dte;
				newRow.ExternalId = msg.Id;
				newRow.ThreadId = msg.ThreadId;
				newRow.isHTML = String.IsNullOrEmpty(mimeMsg.TextBody) ? true : false;
				tblMsgs.AddExternalMessageRow(newRow);
				msgAdapt.Update(tblMsgs);



				tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				newRow = tblMsgs[0];
				Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch;




				foreach (var attachment in mimeMsg.Attachments)
				{

					tblAttch = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
					Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newAttchRow = tblAttch.NewExternalMessageAttachmentRow();

					string fileName = "";
					string filpth;
					if (attachment is MimeKit.MessagePart)
					{
						fileName = attachment.ContentDisposition?.FileName;
						var rfc822 = (MimeKit.MessagePart)attachment;

						if (string.IsNullOrEmpty(fileName))
							fileName = "attached-message.eml";

						Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId);
						Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\");
						filpth = AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\" + DateTime.Now.Ticks.ToString() + fileName;

						using (var stream = File.Create(filpth))
							rfc822.Message.WriteTo(stream);
					}
					else
					{
						var part = (MimePart)attachment;
						fileName = part.FileName;
						Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId);
						Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\");
						filpth = AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\" + DateTime.Now.Ticks.ToString() + fileName;
						using (var stream = File.Create(filpth))
							part.Content.DecodeTo(stream);
					}




					newAttchRow.Path = filpth;
					newAttchRow.MimeType = MimeMapping.GetMimeMapping(fileName);
					newAttchRow.FileName = fileName;
					newAttchRow.ExternalMessageId = newRow.ExternalMessageId;
					tblAttch.AddExternalMessageAttachmentRow(newAttchRow);
					//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable addedRows = (Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable)tblAttch.GetChanges(DataRowState.Added);
					attchAdapt.Update(tblAttch);


				}


				//end download file


			}

			return retVal;
		}


		public void SendMessageBlob(int ProfileId, int senderId, String ToAddress, string fullName, string MessageTxt, AzBlobAttachment attach = null)
		{


			String htmlBody = "";
			InitRecruitingAuth();



			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\RecruitingExternalMessage.html");
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
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "You have received a new message about your recruitment";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;


				AlternateView plainView = AlternateView.CreateAlternateViewFromString(MessageTxt, null, MediaTypeNames.Text.Plain);
				msg.AlternateViews.Add(plainView);

				msg.Attachments.Clear();

				if (attach != null)
				{
					Stream stream = new MemoryStream(attach.Data);

					var attachment = new Attachment(stream, attach.MimeType);

					// var memow = new Attachment()
					attachment.ContentDisposition.FileName = Path.GetFileName(attach.Name);
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

				// SendEmail(msg, "smtp.gmail.com", "587", "recruiting@redbonetrucking.com", "gWFA7k!X00mL");





				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);



				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};







				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();




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
				newRow.ExternalId = result.Id;
				newRow.ThreadId = result.ThreadId;
				newRow.isHTML = false;
				tblMsgs.AddExternalMessageRow(newRow);
				//tblMsgs.ImportRow(newRow);
				//tblMsgs.AcceptChanges();


				msgAdapt.Update(tblMsgs);

				tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				newRow = tblMsgs[0];

				if (attach != null)
				{
					Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
					Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
					Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newAttchRow = tblAttch.NewExternalMessageAttachmentRow();

					newAttchRow.Path = attach.StoragePath;
					newAttchRow.MimeType = attach.MimeType;
					newAttchRow.FileName = attach.Name;
					newAttchRow.ExternalMessageId = newRow.ExternalMessageId;
					tblAttch.AddExternalMessageAttachmentRow(newAttchRow);
					//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable addedRows = (Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable)tblAttch.GetChanges(DataRowState.Added);
					attchAdapt.Update(tblAttch);
				}



			}







			//var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(mailMessage);

			//    var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
			//    {
			//        Raw = Encode(mimeMessage)
			//    };

			//    Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, ServiceEmail);

			//var result = request.Execute(); 


			//request.Execute();
		}


		private void LogMessageCreateEvent(Datasets.dsRecruiting_ExtMessages.ExternalMessageRow Message, int userId)
		{


			Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();

			Datasets.dsRecruiting_ExtMessages.ExternalMessageRow blankRow = tblMsgs.NewExternalMessageRow();


			RecruitingProfileLogger lggr = new RecruitingProfileLogger();
			int evntId = lggr.LogManualUserEvent(RecruitingProfileLogger.EventType.EmailSent, userId);
			DeltaList dLst = lggr.getDeltasGen(blankRow.ItemArray, Message.ItemArray, blankRow.Table.Columns);
			lggr.LogDetail(evntId, Message.ExternalMessageId, "ExternalMessage", "", dLst);
		}


		public void SendRecruitingSignatureEmail(String ToAddress, String code, string firstName, int senderId, int ProfileId)
		{
			InitRecruitingAuth();

			String htmlBody = "";

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\FinishApplication.html");
			htmlBody = str.ReadToEnd();
			str.Close();
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());

			htmlBody = htmlBody.Replace("{{FirstName}}", firstName);
			htmlBody = htmlBody.Replace("{{code}}", code);

			string portalUrl = ConfigurationManager.AppSettings["PortalUrl"];

			string linkTxt = portalUrl + "/Recruiting/Index?cde=" + code;
			htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);

			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToAddress);
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "You have received a new message about your recruitment";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;


				//AlternateView plainView = AlternateView.CreateAlternateViewFromString(MessageTxt, null, MediaTypeNames.Text.Plain);
				//msg.AlternateViews.Add(plainView);

				msg.Attachments.Clear();

				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);

				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};

				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();

				//Create External Message Object after sending
				//get Email message type
				Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Email");
				Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow emailType = tblTypes[0];


				//add this to the db at this point
				Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();
				//   Datasets.dsRecruiting_ExtMessages.ExternalMessageRow blankRow = tblMsgs.NewExternalMessageRow();


				newRow.ExternalAddress = ToAddress;
				newRow.ProfileId = ProfileId;
				newRow.MessageText = htmlBody;
				newRow.Sent = true;
				newRow.Received = false;
				newRow.ExternalMessageTypeId = emailType.ExternalMessageTypeId;
				newRow.MessageDate = DateTime.Now;
				newRow.SenderId = senderId;
				newRow.ExternalId = result.Id;
				newRow.ThreadId = result.ThreadId;
				newRow.isHTML = false;
				tblMsgs.AddExternalMessageRow(newRow);
				//tblMsgs.ImportRow(newRow);
				//tblMsgs.AcceptChanges();


				msgAdapt.Update(tblMsgs);

				tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				newRow = tblMsgs[0];

				this.LogMessageCreateEvent(newRow, senderId);
				//RecruitingProfileLogger lggr = new RecruitingProfileLogger();
				//int evntId = lggr.LogManualUserEvent(RecruitingProfileLogger.EventType.EmailSent, senderId);
				//DeltaList dLst = lggr.getDeltasGen(blankRow.ItemArray, newRow.ItemArray, blankRow.Table.Columns);
				//lggr.LogDetail(evntId, newRow.ExternalMessageId, "ExternalMessage", "", dLst);

			}




























			//using (MailMessage msg = new MailMessage())
			//{
			//    msg.To.Add(ToAddress);
			//    msg.From = new MailAddress(_mailConfig.From, _mailConfig.FromDisplayName);
			//    //msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
			//    msg.Subject = "Please complete your RedBone Trucking Application";
			//    msg.Body = htmlBody;
			//    msg.IsBodyHtml = true;

			//    msg.Attachments.Clear();

			//    SendEmail(msg);
			//}
		}


		public void SendRecruitingMessage(int ProfileId, int senderId, String ToAddress, string fullName, string MessageTxt, string attachMime = "", string attachLocalPath = "")
		{
			InitRecruitingAuth();

			String htmlBody = "";




			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\RecruitingExternalMessage.html");
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
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "You have received a new message about your recruitment";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;


				//AlternateView plainView = AlternateView.CreateAlternateViewFromString(MessageTxt, null, MediaTypeNames.Text.Plain);
				//msg.AlternateViews.Add(plainView);

				msg.Attachments.Clear();

				if (!string.IsNullOrEmpty(attachMime) && !string.IsNullOrEmpty(attachLocalPath))
				{
					var attachment = new Attachment(attachLocalPath, attachMime);

					// var memow = new Attachment()
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

				// SendEmail(msg, "smtp.gmail.com", "587", "recruiting@redbonetrucking.com", "gWFA7k!X00mL");





				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);



				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};







				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();




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
				newRow.ExternalId = result.Id;
				newRow.ThreadId = result.ThreadId;
				newRow.isHTML = false;
				tblMsgs.AddExternalMessageRow(newRow);
				//tblMsgs.ImportRow(newRow);
				//tblMsgs.AcceptChanges();


				msgAdapt.Update(tblMsgs);

				tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				newRow = tblMsgs[0];


				//RecruitingProfileLogger lggr = new RecruitingProfileLogger();
				//int evntId = lggr.LogManualUserEvent(RecruitingProfileLogger.EventType.EmailSent, senderId);

				//lggr.LogDetail(evntId, newRow.ExternalMessageId, "ExternalMessage", "", null);

				this.LogMessageCreateEvent(newRow, senderId);

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

					//   lggr.LogDetail(evntId, newRow.ExternalMessageId, "ExternalMessageAttachment", "", null);

				}



			}







			//var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(mailMessage);

			//    var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
			//    {
			//        Raw = Encode(mimeMessage)
			//    };

			//    Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, ServiceEmail);

			//var result = request.Execute(); 


			//request.Execute();
		}



		public void SendVOERequestEmail(int VOEId, int ProfileId, int senderId, String ToEmployerAddress, string EmployerfullName, string ProfilefullName, string UploadCode, bool includeReleasePdf)
		{
			InitRecruitingAuth();

			String htmlBody = "";

			ToEmployerAddress = "thomas@jadedsaint.com";

			string qrLink = ConfigurationManager.AppSettings["RecruitingReleaseOptions.QRLink"] + UploadCode;

			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\RecruitingVOERequest.html");
			htmlBody = str.ReadToEnd();
			str.Close();
			//htmlBody = htmlBody.Replace("##CONTENT##", str.ReadToEnd());

			htmlBody = htmlBody.Replace("{{employerName}}", EmployerfullName);
			htmlBody = htmlBody.Replace("{{profileName}}", ProfilefullName);
			htmlBody = htmlBody.Replace("{{UploadLink}}", qrLink);

			//string portalUrl = ConfigurationManager.AppSettings["PortalUrl"]; 


			//  string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			//  htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);




			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToEmployerAddress);
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "Employment Verification requested";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;


				//AlternateView plainView = AlternateView.CreateAlternateViewFromString(MessageTxt, null, MediaTypeNames.Text.Plain);
				//msg.AlternateViews.Add(plainView);

				msg.Attachments.Clear();

				if (includeReleasePdf)
				{
					RecruitingVOEHelper voeHelpr = new RecruitingVOEHelper();
					byte[] pdfBytes = voeHelpr.GenerateBlankReleaseFile(VOEId.ToString());

					using (Stream stream = new MemoryStream(pdfBytes))
					{

						var attachment = new Attachment(stream, "EmploymentRelease.pdf", "application/pdf");
						//   var attachment = new Attachment(attachLocalPath, attachMime);

						// var memow = new Attachment()
						attachment.ContentDisposition.FileName = "EmploymentRelease.pdf";
						msg.Attachments.Add(attachment);


						var mimeMessageAttch = MimeKit.MimeMessage.CreateFromMailMessage(msg);

						var gmailMessageAttch = new Google.Apis.Gmail.v1.Data.Message
						{
							Raw = Encode(mimeMessageAttch)
						};


						Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest requestAttch = svc.Users.Messages.Send(gmailMessageAttch, "me");

						var resultAttch = requestAttch.Execute();

						return;

					}


				}

				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);

				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};


				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();


			}

		}


		public void SendRecruitingNotification(int ProfileId, String ToAddress, string MessageTxt)
		{
			InitRecruitingAuth();

			String htmlBody = "";




			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\RecruitingNotification.html");
			htmlBody = str.ReadToEnd();
			str.Close();


			htmlBody = htmlBody.Replace("{{MessageTxt}}", MessageTxt);

			//string portalUrl = ConfigurationManager.AppSettings["PortalUrl"]; 


			//  string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			//  htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);Cons



			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(ToAddress);
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "Recruiting Auto Notification";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;

				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);

				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};







				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();



				//dont log a notififcation as a user message---------------------------------
				//Create External Message Object after sending
				//get Email message type
				////Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Email");
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow emailType = tblTypes[0];


				//////add this to the db at this point
				////Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();


				////newRow.ExternalAddress = ToAddress;
				////newRow.ProfileId = ProfileId;
				////newRow.MessageText = MessageTxt;
				////newRow.Sent = true;
				////newRow.Received = false;
				////newRow.ExternalMessageTypeId = emailType.ExternalMessageTypeId;
				////newRow.MessageDate = DateTime.Now;

				////newRow.ExternalId = result.Id;
				////newRow.ThreadId = result.ThreadId;
				////newRow.isHTML = false;
				////tblMsgs.AddExternalMessageRow(newRow);
				//////tblMsgs.ImportRow(newRow);
				//////tblMsgs.AcceptChanges();


				////msgAdapt.Update(tblMsgs);

				////tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				////newRow = tblMsgs[0];


			}


		}




		public void SendEmploymentRequestApproval(int EmploymentRequestId)
		{
			InitRecruitingAuth();

			String htmlBody = "";

			RedbonePlatform.Datasets.dsPersonEdit_EmploymentHistoryTableAdapters.EmploymentHistoryRequestWPersonTableAdapter genAdapt = new Datasets.dsPersonEdit_EmploymentHistoryTableAdapters.EmploymentHistoryRequestWPersonTableAdapter();
			Datasets.dsPersonEdit_EmploymentHistory.EmploymentHistoryRequestWPersonDataTable tblUnemploy = genAdapt.GetDataById(EmploymentRequestId);
			RedbonePlatform.Datasets.dsPersonEdit_EmploymentHistory.EmploymentHistoryRequestWPersonRow addRow = tblUnemploy.FirstOrDefault();

			string histLink = ConfigurationManager.AppSettings["EmploymentHistoryOptions.HistoryPortalLink"] + addRow.AccessCode;


			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\EmploymentHistoryApproval.html");
			htmlBody = str.ReadToEnd();
			str.Close();


			htmlBody = htmlBody.Replace("{{PersonName}}", addRow.FirstName + " " + addRow.LastName);
			htmlBody = htmlBody.Replace("{{HistoryLink}}", histLink);


			//string portalUrl = ConfigurationManager.AppSettings["PortalUrl"]; 


			//  string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			//  htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);Cons



			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(addRow.RequestorEmail);
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "Employment History Request Notification";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;

				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);

				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};







				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();



				//dont log a notififcation as a user message---------------------------------
				//Create External Message Object after sending
				//get Email message type
				////Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Email");
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow emailType = tblTypes[0];


				//////add this to the db at this point
				////Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
				////Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();


				////newRow.ExternalAddress = ToAddress;
				////newRow.ProfileId = ProfileId;
				////newRow.MessageText = MessageTxt;
				////newRow.Sent = true;
				////newRow.Received = false;
				////newRow.ExternalMessageTypeId = emailType.ExternalMessageTypeId;
				////newRow.MessageDate = DateTime.Now;

				////newRow.ExternalId = result.Id;
				////newRow.ThreadId = result.ThreadId;
				////newRow.isHTML = false;
				////tblMsgs.AddExternalMessageRow(newRow);
				//////tblMsgs.ImportRow(newRow);
				//////tblMsgs.AcceptChanges();


				////msgAdapt.Update(tblMsgs);

				////tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
				////newRow = tblMsgs[0];


			}


		}

		public void SendEmploymentRequestDenial(int EmploymentRequestId, string DenialExp)
		{
			InitRecruitingAuth();

			String htmlBody = "";


			RedbonePlatform.Datasets.dsPersonEdit_EmploymentHistoryTableAdapters.EmploymentHistoryRequestWPersonTableAdapter genAdapt = new Datasets.dsPersonEdit_EmploymentHistoryTableAdapters.EmploymentHistoryRequestWPersonTableAdapter();
			Datasets.dsPersonEdit_EmploymentHistory.EmploymentHistoryRequestWPersonDataTable tblUnemploy = genAdapt.GetDataById(EmploymentRequestId);
			RedbonePlatform.Datasets.dsPersonEdit_EmploymentHistory.EmploymentHistoryRequestWPersonRow addRow = tblUnemploy.FirstOrDefault();

			//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
			//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = attchAdapt.GetDataByMessageId(externalMessageId);

			//build the html version
			//get the base template
			StreamReader str = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "\\EmailTemplates\\EmploymentHistoryDenial.html");
			htmlBody = str.ReadToEnd();
			str.Close();


			htmlBody = htmlBody.Replace("{{PersonName}}", addRow.FirstName + " " + addRow.LastName);
			htmlBody = htmlBody.Replace("{{DenialExplanation}}", DenialExp);

			//string portalUrl = ConfigurationManager.AppSettings["PortalUrl"]; 


			//  string linkTxt = "https://" + portalUrl + "/Recruiting/Index?cde=" + code;
			//  htmlBody = htmlBody.Replace("{{codeUrl}}", linkTxt);Cons



			using (MailMessage msg = new MailMessage())
			{
				msg.To.Add(addRow.RequestorEmail);
				msg.From = new MailAddress("recruiting@redbonetrucking.com", "recruiting@redbonetrucking.com");
				//msg.Subject = "Invoice(s) Submitted For " + invoicesSent[0].ClientName;
				msg.Subject = "Employment History Request Notification";

				msg.Body = htmlBody;

				msg.IsBodyHtml = true;

				var mimeMessage = MimeKit.MimeMessage.CreateFromMailMessage(msg);

				var gmailMessage = new Google.Apis.Gmail.v1.Data.Message
				{
					Raw = Encode(mimeMessage)
				};







				Google.Apis.Gmail.v1.UsersResource.MessagesResource.SendRequest request = svc.Users.Messages.Send(gmailMessage, "me");

				var result = request.Execute();


			}


		}

		public static string Encode(MimeMessage mimeMessage)
		{
			using (MemoryStream ms = new MemoryStream())
			{
				mimeMessage.WriteTo(ms);
				return Convert.ToBase64String(ms.GetBuffer())
					.TrimEnd('=')
					.Replace('+', '-')
					.Replace('/', '_');
			}
		}




	}

}