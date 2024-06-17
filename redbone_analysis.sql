declare @tblName varchar(100)
set @tblName = 'LOAD'


--LOAD
	SELECT
		OBJECT_NAME(referencing_id) AS referencing_object_name,
		o.type_desc AS referencing_object_type--,
		--OBJECT_NAME(referenced_id) AS referenced_object_name,
		--dep_on.type_desc AS referenced_object_type
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


SELECT
    OBJECT_NAME(referencing_id) AS referencing_object_name,
    o.type_desc AS referencing_object_type--,
    --OBJECT_NAME(referenced_id) AS referenced_object_name,
    --dep_on.type_desc AS referenced_object_type
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




