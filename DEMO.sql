DECLARE @dt NVARCHAR(25)	= '2024-04-04 14:12:18.043';

update dispatch.load  set PaperworkRecvdDate = NULL where loadid = 57009
--update dispatch.load  set PaperworkRecvdDate = @dt where loadid = 57009


select PaperworkRecvdDate from dispatch.load where loadid = 57009


