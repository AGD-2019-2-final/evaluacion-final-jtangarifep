-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
!hadoop fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:INT);
data_order1 = ORDER data BY col3 ASC;
d_limit = LIMIT data_order1 5;
STORE d_limit INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output