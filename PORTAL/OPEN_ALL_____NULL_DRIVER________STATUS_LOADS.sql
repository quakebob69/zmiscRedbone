update dispatch.load
	set LoadDriverStatusId = (select LoadDriverStatusId from dispatch.LoadDriverStatus where Name = 'Awaiting Acceptance')
		where
			loadid in 
				(
					select loadid from dispatch.load
						WHERE
							LoadStatusTypeId
								IN
								(
									SELECt LoadStatusTypeId from dispatch.LoadStatusType
									where LoadStatusTypeNm in ('Dispatched', 'In Transit', 'Delivered', 'Hold Billing', 'Avail Billing', 'Awaiting Cust Appr', 'Ready to Close')
								)
							AND
							PaperworkRecvdDate IS NULL
							AND
							LoadDriverStatusId IS NULL
							--order by CreatedDt
				);




---------------------------------
	select l.loadid, lst.LoadStatusTypeNm
		from dispatch.load l
			join dispatch.LoadStatusType lst on l.LoadStatusTypeId = lst.LoadStatusTypeId
				WHERE
					l.LoadStatusTypeId
						IN
						(
							SELECt LoadStatusTypeId from dispatch.LoadStatusType
							where LoadStatusTypeNm in ('Dispatched', 'In Transit', 'Delivered', 'Hold Billing', 'Avail Billing', 'Awaiting Cust Appr', 'Ready to Close')
						)
					AND
					PaperworkRecvdDate IS NULL
					AND
					LoadDriverStatusId IS NULL
				ORDER BY
					LoadStatusTypeNm

