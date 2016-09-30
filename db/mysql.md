    Get Size of all database tables:

    SELECT TABLE_SCHEMA AS 'Database', TABLE_NAME AS 'Table',CONCAT(ROUND(((DATA_LENGTH + INDEX_LENGTH - DATA_FREE) / 1024 / 1024),2)," Mb") AS Size FROM INFORMATION_SCHEMA.TABLES;
    Insert a row with blob data for 10000 times:

    -- --------------------------------------------------------------------------------
    -- Routine DDL
    -- --------------------------------------------------------------------------------
    DELIMITER $$

    CREATE DEFINER=`root`@`localhost` PROCEDURE `insert1000bin`()
    BEGIN

    declare i INT default 0;

    while i<10000 do
        insert into fangyan.audio (AUDIO_DATA) VALUES (LOAD_FILE('C:/Temp/yaoshi.wav'));
        set i = i+1;
    end while;

    END
    On Windows, start/stop mysql service:
    sc start mysql51/mysql
    sc stop mysql51/mysql
