declare @tblName varchar(100)


--SUMMARY
	set @tblName = 'LOAD'
	--LOAD
		SELECT
			o.type_desc AS 'types referencing LOAD',
			COUNT(*) as asdf
		FROM
			sys.sql_expression_dependencies sed
		JOIN
			sys.objects o ON sed.referencing_id = o.object_id
		JOIN
			sys.objects dep_on ON sed.referenced_id = dep_on.object_id
		WHERE
			OBJECT_NAME(referenced_id) = @tblName
		GROUP BY
			o.type_desc
		;



	--DETAIL
		set @tblName = 'LOAD'
		--LOAD
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

