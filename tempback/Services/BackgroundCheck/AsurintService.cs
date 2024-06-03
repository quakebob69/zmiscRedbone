using RedbonePlatform.Entities;
using RedbonePlatform.Entities.BackgroundCheck.Asurint;
using RedbonePlatform.Entities.PackageLookup;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace RedbonePlatform.Services.BackgroundCheck
{
	public class AsurintService : IBackgroundCheckService
	{
		/// <summary>
		/// string RootUser
		/// </summary>
		private AsurintOptions _config { get; set; }
		private HttpClient client;

		public AsurintService(AsurintOptions Config)
		{
			_config = Config;
			client = new HttpClient();

		}

		public AsurintService()
		{
			client = new HttpClient();
			_config = new AsurintOptions();
			_config.AccountID = ConfigurationManager.AppSettings["AsurintSettings.AccountId"];
			_config.LocationID = ConfigurationManager.AppSettings["AsurintSettings.LocationID"];
			_config.RootUser = ConfigurationManager.AppSettings["AsurintSettings.RootUser"];
			_config.RootPassword = ConfigurationManager.AppSettings["AsurintSettings.RootPassword"];
			_config.CustomerUserReferenceID = ConfigurationManager.AppSettings["AsurintSettings.CustomerUserReferenceID"];
			_config.CreateOrderUrl = ConfigurationManager.AppSettings["AsurintSettings.CreateOrderUrl"];
			_config.PackageLookupUrl = ConfigurationManager.AppSettings["AsurintSettings.PackageLookupUrl"];

			_config.ContactFirstName = ConfigurationManager.AppSettings["AsurintSettings.ContactFirstName"];
			_config.ContactLastName = ConfigurationManager.AppSettings["AsurintSettings.ContactLastName"];
			_config.ContactEmail = ConfigurationManager.AppSettings["AsurintSettings.ContactEmail"];
			_config.ContactPhone = ConfigurationManager.AppSettings["AsurintSettings.ContactPhone"];

		}

		public async System.Threading.Tasks.Task CreateOrderAsync(RedbonePlatform.Entities.BackgroundCheck.Asurint.Order toCreateOrder)
		{
			//order to xml

			// toCreateOrder.id = "sdsdsd";
			var xml = "";
			System.Xml.Serialization.XmlSerializer x = new System.Xml.Serialization.XmlSerializer(toCreateOrder.GetType());
			//x.Serialize(mm, pp);





			using (var sww = new StringWriter())
			{
				using (XmlWriter writer = XmlWriter.Create(sww))
				{
					x.Serialize(writer, toCreateOrder);
					xml = sww.ToString(); // Your XML
				}
			}

			//post to api with order as body



			var response = await client.PostAsXmlAsync("http://www.example.com/recepticle.aspx", toCreateOrder);

			var responseString = await response.Content.ReadAsStringAsync();
		}

		private string FormatPhoneNum(string phoneNum)
		{
			string retVal = "";

			phoneNum = phoneNum.Trim();
			phoneNum = phoneNum.Replace("'", "");
			phoneNum = phoneNum.Replace(" ", "");
			phoneNum = phoneNum.Replace("-", "");
			phoneNum = phoneNum.Replace("(", "");
			phoneNum = phoneNum.Replace(")", "");

			ulong numInt = ulong.Parse(phoneNum);

			retVal = String.Format("{0:(###) ###-####}", numInt);



			return retVal;


		}
		public String CreateOrder(int ProfileId, string packageuid, string packageName, int LoggedInUserId)
		{
			//IS THERE ONE TYPE OF ORDER THAT WE ARE GOING TO USE OR MULTIPLE?
			// Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderWStatTableAdapter chkAdapt = new Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderWStatTableAdapter();
			// Datasets.dsRecruitingBackground.BackgroundCheckOrderWStatDataTable chkTbl = chkAdapt.GetDataByProfileId(ProfileId);

			//get logged in user
			Datasets.dsRecruitingBackgroundTableAdapters.PersonWOfficePhneTableAdapter adaptPerson = new Datasets.dsRecruitingBackgroundTableAdapters.PersonWOfficePhneTableAdapter();
			Datasets.dsRecruitingBackground.PersonWOfficePhneDataTable tblePerson = adaptPerson.GetDataById(LoggedInUserId);
			Datasets.dsRecruitingBackground.PersonWOfficePhneRow authUser = tblePerson[0];

			string quoteback = $"TRUCKWIZARD-{Guid.NewGuid().ToString()}";


			//   if (chkTbl.Count >= 1)
			//  {
			//      return "Existing Background check Record Found";
			//  }



			//construct order obj from profile
			RedbonePlatform.Entities.BackgroundCheck.Asurint.Order toCreateOrder = new RedbonePlatform.Entities.BackgroundCheck.Asurint.Order();


			toCreateOrder.QuoteBack = quoteback;
			toCreateOrder.PackageId = packageuid;

			//Construct security object 
			//I NEED THIS INFO FROM ASURINT-------------------------------------------------
			toCreateOrder.Security.AccountID = _config.AccountID;
			toCreateOrder.Security.LocationID = _config.LocationID;
			toCreateOrder.Security.RootCredentials.RootUser = _config.RootUser;
			toCreateOrder.Security.RootCredentials.RootPassword = _config.RootPassword;
			toCreateOrder.Security.CustomerUserReferenceID = authUser.LoginId;

			// toCreateOrder.Security.CustomerUserReferenceID = "bejay@redbonetrucking.com";




			//construct contact object Contact information for ATS user placing the order
			//IS THIS A STATIC VALUE? DOES IT NEED TO MATCH SOMETHING IN ASURINTS SIDE?------------------------------------
			Contact cntct = new Contact();
			cntct.FirstName = authUser.FirstName;
			cntct.LastName = authUser.LastName;
			cntct.Email = authUser.LoginId;
			cntct.Phone = FormatPhoneNum(_config.ContactPhone);
			//cntct.FirstName = "Brandon";
			//cntct.LastName = "Lieber";
			//cntct.Email = "bejay@redbonetrucking.com";
			//cntct.Phone = "801-383-3385";
			toCreateOrder.Contact = cntct;


			//get profile
			Datasets.dsRecruitingBackgroundTableAdapters.ProfileInfoTableAdapter adapt = new Datasets.dsRecruitingBackgroundTableAdapters.ProfileInfoTableAdapter();
			Datasets.dsRecruitingBackground.ProfileInfoDataTable tbl = new Datasets.dsRecruitingBackground.ProfileInfoDataTable();
			Datasets.dsRecruitingBackground.ProfileInfoRow profile;
			// Datasets.dsRecruitingBackground.ProfileInfoRow initialRow = tbl.NewProfileInfoRow();
			tbl = adapt.GetData(ProfileId);

			if (tbl.Count <= 0)
			{
				return "Profile could not be found or info in incomplete";
			}

			profile = tbl[0];

			if (profile.IsExternalCompleteNull() || profile.ExternalComplete != true)
			{
				return "Profile Must be Marked as Complete";
			}


			//BUILD ORDER OBJ FROM PROFILE OBJECT


			//BUILD INPUT SECTION
			Input newOrdrInput = new Input();

			//build subject object
			Subject currSubj = new Subject();
			currSubj.role = "Primary";
			currSubj.FirstName = profile.FirstName;
			//currSubj.MiddleName = "";
			currSubj.LastName = profile.LastName.Replace(".", ""); //asurint doesnt like periods in names, hyphens and spaces ok
			currSubj.SSN = profile.SSN;
			currSubj.DOB = profile.DOB.ToString("MM/dd/yyyy");



			//get drivers license record
			RedbonePlatform.Datasets.dsRecruitingTableAdapters.DriversLicenseListTableAdapter licAdapt = new Datasets.dsRecruitingTableAdapters.DriversLicenseListTableAdapter();
			Datasets.dsRecruiting.DriversLicenseListDataTable tblLicenses = licAdapt.GetData(ProfileId);
			RedbonePlatform.Datasets.dsRecruiting.DriversLicenseListRow licRow = tblLicenses.FirstOrDefault();


			if (licRow == null)
			{
				return "Profile has incomplete Drivers License information";
			}
			currSubj.DLState = licRow.StateCode.Trim();
			currSubj.DLNumber = licRow.Number.Replace("'", "").Trim();


			if (profile.IsPhoneNumberNull())
			{
				return "Profile has incomplete Primary Phone Number information";
			}




			//BUILD SUBJECT CONTACT
			SubjectContact currSubjContact = new SubjectContact();
			currSubjContact.Phone = FormatPhoneNum(profile.PhoneNumber);
			currSubjContact.Email = profile.Email;

			//assign contact to subject
			currSubj.Contact = currSubjContact;


			//assign subject to input object
			newOrdrInput.Subjects.Add(currSubj);

			if (profile.IsAddrLine1Null() || profile.IsAddrCityNull() || profile.IsAddrStateNull() || profile.IsAddrZipNull())
			{
				return "Profile has incomplete Primary Address information";
			}
			//create new address obj
			Address profAddr = new Address();
			profAddr.StreetLine1 = profile.AddrLine1;
			profAddr.StreetLine2 = profile.AddrLine2;
			profAddr.City = profile.AddrCity;
			profAddr.StateProvinceCode = profile.AddrState.Trim();
			profAddr.ZipCode5 = profile.AddrZip;


			//assign address obj to input, we are only attaching the PRIMARY ADDRESS, DO WE NEED ALL ADDRESSES?
			newOrdrInput.Addresses.Add(profAddr);


			//ADD PRODUCTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			//get all employers

			RedbonePlatform.Datasets.dsRecruitingTableAdapters.EmployerListTableAdapter genAdapt = new Datasets.dsRecruitingTableAdapters.EmployerListTableAdapter();
			Datasets.dsRecruiting.EmployerListDataTable tblEmployer = genAdapt.GetData(profile.ProfileId);
			// RedbonePlatform.Datasets.dsRecruiting.EmployerRow addRow = tblEmployer.FirstOrDefault();


			foreach (var row in tblEmployer)
			{
				Product p57176 = new Product();
				p57176.id = "57176";
				Dictionary<string, string> vals = new Dictionary<string, string>();
				vals.Add("CompanyName", row.CompanyName);
				vals.Add("EmpAddress1", row.AddressLine1);
				vals.Add("EmpAddress2", row.IsAddressLine2Null() ? "" : row.AddressLine2);
				vals.Add("EmpState", row.StateCode.Trim());
				vals.Add("EmpCity", row.City);
				vals.Add("JobTitle", row.PositionHeld);
				vals.Add("EmployedFrom", row.StartDate.ToString("MM/dd/yyyy"));
				vals.Add("EmployedTo", row.EndDate.ToString("MM/dd/yyyy"));
				vals.Add("Supervisor", "N/A");
				vals.Add("EmpPhone", row.IsPhoneNumberNull() ? "" : FormatPhoneNum(row.PhoneNumber));
				vals.Add("EmpFax", row.IsFaxNull() ? "" : row.Fax);//O
				vals.Add("EmailAddress", row.Email);
				vals.Add("Department", "");
				vals.Add("DoNotContactEmployer", "false");//O
				vals.Add("LeaveReason", row.DepartureReason);//O

				foreach (var val in vals)
				{
					Item tempItm = new Item();
					tempItm.name = val.Key;
					tempItm.value = val.Value;

					p57176.Criteria.Add(tempItm);
				}
				newOrdrInput.Products.Add(p57176);
			}



			RedbonePlatform.Datasets.dsRecruitingTableAdapters.DrivingSchoolListTableAdapter dSchoolAdapt = new Datasets.dsRecruitingTableAdapters.DrivingSchoolListTableAdapter();
			Datasets.dsRecruiting.DrivingSchoolListDataTable tblschools = dSchoolAdapt.GetData(profile.ProfileId);

			foreach (var row in tblschools)
			{
				//get all education history records
				Product p57177 = new Product();
				p57177.id = "57177";
				Dictionary<string, string> vals77 = new Dictionary<string, string>();
				vals77.Add("FirstName", "");//O
				vals77.Add("LastName", "");//O
				vals77.Add("SchoolName", row.SchoolName);
				vals77.Add("SchoolAddress1", "");//O
				vals77.Add("SchoolAddress2", "");//O
				vals77.Add("EduCity", row.City);
				vals77.Add("EduState", row.StateCode.Trim());
				vals77.Add("Major", "");//O
				vals77.Add("Degree", "");
				vals77.Add("EduPhone", row.IsPhoneNumberNull() ? "" : FormatPhoneNum(row.PhoneNumber));//O
				vals77.Add("EduFax", row.IsFaxNull() ? "" : row.Fax);//O
				vals77.Add("GradDate", "");
				vals77.Add("StartDate", "");//O
				vals77.Add("EndDate", "");//O
				vals77.Add("GPA", "");//O

				foreach (var val in vals77)
				{
					Item tempItm = new Item();
					tempItm.name = val.Key;
					tempItm.value = val.Value;

					p57177.Criteria.Add(tempItm);
				}

				newOrdrInput.Products.Add(p57177);
			}


			//TEST FOR PSP ERROR----------------------------------------------------------

			//Product p57294 = new Product();
			//           p57294.id = "57294";
			//           Dictionary<string, string> vals78 = new Dictionary<string, string>();
			//           vals78.Add("LicenseNumber", "1234");//O
			//           vals78.Add("LicenseTypeOther", "PHYSICAL THERAPIST");//O
			//           vals78.Add("ProfessionalLicenseState", "Az");

			//           foreach (var val in vals78)
			//           {
			//               Item tempItm = new Item();
			//               tempItm.name = val.Key;
			//               tempItm.value = val.Value;

			//               p57294.Criteria.Add(tempItm);
			//           }

			//           newOrdrInput.Products.Add(p57294);





			//           Product p108761 = new Product();
			//           p108761.id = "108761";
			//           p108761.Criteria = null;
			//           newOrdrInput.Products.Add(p108761);




			//           Product p36171 = new Product();
			//           p36171.id = "36171";
			//           Dictionary<string, string> vals79 = new Dictionary<string, string>();
			//           vals79.Add("Address", "1234 w lone tree trail");//O
			//           vals79.Add("City", "Phoenix");//O
			//           vals79.Add("Zip", "85383");
			//           vals79.Add("State", "Az");

			//           foreach (var val in vals79)
			//           {
			//               Item tempItm = new Item();
			//               tempItm.name = val.Key;
			//               tempItm.value = val.Value;

			//               p36171.Criteria.Add(tempItm);
			//           }

			//           newOrdrInput.Products.Add(p36171);






			//           Product p36170 = new Product();
			//           p36170.id = "36170";
			//           Dictionary<string, string> vals80 = new Dictionary<string, string>();
			//           vals80.Add("Address", "1234 w lone tree trail");//O
			//           vals80.Add("City", "Phoenix");//O
			//           vals80.Add("Zip", "85383");
			//           vals80.Add("State", "Az");

			//           foreach (var val in vals80)
			//           {
			//               Item tempItm = new Item();
			//               tempItm.name = val.Key;
			//               tempItm.value = val.Value;

			//               p36170.Criteria.Add(tempItm);
			//           }

			//           newOrdrInput.Products.Add(p36170);


			Product p109305 = new Product();
			p109305.id = "109305";

			Dictionary<string, string> vals81 = new Dictionary<string, string>();
			var pspString = $"&lt;CriteriaSets xmlns:xsd=&quot;http://www.w3.org/2001/XMLSchema&quot; xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;CriteriaSet&gt;&lt;Criteria Name=&quot;LastName&quot; Value=&quot;{profile.LastName.Replace(".", "")}&quot;/&gt;&lt;Criteria Name=&quot;State&quot; Value=&quot;{licRow.StateCode.Trim()}&quot;/&gt;&lt;Criteria Name=&quot;DriversLicense&quot; Value=&quot;{licRow.Number.Trim()}&quot;/&gt;&lt;/CriteriaSet&gt;&lt;CriteriaSet&gt;&lt;Criteria Name=&quot;LastName&quot; Value=&quot;{profile.LastName.Replace(".", "")}&quot;/&gt;&lt;Criteria Name=&quot;State&quot; Value=&quot;{licRow.StateCode.Trim()}&quot;/&gt;&lt;Criteria Name=&quot;DriversLicense&quot; Value=&quot;{licRow.Number.Trim()}&quot;/&gt;&lt;/CriteriaSet&gt;&lt;/CriteriaSets&gt;";
			vals81.Add("PspData", pspString);//O
											 //vals81.Add("City", "Phoenix");//O
											 //vals81.Add("Zip", "85383");
											 //vals81.Add("State", "Az");

			foreach (var val in vals81)
			{
				Item tempItm = new Item();
				tempItm.name = val.Key;
				tempItm.value = val.Value;

				p109305.Criteria.Add(tempItm);
			}

			newOrdrInput.Products.Add(p109305);



			//END TEST FOR PSP ERROR----------------------------------------------------










			//Add "Criteria" 2 objects Gender, mothers maidenName
			CriteriaItem genderItm = new CriteriaItem();
			genderItm.name = "Gender";
			genderItm.scope = "Product";
			if (!profile.IsProfileGenderIdNull())
			{

				switch (profile.Gender)
				{
					case "Male":
						genderItm.value = "M";
						break;
					case "Female":
						genderItm.value = "F";
						break;
					case "Unspecified":
						genderItm.value = "U";
						break;
					default:
						genderItm.value = "U";
						break;
				}



			}
			else
			{
				genderItm.value = "U";
			}


			//WE ARE NOT COLLECTING MOTHERS MAIDEN NAME? DO WE NEED TO? IT SAYS WE CAN SEND N/A
			CriteriaItem maidenNameItm = new CriteriaItem();
			maidenNameItm.name = "Mothers MaidenName";
			maidenNameItm.value = "N/A";
			maidenNameItm.scope = "Product";



			newOrdrInput.Criteria.Add(genderItm);
			newOrdrInput.Criteria.Add(maidenNameItm);


			//ASSEMBLE DOCUMENTS, grab the authorization form that was generated by the portal app, get the id for doc type "Background check authorization"
			RedbonePlatform.Datasets.dsRecruitingTableAdapters.DocumentTypeTableAdapter docTypeAdapt = new Datasets.dsRecruitingTableAdapters.DocumentTypeTableAdapter();
			Datasets.dsRecruiting.DocumentTypeDataTable tbldocType = docTypeAdapt.GetDataByName("Background check authorization");
			RedbonePlatform.Datasets.dsRecruiting.DocumentTypeRow typeRow = tbldocType[0];


			//get pdf file in userfiles for "Background check authorization" document and bse64encode it


			RedbonePlatform.Datasets.dsRecruitingTableAdapters.ProfileDocumentTableAdapter docAdapt = new Datasets.dsRecruitingTableAdapters.ProfileDocumentTableAdapter();
			Datasets.dsRecruiting.ProfileDocumentDataTable tblDocs = docAdapt.GetDataByProfileType(profile.ProfileId, typeRow.DocumentTypeId);



			if (tblDocs.Count <= 0)
			{
				//if we didnt find a document, throw an error indicating so
				return "No Background check Authorization found in Profile Documents";
			}
			else
			{
				RedbonePlatform.Datasets.dsRecruiting.ProfileDocumentRow docAuthRow = tblDocs[0];

				//get document from path
				byte[] docBytes = File.ReadAllBytes(docAuthRow.DocumentPath);

				string b64d = Convert.ToBase64String(docBytes);
				//create new document object, constructor sets everything but content
				Document authDoc = new Document();
				authDoc.Content = b64d;
				//set content to pdf base65
				newOrdrInput.Documents.Add(authDoc);

			}





			//assign input to order object
			toCreateOrder.Input = newOrdrInput;






			var xml2 = "";
			System.Xml.Serialization.XmlSerializer x2 = new System.Xml.Serialization.XmlSerializer(toCreateOrder.GetType());



			using (var sww = new StringWriter())
			{
				XmlWriterSettings sttng = new XmlWriterSettings();
				sttng.ConformanceLevel = ConformanceLevel.Fragment;
				sttng.OmitXmlDeclaration = true;

				using (XmlWriter writer = XmlWriter.Create(sww, sttng))
				{


					// writer.Settings.OmitXmlDeclaration = true;
					//writer.Settings.ConformanceLevel = ConformanceLevel.Fragment;
					writer.WriteWhitespace("");
					//XmlQualifiedName namesp = new XmlQualifiedName("http://schemas.ost.com/oml/base/1.0");
					//List<XmlQualifiedName> names = new List<XmlQualifiedName>();
					//names.Add(namesp);

					XmlSerializerNamespaces ns1 = new XmlSerializerNamespaces();
					ns1.Add("", "http://schemas.ost.com/oml/base/1.0");

					x2.Serialize(writer, toCreateOrder, ns1);
					xml2 = sww.ToString(); // Your XML


					xml2 = xml2.Replace("packageuri", "package:uri");

					xml2 = xml2.Replace("xmlnspackage", "xmlns:package");
					xml2 = xml2.Replace("ItemCrit", "Item");

				}
			}




			string chk = "";

			//end code for testing



			//post to api with order as body

			//update externalId
			string createURI = _config.CreateOrderUrl;
			//string testcont = $"<Order xmlns=\"http://schemas.ost.com/oml/base/1.0\"><Security xmlns=\"http://schemas.ost.com/oml/security/1.0\"><RootCredentials username=\"ust_RedBoneTruckWizardTest\" password=\"TruckWizard1!\" /><AccountID>28450</AccountID><LocationID>28450</LocationID><CustomerUserReferenceID>TestUser</CustomerUserReferenceID></Security><Contact xmlns=\"http://schemas.ost.com/oml/contact/1.0\"><FirstName>Thomas</FirstName><LastName>St. Germain</LastName><Email>thomas@jadedsaint.com</Email></Contact><IncludeParentPackages>True</IncludeParentPackages></Order>";
			// testcont = xml2;

			HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, createURI);
			request.Content = new StringContent(xml2,
												Encoding.UTF8,
												"text/xml");//CONTENT-TYPE header

			// var task = Task.Run(() => client.PostAsXmlAsync(createURI, reqPackages));
			var task = Task.Run(() => client.SendAsync(request));
			task.Wait();
			var response = task.Result;


			//var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			taskrd.Wait();
			var responseString = taskrd.Result;
			// var responseString = await response.Content.ReadAsStringAsync();

			ApplicationAcknowledgement respObj = new ApplicationAcknowledgement();

			var xml = "";
			System.Xml.Serialization.XmlSerializer x = new System.Xml.Serialization.XmlSerializer(respObj.GetType());

			using (TextReader reader = new StringReader(responseString))
			{
				respObj = (ApplicationAcknowledgement)x.Deserialize(reader);
			}



			//  ApplicationAcknowledgement respObj = responseString



			//parse response


			if (respObj != null && respObj.PayloadDisposition.EntityDisposition.EntityStatus != "Complete")
			{
				//we had an error
				if (respObj.PayloadDisposition.EntityDisposition.EntityException != null && respObj.PayloadDisposition.EntityDisposition.EntityException.Exception != null)
				{
					return respObj.PayloadDisposition.EntityDisposition.EntityException.Exception.ExceptionMessage;
				}
				else
				{
					return "Unknown Error Submitting background";
				}
			}
			else
			{
				//we succesfully submitted


				//get id of status in db
				Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckStatusTableAdapter statAdapt = new Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckStatusTableAdapter();
				Datasets.dsRecruitingBackground.BackgroundCheckStatusDataTable statTbl = statAdapt.GetDataByCode("0");




				//put record in db
				Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderTableAdapter cdeAdapt = new Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderTableAdapter();
				Datasets.dsRecruitingBackground.BackgroundCheckOrderDataTable cdeTbl = new Datasets.dsRecruitingBackground.BackgroundCheckOrderDataTable();
				Datasets.dsRecruitingBackground.BackgroundCheckOrderRow newCde = cdeTbl.NewBackgroundCheckOrderRow();

				newCde.ProfileId = ProfileId;
				newCde.ExternalId = respObj.PayloadDisposition.EntityDisposition.Identifier.BackgroundCheckOrderNumber;
				newCde.QuoteBack = quoteback;
				newCde.ProductId = packageuid;//;
				newCde.ProductName = packageName;//;
				newCde.BackgroundCheckStatusId = statTbl[0].BackgroundCheckStatusId; //processing
				newCde.OrderDate = DateTime.Now;

				//put request xml in db for record keeping





				//  XElement root = XElement.Parse(xml2);
				//var mewo = root.Elements();


				//var soundcards = root.Elements().Where(xl => xl.Name == "{{http://schemas.ost.com/oml/security/1.0}Security}").FirstOrDefault();
				//soundcards.Remove();

				//var sanixml = root.ToString();


				var doc = XDocument.Parse(xml2);
				var nodeToRemove = doc.Descendants().Where(o => o.Name.LocalName == "Security");
				nodeToRemove.Remove();
				var sanixml = doc.ToString();

				newCde.RequestObject = sanixml;


				cdeTbl.AddBackgroundCheckOrderRow(newCde);

				cdeAdapt.Update(cdeTbl);
				return "";
			}







			//check if a background check exists

			//warn if a record already exists, and ask to resubmit


			//create Background check order row
			//Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderTableAdapter cdeAdapt = new Datasets.dsRecruitingBackgroundTableAdapters.BackgroundCheckOrderTableAdapter();
			//Datasets.dsRecruitingBackground.BackgroundCheckOrderDataTable cdeTbl = new Datasets.dsRecruitingBackground.BackgroundCheckOrderDataTable();
			//Datasets.dsRecruitingBackground.BackgroundCheckOrderRow newCde = cdeTbl.NewBackgroundCheckOrderRow();

			//newCde.ProfileId = ProfileId;
			//newCde.ExternalId = "";
			//newCde.QuoteBack = Guid.NewGuid().ToString();
			//newCde.Product = "What is the product w2e are sending, should this be stored in the db or just in config";//;
			//newCde.BackgroundCheckStatusId = 1; //set to sent status
			//newCde.OrderDate = DateTime.Now;




			//cdeTbl.AddBackgroundCheckOrderRow(newCde);

			//cdeAdapt.Update(cdeTbl);




			// toCreateOrder.id = "sdsdsd";
			// var xml = "";
			// System.Xml.Serialization.XmlSerializer x = new System.Xml.Serialization.XmlSerializer(toCreateOrder.GetType());
			//x.Serialize(mm, pp);





			//using (var sww = new StringWriter())
			//{
			//    using (XmlWriter writer = XmlWriter.Create(sww))
			//    {
			//        x.Serialize(writer, toCreateOrder);
			//        xml = sww.ToString(); // Your XML
			//    }
			//}







		}



		public List<RedbonePlatform.Entities.PackageLookup.Package> GetPackages(int LoggedInUserId)
		{

			//get logged in user
			Datasets.dsRecruitingBackgroundTableAdapters.PersonWOfficePhneTableAdapter adaptPerson = new Datasets.dsRecruitingBackgroundTableAdapters.PersonWOfficePhneTableAdapter();
			Datasets.dsRecruitingBackground.PersonWOfficePhneDataTable tblePerson = adaptPerson.GetDataById(LoggedInUserId);
			Datasets.dsRecruitingBackground.PersonWOfficePhneRow authUser = tblePerson[0];

			//construct order obj from profile
			RedbonePlatform.Entities.PackageLookup.Order reqPackages = new RedbonePlatform.Entities.PackageLookup.Order();

			//Construct security object 
			//I NEED THIS INFO FROM ASURINT-------------------------------------------------
			reqPackages.Security.AccountID = _config.AccountID;
			reqPackages.Security.LocationID = _config.LocationID;
			reqPackages.Security.RootCredentials.RootUser = _config.RootUser;
			reqPackages.Security.RootCredentials.RootPassword = _config.RootPassword;
			reqPackages.Security.CustomerUserReferenceID = authUser.LoginId;

			//construct contact object Contact information for ATS user placing the order
			//IS THIS A STATIC VALUE? DOES IT NEED TO MATCH SOMETHING IN ASURINTS SIDE?------------------------------------
			Contact cntct = new Contact();
			cntct.FirstName = authUser.FirstName;
			cntct.LastName = authUser.LastName;
			cntct.Email = authUser.LoginId;
			cntct.Phone = _config.ContactPhone;
			reqPackages.Contact = cntct;

			reqPackages.IncludeParentPackages = false;




			//code to serialize order and check for testing

			var xml2 = "";
			System.Xml.Serialization.XmlSerializer x2 = new System.Xml.Serialization.XmlSerializer(reqPackages.GetType());



			using (var sww = new StringWriter())
			{
				XmlWriterSettings sttng = new XmlWriterSettings();
				sttng.ConformanceLevel = ConformanceLevel.Fragment;
				sttng.OmitXmlDeclaration = true;

				using (XmlWriter writer = XmlWriter.Create(sww, sttng))
				{


					// writer.Settings.OmitXmlDeclaration = true;
					//writer.Settings.ConformanceLevel = ConformanceLevel.Fragment;
					writer.WriteWhitespace("");
					//XmlQualifiedName namesp = new XmlQualifiedName("http://schemas.ost.com/oml/base/1.0");
					//List<XmlQualifiedName> names = new List<XmlQualifiedName>();
					//names.Add(namesp);

					XmlSerializerNamespaces ns1 = new XmlSerializerNamespaces();
					ns1.Add("", "http://schemas.ost.com/oml/base/1.0");

					x2.Serialize(writer, reqPackages, ns1);
					xml2 = sww.ToString(); // Your XML
				}
			}




			string chk = "";

			//end code for testing



			//post to api with order as body

			//update externalId
			string createURI = _config.PackageLookupUrl;
			//string testcont = $"<Order xmlns=\"http://schemas.ost.com/oml/base/1.0\"><Security xmlns=\"http://schemas.ost.com/oml/security/1.0\"><RootCredentials username=\"ust_RedBoneTruckWizardTest\" password=\"TruckWizard1!\" /><AccountID>28450</AccountID><LocationID>28450</LocationID><CustomerUserReferenceID>TestUser</CustomerUserReferenceID></Security><Contact xmlns=\"http://schemas.ost.com/oml/contact/1.0\"><FirstName>Thomas</FirstName><LastName>St. Germain</LastName><Email>thomas@jadedsaint.com</Email></Contact><IncludeParentPackages>True</IncludeParentPackages></Order>";
			// testcont = xml2;

			HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, createURI);
			request.Content = new StringContent(xml2,
												Encoding.UTF8,
												"text/xml");//CONTENT-TYPE header

			//client.SendAsync(request)
			//      .ContinueWith(responseTask =>
			//      {

			//          var taskrds = Task.Run(() => responseTask.Result.Content.ReadAsStringAsync());
			//          taskrds.Wait();
			//          var responseStrings = taskrds.Result;


			//          Console.WriteLine("Response: {0}", responseTask.Result);
			//      });




			// var task = Task.Run(() => client.PostAsXmlAsync(createURI, reqPackages));
			var task = Task.Run(() => client.SendAsync(request));
			task.Wait();
			var response = task.Result;


			//var response = await client.PostAsXmlAsync(createURI, toCreateOrder);

			var taskrd = Task.Run(() => response.Content.ReadAsStringAsync());
			taskrd.Wait();
			var responseString = taskrd.Result;
			// var responseString = await response.Content.ReadAsStringAsync();

			ATSServiceAcknowledgement respObj = new ATSServiceAcknowledgement();

			var xml = "";
			System.Xml.Serialization.XmlSerializer x = new System.Xml.Serialization.XmlSerializer(respObj.GetType());

			using (TextReader reader = new StringReader(responseString))
			{
				respObj = (ATSServiceAcknowledgement)x.Deserialize(reader);
			}

			return respObj.ATSResponse.ATSResponsePackages.Packages.ToList();

			//  ApplicationAcknowledgement respObj = responseString



			//parse response




		}


	}
}