-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 

-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
!hadoop fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:INT);
data_order1 = ORDER data BY col1, col3;
STORE data_order1 INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output