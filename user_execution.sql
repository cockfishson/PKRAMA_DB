DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_search_text VARCHAR2(100) := 'a';
    v_cursor SYS_REFCURSOR;
    v_lol SYS_REFCURSOR;
    v_name VARCHAR2(500);
    v_description VARCHAR2(32767);
    v_bit_ver VARCHAR2(100);
    v_version VARCHAR2(100);
    v_requirements VARCHAR2(100);
    v_rating INT;
    v_count INT;
    v_cost INT;
    v_lmao SYS_REFCURSOR;
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
    v_reviewer VARCHAR2(100);
    v_title VARCHAR2(100);
    v_description VARCHAR2(100);
    v_reviewed INT;
    v_kek SYS_REFCURSOR;
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
BEGIN
    C##DEVELOPER.REGISTER_USER(
        p_Username => 'Silkfish',
        p_Email => 'silkfish@gmail.com',
        p_UserPassword => 'labkolover777',
        p_PhoneNumber => '+375293817792',
        p_Address => 'Sverdlova 13b, Minsk',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_ORDER(
        p_ORDERER => 'Silkfish',  
        p_STATUS => 1,            
        p_EXECUTED_BY => 1002,        
        p_PAYMENT_TYPE => 'Card',  
        p_DELIVERY => 'Standard',  
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    C##DEVELOPER.USER_LOGIN ( 
        p_Email =>'silkfish@gmail.com',
        p_Password=> 'labkolover777',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
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
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
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
        p_TableName => 'CPUS',
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
    C##DEVELOPER.REVIEWS_FOR_PRODUCT(
        p_Product_ID => 1000,
        p_Result => v_kek,
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
    C##DEVELOPER.INSERT_ITEM_ORDER(
        p_ORDERED_IN => 4,    
        p_CPU => 1001,           
        p_GPU => 2002,           
        p_COOLER => 3002,       
        p_MOTHERBOARD => 4001,   
        p_PSU => 8001,         
        p_DRIVES => 6001,       
        p_CASE => 5002,        
        p_MEMORY => 7002,       
        p_OS => 1,            
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_REVIEWS(
        p_Reviewer => 'Silkfish',
        p_Title => 'I hate it!',
        p_Description =>'Poop, complite poop',
        p_Reviewed => 1,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.INSERT_REPORT(
        p_REASON => 'Bug',
        p_TITLE => 'Error in Login Page',
        p_EXPLANATION => 'I am unable to log in. Error message displayed: "Invalid username or password."',
        p_AT_DATETIME => SYSTIMESTAMP,
        p_ISCLOSED => 0,
        p_RESOLVED_BY => 1002, 
        p_FILED_BY => 'coloride@gmail.com',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
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

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.REGISTER_USER(
        p_Username => 'Skufarka',
        p_Email => 'Skufarka@gmail.com',
        p_UserPassword => 'Skufarka',
        p_PhoneNumber => '+375293347792',
        p_Address => 'Sverdlova 13a, Minsk',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
    v_username VARCHAR2(100);
    v_email VARCHAR2(50);
    v_password VARCHAR2(100);
    v_phonenumber varchar2(100);
    v_adress varchar2(100);
BEGIN
    C##DEVELOPER.SELECT_ALL_FROM_TABLE(
        p_TableName => 'USERS_DATA',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_username, v_email, v_password, v_phonenumber,v_adress; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Username: ' || v_username || ', email ' || v_email); 
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
BEGIN
    C##DEVELOPER.USER_LOGIN ( 
        p_Email =>'Skufarka@gmail.com',
        p_Password=> 'Skufarka',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;

DECLARE
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
    v_error_code NUMBER;
    v_error_message VARCHAR2(100);
BEGIN
     C##DEVELOPER.INSERT_ORDER(
        p_ORDERER => 'Skufarka',  
        p_STATUS => 1,            
        p_EXECUTED_BY => 1001,        
        p_PAYMENT_TYPE => 'Cash',  
        p_DELIVERY => 'Standard',  
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.DISPLAY_ORDERS('Skufarka', orders_cursor);
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
    v_error_code NUMBER;
    v_error_message VARCHAR2(100);
BEGIN
     C##DEVELOPER.INSERT_ITEM_ORDER(
        p_ORDERED_IN => 6,    
        p_CPU => 1000,           
        p_GPU => 2000,           
        p_COOLER => 3000,       
        p_MOTHERBOARD => 4000,   
        p_PSU => 8000,         
        p_DRIVES => 6000,       
        p_CASE => 5000,        
        p_MEMORY => 7000,       
        p_OS => 4,            
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
     C##DEVELOPER.DISPLAY_ORDERS('Skufarka', orders_cursor);
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
BEGIN
    C##DEVELOPER.DISPLAY_ORDERS('ZenoxGr', orders_cursor);
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
    v_error_message VARCHAR2(200);
BEGIN
    C##DEVELOPER.CHANGE_PASSWORD(
        p_Username => 'Skufarka',
        p_PasswordOld => 'Skufarka',
        p_PasswordNew => '1234',
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
END;
DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id INT; 
    v_name VARCHAR2(100);
    v_bit VARCHAR2(100);
    v_version VARCHAR2(100);
    v_rq VARCHAR2(300);
    v_rt INT;
    v_amnt INT;
    v_cost INT;
BEGIN
    C##DEVELOPER.ORDER_BY_TABLE(
        p_TableName => 'OS',
        p_RowName =>'OS_NAME',
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_name,v_bit,v_version,v_rq,v_rt,v_amnt,v_cost; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
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

DECLARE
    v_cursor SYS_REFCURSOR;
    v_error_code NUMBER;
    v_error_message VARCHAR2(200);
    v_id INT; 
    v_reviewer VARCHAR2(100);
    v_title VARCHAR2(100);
    v_description VARCHAR2(100);
    v_rating INT;
    v_reviewed INT;
BEGIN
    C##DEVELOPER.INSERT_REVIEWS(
        p_Reviewer => 'breakvan',
        p_Title => 'I hate it!',
        p_Description =>'One of the best purchases I ever made :3',
        p_Reviewed => 4,
        p_Rating => 10,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_message);
    C##DEVELOPER.REVIEWS_FOR_PRODUCT(
        p_Product_ID => 4,
        p_Result => v_cursor,
        p_ERROR_CODE => v_error_code,
        p_ERROR_MESSAGE => v_error_message
    );
    IF v_error_code = 0 THEN
        LOOP
            FETCH v_cursor INTO v_id, v_reviewer,v_title,v_description,v_rating,v_reviewed; 
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Reviewer: ' || v_reviewer || ', Title: ' || v_title || ', Description: ' || v_description  || ', Reviewed: ' || v_reviewed); 
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_error_message);
    END IF;
END;

