namespace RedbonePlatform.Services.BackgroundCheck
{
	interface ISMSService
	{

		string SendRecruitingMessage(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message, int SenderId, string attachUri = "", string attachMime = "", string attachName = "");
		string SendRecruitingNotification(Datasets.dsRecruitingBackground.ProfileInfoRow Profile, string phoneNum, string message);

		string CreateAttachment(byte[] fileData, string MimeType, string fileName);


		string SyncRecruitingConversation(int ProfileId);
	}
}
