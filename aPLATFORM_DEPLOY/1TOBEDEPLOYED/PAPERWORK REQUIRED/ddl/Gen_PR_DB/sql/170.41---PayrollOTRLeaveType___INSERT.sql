--select pers.personid, count(pers.personid) as 'tot types' from main.person pers join main.persontypemapping permap on pers.personid = permap.PersonId where pers.isactive = 1 and (persontypeid = 1 or persontypeid = 3  or persontypeid = 4) group by pers.personid having count(pers.personid) > 1 
--select * from main.person where personid in (8, 62, 73, 2153)


--amdin
select personid from main.persontypemapping permap where persontypeid = 1


--fedex
select personid from main.persontypemapping permap where persontypeid = 3




--OTR
select personid from main.persontypemapping permap where persontypeid = 4

