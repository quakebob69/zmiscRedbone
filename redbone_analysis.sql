--SUMMARY
	SELECT
		OBJECT_NAME(referenced_id) AS 'referencED object'
		,'<---------' AS ' '
		,COUNT(*) as 'referencING object count'
	FROM
		sys.sql_expression_dependencies sed
	JOIN
		sys.objects o ON sed.referencing_id = o.object_id
	JOIN
		sys.objects dep_on ON sed.referenced_id = dep_on.object_id
	WHERE
		--OBJECT_NAME(referenced_id) in ('LOAD', 'LOADSTOP', 'LOADSTOPTYPE')
		OBJECT_NAME(referenced_id) in ('LOADSTOPTYPE')
		--OBJECT_NAME(referenced_id) like ('LOAD%')
	GROUP BY
		OBJECT_NAME(referenced_id)
	ORDER BY
		COUNT(*) desc
		,OBJECT_NAME(referenced_id)
	;




--SUMMARY by type
	SELECT
		OBJECT_NAME(referenced_id) AS 'referencED object'
		,'<---------' AS ' '
		,o.type_desc AS 'referencING type'
		,COUNT(*) as 'count'
	FROM
		sys.sql_expression_dependencies sed
	JOIN
		sys.objects o ON sed.referencing_id = o.object_id
	JOIN
		sys.objects dep_on ON sed.referenced_id = dep_on.object_id
	WHERE
		--OBJECT_NAME(referenced_id) in ('LOAD', 'LOADSTOP', 'LOADSTOPTYPE')
		OBJECT_NAME(referenced_id) in ('LOADSTOPTYPE')
		--OBJECT_NAME(referenced_id) like ('LOAD%')
	GROUP BY
		OBJECT_NAME(referenced_id)
		,o.type_desc
	ORDER BY
		OBJECT_NAME(referenced_id)
		,COUNT(*) desc
		,o.type_desc
	;



--DETAIL
	SELECT
		OBJECT_NAME(referenced_id) AS 'referencED object'
		--,dep_on.type_desc AS 'referencED type'
		,'<---------' AS ' '
		,OBJECT_NAME(referencing_id) AS 'referencING object'
		--,o.type_desc AS 'referencING type'
	FROM
		sys.sql_expression_dependencies sed
	JOIN
		sys.objects o ON sed.referencing_id = o.object_id
	JOIN
		sys.objects dep_on ON sed.referenced_id = dep_on.object_id
	WHERE
		--OBJECT_NAME(referenced_id) in ('LOAD', 'LOADSTOP', 'LOADSTOPTYPE')
		OBJECT_NAME(referenced_id) in ('LOADSTOPTYPE')
		--OBJECT_NAME(referenced_id) like ('LOAD%')
			--and OBJECT_NAME(referencing_id) like ('%payroll%')
			--and OBJECT_NAME(referencing_id) like ('%performanc%')
			--and OBJECT_NAME(referencing_id) like ('%acc%')
	ORDER BY
		OBJECT_NAME(referenced_id)
		--,dep_on.type_desc
		,OBJECT_NAME(referencing_id)
	;











	/*



	set @tblName = 'LOADSTOP'
	SELECT
			OBJECT_NAME(referenced_id) AS referenced_object_name
			,dep_on.type_desc AS referenced_object_type
			,OBJECT_NAME(referencing_id) AS referencing_object_name
			,o.type_desc AS referencing_object_type
	FROM
		sys.sql_expression_dependencies sed
	JOIN
		sys.objects o ON sed.referencing_id = o.object_id
	JOIN
		sys.objects dep_on ON sed.referenced_id = dep_on.object_id
	WHERE
		OBJECT_NAME(referenced_id) = @tblName
	ORDER BY
		referencing_object_type
		, referencing_object_name
	;




	*/