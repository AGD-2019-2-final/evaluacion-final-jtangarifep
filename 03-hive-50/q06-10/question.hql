-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne unicamente la columna t0.c5 con sus 
-- elementos en mayuscula.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--

!hdfs dfs -rm -r -f /output/*;
!hdfs dfs -rm -r -f /output;
!hdfs dfs -rm -r -f tbl0.csv
!hdfs dfs -rm -r -f tbl1.csv
!hdfs dfs -mkdir /output;

DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

INSERT OVERWRITE DIRECTORY '/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
SELECT concat_ws(':',T2.c5)
FROM
(
SELECT T1.c1, collect_list(UPPER(T1.c5l)) AS c5
FROM
(
SELECT c1, c5l  FROM tbl0 
LATERAL VIEW explode(c5) myTable1 AS c5l
) T1
GROUP BY T1.c1
) T2;

!hdfs dfs -get /output;
