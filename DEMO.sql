update dispatch.load  set PaperworkRecvdDate = NULL where loadid = 57009
update dispatch.load  set PaperworkRecvdDate = 'ASDF' where loadid = 57009


select PaperworkRecvdDate from dispatch.load where loadid = 57009


