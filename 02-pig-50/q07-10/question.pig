-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.tsv
data_01 = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:BAG{}, col3:MAP[]);
data_bag_01 = FOREACH data_01 GENERATE col1 AS col1, SIZE(col2) AS col2,SIZE(col3) AS col3;
data_bag_02 = ORDER data_bag_01 BY col1,col2,col3; 
STORE data_bag_02 INTO 'output' USING PigStorage (',');
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output