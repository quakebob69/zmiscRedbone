using System.IO;
using System.Threading.Tasks;


namespace RedbonePlatform.Services
{
	public interface IAzStorageBlobService
	{
		// Task<bool> StoreBlobAsync(StorageQueueEntry StorageEntry);

		Task<bool> DownloadBlobToFileAsync(string blobPath, string Path);
		Task<Stream> DownloadBlobToStreamAsync(string blobPath);

		Task<bool> UploadBlob(byte[] file, string filename, string remotePath);


	}
}