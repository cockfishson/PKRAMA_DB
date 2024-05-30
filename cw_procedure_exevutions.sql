DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    INSERT_OS(
        p_OS_NAME => 'Linux Ubuntu',
        p_OS_BIT_VERSION => '64-bit',
        p_OS_VERSION => '20.04 LTS',
        p_OS_REQUIREMENTS => '2 GHz dual-core processor, 4 GB RAM, 25 GB available hard disk space',
        p_RATING => 9,
        p_AMMOUNT => 50,
        p_COST => 0,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.put_line(v_error_message);
END;

SELECT * FROM OS;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    DELETE_ROW_AND_REDUCE_IDS(
        p_TableName => 'OS',
        p_ProductID => 0, 
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );

    DBMS_OUTPUT.put_line(v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    DELETE_ROW_AND_REDUCE_IDS(
        p_TableName => 'ITEMS_ORDERED',
        p_ProductID => 0, 
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.put_line(v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    REPLACE_PRODUCT_INFO (
        p_TableName => 'OS',
        p_ColumnName => 'RATING',
        p_ProductID => 0,
        p_NewValue => '8',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    
    IF v_error_code = 0 THEN
        DBMS_OUTPUT.put_line('Updated successfully.');
    ELSE
        DBMS_OUTPUT.put_line('Error: ' || v_error_message);
    END IF;
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
    SEARCH_COMPONENTS(
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

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id OS.OS_ID%TYPE; 
    v_name OS.OS_NAME%TYPE;
    v_bit_ver OS.OS_BIT_VERSION%TYPE;
    v_version OS.OS_VERSION%TYPE;
    v_requirements OS.OS_REQUIREMENTS%TYPE;
    v_rating OS.RATING%TYPE;
    v_count OS.AMMOUNT%TYPE;
    v_cost OS.COST%TYPE;
BEGIN
    SELECT_ALL_FROM_TABLE(
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

SELECT * FROM OS;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    INSERT_CPU(
        p_CORE_COUNT => '8',
        p_SOCKET => 'AM4',
        p_OPERATING_FREQUENCY => '3.6 GHz',
        p_CPU_NAME => 'AMD Ryzen 7 5800X',
        p_BRAND => 'AMD',
        p_LINE => 'Ryzen',
        p_SERIES => '5000',
        p_MODEL => '5800X',
        p_THREAD_COUNT => 16,
        p_TURBO_FREQUENCY => '4.7 GHz',
        p_MANUFACTURING_TECH => '7nm',
        p_TDP => '105W',
        p_INTEGRATED_GRAPHICS => NULL,
        p_RATING => 9,
        p_AMMOUNT => 100,
        p_COST => 449,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_GPU(
        p_BRAND => 'NVIDIA',
        p_SERIES => 'GeForce RTX 3080',
        p_GPU_NAME => 'NVIDIA GeForce RTX 3080',
        p_CORE_CLOCK => '1440 MHz',
        p_BOOST_CLOCK => '1710 MHz',
        p_MEMORY_SIZE => '10 GB',
        p_MEMORY_INTERFACE => '320-bit',
        p_MEMORY_TYPE => 'GDDR6X',
        p_RAY_TRACING => 'Yes',
        p_RATING => 9,
        p_AMMOUNT => 50,
        p_COST => 699,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_COOLER(
        p_BRAND => 'Noctua',
        p_MODEL => 'NH-D15',
        p_COOLER_NAME => 'Noctua NH-D15',
        p_FAN_SIZE => '140mm',
        p_CPU_SOCKETS => 'AM4, LGA1200, LGA1151, etc.',
        p_RPM => 'To 1500RPM',
        p_COOLER_TYPE => 'Air',
        p_RATING => 10,
        p_AMMOUNT => 200,
        p_COST => 89,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_MOTHERBOARD(
        p_BRAND => 'ASUS',
        p_MODEL => 'ROGStrix X570 Gaming',
        p_MOTHERBOARD_NAME => 'ASUS ROG Strix X570-E Gaming',
        p_SOCKET => 'AM4',
        p_CHIPSET => 'X570',
        p_MEMORY_SLOTS => 4,
        p_MEMORY_TYPE => 'DDR4',
        p_WIFI => 'Wi-Fi 6',
        p_BLUETOOTH => 'Bluetooth 5.0',
        p_RATING => 9,
        p_AMMOUNT => 100,
        p_COST => 299,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_CASE(
        p_BRAND => 'Corsair',
        p_SERIES => 'Crystal',
        p_CASE_NAME => 'Corsair Crystal 570X',
        p_CASE_MATERIALS => 'Tempered Glass, Steel',
        p_CASE_TYPE => 'ATX Mid Tower',
        p_RATING => 9,
        p_AMMOUNT => 150,
        p_COST => 179,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STORAGE(
        p_BRAND => 'Samsung',
        p_CAPACITY => '1 TB',
        p_STORAGE_NAME => 'Samsung 970 EVO Plus',
        p_READ_SPEED => '3500 MB/s',
        p_WRITE_SPEED => '3300 MB/s',
        p_STORAGE_TYPE => 'NVMe SSD',
        p_RATING => 9,
        p_AMMOUNT => 100,
        p_COST => 149,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_MEMORY(
        p_MEMORY_NAME => 'Corsair Vengeance LPX',
        p_MEMORY_TYPE => 'DDR4',
        p_BRAND => 'Corsair',
        p_CAPACITY => '16 GB',
        p_BUFFERING => 'Unbuffered',
        p_RATING => 8,
        p_AMMOUNT => 200,
        p_COST => 89,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_PSU(
        p_PSU_NAME => 'EVGA SuperNOVA 750 G5',
        p_SERIES => 'SuperNOVA G5',
        p_BRAND => 'EVGA',
        p_MAXIMUM_POWER => '750W',
        p_SERTIFICATION => '80 Plus Gold',
        p_RATING => 9,
        p_AMMOUNT => 100,
        p_COST => 129,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    REGISTER_EMPLOYEE(
        p_Employee_ID => 1001,
        p_FullName => 'Maxim Kukharev',
        p_EmployeePassword => 'kyxapka1234',
        p_EmployeePosition => 'Manager',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    EMPLOYEE_LOGIN(
        p_Employee_ID => 1001,
        p_Password => 'kyxapka1234',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'Accepted',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'In Assembly',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'Ready', 
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'In transit',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'Delivered',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_STATUS(
        p_STATUS_NAME => 'Cancelled',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_ORDER(
        p_ORDERER => 'ZenoxGr',  
        p_STATUS => 1,            
        p_EXECUTED_BY => 1001,        
        p_PAYMENT_TYPE => 'Cash',  
        p_DELIVERY => 'Standard',  
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_ITEM_ORDER(
        p_ORDERED_IN => 0,    
        p_CPU => 0,           
        p_GPU => 0,           
        p_COOLER => 0,       
        p_MOTHERBOARD => 0,   
        p_PSU => 0,         
        p_DRIVES => 0,       
        p_CASE => 0,        
        p_MEMORY => 0,       
        p_OS => 0,            
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    INSERT_REVIEWS(
        p_Reviewer => 'ZenoxGr',
        p_Title => 'I love it!',
        p_Description =>'One of the best purchases I ever made',
        p_Reviewed => 1000,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

select * from USERS_DATA;

select * from ORDERS;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    REGISTER_USER(
        p_Username => 'ZenoxGr',
        p_Email => 'ZenoxGr@gmail.com',
        p_UserPassword => 'labko777',
        p_PhoneNumber => '+375293817792',
        p_Address => 'Sverdlova 13a, Minsk',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
        INSERT_ORDER(
        p_ORDERER => 'ZenoxGr',  
        p_STATUS => 1,            
        p_EXECUTED_BY => 1001,        
        p_PAYMENT_TYPE => 'Cash',  
        p_DELIVERY => 'Standard',  
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    INSERT_REVIEWS(
        p_Reviewer => 'ZenoxGr',
        p_Title => 'I love it!',
        p_Description =>'One of the best purchases I ever made',
        p_Reviewed => 1000,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    CHANGE_PASSWORD(
        p_Username => 'ZenoxGr',
        p_PasswordOld => 'labko777',
        p_PasswordNew => 'labko666',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

select * from statuses;
select * from os;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id STATUSES.STATUS_ID%TYPE; 
    v_name STATUSES.STATUS_NAME%TYPE;
BEGIN
    ORDER_BY_TABLE(
        p_TableName => 'STATUSES',
        p_RowName =>'STATUS_NAME',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name; 
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
    v_error_message VARCHAR2(100);
BEGIN
    CANCEL_ORDER(
        p_OrderId => 0,
        p_ERROR_CODE_lol => v_error_code,
        p_ERROR_MESSAGE_lol => v_error_message
    );
END;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id GPUS.GPU_ID%TYPE; 
    v_brand GPUS.BRAND%TYPE;
    v_series GPUS.SERIES%TYPE;
    v_gpu_name GPUS.GPU_NAME%TYPE;
    v_core_clock GPUS.CORE_CLOCK%TYPE;
    v_boost_clock GPUS.BOOST_CLOCK%TYPE;
    v_memory_size GPUS.MEMORY_SIZE%TYPE;
    v_memory_interface GPUS.MEMORY_INTERFACE%TYPE;
    v_memory_type GPUS.MEMORY_TYPE%TYPE;
    v_ray_tracing GPUS.RAY_TRACING%TYPE;
    v_rating GPUS.RATING%TYPE;
    v_amount GPUS.AMMOUNT%TYPE;
    v_cost GPUS.COST%TYPE;
BEGIN
    FILTER_DATA(
        p_TableName => 'GPUS',
        p_ColumnName => 'COST',
        p_Min => 10,
        p_Max => 2600,
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO 
                v_id, v_brand, v_series, v_gpu_name, 
                v_core_clock, v_boost_clock, v_memory_size, 
                v_memory_interface, v_memory_type, v_ray_tracing, 
                v_rating, v_amount, v_cost; 
            
            EXIT WHEN v_cursor%NOTFOUND;
            
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
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

SELECT * FROM REVIEWS;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id REVIEWS.REVIEW_ID%TYPE; 
    v_reviewer REVIEWS.REVIEWER%TYPE;
    v_title REVIEWS.TITLE%TYPE;
    v_description REVIEWS.DESCRIPTION%TYPE;
    v_reviewed REVIEWS.REVIEWED%TYPE;
BEGIN
    REVIEWS_FOR_PRODUCT(
        p_Product_ID => 1000,
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_reviewer,v_title,v_description,v_reviewed; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Reviewer: ' || v_reviewer || ', Title: ' || v_title || ', Description: ' || v_description  || ', Reviewed: ' || v_reviewed); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(100);
BEGIN
    INSERT_ORDER(
        p_ORDERER => 'ZenoxGr',  
        p_STATUS => 1,            
        p_EXECUTED_BY => 1001,        
        p_PAYMENT_TYPE => 'Cash',  
        p_DELIVERY => 'Standard',  
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
END;

SELECT * FROM CPUS;
SELECT * FROM ITEMS_ORDERED;
SELECT * FROM ORDERS;


DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(100);
BEGIN
    INSERT_ITEM_ORDER(
        p_ORDERED_IN => 1,    
        p_CPU => 1000,           
        p_GPU => 2000,           
        p_COOLER => 3000,       
        p_MOTHERBOARD => 4000,   
        p_PSU => 8000,         
        p_DRIVES => 6000,       
        p_CASE => 5000,        
        p_MEMORY => 7000,       
        p_OS => 0,            
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;
SELECT * FROM ORDERS;

DECLARE
    orders_cursor SYS_REFCURSOR;
    order_id ORDERS.ORDER_ID%TYPE;
    orderer ORDERS.ORDERER%TYPE;
    status_name STATUSES.STATUS_NAME%TYPE;
    cost ORDERS.COST%TYPE;
    payment_type ORDERS.PAYMENT_TYPE%TYPE;
    delivery ORDERS.DELIVERY%TYPE;
    cpu_name CPUS.CPU_NAME%TYPE;
    gpu_name GPUS.GPU_NAME%TYPE;
    cooler_name COOLERS.COOLER_NAME%TYPE;
    motherboard_name MOTHERBOARD.MOTHERBOARD_NAME%TYPE;
    psu_name PSUS.PSU_NAME%TYPE;
    storage_name STORAGE.STORAGE_NAME%TYPE;
    case_name CASES.CASE_NAME%TYPE;
    memory_name MEMORIES.MEMORY_NAME%TYPE;
    os_name OS.OS_NAME%TYPE;
BEGIN
    DISPLAY_ORDERS('ZenoxGr', orders_cursor);
    
    LOOP
        FETCH orders_cursor INTO order_id, orderer, status_name, cost, payment_type, delivery,
                                 cpu_name, gpu_name, cooler_name, motherboard_name,
                                 psu_name, storage_name, case_name, memory_name, os_name;
        EXIT WHEN orders_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_id);
        DBMS_OUTPUT.PUT_LINE('Orderer: ' || orderer);
        DBMS_OUTPUT.PUT_LINE('Status: ' || status_name);
        DBMS_OUTPUT.PUT_LINE('Cost: ' || cost);
        DBMS_OUTPUT.PUT_LINE('CPU: ' || cpu_name);
        DBMS_OUTPUT.PUT_LINE('GPU: ' || gpu_name);
        DBMS_OUTPUT.PUT_LINE('Cooler: ' || cooler_name);
        DBMS_OUTPUT.PUT_LINE('Motherboard: ' || motherboard_name);
        DBMS_OUTPUT.PUT_LINE('PSU: ' || psu_name);
        DBMS_OUTPUT.PUT_LINE('Storage: ' || storage_name);
        DBMS_OUTPUT.PUT_LINE('Case: ' || case_name);
        DBMS_OUTPUT.PUT_LINE('Memory: ' || memory_name);
        DBMS_OUTPUT.PUT_LINE('OS: ' || os_name);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
    
    CLOSE orders_cursor;
END;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(100);
BEGIN
    CANCEL_ORDER(
        p_OrderId => 1,
        p_ERROR_CODE_lol => v_error_code,
        p_ERROR_MESSAGE_lol => v_error_message
    );
        CANCEL_ORDER(
        p_OrderId => 3,
        p_ERROR_CODE_lol => v_error_code,
        p_ERROR_MESSAGE_lol => v_error_message
    );
END;

BEGIN
    export_OS_to_JSON('os_data.json');
END;

BEGIN
    IMPORT_OS_FROM_JSON('os_data.json');
END;


SELECT * FROM ORDERS;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    REPLACE_PRODUCT_INFO (
        p_TableName => 'ORDERS',
        p_ColumnName => 'STATUS',
        p_ProductID => 3,
        p_NewValue => '5',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    
    IF v_error_code = 0 THEN
        DBMS_OUTPUT.put_line('Updated successfully.');
    ELSE
        DBMS_OUTPUT.put_line('Error: ' || v_error_message);
    END IF;
END;

SELECT * FROM REVIEWS;
SELECT * FROM OS;
SELECT * FROM USERS_DATA;
DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
        INSERT_REVIEWS(
        p_Reviewer => 'ZenoxGr',
        p_Title => 'I hate it!',
        p_Description =>'POOOOOOP',
        p_Reviewed => 1,
        p_Rating => 1,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DELETE FROM REVIEWS WHERE REVIEW_ID = 1;

DECLARE
    i INT := 2;
BEGIN
    WHILE i <= 100000 LOOP
        INSERT INTO OS (OS_ID, OS_NAME, OS_BIT_VERSION, OS_VERSION, OS_REQUIREMENTS, RATING, AMMOUNT, COST)
        VALUES (
            i,
            'OS_Name_' || i,
            CASE WHEN MOD(i, 2) = 0 THEN '64-bit' ELSE '32-bit' END,
            'Version_' || i,
            'Requirements_' || i,
            ROUND(DBMS_RANDOM.VALUE(1, 10)), 
            ROUND(DBMS_RANDOM.VALUE(100, 1000)), 
            ROUND(DBMS_RANDOM.VALUE(50, 500)) 
        );
        i := i + 1;
    END LOOP;
    COMMIT;
END;

SELECT * FROM OS WHERE OS_ID > 30 and OS_ID < 99999;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id OS.OS_ID%TYPE; 
    v_name OS.OS_NAME%TYPE;
    v_bit_version OS.OS_BIT_VERSION%TYPE;
    v_version OS.OS_VERSION%TYPE;
    v_requirements OS.OS_REQUIREMENTS%TYPE;
    v_rating OS.RATING%TYPE;
    v_amount OS.AMMOUNT%TYPE;
    v_cost OS.COST%TYPE;
    v_start_time TIMESTAMP := systimestamp;
BEGIN
    FILTER_DATA(
        p_TableName => 'OS',
        p_ColumnName => 'OS_ID',
        p_Min => 30,
        p_Max => 99999,
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO 
                v_id, v_name, v_bit_version, v_version, v_requirements, v_rating, v_amount, v_cost; 
            
            EXIT WHEN v_cursor%NOTFOUND;
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Execution time: ' || (systimestamp - v_start_time));
END;
SELECT MAX(OS_ID) FROM OS;

DECLARE
    i INT := 2;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    WHILE i <= 99998 LOOP
        DELETE_ROW_AND_REDUCE_IDS(
        p_TableName => 'OS',
        p_ProductID => 2, 
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
        );
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.put_line(v_error_message);
    COMMIT;
END;

DECLARE
    i INT := 2;
BEGIN
    WHILE i <= 99913 LOOP
        DELETE FROM OS WHERE OS_ID = i;
        i := i+1;
        commit;
    END LOOP;
    COMMIT;
END;
 select *
  from all_constraints c
 where constraint_name like '%SYS_C008685%'