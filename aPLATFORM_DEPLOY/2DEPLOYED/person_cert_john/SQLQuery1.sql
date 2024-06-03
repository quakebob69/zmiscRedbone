
--select * from 

--select CertificationCode from main.CertificationPersonMapping where personid = 8


declare @ActiveInd bit
	set @ActiveInd = 0
	--set @ActiveInd = 1


SELECT        main.CertificationPersonMapping.CertificationPersonMappingId, main.CertificationPersonMapping.PersonId, main.CertificationPersonMapping.CertificationTypeId, main.CertificationPersonMapping.ReceivedDate, 
                         main.CertificationPersonMapping.ExpireDate, main.CertificationPersonMapping.Notes, main.CertificationPersonMapping.CertificationCode, main.CertificationType.CertificationDescription, 
                         main.CertificationPersonMapping.CertificationState, main.CertificationPersonMapping.ActiveInd
FROM            main.CertificationPersonMapping INNER JOIN
                         main.CertificationType ON main.CertificationPersonMapping.CertificationTypeId = main.CertificationType.CertificationTypeId
WHERE        (main.CertificationPersonMapping.PersonId = 8) AND (main.CertificationPersonMapping.ActiveInd <> @ActiveInd)








--select * from 

--select CertificationCode from main.CertificationPersonMapping where personid = 8





SELECT        main.CertificationPersonMapping.CertificationPersonMappingId, main.CertificationPersonMapping.PersonId, main.CertificationPersonMapping.CertificationTypeId, main.CertificationPersonMapping.ReceivedDate, 
                         main.CertificationPersonMapping.ExpireDate, main.CertificationPersonMapping.Notes, main.CertificationPersonMapping.CertificationCode, main.CertificationType.CertificationDescription, 
                         main.CertificationPersonMapping.CertificationState, main.CertificationPersonMapping.ActiveInd
FROM            main.CertificationPersonMapping INNER JOIN
                         main.CertificationType ON main.CertificationPersonMapping.CertificationTypeId = main.CertificationType.CertificationTypeId
WHERE        main.CertificationPersonMapping.PersonId = 8


and  iif(1=0, main.CertificationPersonMapping.ActiveInd, main.CertificationPersonMapping.ActiveInd) is not null
                --AND iif(1=1, main.CertificationPersonMapping.ActiveInd = @ActiveInd, (main.CertificationPersonMapping.ActiveInd <> @ActiveInd))

