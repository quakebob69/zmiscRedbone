/*
delete from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 0)
*/


/*select * from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 0)
select * from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 1)*/

--update main.CertificationPersonMapping set filename = 'Glossary of Transportation Terms.pdf' where CertificationPersonMappingId = 7643 

--select * from main.CertificationPersonMapping where CertificationPersonMappingId = 7643


select * from main.CertificationPersonMapping
where filename is not null