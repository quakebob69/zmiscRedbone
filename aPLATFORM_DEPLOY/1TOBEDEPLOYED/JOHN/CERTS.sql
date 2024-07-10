select * from main.CertificationPersonMapping where filename is not null


select * from main.CertificationPersonMapping where PersonId = (select top 1 PersonId from main.person where LastName = 'BRAVO')
select * from main.CertificationPersonMapping where PersonId = (select top 1 PersonId from main.person where FIRSTNAME = 'DANIEL' AND LastName = 'CALL')

--UPDATE main.CertificationPersonMapping SET FileName = '3-22-2023 Med Card.pdf' WHERE CertificationPersonMappingID = 7220
--UPDATE main.CertificationPersonMapping SET FileName = '07-09-2024 Medical Card.pdf' WHERE CertificationPersonMappingID = 7681




select * from main.CertificationPersonMapping where filename is not null
ORDER BY PERSONID


--where PersonId = (select top 1 PersonId from main.person where LastName = 'BRAVO')
