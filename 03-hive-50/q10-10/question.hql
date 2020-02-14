-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--

!hdfs dfs -rm -r -f /output/*;
!hdfs dfs -rm -r -f /output;
!hdfs dfs -rm -r -f tbl0.csv
!hdfs dfs -rm -r -f tbl1.csv
!hdfs dfs -mkdir /output;

DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

INSERT OVERWRITE DIRECTORY '/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
select myTable.key, count(1) from t0
lateral view explode(c3) myTable
group by myTable.key;
!hdfs dfs -get /output;
