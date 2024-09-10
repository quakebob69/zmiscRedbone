update dispatch.load
set LoadDriverStatusId = (select LoadDriverStatusId from dispatch.LoadDriverStatus where Name = 'Awaiting Acceptance')
where LoadDriverStatusId is null and LoadStatusTypeId = (select LoadStatusTypeid from dispatch.LoadStatusType  where LoadStatusTypeNm = 'Dispatched');
