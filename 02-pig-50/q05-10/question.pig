-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.tsv
data_01 = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:CHARARRAY);
data_02 = FOREACH data_01 GENERATE FLATTEN(TOKENIZE(col2)) AS col2;
data_03 = FILTER data_02 BY (col2 != '{') AND (col2 != '}');
group_data = GROUP data_03 BY col2;
data_04 = FOREACH group_data GENERATE group, COUNT(data_03.col2);
STORE data_04 INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output