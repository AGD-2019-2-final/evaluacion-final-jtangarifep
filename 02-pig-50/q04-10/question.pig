--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
!hadoop fs -put truck_event_text_partition.csv 
data_truck = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') AS (driverId:INT, truckId:INT, eventTime:CHARARRAY, eventType:CHARARRAY, longitude:DOUBLE,latitude:DOUBLE,eventKey:CHARARRAY,correlationId:CHARARRAY,driverName:CHARARRAY,routeId:BIGINTEGER,routeName:CHARARRAY,eventDate:CHARARRAY);
data_truck_01 = FOREACH data_truck GENERATE driverId,truckId,eventTime;
data_truck_02 = LIMIT data_truck_01 10;
data_truck_03 = ORDER data_truck_02 BY driverId,truckId,eventTime;
fs -mkdir output
STORE data_truck_04 INTO 'output';
fs -get output/ .
fs -rm -f truck_event_text_partition.csv
fs -rm -r output
