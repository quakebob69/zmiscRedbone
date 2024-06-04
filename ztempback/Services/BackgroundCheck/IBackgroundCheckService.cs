using RedbonePlatform.Entities.BackgroundCheck.Asurint;
using System;

namespace RedbonePlatform.Services.BackgroundCheck
{
	interface IBackgroundCheckService
	{

		System.Threading.Tasks.Task CreateOrderAsync(Order toCreateOrder);
		String CreateOrder(int ProfileId, string packageuid, string packageName, int LoggedInUserId);

	}
}
