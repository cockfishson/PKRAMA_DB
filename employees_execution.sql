DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_OS(
        p_OS_NAME => 'macOS Catalina',
        p_OS_BIT_VERSION => '64-bit',
        p_OS_VERSION => '10.15',
        p_OS_REQUIREMENTS => '4 GB RAM, 12.5 GB available hard disk space',
        p_RATING => 8,
        p_AMMOUNT => 40,
        p_COST => 0,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_CPU(
        p_CORE_COUNT => '16',
        p_SOCKET => 'AM4',
        p_OPERATING_FREQUENCY => '3.7 GHz',
        p_CPU_NAME => 'AMD Ryzen 9 5950X',
        p_BRAND => 'AMD',
        p_LINE => 'Ryzen',
        p_SERIES => '5000 Series',
        p_MODEL => 'Ryzen 9 5950X',
        p_THREAD_COUNT => 32,
        p_TURBO_FREQUENCY => '4.9 GHz',
        p_MANUFACTURING_TECH => '7nm',
        p_TDP => '105W',
        p_INTEGRATED_GRAPHICS => NULL,
        p_RATING => 10,
        p_AMMOUNT => 60,
        p_COST => 799,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_GPU(
        p_BRAND => 'NVIDIA',
        p_SERIES => 'GeForce RTX 3070',
        p_GPU_NAME => 'NVIDIA GeForce RTX 3070',
        p_CORE_CLOCK => '1500 MHz',
        p_BOOST_CLOCK => '1725 MHz',
        p_MEMORY_SIZE => '8 GB',
        p_MEMORY_INTERFACE => '256-bit',
        p_MEMORY_TYPE => 'GDDR6',
        p_RAY_TRACING => 'Yes',
        p_RATING => 9,
        p_AMMOUNT => 50,
        p_COST => 499,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    -- Insert Cooler
    C##DEVELOPER.INSERT_COOLER(
        p_BRAND => 'NZXT',
        p_MODEL => 'Kraken X73',
        p_COOLER_NAME => 'NZXT Kraken X73 RGB',
        p_FAN_SIZE => '140mm',
        p_CPU_SOCKETS => 'LGA1200, AM4',
        p_RPM => '2000',
        p_COOLER_TYPE => 'Liquid',
        p_RATING => 9,
        p_AMMOUNT => 40,
        p_COST => 179,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_MOTHERBOARD(
        p_BRAND => 'ASUS',
        p_MODEL => 'ROG Strix Z590-E Gaming WiFi',
        p_MOTHERBOARD_NAME => 'ASUS ROG Strix Z590-E Gaming WiFi',
        p_SOCKET => 'LGA1200',
        p_CHIPSET => 'Intel Z590',
        p_MEMORY_SLOTS => 4,
        p_MEMORY_TYPE => 'DDR4',
        p_WIFI => '802.11ax',
        p_BLUETOOTH => 'Bluetooth 5.2',
        p_RATING => 9,
        p_AMMOUNT => 35,
        p_COST => 329,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_CASE(
        p_BRAND => 'Corsair',
        p_SERIES => 'Crystal',
        p_CASE_NAME => 'Corsair Crystal 570X RGB',
        p_CASE_MATERIALS => 'Tempered Glass',
        p_CASE_TYPE => 'Mid Tower',
        p_RATING => 9,
        p_AMMOUNT => 40,
        p_COST => 179,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_STORAGE(
        p_BRAND => 'Western Digital',
        p_CAPACITY => '2TB',
        p_STORAGE_NAME => 'WD Black SN850',
        p_READ_SPEED => '7000 MB/s',
        p_WRITE_SPEED => '5300 MB/s',
        p_STORAGE_TYPE => 'NVMe SSD',
        p_RATING => 9,
        p_AMMOUNT => 25,
        p_COST => 299,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_MEMORY(
        p_MEMORY_NAME => 'G.Skill Ripjaws V Series',
        p_MEMORY_TYPE => 'DDR4',
        p_BRAND => 'G.Skill',
        p_CAPACITY => '2 x 16GB',
        p_BUFFERING => 'Unbuffered',
        p_RATING => 9,
        p_AMMOUNT => 50,
        p_COST => 159,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_PSU(
        p_PSU_NAME => 'Corsair RM850x',
        p_SERIES => 'RMx',
        p_BRAND => 'Corsair',
        p_MAXIMUM_POWER => '850W',
        p_SERTIFICATION => '80 Plus Gold',
        p_RATING => 9,
        p_AMMOUNT => 35,
        p_COST => 139,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.REPLACE_PRODUCT_INFO(
        p_TableName => 'GPUS',
        p_ColumnName => 'RATING',
        p_ProductID => 0,
        p_NewValue => '6',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.REPLACE_PRODUCT_INFO(
        p_TableName => 'ORDERS',
        p_ColumnName => 'STATUS',
        p_ProductID => 0,
        p_NewValue => '2',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
BEGIN
    C##DEVELOPER.SEARCH_COMPONENTS(
        p_SearchText => 'a',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name, v_description;
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Description: ' || v_description);
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
    v_bit_ver VARCHAR2(100);
    v_version VARCHAR2(100);
    v_requirements VARCHAR2(100);
    v_rating INT;
    v_count INT;
    v_cost INT;
BEGIN
    C##DEVELOPER.SELECT_ALL_FROM_TABLE(
        p_TableName => 'OS',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name, v_bit_ver, v_version, v_requirements, v_rating, v_count, v_cost;
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name);
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.EMPLOYEE_LOGIN(
        p_Employee_ID => 1002,
        p_Password => 'mobilelegends1234',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;


DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_lol SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
BEGIN
    C##DEVELOPER.ORDER_BY_TABLE(
        p_TableName => 'STATUSES',
        p_RowName => 'STATUS_NAME',
        p_Result => v_lol,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_lol INTO v_id, v_name;
            EXIT WHEN v_lol%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name);
        END LOOP;
        CLOSE v_lol;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_lmao SYS_REFCURSOR;
    v_id INT;
    v_brand VARCHAR2(100);
    v_series VARCHAR2(100);
    v_gpu_name VARCHAR2(100);
    v_core_clock VARCHAR2(100);
    v_boost_clock VARCHAR2(100);
    v_memory_size VARCHAR2(100);
    v_memory_interface VARCHAR2(100);
    v_memory_type VARCHAR2(100);
    v_ray_tracing VARCHAR2(100);
    v_rating INT;
    v_amount INT;
    v_cost INT;
BEGIN
    C##DEVELOPER.FILTER_DATA(
        p_TableName => 'GPUS',
        p_ColumnName => 'COST',
        p_Min => 10,
        p_Max => 2600,
        p_Result => v_lmao,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_lmao INTO
                v_id, v_brand, v_series, v_gpu_name,
                v_core_clock, v_boost_clock, v_memory_size,
                v_memory_interface, v_memory_type, v_ray_tracing,
                v_rating, v_amount, v_cost;
            EXIT WHEN v_lmao%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(
                'GPU_ID: ' || v_id ||
                ', BRAND: ' || v_brand ||
                ', SERIES: ' || v_series ||
                ', GPU_NAME: ' || v_gpu_name ||
                ', CORE_CLOCK: ' || v_core_clock ||
                ', BOOST_CLOCK: ' || v_boost_clock ||
                ', MEMORY_SIZE: ' || v_memory_size ||
                ', MEMORY_INTERFACE: ' || v_memory_interface ||
                ', MEMORY_TYPE: ' || v_memory_type ||
                ', RAY_TRACING: ' || v_ray_tracing ||
                ', RATING: ' || v_rating ||
                ', AMMOUNT: ' || v_amount ||
                ', COST: ' || v_cost
            );
        END LOOP;
        CLOSE v_lmao;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_kek SYS_REFCURSOR;
    v_id INT;
    v_reviewer VARCHAR2(100);
    v_title VARCHAR2(100);
    v_description VARCHAR2(100);
    v_reviewed INT;
BEGIN
    C##DEVELOPER.REVIEWS_FOR_PRODUCT(
        p_Product_ID => 1000,
        p_Result => v_kek,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_kek INTO v_id, v_reviewer, v_title, v_description, v_reviewed;
            EXIT WHEN v_kek%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Reviewer: ' || v_reviewer || ', Title: ' || v_title || ', Description: ' || v_description || ', Reviewed: ' || v_reviewed);
        END LOOP;
        CLOSE v_kek;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);

BEGIN
    C##DEVELOPER.EMPLOYEE_LOGIN(
        p_Employee_ID => 1234,
        p_Password => '1234',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.put_line(v_error_message);
END;

DECLARE
    v_search_text VARCHAR2(100) := 'a';
    v_cursor SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
    v_error_code NUMBER;
    v_error_message VARCHAR2(32767);
BEGIN
    C##DEVELOPER.SEARCH_COMPONENTS(
        p_SearchText => v_search_text,
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
            FETCH v_cursor INTO v_id, v_name, v_description;
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Description: ' || v_description );
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;