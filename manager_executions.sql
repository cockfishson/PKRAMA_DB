DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_search_text VARCHAR2(100) := 'a';
    v_cursor SYS_REFCURSOR;
    v_lol SYS_REFCURSOR;
    v_lmao SYS_REFCURSOR;
    orders_cursor SYS_REFCURSOR;
    order_id INT;
    orderer VARCHAR2(100);
    status_name VARCHAR2(100);
    cost INT;
    payment_type VARCHAR2(100);
    delivery VARCHAR2(100);
    cpu_name VARCHAR2(100);
    gpu_name VARCHAR2(100);
    cooler_name VARCHAR2(100);
    motherboard_name VARCHAR2(100);
    psu_name VARCHAR2(100);
    storage_name VARCHAR2(100);
    case_name VARCHAR2(100);
    memory_name VARCHAR2(100);
    os_name VARCHAR2(100);
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
    v_bit_ver VARCHAR2(100);
    v_version VARCHAR2(100);
    v_requirements VARCHAR2(100);
    v_rating INT;
    v_count INT;
    v_cost INT;
BEGIN
    C##DEVELOPER.INSERT_OS(
        p_OS_NAME => 'Windows 10',
        p_OS_BIT_VERSION => '64-bit',
        p_OS_VERSION => '10.0',
        p_OS_REQUIREMENTS => ' 4 GB RAM, 30 GB available hard disk space',
        p_RATING => 8,
        p_AMMOUNT => 2,
        p_COST => 50,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
end;
    DBMS_OUTPUT.put_line(v_error_message);
    C##DEVELOPER.INSERT_CPU(
        p_CORE_COUNT => '12',
        p_SOCKET => 'LGA1200',
        p_OPERATING_FREQUENCY => '3.8 GHz',
        p_CPU_NAME => 'Intel Core i9-10900K',
        p_BRAND => 'Intel',
        p_LINE => 'Core',
        p_SERIES => '10th Gen',
        p_MODEL => 'i9-10900K',
        p_THREAD_COUNT => 20,
        p_TURBO_FREQUENCY => '5.3 GHz',
        p_MANUFACTURING_TECH => '14nm',
        p_TDP => '125W',
        p_INTEGRATED_GRAPHICS => NULL,
        p_RATING => 9,
        p_AMMOUNT => 75,
        p_COST => 499,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    
    C##DEVELOPER.INSERT_GPU(
        p_BRAND => 'AMD',
        p_SERIES => 'Radeon RX 6800 XT',
        p_GPU_NAME => 'AMD Radeon RX 6800 XT',
        p_CORE_CLOCK => '1825 MHz',
        p_BOOST_CLOCK => '2250 MHz',
        p_MEMORY_SIZE => '16 GB',
        p_MEMORY_INTERFACE => '256-bit',
        p_MEMORY_TYPE => 'GDDR6',
        p_RAY_TRACING => 'Yes',
        p_RATING => 9,
        p_AMMOUNT => 30,
        p_COST => 649,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
     C##DEVELOPER.INSERT_COOLER(
        p_BRAND => 'Corsair',
        p_MODEL => 'H100i',
        p_COOLER_NAME => 'Corsair H100i RGB Platinum',
        p_FAN_SIZE => '120mm',
        p_CPU_SOCKETS => 'LGA1151, AM4',
        p_RPM => '2400',
        p_COOLER_TYPE => 'Liquid',
        p_RATING => 9,
        p_AMMOUNT => 50,
        p_COST => 159,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
     C##DEVELOPER.INSERT_MOTHERBOARD(
        p_BRAND => 'MSI',
        p_MODEL => 'MPG Z590 GAMING EDGE WIFI',
        p_MOTHERBOARD_NAME => 'MSI MPG Z590 GAMING EDGE WIFI',
        p_SOCKET => 'LGA1200',
        p_CHIPSET => 'Intel Z590',
        p_MEMORY_SLOTS => 4,
        p_MEMORY_TYPE => 'DDR4',
        p_WIFI => '802.11ax',
        p_BLUETOOTH => 'Bluetooth 5.1',
        p_RATING => 8,
        p_AMMOUNT => 30,
        p_COST => 229,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
     C##DEVELOPER.INSERT_CASE(
        p_BRAND => 'NZXT',
        p_SERIES => 'H510',
        p_CASE_NAME => 'NZXT H510',
        p_CASE_MATERIALS => 'Steel, Tempered Glass',
        p_CASE_TYPE => 'Mid Tower',
        p_RATING => 9,
        p_AMMOUNT => 40,
        p_COST => 79,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_STORAGE(
        p_BRAND => 'Samsung',
        p_CAPACITY => '250GB',
        p_STORAGE_NAME => 'Samsung 970 EVO Plus',
        p_READ_SPEED => '3500 MB/s',
        p_WRITE_SPEED => '3300 MB/s',
        p_STORAGE_TYPE => 'NVMe SSD',
        p_RATING => 9,
        p_AMMOUNT => 20,
        p_COST => 149,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_MEMORY(
        p_MEMORY_NAME => 'Corsair Vengeance LPX',
        p_MEMORY_TYPE => 'DDR4',
        p_BRAND => 'Corsair',
        p_CAPACITY => '2 x 8GB',
        p_BUFFERING => 'Unbuffered',
        p_RATING => 8,
        p_AMMOUNT => 40,
        p_COST => 89,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_PSU(
        p_PSU_NAME => 'EVGA SuperNOVA 900 GA',
        p_SERIES => 'SuperNOVA',
        p_BRAND => 'EVGA',
        p_MAXIMUM_POWER => '900W',
        p_SERTIFICATION => '80 Plus Gold',
        p_RATING => 9,
        p_AMMOUNT => 30,
        p_COST => 159,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
end;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_search_text VARCHAR2(100) := 'a';
    v_cursor SYS_REFCURSOR;
    v_lol SYS_REFCURSOR;
    v_lmao SYS_REFCURSOR;
    orders_cursor SYS_REFCURSOR;
    order_id INT;
    orderer VARCHAR2(100);
    status_name VARCHAR2(100);
    cost INT;
    payment_type VARCHAR2(100);
    delivery VARCHAR2(100);
    cpu_name VARCHAR2(100);
    gpu_name VARCHAR2(100);
    cooler_name VARCHAR2(100);
    motherboard_name VARCHAR2(100);
    psu_name VARCHAR2(100);
    storage_name VARCHAR2(100);
    case_name VARCHAR2(100);
    memory_name VARCHAR2(100);
    os_name VARCHAR2(100);
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
    v_bit_ver VARCHAR2(100);
    v_version VARCHAR2(100);
    v_requirements VARCHAR2(100);
    v_rating INT;
    v_count INT;
    v_cost INT;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.SELECT_ALL_FROM_TABLE(
        p_TableName => 'OS',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name, v_bit_ver, v_version,v_requirements, v_rating,v_count,v_cost; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || 'Ammount :' || v_count || 'Rating :' || v_rating); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_search_text VARCHAR2(100) := 'a';
    v_cursor SYS_REFCURSOR;
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

BEGIN
     C##DEVELOPER.export_OS_to_JSON('os_data.json');
END;

BEGIN
    C##DEVELOPER.IMPORT_OS_FROM_JSON('import.json');
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
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
            FETCH v_cursor INTO v_id, v_name, v_bit_ver, v_version,v_requirements, v_rating,v_count,v_cost; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
    C##DEVELOPER.DELETE_ROW_AND_REDUCE_IDS(
        p_TableName => 'OS',
        p_ProductID => 1, 
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
        );
    DBMS_OUTPUT.put_line(v_error_message);
    C##DEVELOPER.SELECT_ALL_FROM_TABLE(
        p_TableName => 'OS',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name, v_bit_ver, v_version,v_requirements, v_rating,v_count,v_cost; 
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
    C##DEVELOPER.REGISTER_EMPLOYEE(
        p_Employee_ID => 1234,
        p_FullName => 'One Two',
        p_EmployeePassword => '1234',
        p_EmployeePosition => 'Assembler',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    C##DEVELOPER.EMPLOYEE_LOGIN(
        p_Employee_ID => 1234,
        p_Password => '1234',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.put_line(v_error_message);
END;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.INSERT_OS(
        p_OS_NAME => 'Windows 11',
        p_OS_BIT_VERSION => '64-bit',
        p_OS_VERSION => '23H2',
        p_OS_REQUIREMENTS => ' 4 GB RAM, 50 GB available hard disk space',
        p_RATING => 9,
        p_AMMOUNT => 60,
        p_COST => 50,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
END;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
    v_id INT;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
    v_bit_ver VARCHAR2(100);
    v_version VARCHAR2(100);
    v_requirements VARCHAR2(100);
    v_rating INT;
    v_count INT;
    v_cost INT;
BEGIN
    C##DEVELOPER.REPLACE_PRODUCT_INFO (
        p_TableName => 'OS',
        p_ColumnName => 'OS_NAME',
        p_ProductID => 3,
        p_NewValue => 'Bindows 10',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.put_line(v_error_message);
    C##DEVELOPER.SELECT_ALL_FROM_TABLE(
        p_TableName => 'OS',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name, v_bit_ver, v_version,v_requirements, v_rating,v_count,v_cost; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE 
    v_lmao SYS_REFCURSOR;
    v_lol SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
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
    v_id INT;
    v_name VARCHAR2(500);
BEGIN
    C##DEVELOPER.ORDER_BY_TABLE(
        p_TableName => 'STATUSES',
        p_RowName =>'STATUS_NAME',
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
    v_reviewer VARCHAR2(100);
    v_title VARCHAR2(100);
    v_description VARCHAR2(100);
    v_reviewed INT;
    v_kek SYS_REFCURSOR;
Begin
    C##DEVELOPER.REVIEWS_FOR_PRODUCT(
        p_Product_ID => 1000,
        p_Result => v_kek,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_kek INTO v_id, v_reviewer,v_title,v_description,v_reviewed; 
            EXIT WHEN v_kek%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Reviewer: ' || v_reviewer || ', Title: ' || v_title || ', Description: ' || v_description  || ', Reviewed: ' || v_reviewed); 
        END LOOP;
        CLOSE v_kek;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;