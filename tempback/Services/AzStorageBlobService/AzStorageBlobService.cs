
//using Azure.Storage.Blobs;
using RedbonePlatform.Entities.AzBlob;
using System;
using System.Configuration;
using System.IO;
using System.Threading.Tasks;

namespace RedbonePlatform.Services
{
	public class AzStorageBlobService : IAzStorageBlobService
	{

		private readonly AzBlobConnectionOptions _config;

		public AzStorageBlobService(AzBlobConnectionOptions config)
		{

			_config = config;


		}



		public AzStorageBlobService()
		{

			_config = new AzBlobConnectionOptions();
			_config.ConnectionString = ConfigurationManager.AppSettings["AzBlobConnectionOptions.ConnectionString"];
			_config.ContainerName = ConfigurationManager.AppSettings["AzBlobConnectionOptions.ContainerName"];
			_config.LocalDirectory = ConfigurationManager.AppSettings["AzBlobConnectionOptions.LocalDirectory"];

		}
		#region Blob Functions
		public async Task<bool> DownloadBlobToFileAsync(string blobPath, string Path)
		{

			try
			{
				//BlobContainerClient container = new BlobContainerClient(_config.ConnectionString, _config.ContainerName);
				//BlobClient blob = container.GetBlobClient(blobPath);
				//blob.DownloadTo(Path);

				return true;

			}
			catch (Exception exception)
			{
				//_logger.LogError(exception, $"Failed putting Message on Storage Queue");
				return false;
			}
			finally
			{

			}
		}


		public async Task<Stream> DownloadBlobToStreamAsync(string blobPath)
		{

			try
			{
				// BlobContainerClient container = new BlobContainerClient(_config.ConnectionString, _config.ContainerName);
				// BlobClient blob = container.GetBlobClient(blobPath);

				var s = new MemoryStream();
				// blob.DownloadTo(s);
				// s.Position = 0;

				//// blob.DownloadTo(Path);

				return s;

			}
			catch (Exception exception)
			{
				//_logger.LogError(exception, $"Failed putting Message on Storage Queue");
				return null;
			}
			finally
			{

			}
		}

		public async Task<bool> DownloadBlobToLocalDirAsync(string blobPath)
		{

			try
			{
				//BlobContainerClient container = new BlobContainerClient(_config.ConnectionString, _config.ContainerName);
				//BlobClient blob = container.GetBlobClient(blobPath);
				//blob.DownloadTo(_config.LocalDirectory);

				return true;

			}
			catch (Exception exception)
			{
				//_logger.LogError(exception, $"Failed putting Message on Storage Queue");
				return false;
			}
			finally
			{

			}
		}


		public async Task<bool> UploadBlob(byte[] file, string filename, string remotePath)
		{
			//BlobContainerClient container = new BlobContainerClient(_config.ConnectionString, _config.ContainerName);

			//filename = remotePath + filename;
			//BlobClient blobClient = container.GetBlobClient(filename);

			//Console.WriteLine("Uploading to Blob storage as blob:\n\t {0}\n", blobClient.Uri);

			//BinaryData sd = new BinaryData(file);


			//// Upload data from the local file
			//await blobClient.UploadAsync(sd);

			return true;

		}
		#endregion




	}
}
