declare @tblNameList varchar(100)
set @tblNameList = '"'+ CHAR(39) "LOAD"'",' 'LOADSTOP''
	--SELECT 'She said asdf"I' + CHAR(39) + 'm going to the store."asdf' AS quote;


--SUMMARY
	/*
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
	*/

	--DETAIL
		--LOAD
			SELECT
				OBJECT_NAME(referenced_id) AS 'Referenced Name'
				,dep_on.type_desc AS 'Referenced Type'
				,OBJECT_NAME(referencing_id) AS referencing_object_name
				,o.type_desc AS referencing_object_type
			FROM
				sys.sql_expression_dependencies sed
			JOIN
				sys.objects o ON sed.referencing_id = o.object_id
			JOIN
				sys.objects dep_on ON sed.referenced_id = dep_on.object_id
			WHERE
				OBJECT_NAME(referenced_id) in (@tblNameList)
			ORDER BY
				referencing_object_type
				, referencing_object_name
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