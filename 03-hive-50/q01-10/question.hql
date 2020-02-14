-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

!hdfs dfs -rm -r -f /output;
!hdfs dfs -rm -r -f data.tsv
!hdfs dfs -mkdir /output;
!hdfs dfs -copyFromLocal data.tsv data.tsv;

DROP TABLE IF EXISTS data_q01;

CREATE TABLE data_q01 (col1 STRING,
                      col2 STRING,
                      col3 INT)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';
LOAD DATA INPATH 'data.tsv' OVERWRITE
INTO TABLE data_q01;
INSERT OVERWRITE DIRECTORY '/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT col1, COUNT(col1) FROM data_q01 GROUP BY col1;

!hdfs dfs -get /output;