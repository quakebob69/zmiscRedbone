--SUMMARY
	--LOAD
		SELECT
			OBJECT_NAME(referenced_id) AS 'referencED object'
			,'<---------' AS ' '
			,o.type_desc AS 'referencING type'
			,COUNT(*) as 'type count'
		FROM
			sys.sql_expression_dependencies sed
		JOIN
			sys.objects o ON sed.referencing_id = o.object_id
		JOIN
			sys.objects dep_on ON sed.referenced_id = dep_on.object_id
		WHERE
			OBJECT_NAME(referenced_id) in ('LOAD', 'LOADSTOP')
		GROUP BY
			OBJECT_NAME(referenced_id)
			,o.type_desc
		ORDER BY
			OBJECT_NAME(referenced_id)
			,COUNT(*) desc
			,o.type_desc
		;



	--DETAIL
		--LOAD
			SELECT
				OBJECT_NAME(referenced_id) AS 'referencED object'
				--,dep_on.type_desc AS 'referencED type'
				,'<---------' AS ' '
				,OBJECT_NAME(referencing_id) AS 'referencING object'
				,o.type_desc AS 'referencING type'
			FROM
				sys.sql_expression_dependencies sed
			JOIN
				sys.objects o ON sed.referencing_id = o.object_id
			JOIN
				sys.objects dep_on ON sed.referenced_id = dep_on.object_id
			WHERE
				OBJECT_NAME(referenced_id) in ('LOAD', 'LOADSTOP')
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