-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que compute la cantidad de registros por letra de la 
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `a` en la columna 2 y la clave `aaa` en la 
-- columna 3 es:
--
--     a    aaa    5
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
select c2e, tt1.key, count(1)
from t0
lateral view explode(c2) tt0 AS c2e
lateral view explode(c3) tt1
group by c2e, tt1.key
order by c2e, tt1.key;

!hdfs dfs -get /output;

