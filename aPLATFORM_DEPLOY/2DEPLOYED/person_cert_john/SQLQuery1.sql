/*
delete from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 0)
*/

select * from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 0)
select * from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 1)

