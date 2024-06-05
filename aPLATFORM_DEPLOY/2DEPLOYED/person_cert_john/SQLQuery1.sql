/*
delete from main.CertificationPersonMapping
                         where CertificationPersonMappingId

						 in (SELECT        CertificationPersonMappingId
FROM            main.CertificationPersonMapping
WHERE        (main.CertificationPersonMapping.PersonId = 2775) and activeind = 0)



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

--update main.CertificationPersonMapping set filename = 'SRS.pdf' where CertificationPersonMappingId = 7643 

--select * from main.CertificationPersonMapping where CertificationPersonMappingId = 7643


select * from main.CertificationPersonMapping where PersonId = 2775;

select * from main.CertificationPersonMapping where filename is not null;


--select * from main.CertificationPersonMapping where CertificationPersonMappingId  < 0;


select personid, * from main.CertificationPersonMapping order by CertificationPersonMappingId desc;

select * from main.Person where personid = 2982
*/


