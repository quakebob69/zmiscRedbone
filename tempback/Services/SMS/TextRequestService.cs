using Newtonsoft.Json;
using RedbonePlatform.Entities;
using RedbonePlatform.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;

namespace RedbonePlatform.Services.BackgroundCheck
{
	public class TextRequestService : ISMSService
	{
		/// <summary>
		/// string RootUser
		/// </summary>
		private TextRequestOptions _config { get; set; }
		private HttpClient client;

		public TextRequestService(TextRequestOptions Config)
		{
			_config = Config;
			client = new HttpClient();

		}

		public TextRequestService()
		{
			client = new HttpClient();
			_config = new TextRequestOptions();
			_config.APIKey = ConfigurationManager.AppSettings["TextRequestSettings.ApiKey"];
			_config.MsgCreateURL = ConfigurationManager.AppSettings["TextRequestSettings.MsgCreatURL"];
			_config.BaseUrl = ConfigurationManager.AppSettings["TextRequestSettings.BaseUrl"];
			_config.RecruitingDashboardId = ConfigurationManager.AppSettings["TextRequestSettings.RecruitingDashboardId"];

		}

		public string SendRecruitingMessage(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message, int SenderId, string attachUri = "", string attachMime = "", string attachLocalPath = "")
		{
			//order to xml
			try
			{


				string contactErrstr = CreateContact(Profile.FirstName, Profile.LastName, Profile.PhoneNumber);
				string errStrng = SendRecruitingMessageCall(Profile, phoneNum, message, SenderId, attachUri, attachMime, attachLocalPath);







				return errStrng;

			}
			catch (Exception ex)
			{
				//return error
				return "An Unknown error occurred";
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";

		}

		public string SendRecruitingNotification(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message)
		{
			//order to xml
			try
			{


				string contactErrstr = CreateContact(Profile.FirstName, Profile.LastName, phoneNum);
				string errStrng = SendRecruitingNotificationCall(Profile, phoneNum, message);







				return errStrng;

			}
			catch (Exception ex)
			{
				//return error
				return "An Unknown error occurred";
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";

		}



		public string SyncRecruitingConversation(int ProfileId)
		{
			//get messages for all phone numbers associated with profile
			try
			{

				RedbonePlatform.Datasets.dsRecruitingTableAdapters.ProfilePhoneNumberTableAdapter genAdapt = new Datasets.dsRecruitingTableAdapters.ProfilePhoneNumberTableAdapter();
				Datasets.dsRecruiting.ProfilePhoneNumberDataTable tblUnemploy = genAdapt.GetData(ProfileId);


				Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
				Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Text");
				Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow txtType = tblTypes[0];

				foreach (var phneNum in tblUnemploy)
				{
					string currNum = phneNum.PhoneNumber.Replace("-", string.Empty);
					currNum = currNum.Replace(")", string.Empty);
					currNum = currNum.Replace("(", string.Empty);
					currNum = currNum.Replace(" ", string.Empty);


					// currNum = "6235129434";
					string postURI = _config.BaseUrl + $"dashboards/{_config.RecruitingDashboardId}/contacts/{currNum}/messages?page=0&page_size=1000";



					using (var client = new WebClient())
					{
						client.Headers.Add("x-api-key", _config.APIKey);
						string respo = client.DownloadString(postURI);
						//string respo = "{'message_id': 'c71be14d-dc92-4cd4-be71-3538d0dc51de','body': 'I am reaching back out.','message_direction': 'S','response_by_username': 'Bill Cassidy','message_timestamp_utc': '2022-08-04T03:17:42.1250403Z','delivery_status': 'sending','delivery_error': null, 'mms_media': []}";
						if (!string.IsNullOrEmpty(respo))
						{
							var smsRespo = JsonConvert.DeserializeObject<SMSConversationResponse>(respo);

							if (smsRespo != null)
							{
								if (smsRespo.meta.total_items > 0)
								{


									//Get all external messages
									Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageWTypeTableAdapter msgWTAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageWTypeTableAdapter();
									Datasets.dsRecruiting_ExtMessages.ExternalMessageWTypeDataTable tblMsgsWT = msgWTAdapt.GetDataByProfileTexts(ProfileId);

									//List<Datasets.dsRecruiting_ExtMessages.ExternalMessageRow> currdbMsgs = tblMsgs.Where(x => x.ExternalId != null).ToList();

									List<SMS> listToCreate = new List<SMS>();
									listToCreate = smsRespo.items.Where(x => tblMsgsWT.Where(y => y.ExternalId == x.message_id).Any() == false).ToList();

									//remove from respo message list is the id exists in the db alread



									Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
									Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();

									//loop through remaining respo messages and create in db
									foreach (var smsItm in listToCreate)
									{
										Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();


										newRow.ExternalAddress = currNum;
										newRow.ProfileId = ProfileId;
										newRow.MessageText = smsItm.body;
										newRow.Sent = smsItm.message_direction == "S" ? true : false;
										newRow.Received = smsItm.message_direction == "R" ? true : false;
										newRow.ExternalMessageTypeId = txtType.ExternalMessageTypeId;
										DateTime dte = DateTime.Parse(smsItm.message_timestamp_utc);
										dte = dte.ToLocalTime();
										newRow.MessageDate = dte;
										newRow.ExternalId = smsItm.message_id;
										newRow.isHTML = false;
										tblMsgs.AddExternalMessageRow(newRow);
										msgAdapt.Update(tblMsgs);



										tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
										newRow = tblMsgs[0];
										Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
										Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch;

										foreach (string attch in smsItm.mms_media)
										{
											//create new attachment record in db

											tblAttch = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
											Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newAttchRow = tblAttch.NewExternalMessageAttachmentRow();



											RemoteAttachment ImAFile = GetAttachment(attch);
											//download file to userfiles
											//////////UploadedFile file = AsyncUpload1.UploadedFiles[0];
											//////////fileData = new byte[file.InputStream.Length];
											//////////file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);

											//////////attchmime = AsyncUpload1.UploadedFiles[0].ContentType;
											//////////attchName = file.FileName;
											//////////attchUri = svc.CreateAttachment(fileData, attchmime, attchName);

											if (ImAFile != null && ImAFile.Data != null && ImAFile.Data.Length > 0)
											{
												Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId);
												Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\");
												string filpth = AppDomain.CurrentDomain.BaseDirectory + "\\" + "UserFiles\\RecruitingFiles\\" + ProfileId + "\\ExternalAttachments\\" + DateTime.Now.Ticks.ToString() + ImAFile.FileName;
												File.WriteAllBytes(filpth, ImAFile.Data);

												newAttchRow.Path = filpth;
												newAttchRow.MimeType = MimeMapping.GetMimeMapping(ImAFile.FileName);
												newAttchRow.FileName = ImAFile.FileName;
												newAttchRow.ExternalMessageId = newRow.ExternalMessageId;
												tblAttch.AddExternalMessageAttachmentRow(newAttchRow);
												//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable addedRows = (Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable)tblAttch.GetChanges(DataRowState.Added);
												attchAdapt.Update(tblAttch);

											}
											else
											{
												//do nothing for now
											}

											//end download file






										}

									}



									//tblMsgs.AddExternalMessageRow(newRow);
									msgAdapt.Update(tblMsgs);
									return "";
								}
								else
								{
									return "An Error occurred syncing the conversation";
								}
							}
							else
							{
								return "An Error occurred syncing the conversation";
							}
						}
						else
						{
							//return error
							return "An Error occurred syncing the conversation";
						}
					}


				}



			}
			catch (Exception ex)
			{
				//return error
				return "";
			}





			//for each message not in the database, create it

			return "";
		}

		public string CreateContact(string FirstName, string LastName, string PhoneNumber)
		{
			//order to xml
			try
			{
				// toCreateOrder.id = "sdsdsd";
				CreateContactRequest request = new CreateContactRequest();
				request.first_name = FirstName;
				request.last_name = LastName;
				request.display_name = FirstName + " " + LastName;
				request.is_suppressed = false;
				request.is_archived = false;
				request.is_blocked = false;
				request.note = "Created/updated by RedBoneplatform API";
				request.is_resolved = false;


				string payload = JsonConvert.SerializeObject(request);

				//post to api with order as body https://api.textrequest.com/api/v3/dashboards/{dashboard_id}/contacts/{phone_number}/messages
				// string createURI = _config.CreateOrderUrl;


				//string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages";
				string postURI = _config.BaseUrl + "dashboards/" + _config.RecruitingDashboardId + "/contacts/" + PhoneNumber;
				using (var client = new WebClient())
				{
					client.Headers.Add("x-api-key", _config.APIKey);
					string respo = client.UploadString(postURI, payload);
					//string respo = "{'message_id': 'c71be14d-dc92-4cd4-be71-3538d0dc51de','body': 'I am reaching back out.','message_direction': 'S','response_by_username': 'Bill Cassidy','message_timestamp_utc': '2022-08-04T03:17:42.1250403Z','delivery_status': 'sending','delivery_error': null, 'mms_media': []}";
					if (!string.IsNullOrEmpty(respo))
					{
						var smsRespo = JsonConvert.DeserializeObject<CreateContactResponse>(respo);

						if (smsRespo != null)
						{
							return "";
						}
						else
						{
							return "An Unknown Error occurred sending message";
						}
					}
					else
					{
						//return error
						return "An Unknown Error occurred sending message";
					}
				}

			}
			catch (Exception ex)
			{
				//return error
				return "";
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";

		}


		public string CreateAttachment(byte[] fileData, string MimeType, string fileName)
		{
			//order to xml
			try
			{



				HttpClient httpClient = new HttpClient();
				httpClient.DefaultRequestHeaders.Add("x-api-key", _config.APIKey);
				MultipartFormDataContent form = new MultipartFormDataContent();


				form.Add(new ByteArrayContent(fileData, 0, fileData.Length), "file", fileName);
				// HttpResponseMessage response = await httpClient.PostAsync("PostUrl", form);





				var result = httpClient.PostAsync("https://api.textrequest.com/api/v3/mms", form);
				string respObj = result.Result.Content.ReadAsStringAsync().Result;



				if (!string.IsNullOrEmpty(respObj))
				{
					var uploadRespo = JsonConvert.DeserializeObject<AttachmentCreateResponse>(respObj);

					if (uploadRespo != null)
					{
						if (!string.IsNullOrEmpty(uploadRespo.error_message))
						{
							return "";
						}
						else
						{
							//we succesfully uploaded

							//create record in db
							//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
							//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
							//Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newRow = tblMsgs.NewExternalMessageAttachmentRow();

							//newRow.Path = uploadRespo.url;
							//newRow.MimeType = uploadRespo.mime_type;
							//newRow.FileName = fileName;



							//tblMsgs.AddExternalMessageAttachmentRow(newRow);
							//msgAdapt.Update(tblMsgs);


							//return url of file
							return uploadRespo.url;
						}

					}
					else
					{
						return "";
					}
				}
				else
				{
					//return error
					return "";
				}



				//response.EnsureSuccessStatusCode();
				//httpClient.Dispose();
				//string sd = response.Content.ReadAsStringAsync().Result;












				// toCreateOrder.id = "sdsdsd";
				//  CreateContactRequest request = new CreateContactRequest();
				//request.first_name = FirstName;
				//request.last_name = LastName;
				//request.display_name = FirstName + " " + LastName;
				//request.is_suppressed = false;
				//request.is_archived = false;
				//request.is_blocked = false;
				//request.note = "Created/updated by RedBoneplatform API";
				//request.is_resolved = false;


				//string payload = JsonConvert.SerializeObject(request);

				////post to api with order as body https://api.textrequest.com/api/v3/dashboards/{dashboard_id}/contacts/{phone_number}/messages
				//// string createURI = _config.CreateOrderUrl;


				////string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages";
				//string postURI = _config.BaseUrl + "dashboards/" + _config.DashboardId + "/contacts/" + PhoneNumber;
				//using (var client = new WebClient())
				//{
				//    client.Headers.Add("x-api-key", _config.APIKey);
				//    string respo = client.UploadString(postURI, payload);
				//    //string respo = "{'message_id': 'c71be14d-dc92-4cd4-be71-3538d0dc51de','body': 'I am reaching back out.','message_direction': 'S','response_by_username': 'Bill Cassidy','message_timestamp_utc': '2022-08-04T03:17:42.1250403Z','delivery_status': 'sending','delivery_error': null, 'mms_media': []}";
				//    if (!string.IsNullOrEmpty(respo))
				//    {
				//        var smsRespo = JsonConvert.DeserializeObject<CreateContactResponse>(respo);

				//        if (smsRespo != null)
				//        {
				//            return "";
				//        }
				//        else
				//        {
				//            return "An Unknown Error occurred sending message";
				//        }
				//    }
				//    else
				//    {
				//        //return error
				//        return "An Unknown Error occurred sending message";
				//    }
				//}

			}
			catch (Exception ex)
			{
				//return error
				return "";
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";

		}

		public RemoteAttachment GetAttachment(string remoteURI)
		{
			//order to xml
			try
			{

				WebClient wc = new WebClient();
				//  byte[] bytes = wc.DownloadData(remoteURI);

				RemoteAttachment retVal = new RemoteAttachment();
				retVal.FileName = Path.GetFileName(remoteURI);
				retVal.Data = wc.DownloadData(remoteURI);

				return retVal;
			}
			catch (Exception ex)
			{
				//return error
				return null;
			}

			return null;

		}


		private string SendRecruitingMessageCall(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message, int SenderId, string attachUri = "", string attachMime = "", string attachLocalPath = "")
		{
			try
			{
				// toCreateOrder.id = "sdsdsd";
				SMSSendRequest request = new SMSSendRequest();
				request.body = message;
				request.sender_name = "Redbone Platform";
				//  request.status_callback = "";
				// request.location_callback = "";
				if (string.IsNullOrEmpty(attachUri))
				{
					request.mms_media = new string[0];
				}
				else
				{
					request.mms_media = new string[1];
					request.mms_media[0] = attachUri;
				}


				string payload = JsonConvert.SerializeObject(request);

				//post to api with order as body https://api.textrequest.com/api/v3/dashboards/{dashboard_id}/contacts/{phone_number}/messages
				// string createURI = _config.CreateOrderUrl;


				//  CreateContact(Profile.FirstName, Profile.LastName, Profile.PhoneNumber);

				// phoneNum = "6235129434";

				string postURI = _config.BaseUrl + "/dashboards/" + _config.RecruitingDashboardId + "/contacts/" + phoneNum + "/messages";
				//string postURI = _config.BaseUrl + $"dashboards/" + _config.DashboardId + "/contacts/{phoneNum}/messages";
				using (var client = new WebClient())
				{
					client.Headers.Add("x-api-key", _config.APIKey);
					string respo = client.UploadString(postURI, payload);
					//string respo = "{'message_id': 'c71be14d-dc92-4cd4-be71-3538d0dc51de','body': 'I am reaching back out.','message_direction': 'S','response_by_username': 'Bill Cassidy','message_timestamp_utc': '2022-08-04T03:17:42.1250403Z','delivery_status': 'sending','delivery_error': null, 'mms_media': []}";
					if (!string.IsNullOrEmpty(respo))
					{
						var smsRespo = JsonConvert.DeserializeObject<SMS>(respo);

						if (smsRespo != null)
						{
							if (smsRespo.delivery_status != MsgStatus.error)
							{
								//get text message type
								Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
								Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Text");
								Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow txtType = tblTypes[0];


								//add this to the db at this point
								Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
								Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
								Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();
								Datasets.dsRecruiting_ExtMessages.ExternalMessageRow blankRow = tblMsgs.NewExternalMessageRow();

								newRow.ExternalAddress = phoneNum;
								newRow.ProfileId = Profile.ProfileId;
								newRow.MessageText = message;
								newRow.Sent = true;
								newRow.Received = false;
								newRow.ExternalMessageTypeId = txtType.ExternalMessageTypeId;
								newRow.MessageDate = DateTime.Now;
								newRow.SenderId = SenderId;
								newRow.ExternalId = smsRespo.message_id;
								newRow.isHTML = false;

								tblMsgs.AddExternalMessageRow(newRow);
								//tblMsgs.ImportRow(newRow);
								//tblMsgs.AcceptChanges();


								msgAdapt.Update(tblMsgs);

								tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
								newRow = tblMsgs[0];

								RecruitingProfileLogger lggr = new RecruitingProfileLogger();
								int evntId = lggr.LogManualUserEvent(RecruitingProfileLogger.EventType.SMSSent, SenderId);


								DeltaList dLst = lggr.getDeltasGen(blankRow.ItemArray, newRow.ItemArray, blankRow.Table.Columns);

								lggr.LogDetail(evntId, newRow.ExternalMessageId, "ExternalMessage", "", dLst);


								if (request.mms_media.Length > 0)
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
								return "";
							}
							else
							{
								return "An Error occurred sending message: " + smsRespo.delivery_error;
							}
						}
						else
						{
							return "An Unknown Error occurred sending message";
						}
					}
					else
					{
						//return error
						return "An Unknown Error occurred sending message";
					}
				}

			}
			catch (Exception ex)
			{
				//return error
				return "An Error occurred sending message: " + ex.Message;
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";
		}



		private string SendRecruitingNotificationCall(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message)
		{
			try
			{
				// toCreateOrder.id = "sdsdsd";
				SMSSendRequest request = new SMSSendRequest();
				request.body = message;
				request.sender_name = "Redbone Platform";

				request.mms_media = new string[0];

				string payload = JsonConvert.SerializeObject(request);

				//post to api with order as body https://api.textrequest.com/api/v3/dashboards/{dashboard_id}/contacts/{phone_number}/messages
				// string createURI = _config.CreateOrderUrl;


				//  CreateContact(Profile.FirstName, Profile.LastName, Profile.PhoneNumber);

				// phoneNum = "6235129434";

				string postURI = _config.BaseUrl + "/dashboards/" + _config.RecruitingDashboardId + "/contacts/" + phoneNum + "/messages";
				//string postURI = _config.BaseUrl + $"dashboards/" + _config.DashboardId + "/contacts/{phoneNum}/messages";
				using (var client = new WebClient())
				{
					client.Headers.Add("x-api-key", _config.APIKey);
					string respo = client.UploadString(postURI, payload);
					//string respo = "{'message_id': 'c71be14d-dc92-4cd4-be71-3538d0dc51de','body': 'I am reaching back out.','message_direction': 'S','response_by_username': 'Bill Cassidy','message_timestamp_utc': '2022-08-04T03:17:42.1250403Z','delivery_status': 'sending','delivery_error': null, 'mms_media': []}";
					if (!string.IsNullOrEmpty(respo))
					{
						var smsRespo = JsonConvert.DeserializeObject<SMS>(respo);

						if (smsRespo != null)
						{
							if (smsRespo.delivery_status != MsgStatus.error)
							{

								//this is a notification, we dont need to record it in the db at all

								//get text message type
								//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter typeAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTypeTableAdapter();
								//Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeDataTable tblTypes = typeAdapt.GetDataByName("Text");
								//Datasets.dsRecruiting_ExtMessages.ExternalMessageTypeRow txtType = tblTypes[0];


								//add this to the db at this point
								//Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter msgAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageTableAdapter();
								//Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable tblMsgs = new Datasets.dsRecruiting_ExtMessages.ExternalMessageDataTable();
								//Datasets.dsRecruiting_ExtMessages.ExternalMessageRow newRow = tblMsgs.NewExternalMessageRow();
								//Datasets.dsRecruiting_ExtMessages.ExternalMessageRow blankRow = tblMsgs.NewExternalMessageRow();

								//newRow.ExternalAddress = phoneNum;
								//newRow.ProfileId = Profile.ProfileId;
								//newRow.MessageText = message;
								//newRow.Sent = true;
								//newRow.Received = false;
								//newRow.ExternalMessageTypeId = txtType.ExternalMessageTypeId;
								//newRow.MessageDate = DateTime.Now;
								//newRow.SenderId = SenderId;
								//newRow.ExternalId = smsRespo.message_id;
								//newRow.isHTML = false;

								//tblMsgs.AddExternalMessageRow(newRow);
								////tblMsgs.ImportRow(newRow);
								////tblMsgs.AcceptChanges();


								//msgAdapt.Update(tblMsgs);

								//tblMsgs = msgAdapt.GetDataByExtId(newRow.ExternalId);
								//newRow = tblMsgs[0];

								//RecruitingProfileLogger lggr = new RecruitingProfileLogger();
								//int evntId = lggr.LogManualUserEvent(RecruitingProfileLogger.EventType.SMSSent, SenderId);


								//DeltaList dLst = lggr.getDeltasGen(blankRow.ItemArray, newRow.ItemArray, blankRow.Table.Columns);

								//lggr.LogDetail(evntId, newRow.ExternalMessageId, "ExternalMessage", "", dLst);


								//if (request.mms_media.Length > 0)
								//{
								//    Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter attchAdapt = new Datasets.dsRecruiting_ExtMessagesTableAdapters.ExternalMessageAttachmentTableAdapter();
								//    Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable tblAttch = new Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable();
								//    Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentRow newAttchRow = tblAttch.NewExternalMessageAttachmentRow();

								//    newAttchRow.Path = attachLocalPath;
								//    newAttchRow.MimeType = attachMime;
								//    newAttchRow.FileName = Path.GetFileName(attachLocalPath);
								//    newAttchRow.ExternalMessageId = newRow.ExternalMessageId;
								//    tblAttch.AddExternalMessageAttachmentRow(newAttchRow);
								//    //Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable addedRows = (Datasets.dsRecruiting_ExtMessages.ExternalMessageAttachmentDataTable)tblAttch.GetChanges(DataRowState.Added);
								//    attchAdapt.Update(tblAttch);
								//}
								return "";
							}
							else
							{
								return "An Error occurred sending message: " + smsRespo.delivery_error;
							}
						}
						else
						{
							return "An Unknown Error occurred sending message";
						}
					}
					else
					{
						//return error
						return "An Unknown Error occurred sending message";
					}
				}

			}
			catch (Exception ex)
			{
				//return error
				return "An Error occurred sending message: " + ex.Message;
			}




			// string postURI = _config.BaseUrl + "/dashboards/" + _config.DashboardId + "/contacts/" + phoneNum + "/messages"
			//var task = Task.Run(() => client.PostAsJsonAsync(postURI, toCreateOrder));
			//task.Wait();
			//var response = task.Result;


			////var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			//var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			//taskrd.Wait();
			//var responseString = taskrd.Result;


			//var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			//var responseString = await response.Content.ReadAsStringAsync();
			return "An Unknown Error occurred sending message";
		}

	}

	public class RemoteAttachment
	{
		public string FileName { get; set; }

		public byte[] Data { get; set; }
	}

}