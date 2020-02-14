-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
!hadoop fs -put data.tsv
data_01 = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:MAP[]);
data_02 = FOREACH data_01 GENERATE FLATTEN(col3) AS col3;
data_03 = FOREACH data_02 GENERATE $0 AS col_key;
group_key = GROUP data_03 BY col_key;
data_04 = FOREACH group_key GENERATE group, COUNT(data_03.col_key);
STORE data_04 INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output