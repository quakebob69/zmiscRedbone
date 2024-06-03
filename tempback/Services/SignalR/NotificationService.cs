
using System;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;
using System.Threading.Tasks;
//using Azure.Storage.Blobs;
using RedbonePlatform.Entities.AzBlob;
using System.Configuration;
using System.Net;

namespace RedbonePlatform.Services
{
    public class NotificationService : INotificationService
    {
        private readonly string _sigrNotiKey ;
        private readonly string _loadHubAPIBaseUrl;
        private readonly string _personHubAPIBaseUrl;

        public NotificationService()
        {
            _loadHubAPIBaseUrl = ConfigurationManager.AppSettings["SignalRSettings.LoadHubAPIBaseUrl"];
            _personHubAPIBaseUrl = ConfigurationManager.AppSettings["SignalRSettings.PersonHubAPIBaseUrl"];
            _sigrNotiKey = ConfigurationManager.AppSettings["SignalRSettings.XApiKey"];
        }




        public void SendLoadUpdatedPerPersonNotification(string LoadId, string PersonId)
        {
            //https://localhost:7095/api/Load/TriggerLoadUpdateGet?LoadId={LoadId}";

            try
            {
                string URI = _loadHubAPIBaseUrl + $"TriggerLoadUpdatePerPersonGet?LoadId={LoadId}&PersonId={PersonId}";
                using (var client = new WebClient())
                {
                    client.Headers.Add("XApiKey", _sigrNotiKey);
                    string result = client.DownloadString(URI);

                }

            }
            catch (Exception ex)
            {
                return;
            }

        }

        public void SendLoadUpdatedNotification(string LoadId)
        {
            //https://localhost:7095/api/Load/TriggerLoadUpdateGet?LoadId={LoadId}";

            try
            {
                string URI = _loadHubAPIBaseUrl + $"TriggerLoadUpdateGet?LoadId={LoadId}";
                using (var client = new WebClient())
                {
                    client.Headers.Add("XApiKey", _sigrNotiKey);
                    string result = client.DownloadString(URI);

                }

            }
            catch (Exception ex)
            {
                return;
            }

        }

        public void SendFileRequestStatusUpdate(string LoadId, string StopId, string status)
        {
            try { 
            string URI = _loadHubAPIBaseUrl + $"TriggerLoadFileRequestUpdate?LoadId={LoadId}&LoadStopId={StopId}&StatusText={status}";
            using (var client = new WebClient())
            {
                client.Headers.Add("XApiKey", _sigrNotiKey);
                string result = client.DownloadString(URI);

            }
            }
            catch (Exception ex)
            {
                return;
            }
        }

        public void SendPersonMessageSentUpdate(string MessageId, string PersonId, string Title)
        {
            try { 
            string URI = _personHubAPIBaseUrl + $"TriggerPersonMessageSent?MessageId={MessageId}&PersonId={PersonId}&Title={Title}";
            using (var client = new WebClient())
            {
                client.Headers.Add("XApiKey", _sigrNotiKey);
                string result = client.DownloadString(URI);

            }
            }
            catch (Exception ex)
            {
                return;
            }
        }


        public void SendBroadcastMessageSentUpdate(string MessageId, string Title)
        {
            try { 
            string URI = _personHubAPIBaseUrl + $"TriggerBroadcastMessageSent?MessageId={MessageId}&Title={Title}";
            using (var client = new WebClient())
            {
                client.Headers.Add("XApiKey", _sigrNotiKey);
                string result = client.DownloadString(URI);

            }
            }
            catch (Exception ex)
            {
                return;
            }
        }


    }
}
