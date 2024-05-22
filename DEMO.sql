DECLARE @dt NVARCHAR(25)	= '2024-04-04 14:12:18.043';
DECLARE @LOADYLOAD INT		= 57009;




--reset
--update dispatch.load  set PaperworkRecvdDate = NULL where loadid = 57009



--unhold
--update dispatch.load  set PaperworkRecvdDate = @dt where loadid = 57009


select aepd.* 
from
[export].[AccountingExportPayrollData] aepd
join dispatch.load ld on aepd.LoadIdOrDriverPayId = ld.loadid
where PayPeriodId is null
and ld.PaperworkRecvdDate is not null
--where LoadIdOrDriverPayId = 57009 




--select PaperworkRecvdDate from dispatch.load where loadid = 57009
--select top 1000 * from [dispatch].[PR_OTR_History] order by loadid desc
--select * from [dispatch].[Load] where  loadid = 57009
--select * from [dispatch].[PR_OTR_History] where  loadid = 57009
