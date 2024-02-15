USE RedBone;

--SCHEMAS
	--BY NAME
		SELECT 
			distinct(s.name) AS SchemaName
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
		ORDER BY
			s.name



	--GROUP BY SCHEMA ORDER BY TABLE
		SELECT 
			s.name AS SchemaName,
			count(s.name) AS '# Tables'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
		GROUP BY 
			s.name
		ORDER BY
			s.name



	--GROUP BY SCHEMA ORDER BY # TABLES
		SELECT 
			s.name AS SchemaName,
			count(s.name) AS '# Tables'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
		GROUP BY 
			s.name
		ORDER BY
			count(s.name) asc



--TABLES 
	--BY SCHEMA, NAME
		SELECT 
			s.name AS SchemaName,
			t.name AS 'Table Name',
			FORMAT(SUM(p.rows), 'N0') AS 'Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)

		GROUP BY 
			s.name, t.name
		ORDER BY
			s.name, t.name



	--BY ROWS (desc) SCHEMA, NAME
		SELECT 
			s.name AS SchemaName,
			t.name AS 'Table Name',
			FORMAT(SUM(p.rows), 'N0') AS 'Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)

		GROUP BY 
			s.name, t.name
		ORDER BY
			SUM(p.rows) DESC, s.name, t.name



	--BY ROWS (asc) SCHEMA, NAME
		SELECT 
			s.name AS SchemaName,
			t.name AS 'Table Name',
			FORMAT(SUM(p.rows), 'N0') AS 'Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)

		GROUP BY 
			s.name, t.name
		ORDER BY
			SUM(p.rows) ASC, s.name, t.name



	--EMPTY TABLES
		SELECT 
			s.name AS SchemaName,
			t.name AS 'EMPTY Table Name',
			FORMAT(SUM(p.rows), 'N0') AS 'Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
		GROUP BY 
			s.name, t.name
		HAVING
			SUM(p.rows) = 0
		ORDER BY
			s.name, t.name, SUM(p.rows) DESC;



	--NON-EMPTY TABLES
		SELECT 
			s.name AS SchemaName,
			t.name AS 'NON-EMPTY Table Name',
			FORMAT(SUM(p.rows), 'N0') AS 'Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
		GROUP BY 
			s.name, t.name
		HAVING
			SUM(p.rows) > 0
		ORDER BY
			s.name, t.name, SUM(p.rows) DESC;



	--# TOTAL RECORDS IN DB
		SELECT 
			FORMAT(SUM(p.rows), 'N0') AS 'TOTAL db Number of Records'
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)


	--# TABLES WITH LESS THAN X RECORDS
		DECLARE @numRecs int = 10

		SELECT 
			count(s.name)
		FROM 
			sys.tables t
		INNER JOIN 
			sys.partitions p ON t.object_id = p.object_id
		INNER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE 
			-- 0: Heap table, 1: Clustered index
			p.index_id IN (0, 1)
			and p.rows < @numRecs



--STORED PROCS
	SELECT
		ROUTINE_SCHEMA, ROUTINE_NAME 
	FROM
		INFORMATION_SCHEMA.ROUTINES 
	WHERE
		ROUTINE_TYPE = 'PROCEDURE'
	ORDER BY
		ROUTINE_NAME;



--COLUMNS
	SELECT
		TABLE_SCHEMA, COUNT(COLUMN_NAME) as '# Table Columns'
	FROM
		INFORMATION_SCHEMA.COLUMNS
	WHERE
		TABLE_CATALOG = 'RedBone'
	GROUP BY
		TABLE_SCHEMA
	ORDER BY
		TABLE_SCHEMA;
