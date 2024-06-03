using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;


namespace RedbonePlatform.Services
{
    public interface INotificationService
    {
        void SendLoadUpdatedNotification(string LoadId);
        void SendLoadUpdatedPerPersonNotification(string LoadId, string PersonId);
        void SendFileRequestStatusUpdate(string LoadId, string StopId, string status);


        void SendPersonMessageSentUpdate(string MessageId, string PersonId, string Title);

        void SendBroadcastMessageSentUpdate(string MessageId, string Title);
    }
      
}