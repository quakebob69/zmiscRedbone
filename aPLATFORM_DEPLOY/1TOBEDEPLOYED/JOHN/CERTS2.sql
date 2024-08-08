SELECT       
main.CertificationPersonMapping.CertificationPersonMappingId, main.CertificationPersonMapping.PersonId, main.CertificationPersonMapping.CertificationTypeId, main.CertificationPersonMapping.ReceivedDate,                           main.CertificationPersonMapping.ExpireDate, main.CertificationPersonMapping.Notes, main.CertificationPersonMapping.CertificationCode, main.CertificationType.CertificationDescription, main.CertificationPersonMapping.fileName
FROM            main.CertificationPersonMapping
INNER JOIN                          main.CertificationType ON main.CertificationPersonMapping.CertificationTypeId = main.CertificationType.CertificationTypeId
WHERE        (main.CertificationPersonMapping.PersonId = 2775)

--
update main.CertificationPersonMapping set filename = 'C:\Users\danny.call\source\repos\RedboneWizard\RedBonePlatform\RedBonePlatform\UserFiles\2775\Qualification\Certifications\Safe Land\2010_FinalSig_09_20_2024.pdf' where personid = 2775
                                                      --C:\Users\portl\source\redbone\redboneplatform\RedBonePlatform\RedBonePlatform\\UserFiles\RecruitingFiles\1002\shutterstock_645891550 (4).png
													  --"C:\\Users\\portl\\source\\redbone\\redboneplatform\\RedBonePlatform\\RedBonePlatform\\\\UserFiles\\RecruitingFiles\\1002\\shutterstock_645891550 (4).png"
													  --'C:\Users\danny.call\source\repos\RedboneWizard\RedBonePlatform\RedBonePlatform\UserFiles\2775\Qualification\Certifications\Safe Land\127.jpg'

delete from main.CertificationPersonMapping where main.CertificationPersonMapping.PersonId = 2775;

SELECT TOP (1000) [CertificationPersonMappingId]
      ,[PersonId]
      ,[CertificationTypeId]
      ,[ReceivedDate]
      ,[ExpireDate]
      ,[Notes]
      ,[CertificationCode]
      ,[CertificationState]
      ,[ActiveInd]
      ,[FileName]
  FROM [main].[CertificationPersonMapping]
  where filename is not null
  order by personid, CertificationPersonMappingId desc




  SELECT distinct 
     (concat([PersonId]
       , [FileName]))
  FROM [main].[CertificationPersonMapping]
  where filename is not null
  --order by personid, CertificationPersonMappingId des




SELECT
	main.CertificationPersonMapping.CertificationPersonMappingId, main.CertificationPersonMapping.FileName, main.CertificationPersonMapping.PersonId, main.CertificationPersonMapping.CertificationTypeId, main.CertificationPersonMapping.ReceivedDate,                           main.CertificationPersonMapping.ExpireDate, main.CertificationPersonMapping.Notes, main.CertificationPersonMapping.CertificationCode, main.CertificationType.CertificationDescription, main.CertificationPersonMapping.fileName
FROM
	main.CertificationPersonMapping
	INNER JOIN main.CertificationType ON main.CertificationPersonMapping.CertificationTypeId = main.CertificationType.CertificationTypeId
WHERE
	main.CertificationPersonMapping.PersonId in
		(select personid from main.Person where personid = 2775)




SELECT TOP (1000) [CertificationPersonMappingId]
      ,[PersonId]
      ,[CertificationTypeId]
      ,[ReceivedDate]
      ,[ExpireDate]
      ,[Notes]
      ,[CertificationCode]
      ,[CertificationState]
      ,[ActiveInd]
      ,[FileName]
  FROM [main].[CertificationPersonMapping]




/*select * from main.CertificationPersonMapping where filename is not null


select * from main.CertificationPersonMapping where PersonId = (select top 1 PersonId from main.person where LastName = 'BRAVO')
select * from main.CertificationPersonMapping where PersonId = (select top 1 PersonId from main.person where FIRSTNAME = 'DANIEL' AND LastName = 'CALL')

--UPDATE main.CertificationPersonMapping SET FileName = '3-22-2023 Med Card.pdf' WHERE CertificationPersonMappingID = 7220
--UPDATE main.CertificationPersonMapping SET FileName = '07-09-2024 Medical Card.pdf' WHERE CertificationPersonMappingID = 7681




select * from main.CertificationPersonMapping where filename is not null
ORDER BY PERSONID


--where PersonId = (select top 1 PersonId from main.person where LastName = 'BRAVO')*/
