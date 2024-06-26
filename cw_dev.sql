DROP TABLE REPORTS CASCADE CONSTRAINTS;
DROP TABLE ITEMS_ORDERED CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE USERS_DATA CASCADE CONSTRAINTS;
DROP TABLE STATUSES CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE OS CASCADE CONSTRAINTS;
DROP TABLE CPUS CASCADE CONSTRAINTS;
DROP TABLE GPUS CASCADE CONSTRAINTS;
DROP TABLE COOLERS CASCADE CONSTRAINTS;
DROP TABLE MOTHERBOARD CASCADE CONSTRAINTS;
DROP TABLE CASES CASCADE CONSTRAINTS;
DROP TABLE STORAGE CASCADE CONSTRAINTS;
DROP TABLE MEMORIES CASCADE CONSTRAINTS;
DROP TABLE PSUS CASCADE CONSTRAINTS;
DROP TABLE REVIEWS CASCADE CONSTRAINTS;


CREATE TABLE USERS_DATA(
    Username VARCHAR2(25),
    Email VARCHAR2(50) NOT NULL,
    UserPassword VARCHAR2(30) NOT NULL,
    PhoneNumber VARCHAR2(14) NOT NULL,
    Adress VARCHAR2(120) NOT NULL,
    PRIMARY KEY(Username)
)TABLESPACE PKRAMA_TS;

CREATE TABLE REVIEWS(
    REVIEW_ID INT,
    REVIEWER VARCHAR2(25),
    TITLE VARCHAR(50),
    DESCRIPTION VARCHAR(250),
    REVIEWED INT,
    RATING INT,
    PRIMARY KEY(REVIEW_ID),
    FOREIGN KEY(REVIEWER) REFERENCES USERS_DATA(USERNAME)
)TABLESPACE PKRAMA_TS;

CREATE TABLE STATUSES(
    STATUS_ID INT,
    STATUS_NAME VARCHAR2(50) NOT NULL,
    PRIMARY KEY(STATUS_ID)
)TABLESPACE PKRAMA_TS;

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID INT,
    FULL_NAME VARCHAR2(60) NOT NULL,
    EMPLOYEE_PASSWORD VARCHAR2(30) NOT NULL,
    EMPLOYEE_POSITION VARCHAR2(30) NOT NULL,
    PRIMARY KEY(EMPLOYEE_ID)
)TABLESPACE PKRAMA_TS;

CREATE TABLE OS(
    OS_ID INT,
    OS_NAME VARCHAR2(50) NOT NULL,
    OS_BIT_VERSION VARCHAR(20) NOT NULL,
    OS_VERSION VARCHAR2(50) NOT NULL,
    OS_REQUIREMENTS VARCHAR2(120) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(OS_ID)
)TABLESPACE PKRAMA_TS;
CREATE TABLE CPUS(
    CPU_ID INT,
    CORE_COUNT VARCHAR2(50) NOT NULL,
    SOCKET VARCHAR2(10) NOT NULL,
    OPERATING_FREQUENCY VARCHAR2(20) NOT NULL,
    CPU_NAME VARCHAR2(50) NOT NULL,
    BRAND VARCHAR2(50) NOT NULL,
    LINE VARCHAR2(20) NOT NULL,
    SERIES VARCHAR2(20) NOT NULL,
    MODEL VARCHAR2(20) NOT NULL,
    THREAD_COUNT INT NOT NULL,
    TURBO_FREQUENCY VARCHAR2(20) NOT NULL,
    MANUFACTURING_TECH VARCHAR2(10) NOT NULL,
    TDP VARCHAR2(20) NOT NULL,
    INTEGRATED_GRAPHICS VARCHAR(50),
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(CPU_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE GPUS(
    GPU_ID INT,
    BRAND VARCHAR2(50) NOT NULL,
    SERIES VARCHAR2(20) NOT NULL,
    GPU_NAME VARCHAR2(50) NOT NULL,
    CORE_CLOCK VARCHAR2(20) NOT NULL,
    BOOST_CLOCK VARCHAR2(20) NOT NULL,
    MEMORY_SIZE VARCHAR2(10) NOT NULL,
    MEMORY_INTERFACE VARCHAR2(10) NOT NULL,
    MEMORY_TYPE VARCHAR2(20) NOT NULL,
    RAY_TRACING VARCHAR2(30) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(GPU_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE COOLERS(
    COOLER_ID INT,
    BRAND VARCHAR2(50) NOT NULL,
    MODEL VARCHAR2(20) NOT NULL,
    COOLER_NAME VARCHAR2(50) NOT NULL,
    FAN_SIZE VARCHAR2(10) NOT NULL,
    CPU_SOCKETS VARCHAR2(120) NOT NULL,
    RPM VARCHAR2(10) NOT NULL,
    COOLER_TYPE VARCHAR2(30) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(COOLER_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE MOTHERBOARD(
    MOTHERBOARD_ID INT,
    BRAND VARCHAR2(50) NOT NULL,
    MODEL VARCHAR2(20) NOT NULL,
    MOTHERBOARD_NAME VARCHAR2(50) NOT NULL,
    SOCKET VARCHAR2(10) NOT NULL,
    CHIPSET VARCHAR2(10) NOT NULL,
    MEMORY_SLOTS INT NOT NULL,
    MEMORY_TYPE VARCHAR2(10) NOT NULL,
    WIFI VARCHAR2(20),
    BLUETOOTH VARCHAR(20),
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(MOTHERBOARD_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE CASES(
    CASE_ID INT,
    BRAND VARCHAR2(50) NOT NULL,
    SERIES VARCHAR2(20) NOT NULL,
    CASE_NAME VARCHAR2(50) NOT NULL,
    CASE_MATERIALS VARCHAR2(30) NOT NULL,
    CASE_TYPE VARCHAR2(20) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(CASE_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE STORAGE(
    STORAGE_ID INT,
    BRAND VARCHAR2(50) NOT NULL,
    CAPACITY VARCHAR2(10) NOT NULL,
    STORAGE_NAME VARCHAR2(50) NOT NULL,
    READ_SPEED VARCHAR2(20) NOT NULL,
    WRITE_SPEED VARCHAR2(20) NOT NULL,
    STORAGE_TYPE VARCHAR2(20) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(STORAGE_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE MEMORIES(
    MEMORY_ID INT,
    MEMORY_NAME VARCHAR2(50) NOT NULL,
    MEMORY_TYPE VARCHAR2(10) NOT NULL,
    BRAND VARCHAR2(50) NOT NULL,
    CAPACITY VARCHAR2(10) NOT NULL,
    BUFFERING VARCHAR2(20),
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(MEMORY_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE PSUS(
    PSU_ID INT,
    PSU_NAME VARCHAR2(50) NOT NULL,
    SERIES VARCHAR2(20) NOT NULL,
    BRAND VARCHAR2(50) NOT NULL,
    MAXIMUM_POWER VARCHAR2(10) NOT NULL,
    SERTIFICATION VARCHAR2(20) NOT NULL,
    RATING INT NOT NULL,
    AMMOUNT INT NOT NULL,
    COST INT NOT NULL,
    PRIMARY KEY(PSU_ID)
)TABLESPACE PKRAMA_TS;
 
CREATE TABLE REPORTS(
    TICKET_ID INT,
    REASON VARCHAR2(50) NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    EXPLANATION VARCHAR2(450) NOT NULL,
    AT_DATETIME TIMESTAMP NOT NULL,
    ISCLOSED INT NOT NULL,
    RESOLVED_BY INT NOT NULL,
    FILED_BY VARCHAR2(50) NOT NULL,
    PRIMARY KEY(TICKET_ID),
    FOREIGN KEY(RESOLVED_BY) REFERENCES EMPLOYEES(EMPLOYEE_ID)
)TABLESPACE PKRAMA_TS;

CREATE TABLE ITEMS_ORDERED(
    ORDERED_IN INT,
    ITEM_ID INT,
    CPU INT,
    GPU INT,
    COOLER INT,
    MOTHERBOARD INT,
    PSU INT,
    DRIVES INT,
    CASE INT,
    MEMORY INT,
    OS_LOL INT,
    PRIMARY KEY(ITEM_ID),
    FOREIGN KEY(ORDERED_IN) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY(CPU) REFERENCES CPUS(CPU_ID),
    FOREIGN KEY(GPU) REFERENCES GPUS(GPU_ID),
    FOREIGN KEY(COOLER) REFERENCES COOLERS(COOLER_ID),
    FOREIGN KEY(MOTHERBOARD) REFERENCES MOTHERBOARD(MOTHERBOARD_ID),
    FOREIGN KEY(PSU) REFERENCES PSUS(PSU_ID),
    FOREIGN KEY(DRIVES) REFERENCES STORAGE(STORAGE_ID),
    FOREIGN KEY(CASE) REFERENCES CASES(CASE_ID),
    FOREIGN KEY(MEMORY) REFERENCES MEMORIES(MEMORY_ID),
    FOREIGN KEY(OS_LOL) REFERENCES OS(OS_ID)
)TABLESPACE PKRAMA_TS;

CREATE TABLE ORDERS(
    ORDER_ID INT,
    ORDERER VARCHAR(25), 
    STATUS INT,
    EXECUTED_BY INT,
    COST INT NOT NULL,
    PAYMENT_TYPE VARCHAR2(50) NOT NULL,
    DELIVERY VARCHAR(20),
    PRIMARY KEY(ORDER_ID),
    FOREIGN KEY(ORDERER) REFERENCES USERS_DATA(Username),
    FOREIGN KEY(STATUS) REFERENCES STATUSES(STATUS_ID),
    FOREIGN KEY (EXECUTED_BY)  REFERENCES EMPLOYEES(EMPLOYEE_ID)
)TABLESPACE PKRAMA_TS;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

CREATE OR REPLACE PROCEDURE INSERT_REVIEWS (p_Reviewer IN REVIEWS.REVIEWER%TYPE, p_Title IN REVIEWS.TITLE%TYPE,p_Description IN REVIEWS.DESCRIPTION%TYPE ,p_Reviewed IN REVIEWS.REVIEWED%TYPE,p_Rating IN REVIEWS.RATING%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id REPORTS.TICKET_ID%TYPE; v_user_count INT; v_count INT; 
BEGIN
    SELECT COUNT(*)
    INTO v_user_count
    FROM USERS_DATA
    WHERE USERNAME = p_Reviewer;
    IF v_user_count = 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'User with name ' || TO_CHAR(p_Reviewer) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*) INTO v_count FROM REVIEWS;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(REVIEW_ID), 0) INTO v_max_id FROM REVIEWS;
        v_max_id := v_max_id + 1;
    END IF;
    INSERT INTO REVIEWS (
        REVIEW_ID,
        REVIEWER,
        TITLE,
        DESCRIPTION,
        REVIEWED,
        RATING
    ) VALUES (
        v_max_id,
        p_Reviewer,
        p_Title,
        p_Description,
        p_Reviewed,
        p_Rating
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_OS (p_OS_NAME IN OS.OS_NAME%TYPE, p_OS_BIT_VERSION IN OS.OS_BIT_VERSION%TYPE, p_OS_VERSION IN OS.OS_VERSION%TYPE, p_OS_REQUIREMENTS IN OS.OS_REQUIREMENTS%TYPE, p_RATING IN OS.RATING%TYPE, p_AMMOUNT IN OS.AMMOUNT%TYPE, p_COST IN OS.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id OS.OS_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM OS;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(OS_ID), 0) INTO v_max_id FROM OS;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF;
    INSERT INTO OS (
        OS_ID,
        OS_NAME,
        OS_BIT_VERSION,
        OS_VERSION,
        OS_REQUIREMENTS,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_OS_NAME,
        p_OS_BIT_VERSION,
        p_OS_VERSION,
        p_OS_REQUIREMENTS,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_CPU ( p_CORE_COUNT IN CPUS.CORE_COUNT%TYPE, p_SOCKET IN CPUS.SOCKET%TYPE, p_OPERATING_FREQUENCY IN CPUS.OPERATING_FREQUENCY%TYPE, p_CPU_NAME IN CPUS.CPU_NAME%TYPE, p_BRAND IN CPUS.BRAND%TYPE, p_LINE IN CPUS.LINE%TYPE, p_SERIES IN CPUS.SERIES%TYPE, p_MODEL IN CPUS.MODEL%TYPE, p_THREAD_COUNT IN CPUS.THREAD_COUNT%TYPE, p_TURBO_FREQUENCY IN CPUS.TURBO_FREQUENCY%TYPE, p_MANUFACTURING_TECH IN CPUS.MANUFACTURING_TECH%TYPE, p_TDP IN CPUS.TDP%TYPE, p_INTEGRATED_GRAPHICS IN CPUS.INTEGRATED_GRAPHICS%TYPE, p_RATING IN CPUS.RATING%TYPE, p_AMMOUNT IN CPUS.AMMOUNT%TYPE, p_COST IN CPUS.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id CPUS.CPU_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM CPUS;
    IF v_count < 1 THEN
        v_max_id:=1000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(CPU_ID), 0) INTO v_max_id FROM CPUS;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF;
    IF p_THREAD_COUNT < 0 THEN 
        p_ERROR_CODE := -4;
        p_ERROR_MESSAGE := 'Thread count should be more then 0';
        RETURN;
    END IF;  
    INSERT INTO CPUS (
        CPU_ID,
        CORE_COUNT,
        SOCKET,
        OPERATING_FREQUENCY,
        CPU_NAME,
        BRAND,
        LINE,
        SERIES,
        MODEL,
        THREAD_COUNT,
        TURBO_FREQUENCY,
        MANUFACTURING_TECH,
        TDP,
        INTEGRATED_GRAPHICS,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_CORE_COUNT,
        p_SOCKET,
        p_OPERATING_FREQUENCY,
        p_CPU_NAME,
        p_BRAND,
        p_LINE,
        p_SERIES,
        p_MODEL,
        p_THREAD_COUNT,
        p_TURBO_FREQUENCY,
        p_MANUFACTURING_TECH,
        p_TDP,
        p_INTEGRATED_GRAPHICS,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_GPU (p_BRAND IN GPUS.BRAND%TYPE, p_SERIES IN GPUS.SERIES%TYPE, p_GPU_NAME IN GPUS.GPU_NAME%TYPE, p_CORE_CLOCK IN GPUS.CORE_CLOCK%TYPE, p_BOOST_CLOCK IN GPUS.BOOST_CLOCK%TYPE, p_MEMORY_SIZE IN GPUS.MEMORY_SIZE%TYPE, p_MEMORY_INTERFACE IN GPUS.MEMORY_INTERFACE%TYPE, p_MEMORY_TYPE IN GPUS.MEMORY_TYPE%TYPE, p_RAY_TRACING IN GPUS.RAY_TRACING%TYPE, p_RATING IN GPUS.RATING%TYPE, p_AMMOUNT IN GPUS.AMMOUNT%TYPE, p_COST IN GPUS.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id GPUS.GPU_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM GPUS;
    IF v_count < 1 THEN
        v_max_id:=2000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(GPU_ID), 0) INTO v_max_id FROM GPUS;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO GPUS (
        GPU_ID,
        BRAND,
        SERIES,
        GPU_NAME,
        CORE_CLOCK,
        BOOST_CLOCK,
        MEMORY_SIZE,
        MEMORY_INTERFACE,
        MEMORY_TYPE,
        RAY_TRACING,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_BRAND,
        p_SERIES,
        p_GPU_NAME,
        p_CORE_CLOCK,
        p_BOOST_CLOCK,
        p_MEMORY_SIZE,
        p_MEMORY_INTERFACE,
        p_MEMORY_TYPE,
        p_RAY_TRACING,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_COOLER ( p_BRAND IN COOLERS.BRAND%TYPE, p_MODEL IN COOLERS.MODEL%TYPE, p_COOLER_NAME IN COOLERS.COOLER_NAME%TYPE, p_FAN_SIZE IN COOLERS.FAN_SIZE%TYPE, p_CPU_SOCKETS IN COOLERS.CPU_SOCKETS%TYPE, p_RPM IN COOLERS.RPM%TYPE, p_COOLER_TYPE IN COOLERS.COOLER_TYPE%TYPE, p_RATING IN COOLERS.RATING%TYPE, p_AMMOUNT IN COOLERS.AMMOUNT%TYPE, p_COST IN COOLERS.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id COOLERS.COOLER_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM COOLERS;
    IF v_count < 1 THEN
        v_max_id:=3000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(COOLER_ID), 0) INTO v_max_id FROM COOLERS;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO COOLERS (
        COOLER_ID,
        BRAND,
        MODEL,
        COOLER_NAME,
        FAN_SIZE,
        CPU_SOCKETS,
        RPM,
        COOLER_TYPE,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_BRAND,
        p_MODEL,
        p_COOLER_NAME,
        p_FAN_SIZE,
        p_CPU_SOCKETS,
        p_RPM,
        p_COOLER_TYPE,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_MOTHERBOARD ( p_BRAND IN MOTHERBOARD.BRAND%TYPE, p_MODEL IN MOTHERBOARD.MODEL%TYPE, p_MOTHERBOARD_NAME IN MOTHERBOARD.MOTHERBOARD_NAME%TYPE, p_SOCKET IN MOTHERBOARD.SOCKET%TYPE, p_CHIPSET IN MOTHERBOARD.CHIPSET%TYPE, p_MEMORY_SLOTS IN MOTHERBOARD.MEMORY_SLOTS%TYPE, p_MEMORY_TYPE IN MOTHERBOARD.MEMORY_TYPE%TYPE, p_WIFI IN MOTHERBOARD.WIFI%TYPE, p_BLUETOOTH IN MOTHERBOARD.BLUETOOTH%TYPE, p_RATING IN MOTHERBOARD.RATING%TYPE, p_AMMOUNT IN MOTHERBOARD.AMMOUNT%TYPE, p_COST IN MOTHERBOARD.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id MOTHERBOARD.MOTHERBOARD_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM MOTHERBOARD;
    IF v_count < 1 THEN
        v_max_id:=4000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(MOTHERBOARD_ID), 0) INTO v_max_id FROM MOTHERBOARD;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    IF p_MEMORY_SLOTS < 0 THEN 
        p_ERROR_CODE := -4;
        p_ERROR_MESSAGE := 'Memory slots count should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO MOTHERBOARD (
        MOTHERBOARD_ID,
        BRAND,
        MODEL,
        MOTHERBOARD_NAME,
        SOCKET,
        CHIPSET,
        MEMORY_SLOTS,
        MEMORY_TYPE,
        WIFI,
        BLUETOOTH,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_BRAND,
        p_MODEL,
        p_MOTHERBOARD_NAME,
        p_SOCKET,
        p_CHIPSET,
        p_MEMORY_SLOTS,
        p_MEMORY_TYPE,
        p_WIFI,
        p_BLUETOOTH,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_CASE ( p_BRAND IN CASES.BRAND%TYPE, p_SERIES IN CASES.SERIES%TYPE, p_CASE_NAME IN CASES.CASE_NAME%TYPE, p_CASE_MATERIALS IN CASES.CASE_MATERIALS%TYPE, p_CASE_TYPE IN CASES.CASE_TYPE%TYPE, p_RATING IN CASES.RATING%TYPE, p_AMMOUNT IN CASES.AMMOUNT%TYPE, p_COST IN CASES.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id CASES.CASE_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM CASES;
    IF v_count < 1 THEN
        v_max_id:=5000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(CASE_ID), 0) INTO v_max_id FROM CASES;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO CASES (
        CASE_ID,
        BRAND,
        SERIES,
        CASE_NAME,
        CASE_MATERIALS,
        CASE_TYPE,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_BRAND,
        p_SERIES,
        p_CASE_NAME,
        p_CASE_MATERIALS,
        p_CASE_TYPE,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_STORAGE ( p_BRAND IN STORAGE.BRAND%TYPE, p_CAPACITY IN STORAGE.CAPACITY%TYPE, p_STORAGE_NAME IN STORAGE.STORAGE_NAME%TYPE, p_READ_SPEED IN STORAGE.READ_SPEED%TYPE, p_WRITE_SPEED IN STORAGE.WRITE_SPEED%TYPE, p_STORAGE_TYPE IN STORAGE.STORAGE_TYPE%TYPE, p_RATING IN STORAGE.RATING%TYPE, p_AMMOUNT IN STORAGE.AMMOUNT%TYPE, p_COST IN STORAGE.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id STORAGE.STORAGE_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM STORAGE;
    IF v_count < 1 THEN
        v_max_id:=6000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(STORAGE_ID), 0) INTO v_max_id FROM STORAGE;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO STORAGE (
        STORAGE_ID,
        BRAND,
        CAPACITY,
        STORAGE_NAME,
        READ_SPEED,
        WRITE_SPEED,
        STORAGE_TYPE,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_BRAND,
        p_CAPACITY,
        p_STORAGE_NAME,
        p_READ_SPEED,
        p_WRITE_SPEED,
        p_STORAGE_TYPE,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_MEMORY ( p_MEMORY_NAME IN MEMORIES.MEMORY_NAME%TYPE, p_MEMORY_TYPE IN MEMORIES.MEMORY_TYPE%TYPE, p_BRAND IN MEMORIES.BRAND%TYPE, p_CAPACITY IN MEMORIES.CAPACITY%TYPE, p_BUFFERING IN MEMORIES.BUFFERING%TYPE, p_RATING IN MEMORIES.RATING%TYPE, p_AMMOUNT IN MEMORIES.AMMOUNT%TYPE, p_COST IN MEMORIES.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id MEMORIES.MEMORY_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM MEMORIES;
    IF v_count < 1 THEN
        v_max_id:=7000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(MEMORY_ID), 0) INTO v_max_id FROM MEMORIES;
        v_max_id := v_max_id + 1;
    END IF;
        IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO MEMORIES (
        MEMORY_ID,
        MEMORY_NAME,
        MEMORY_TYPE,
        BRAND,
        CAPACITY,
        BUFFERING,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_MEMORY_NAME,
        p_MEMORY_TYPE,
        p_BRAND,
        p_CAPACITY,
        p_BUFFERING,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_PSU ( p_PSU_NAME IN PSUS.PSU_NAME%TYPE, p_SERIES IN PSUS.SERIES%TYPE, p_BRAND IN PSUS.BRAND%TYPE, p_MAXIMUM_POWER IN PSUS.MAXIMUM_POWER%TYPE, p_SERTIFICATION IN PSUS.SERTIFICATION%TYPE, p_RATING IN PSUS.RATING%TYPE, p_AMMOUNT IN PSUS.AMMOUNT%TYPE, p_COST IN PSUS.COST%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id PSUS.PSU_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM PSUS;
    IF v_count < 1 THEN
        v_max_id:=8000;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(PSU_ID), 0) INTO v_max_id FROM PSUS;
        v_max_id := v_max_id + 1;
    END IF;
    IF p_RATING < 0 OR p_RATING > 10 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Rating should be between 0 and 10';
        RETURN;
    END IF;
    IF p_AMMOUNT < 0 THEN 
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Ammount should be more then 0';
        RETURN;
    END IF;
    IF p_COST < 0 THEN 
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Cost should be more then 0';
        RETURN;
    END IF; 
    INSERT INTO PSUS (
        PSU_ID,
        PSU_NAME,
        SERIES,
        BRAND,
        MAXIMUM_POWER,
        SERTIFICATION,
        RATING,
        AMMOUNT,
        COST
    ) VALUES (
        v_max_id,
        p_PSU_NAME,
        p_SERIES,
        p_BRAND,
        p_MAXIMUM_POWER,
        p_SERTIFICATION,
        p_RATING,
        p_AMMOUNT,
        p_COST
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_REPORT ( p_REASON IN REPORTS.REASON%TYPE, p_TITLE IN REPORTS.TITLE%TYPE, p_EXPLANATION IN REPORTS.EXPLANATION%TYPE, p_AT_DATETIME IN REPORTS.AT_DATETIME%TYPE, p_ISCLOSED IN REPORTS.ISCLOSED%TYPE, p_RESOLVED_BY IN REPORTS.RESOLVED_BY%TYPE, p_FILED_BY IN REPORTS.FILED_BY%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id REPORTS.TICKET_ID%TYPE; v_employee_count INT; v_count INT; 
BEGIN
    SELECT COUNT(*)
    INTO v_employee_count
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_RESOLVED_BY;
    IF v_employee_count = 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Employee with ID ' || TO_CHAR(p_RESOLVED_BY) || ' does not exist.';
        RETURN;
    END IF;
    IF p_ISCLOSED NOT IN (0, 1) THEN
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'ISCLOSED value must be 0 (not closed) or 1 (closed).';
        RETURN;
    END IF;
    SELECT COUNT(*) INTO v_count FROM REPORTS;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(TICKET_ID), 0) INTO v_max_id FROM REPORTS;
        v_max_id := v_max_id + 1;
    END IF;
    INSERT INTO REPORTS (
        TICKET_ID,
        REASON,
        TITLE,
        EXPLANATION,
        AT_DATETIME,
        ISCLOSED,
        RESOLVED_BY,
        FILED_BY
    ) VALUES (
        v_max_id,
        p_REASON,
        p_TITLE,
        p_EXPLANATION,
        p_AT_DATETIME,
        p_ISCLOSED,
        p_RESOLVED_BY,
        p_FILED_BY
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_ORDER ( p_ORDERER IN USERS_DATA.Username%TYPE, p_STATUS IN STATUSES.STATUS_ID%TYPE, p_EXECUTED_BY IN EMPLOYEES.EMPLOYEE_ID%TYPE,  p_PAYMENT_TYPE IN ORDERS.PAYMENT_TYPE%TYPE, p_DELIVERY IN ORDERS.DELIVERY%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id ORDERS.ORDER_ID%TYPE; v_user_count INT; v_status_count INT; v_employee_count INT; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM ORDERS;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(ORDER_ID), 0) INTO v_max_id FROM ORDERS;
        v_max_id := v_max_id + 1;
    END IF;
    SELECT COUNT(*)
    INTO v_user_count
    FROM USERS_DATA
    WHERE Username = p_ORDERER;
    IF v_user_count = 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Orderer with username ' || p_ORDERER || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO v_status_count
    FROM STATUSES
    WHERE STATUS_ID = p_STATUS;
    IF v_status_count = 0 THEN
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Status with ID ' || p_STATUS || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO v_employee_count
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_EXECUTED_BY;
    IF v_employee_count = 0 THEN
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'Employee with ID ' || TO_CHAR(p_EXECUTED_BY) || ' does not exist.';
        RETURN;
    END IF;
    INSERT INTO ORDERS (
        ORDER_ID,
        ORDERER,
        STATUS,
        EXECUTED_BY,
        COST,
        PAYMENT_TYPE,
        DELIVERY
    ) VALUES (
        v_max_id,
        p_ORDERER,
        p_STATUS,
        p_EXECUTED_BY,
        0,
        p_PAYMENT_TYPE,
        p_DELIVERY
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_STATUS ( p_STATUS_NAME IN STATUSES.STATUS_NAME%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_max_id STATUSES.STATUS_ID%TYPE; v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM STATUSES;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(STATUS_ID), 0) INTO v_max_id FROM STATUSES;
        v_max_id := v_max_id + 1;
    END IF;
    INSERT INTO STATUSES (STATUS_ID, STATUS_NAME)
    VALUES (v_max_id, p_STATUS_NAME);
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE INSERT_ITEM_ORDER (p_ORDERED_IN IN ORDERS.ORDER_ID%TYPE, p_CPU IN CPUS.CPU_ID%TYPE, p_GPU IN GPUS.GPU_ID%TYPE, p_COOLER IN COOLERS.COOLER_ID%TYPE, p_MOTHERBOARD IN MOTHERBOARD.MOTHERBOARD_ID%TYPE, p_PSU IN PSUS.PSU_ID%TYPE, p_DRIVES IN STORAGE.STORAGE_ID%TYPE, p_CASE IN CASES.CASE_ID%TYPE, p_MEMORY IN MEMORIES.MEMORY_ID%TYPE, p_OS IN OS.OS_ID%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2)AS v_max_id ITEMS_ORDERED.ITEM_ID%TYPE; v_count INT; v_item_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM ITEMS_ORDERED;
    IF v_count < 1 THEN
        v_max_id:=0;
    END IF;
    IF v_count > 0 THEN
        SELECT NVL(MAX(ITEM_ID), 0) INTO v_max_id FROM ITEMS_ORDERED;
        v_max_id := v_max_id + 1;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM ORDERS
    WHERE ORDER_ID = p_ORDERED_IN;
    IF p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Order with ID ' || TO_CHAR(p_ORDERED_IN) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM CPUS
    WHERE CPU_ID = p_CPU;
    IF p_CPU IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'CPU with ID ' || TO_CHAR(p_CPU) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM GPUS
    WHERE GPU_ID = p_GPU;
    IF p_GPU IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -3;
        p_ERROR_MESSAGE := 'GPU with ID ' || TO_CHAR(p_GPU) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM COOLERS
    WHERE COOLER_ID = p_COOLER;
    IF p_COOLER IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -4;
        p_ERROR_MESSAGE := 'Cooler with ID ' || TO_CHAR(p_COOLER) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM MOTHERBOARD
    WHERE MOTHERBOARD_ID = p_MOTHERBOARD;
    IF p_MOTHERBOARD IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -5;
        p_ERROR_MESSAGE := 'Motherboard with ID ' || TO_CHAR(p_MOTHERBOARD) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM PSUS
    WHERE PSU_ID = p_PSU;
    IF p_PSU IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -6;
        p_ERROR_MESSAGE := 'PSU with ID ' || TO_CHAR(p_PSU) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM STORAGE
    WHERE STORAGE_ID = p_DRIVES;
    IF p_DRIVES IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -7;
        p_ERROR_MESSAGE := 'Drives with ID ' || TO_CHAR(p_DRIVES) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM CASES
    WHERE CASE_ID = p_CASE;
    IF p_CASE IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -8;
        p_ERROR_MESSAGE := 'Case with ID ' || TO_CHAR(p_CASE) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM MEMORIES
    WHERE MEMORY_ID = p_MEMORY;
    IF p_MEMORY IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -9;
        p_ERROR_MESSAGE := 'Memory with ID ' || TO_CHAR(p_MEMORY) || ' does not exist.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO p_ERROR_CODE
    FROM OS
    WHERE OS_ID = p_OS;
    IF p_OS IS NOT NULL AND p_ERROR_CODE = 0 THEN
        p_ERROR_CODE := -10;
        p_ERROR_MESSAGE := 'OS with ID ' || TO_CHAR(p_OS) || ' does not exist.';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM OS WHERE OS_ID = p_Os;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -11;
        p_ERROR_MESSAGE := 'OS with ID ' || TO_CHAR(p_OS) || 'has insufficiant amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM CPUS WHERE CPU_ID = p_CPU;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -12;
        p_ERROR_MESSAGE := 'CPU with ID ' || TO_CHAR(p_CPU) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM GPUS WHERE GPU_ID = p_GPU;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -13;
        p_ERROR_MESSAGE := 'GPU with ID ' || TO_CHAR(p_GPU) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM COOLERS WHERE COOLER_ID = p_COOLER;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -14;
        p_ERROR_MESSAGE := 'Cooler with ID ' || TO_CHAR(p_COOLER) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM MOTHERBOARD WHERE MOTHERBOARD_ID = p_MOTHERBOARD;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -15;
        p_ERROR_MESSAGE := 'Motherboard with ID ' || TO_CHAR(p_MOTHERBOARD) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM PSUS WHERE PSU_ID = p_PSU;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -16;
        p_ERROR_MESSAGE := 'PSU with ID ' || TO_CHAR(p_PSU) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM STORAGE WHERE STORAGE_ID = p_DRIVES;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -17;
        p_ERROR_MESSAGE := 'Drives with ID ' || TO_CHAR(p_DRIVES) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM CASES WHERE CASE_ID = p_CASE;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -18;
        p_ERROR_MESSAGE := 'Case with ID ' || TO_CHAR(p_CASE) || ' has insufficient amount';
        RETURN;
    END IF;
    SELECT AMMOUNT INTO v_item_count FROM MEMORIES WHERE MEMORY_ID = p_MEMORY;
    IF v_item_count < 1 THEN
        p_ERROR_CODE := -19;
        p_ERROR_MESSAGE := 'Memory with ID ' || TO_CHAR(p_MEMORY) || ' has insufficient amount';
        RETURN;
    END IF;
    INSERT INTO ITEMS_ORDERED (
        ORDERED_IN,
        ITEM_ID,
        CPU,
        GPU,
        COOLER,
        MOTHERBOARD,
        PSU,
        DRIVES,
        CASE,
        MEMORY,
        OS_LOL
    ) VALUES (
        p_ORDERED_IN,
        v_max_id,
        p_CPU,
        p_GPU,
        p_COOLER,
        p_MOTHERBOARD,
        p_PSU,
        p_DRIVES,
        p_CASE,
        p_MEMORY,
        p_OS
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE REGISTER_USER ( p_Username IN USERS_DATA.Username%TYPE, p_Email IN USERS_DATA.Email%TYPE, p_UserPassword IN USERS_DATA.UserPassword%TYPE ,p_PhoneNumber IN USERS_DATA.PhoneNumber%TYPE, p_Address IN USERS_DATA.Adress%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_username_count INTEGER; v_email_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_username_count
    FROM USERS_DATA
    WHERE Username = p_Username;
    IF v_username_count > 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Username already exists. Please choose a different one.';
        RETURN;
    END IF;
    SELECT COUNT(*)
    INTO v_email_count
    FROM USERS_DATA
    WHERE Email = p_Email;
    IF v_email_count > 0 THEN
        p_ERROR_CODE := -2;
        p_ERROR_MESSAGE := 'Email address is already in use. Please use a different one.';
        RETURN;
    END IF;
    INSERT INTO USERS_DATA (
        Username,
        Email,
        UserPassword,
        PhoneNumber,
        Adress
    ) VALUES (
        p_Username,
        p_Email,
        p_UserPassword,
        p_PhoneNumber,
        p_Address
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'User registered successfully.';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE USER_LOGIN ( p_Email IN USERS_DATA.Email%TYPE, p_Password IN USERS_DATA.UserPassword%TYPE, p_ERROR_CODE OUT NUMBER,p_ERROR_MESSAGE OUT VARCHAR2) AS v_username USERS_DATA.Username%TYPE;
BEGIN
    SELECT Username INTO v_username
    FROM USERS_DATA
    WHERE Email = p_Email AND UserPassword = p_Password;
    IF v_username IS NULL THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Invalid email or password. Please try again.';
        RETURN;
    END IF;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Login successful. Welcome, ' || v_username || '!';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Invalid email or password. Please try again.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE REGISTER_EMPLOYEE ( p_Employee_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE, p_FullName IN EMPLOYEES.FULL_NAME%TYPE, p_EmployeePassword IN EMPLOYEES.EMPLOYEE_PASSWORD%TYPE, p_EmployeePosition IN EMPLOYEES.EMPLOYEE_POSITION%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS  v_id_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_id_count
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_Employee_ID;
    IF v_id_count > 0 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Employee ID already exists. Please choose a different one.';
        RETURN;
    END IF;
    INSERT INTO EMPLOYEES (
        EMPLOYEE_ID,
        FULL_NAME,
        EMPLOYEE_PASSWORD,
        EMPLOYEE_POSITION
    ) VALUES (
        p_Employee_ID,
        p_FullName,
        p_EmployeePassword,
        p_EmployeePosition
    );
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Employee registered successfully.';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE EMPLOYEE_LOGIN (p_Employee_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE, p_Password IN EMPLOYEES.EMPLOYEE_PASSWORD%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_full_name EMPLOYEES.FULL_NAME%TYPE;
BEGIN
    SELECT FULL_NAME INTO v_full_name
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_Employee_ID AND EMPLOYEE_PASSWORD = p_Password;
    IF v_full_name IS NULL THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Invalid employee ID or password. Please try again.';
        RETURN;
    END IF;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Login successful. Welcome, ' || v_full_name || '!';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Invalid employee ID or password. Please try again.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE REPLACE_PRODUCT_INFO (p_TableName IN VARCHAR2,p_ColumnName IN VARCHAR2,p_ProductID IN INT,p_NewValue IN VARCHAR2,p_ERROR_CODE OUT NUMBER,p_ERROR_MESSAGE OUT VARCHAR2) AS v_ColumnDataType VARCHAR2(50);
BEGIN
    SELECT DATA_TYPE
    INTO v_ColumnDataType
    FROM USER_TAB_COLUMNS
    WHERE TABLE_NAME = p_TableName
    AND COLUMN_NAME = p_ColumnName;

    EXECUTE IMMEDIATE 'UPDATE ' || p_TableName ||
                      ' SET ' || p_ColumnName || ' = :newValue' ||
                      ' WHERE ' ||CASE
                                  WHEN p_TableName = 'OS' THEN 'OS_ID = :ID'
                                  WHEN p_TableName = 'CPUS' THEN 'CPU_ID = :ID'
                                  WHEN p_TableName = 'GPUS' THEN 'GPU_ID = :ID'
                                  WHEN p_TableName = 'COOLERS' THEN 'COOLER_ID = :ID'
                                  WHEN p_TableName = 'MOTHERBOARD' THEN 'MOTHERBOARD_ID = :ID'
                                  WHEN p_TableName = 'CASES' THEN 'CASE_ID = :ID'
                                  WHEN p_TableName = 'STORAGE' THEN 'STORAGE_ID = :ID'
                                  WHEN p_TableName = 'MEMORIES' THEN 'MEMORY_ID = :ID'
                                  WHEN p_TableName = 'PSUS' THEN 'PSU_ID = :ID'
                                  WHEN p_TableName = 'ITEMS_ORDERED' then 'ITEM_ID = :ID'
                                  WHEN p_TableName = 'ORDERS' then 'ORDER_ID = :ID'
                                  WHEN p_TableName = 'EMPLOYEES' then 'EMPLOYEE_ID = :ID'
                                  END
                      USING p_NewValue, p_ProductID;
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Cell information replaced successfully.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Table or column not found.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE  DELETE_ROW_AND_REDUCE_IDS ( p_TableName IN VARCHAR2, p_ProductID IN INT, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_MaxID INT; v_count INT;v_con_name VARCHAR2;
BEGIN
    EXECUTE IMMEDIATE 'SELECT MAX(' ||
                      CASE
                          WHEN p_TableName = 'OS' THEN 'OS_ID'
                          WHEN p_TableName = 'CPUS' THEN 'CPU_ID'
                          WHEN p_TableName = 'GPUS' THEN 'GPU_ID'
                          WHEN p_TableName = 'COOLERS' THEN 'COOLER_ID'
                          WHEN p_TableName = 'MOTHERBOARD' THEN 'MOTHERBOARD_ID'
                          WHEN p_TableName = 'CASES' THEN 'CASE_ID'
                          WHEN p_TableName = 'STORAGE' THEN 'STORAGE_ID'
                          WHEN p_TableName = 'MEMORIES' THEN 'MEMORY_ID'
                          WHEN p_TableName = 'PSUS' THEN 'PSU_ID'
                          WHEN p_TableName = 'ITEMS_ORDERED' then 'ITEM_ID'
                      END || ') FROM ' || p_TableName INTO v_MaxID;
    EXECUTE IMMEDIATE 'DELETE FROM ' || p_TableName || ' WHERE ' ||
                      CASE
                          WHEN p_TableName = 'OS' THEN 'OS_ID'
                          WHEN p_TableName = 'CPUS' THEN 'CPU_ID'
                          WHEN p_TableName = 'GPUS' THEN 'GPU_ID'
                          WHEN p_TableName = 'COOLERS' THEN 'COOLER_ID'
                          WHEN p_TableName = 'MOTHERBOARD' THEN 'MOTHERBOARD_ID'
                          WHEN p_TableName = 'CASES' THEN 'CASE_ID'
                          WHEN p_TableName = 'STORAGE' THEN 'STORAGE_ID'
                          WHEN p_TableName = 'MEMORIES' THEN 'MEMORY_ID'
                          WHEN p_TableName = 'PSUS' THEN 'PSU_ID'
                          WHEN p_TableName = 'ITEMS_ORDERED' then 'ITEM_ID'
                      END || ' = :productID'
                      USING p_ProductID;
    IF v_MaxID > p_ProductID THEN
        FOR i IN p_ProductID..v_MaxID - 1 LOOP
            EXECUTE IMMEDIATE 'UPDATE ' || p_TableName ||
                              ' SET ' ||
                              CASE
                                  WHEN p_TableName = 'OS' THEN 'OS_ID = :newID'
                                  WHEN p_TableName = 'CPUS' THEN 'CPU_ID = :newID'
                                  WHEN p_TableName = 'GPUS' THEN 'GPU_ID = :newID'
                                  WHEN p_TableName = 'COOLERS' THEN 'COOLER_ID = :newID'
                                  WHEN p_TableName = 'MOTHERBOARD' THEN 'MOTHERBOARD_ID = :newID'
                                  WHEN p_TableName = 'CASES' THEN 'CASE_ID = :newID'
                                  WHEN p_TableName = 'STORAGE' THEN 'STORAGE_ID = :newID'
                                  WHEN p_TableName = 'MEMORIES' THEN 'MEMORY_ID = :newID'
                                  WHEN p_TableName = 'PSUS' THEN 'PSU_ID = :newID'
                                  WHEN p_TableName = 'ITEMS_ORDERED' then 'ITEM_ID = :newID'
                              END ||
                              ' WHERE ' ||
                              CASE
                                  WHEN p_TableName = 'OS' THEN 'OS_ID = :oldID'
                                  WHEN p_TableName = 'CPUS' THEN 'CPU_ID = :oldID'
                                  WHEN p_TableName = 'GPUS' THEN 'GPU_ID = :oldID'
                                  WHEN p_TableName = 'COOLERS' THEN 'COOLER_ID = :oldID'
                                  WHEN p_TableName = 'MOTHERBOARD' THEN 'MOTHERBOARD_ID = :oldID'
                                  WHEN p_TableName = 'CASES' THEN 'CASE_ID = :oldID'
                                  WHEN p_TableName = 'STORAGE' THEN 'STORAGE_ID = :oldID'
                                  WHEN p_TableName = 'MEMORIES' THEN 'MEMORY_ID = :oldID'
                                  WHEN p_TableName = 'PSUS' THEN 'PSU_ID = :oldID'
                                  WHEN p_TableName = 'ITEMS_ORDERED' then 'ITEM_ID = :oldID'
                              END
                              USING i, i + 1;
        END LOOP;
    END IF;

    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Row deleted successfully and product IDs updated.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Table not found.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE SEARCH_COMPONENTS ( p_SearchText IN VARCHAR2, p_Result OUT SYS_REFCURSOR, p_ERROR_CODE OUT NUMBER,p_ERROR_MESSAGE OUT VARCHAR2) as
BEGIN
    OPEN p_Result FOR
    SELECT *
    FROM (
        SELECT OS_ID AS ID, OS_NAME AS NAME, OS_VERSION || ' ' || OS_BIT_VERSION AS DESCRIPTION FROM OS
        UNION ALL
        SELECT CPU_ID AS ID, CPU_NAME AS NAME, BRAND || ' ' || SERIES || ' ' || MODEL AS DESCRIPTION FROM CPUS
        UNION ALL
        SELECT GPU_ID AS ID, GPU_NAME AS NAME, BRAND || ' ' || SERIES AS DESCRIPTION FROM GPUS
        UNION ALL
        SELECT COOLER_ID AS ID, COOLER_NAME AS NAME, BRAND || ' ' || MODEL AS DESCRIPTION FROM COOLERS
        UNION ALL
        SELECT MOTHERBOARD_ID AS ID, MOTHERBOARD_NAME AS NAME, BRAND || ' ' || MODEL AS DESCRIPTION FROM MOTHERBOARD
        UNION ALL
        SELECT CASE_ID AS ID, CASE_NAME AS NAME, BRAND || ' ' || SERIES AS DESCRIPTION FROM CASES
        UNION ALL
        SELECT STORAGE_ID AS ID, STORAGE_NAME AS NAME, BRAND || ' ' || CAPACITY AS DESCRIPTION FROM STORAGE
        UNION ALL
        SELECT MEMORY_ID AS ID, MEMORY_NAME AS NAME, BRAND || ' ' || CAPACITY AS DESCRIPTION FROM MEMORIES
        UNION ALL
        SELECT PSU_ID AS ID, PSU_NAME AS NAME, BRAND || ' ' || SERIES AS DESCRIPTION FROM PSUS
    ) WHERE UPPER(NAME) LIKE '%' || UPPER(p_SearchText) || '%';

    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE SELECT_ALL_FROM_TABLE(p_TableName IN VARCHAR2, p_Result OUT SYS_REFCURSOR, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2)
AS
BEGIN
    OPEN p_Result FOR 'SELECT * FROM ' || p_TableName;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Table or column not found.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE TRIGGER UPDATE_ORDER_COST
AFTER INSERT ON ITEMS_ORDERED
FOR EACH ROW
DECLARE
    v_total_cost INT;
BEGIN
    SELECT NVL(SUM(
        NVL((SELECT COST FROM CPUS WHERE CPU_ID = :NEW.CPU), 0) +
        NVL((SELECT COST FROM GPUS WHERE GPU_ID = :NEW.GPU), 0) +
        NVL((SELECT COST FROM COOLERS WHERE COOLER_ID = :NEW.COOLER), 0) +
        NVL((SELECT COST FROM MOTHERBOARD WHERE MOTHERBOARD_ID = :NEW.MOTHERBOARD), 0) +
        NVL((SELECT COST FROM PSUS WHERE PSU_ID = :NEW.PSU), 0) +
        NVL((SELECT COST FROM STORAGE WHERE STORAGE_ID = :NEW.DRIVES), 0) +
        NVL((SELECT COST FROM CASES WHERE CASE_ID = :NEW.CASE), 0) +
        NVL((SELECT COST FROM MEMORIES WHERE MEMORY_ID = :NEW.MEMORY), 0) +
        NVL((SELECT COST FROM OS WHERE OS_ID = :NEW.OS_LOL), 0)
    ), 0) + 20
    INTO v_total_cost
    FROM dual;
    UPDATE ORDERS
    SET COST = v_total_cost
    WHERE ORDER_ID = :NEW.ORDERED_IN;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END UPDATE_ORDER_COST;

CREATE OR REPLACE PROCEDURE CHANGE_PASSWORD(p_Username IN USERS_DATA.USERNAME%TYPE, p_PasswordOld IN USERS_DATA.UserPassword%TYPE, p_PasswordNew IN USERS_DATA.UserPassword%TYPE, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2) AS v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM USERS_DATA WHERE UPPER(Username) = UPPER(p_Username) and UPPER(UserPassword) = UPPER(p_PasswordOld);
    IF v_count<1 THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Wrong password or username';
        RETURN;
    END IF;
    UPDATE USERS_DATA SET UserPassword = p_PasswordNew WHERE Username = p_Username;
    COMMIT;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
    EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;    

CREATE OR REPLACE PROCEDURE ORDER_BY_TABLE(p_TableName IN VARCHAR2, p_RowName IN VARCHAR2,p_Result OUT SYS_REFCURSOR, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2)
AS
BEGIN
    OPEN p_Result FOR 'SELECT * FROM ' || p_TableName || ' ORDER BY ' || p_RowName;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Table or column not found.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE CANCEL_ORDER(p_OrderID IN ORDERS.ORDER_ID%TYPE,p_ERROR_CODE_lol OUT NUMBER,p_ERROR_MESSAGE_lol OUT VARCHAR2) AS v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM ORDERS WHERE ORDER_ID = p_OrderID;
    IF v_count = 0 THEN
        p_ERROR_CODE_lol := -1;
        p_ERROR_MESSAGE_lol := 'Column not found.';
        RETURN;
    END IF;
    UPDATE ORDERS SET STATUS = 5 WHERE Order_ID = p_OrderID;
    p_ERROR_CODE_lol := 0;
    p_ERROR_MESSAGE_lol := 'Success';
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE_lol := SQLCODE;
        p_ERROR_MESSAGE_lol := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE FILTER_DATA (p_TableName IN VARCHAR2,p_ColumnName IN VARCHAR2,p_Min IN NUMBER,p_Max IN NUMBER,p_Result OUT SYS_REFCURSOR,p_ERROR_CODE OUT NUMBER,p_ERROR_MESSAGE OUT VARCHAR2) AS v_column_type VARCHAR2(50); v_index_count NUMBER; v_index_name VARCHAR2(30);
BEGIN
    SELECT COUNT(*)
    INTO v_index_count
    FROM ALL_IND_COLUMNS aic
    JOIN ALL_INDEXES ai ON aic.INDEX_NAME = ai.INDEX_NAME
    WHERE ai.TABLE_NAME = p_TableName
    AND aic.COLUMN_NAME = p_ColumnName;
    IF v_index_count = 0 THEN
        v_index_name := 'IDX_' || p_TableName || '_' || p_ColumnName || '_' || DBMS_RANDOM.STRING('X', 5);
        EXECUTE IMMEDIATE 'CREATE INDEX ' || v_index_name || ' ON ' || p_TableName || '(' || p_ColumnName || ')';
    END IF;
    SELECT DATA_TYPE
    INTO v_column_type
    FROM USER_TAB_COLUMNS
    WHERE TABLE_NAME = p_TableName
    AND COLUMN_NAME = p_ColumnName;
    IF v_column_type IN ('NUMBER', 'INT', 'NUMERIC', 'INTEGER') THEN
        OPEN p_Result FOR 'SELECT * FROM ' || p_TableName || ' WHERE ' || p_ColumnName || ' >= ' || p_Min || ' AND ' || p_ColumnName || ' <= ' || p_Max;
        p_ERROR_CODE := 0;
        p_ERROR_MESSAGE := 'Success';
    ELSE
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Column type is not numeric';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE PROCEDURE REVIEWS_FOR_PRODUCT(p_Product_ID INT, p_Result OUT SYS_REFCURSOR, p_ERROR_CODE OUT NUMBER, p_ERROR_MESSAGE OUT VARCHAR2)
AS
BEGIN
    OPEN p_Result FOR 'SELECT * FROM REVIEWS WHERE REVIEWED = ' || p_Product_ID;
    p_ERROR_CODE := 0;
    p_ERROR_MESSAGE := 'Success';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_ERROR_CODE := -1;
        p_ERROR_MESSAGE := 'Table or column not found.';
    WHEN OTHERS THEN
        p_ERROR_CODE := SQLCODE;
        p_ERROR_MESSAGE := SUBSTR(SQLERRM, 1, 200);
END;

CREATE OR REPLACE TRIGGER REDUCE_ITEMS
AFTER INSERT ON ITEMS_ORDERED
FOR EACH ROW
DECLARE
    v_new_value INT;
BEGIN
    UPDATE CPUS SET AMMOUNT = AMMOUNT - 1 WHERE CPU_ID = :NEW.CPU;
    UPDATE GPUS SET AMMOUNT = AMMOUNT - 1 WHERE GPU_ID = :NEW.GPU;
    UPDATE OS SET AMMOUNT = AMMOUNT - 1 WHERE OS_ID = :NEW.OS_LOL;
    UPDATE PSUS SET AMMOUNT = AMMOUNT - 1 WHERE PSU_ID = :NEW.PSU;
    UPDATE MOTHERBOARD SET AMMOUNT = AMMOUNT - 1 WHERE MOTHERBOARD_ID = :NEW.MOTHERBOARD;
    UPDATE COOLERS SET AMMOUNT = AMMOUNT - 1 WHERE COOLER_ID = :NEW.COOLER;
    UPDATE CASES SET AMMOUNT = AMMOUNT - 1 WHERE CASE_ID = :NEW.CASE;
    UPDATE MEMORIES SET AMMOUNT = AMMOUNT - 1 WHERE MEMORY_ID = :NEW.MEMORY;
    UPDATE STORAGE SET AMMOUNT = AMMOUNT - 1 WHERE STORAGE_ID = :NEW.DRIVES;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END REDUCE_ITEMS;


CREATE OR REPLACE TRIGGER LOCK_STATUSES
BEFORE UPDATE ON ORDERS
FOR EACH ROW
BEGIN
    IF :old.STATUS > 3 THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Cannot update status to a value above 3.');
    END IF;
END LOCK_STATUSES;

CREATE OR REPLACE PROCEDURE DISPLAY_ORDERS(p_Username IN VARCHAR2, p_Result OUT SYS_REFCURSOR) AS
BEGIN
    OPEN p_Result FOR
        SELECT ORDER_ID, ORDERER, STATUS_NAME, COST, PAYMENT_TYPE, DELIVERY,
               CPU_NAME, GPU_NAME, COOLER_NAME, MOTHERBOARD_NAME, 
               PSU_NAME, STORAGE_NAME, CASE_NAME, MEMORY_NAME, OS_NAME
        FROM (
            SELECT o.ORDER_ID, o.ORDERER, s.STATUS_NAME, o.COST, o.PAYMENT_TYPE, o.DELIVERY,
                   c.CPU_NAME, g.GPU_NAME, co.COOLER_NAME, m.MOTHERBOARD_NAME, 
                   p.PSU_NAME, st.STORAGE_NAME, cs.CASE_NAME, mem.MEMORY_NAME, os.OS_NAME
            FROM ORDERS o
            JOIN ITEMS_ORDERED io ON o.ORDER_ID = io.ORDERED_IN
            JOIN STATUSES s ON o.STATUS = s.STATUS_ID
            LEFT JOIN CPUS c ON io.CPU = c.CPU_ID
            LEFT JOIN GPUS g ON io.GPU = g.GPU_ID
            LEFT JOIN COOLERS co ON io.COOLER = co.COOLER_ID
            LEFT JOIN MOTHERBOARD m ON io.MOTHERBOARD = m.MOTHERBOARD_ID
            LEFT JOIN PSUS p ON io.PSU = p.PSU_ID
            LEFT JOIN STORAGE st ON io.DRIVES = st.STORAGE_ID
            LEFT JOIN CASES cs ON io.CASE = cs.CASE_ID
            LEFT JOIN MEMORIES mem ON io.MEMORY = mem.MEMORY_ID
            LEFT JOIN OS os ON io.OS_LOL = os.OS_ID
            WHERE o.ORDERER = p_Username
        );
END;

CREATE OR REPLACE DIRECTORY JSON_DIR AS 'C:\export_import';
 
CREATE OR REPLACE PROCEDURE export_OS_to_JSON(filename IN VARCHAR2) AS
    v_file UTL_FILE.FILE_TYPE;
    v_json CLOB;
BEGIN
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT('OS_ID' VALUE OS_ID,
                           'OS_NAME' VALUE OS_NAME,
                           'OS_BIT_VERSION' VALUE OS_BIT_VERSION,
                           'OS_VERSION' VALUE OS_VERSION,
                           'OS_REQUIREMENTS' VALUE OS_REQUIREMENTS,
                           'RATING' VALUE RATING,
                           'AMMOUNT' VALUE AMMOUNT,
                           'COST' VALUE COST)
           ) INTO v_json
    FROM OS;
    v_file := UTL_FILE.FOPEN('JSON_DIR', filename, 'W');
    UTL_FILE.PUT_LINE(v_file, v_json);
    UTL_FILE.FCLOSE(v_file);
EXCEPTION
    WHEN OTHERS THEN
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        RAISE;
END;

CREATE OR REPLACE PROCEDURE IMPORT_OS_FROM_JSON(filename IN VARCHAR2) AS
    v_file UTL_FILE.FILE_TYPE;
    v_json CLOB;
BEGIN
    v_file := UTL_FILE.FOPEN('JSON_DIR', filename, 'R');
    UTL_FILE.GET_LINE(v_file, v_json);
    INSERT INTO OS (OS_ID, OS_NAME, OS_BIT_VERSION, OS_VERSION, OS_REQUIREMENTS, RATING, AMMOUNT, COST)
    SELECT jt.OS_ID,
           jt.OS_NAME,
           jt.OS_BIT_VERSION,
           jt.OS_VERSION,
           jt.OS_REQUIREMENTS,
           jt.RATING,
           jt.AMMOUNT,
           jt.COST
    FROM JSON_TABLE(v_json, '$[*]'
        COLUMNS (
            OS_ID INT PATH '$.OS_ID',
            OS_NAME VARCHAR2(50) PATH '$.OS_NAME',
            OS_BIT_VERSION VARCHAR(20) PATH '$.OS_BIT_VERSION',
            OS_VERSION VARCHAR2(50) PATH '$.OS_VERSION',
            OS_REQUIREMENTS VARCHAR2(120) PATH '$.OS_REQUIREMENTS',
            RATING INT PATH '$.RATING',
            AMMOUNT INT PATH '$.AMMOUNT',
            COST INT PATH '$.COST'
        )
    ) jt;
    COMMIT;
    UTL_FILE.FCLOSE(v_file);
EXCEPTION
    WHEN OTHERS THEN
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        RAISE;
END;

CREATE OR REPLACE TRIGGER UPDATE_RATING
AFTER INSERT ON REVIEWS
FOR EACH ROW
DECLARE
    reviewed_id INT;
    v_table_name VARCHAR2(50);
    v_sum INT;
    v_count INT;
    v_new_value INT;
    v_id VARCHAR2(50);
BEGIN
    SELECT REVIEWED INTO reviewed_id FROM REVIEWS WHERE REVIEW_ID = :NEW.REVIEW_ID;
    
    IF reviewed_id >-1 and reviewed_id<1000 THEN
        v_table_name := 'OS';
        v_id := 'OS_ID';
    ELSIF reviewed_id >999 and reviewed_id<2000 THEN
        v_table_name := 'CPUS';
        v_id := 'CPU_ID';
    ELSIF reviewed_id >1999 and reviewed_id<3000 THEN
        v_table_name := 'GPUS';
        v_id := 'GPU_ID';
    ELSIF reviewed_id >2999 and reviewed_id<4000 THEN
        v_table_name := 'COOLERS';
        v_id := 'COOLER_ID';
    ELSIF reviewed_id >3999 and reviewed_id<5000 THEN
        v_table_name := 'MOTHERBOARD';
        v_id := 'MOTHERBOARD_ID';
    ELSIF reviewed_id >5999 and reviewed_id<6000 THEN
        v_table_name := 'CASES';
        v_id := 'CASE_ID';
    ELSIF reviewed_id >6999 and reviewed_id<7000 THEN
        v_table_name := 'STORAGE';
        v_id := 'STORAGE_ID';
    ELSIF reviewed_id >7999 and reviewed_id<8000 THEN
        v_table_name := 'MEMORIES';
        v_id := 'MEMORY_ID';
    ELSIF reviewed_id >8999 and reviewed_id<9000 THEN
        v_table_name := 'PSUS';
        v_id := 'PSU_ID';
    END IF;

    SELECT COUNT(*) INTO v_count FROM REVIEWS WHERE REVIEWED = reviewed_id;
    SELECT SUM(RATING) INTO v_sum FROM REVIEWS WHERE REVIEWED = reviewed_id;
    
    IF v_count > 0 THEN
        v_new_value := ROUND(v_sum/v_count);
        EXECUTE IMMEDIATE 'UPDATE ' || v_table_name || ' SET RATING = :new_rating WHERE ' || v_id || ' = :reviewed_id;'
        USING v_new_value, reviewed_id;
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END UPDATE_RATING;


CREATE OR REPLACE TRIGGER RESTORE_AMOUNT 
AFTER UPDATE OF STATUS ON ORDERS 
FOR EACH ROW
WHEN (NEW.STATUS = 5)
DECLARE 
  CURSOR v_items IS
    SELECT * FROM ITEMS_ORDERED WHERE ORDERED_IN = :NEW.ORDER_ID FOR UPDATE;
BEGIN
  FOR item_ordered IN v_items LOOP
    IF item_ordered.CPU IS NOT NULL THEN
      UPDATE CPUS SET AMMOUNT = AMMOUNT + 1 WHERE CPU_ID = item_ordered.CPU;
    END IF;
    IF item_ordered.GPU IS NOT NULL THEN
      UPDATE GPUS SET AMMOUNT = AMMOUNT + 1 WHERE GPU_ID = item_ordered.GPU;
    END IF;
    IF item_ordered.COOLER IS NOT NULL THEN
      UPDATE COOLERS SET AMMOUNT = AMMOUNT + 1 WHERE COOLER_ID = item_ordered.COOLER;
    END IF;
    IF item_ordered.MOTHERBOARD IS NOT NULL THEN
      UPDATE MOTHERBOARD SET AMMOUNT = AMMOUNT + 1 WHERE MOTHERBOARD_ID = item_ordered.MOTHERBOARD;
    END IF;
    IF item_ordered.PSU IS NOT NULL THEN
      UPDATE PSUS SET AMMOUNT = AMMOUNT + 1 WHERE PSU_ID = item_ordered.PSU;
    END IF;
    IF item_ordered.DRIVES IS NOT NULL THEN
      UPDATE STORAGE SET AMMOUNT = AMMOUNT + 1 WHERE STORAGE_ID = item_ordered.DRIVES;
    END IF;
    IF item_ordered."CASE" IS NOT NULL THEN
      UPDATE CASES SET AMMOUNT = AMMOUNT + 1 WHERE CASE_ID = item_ordered."CASE";
    END IF;
    IF item_ordered.MEMORY IS NOT NULL THEN
      UPDATE MEMORIES SET AMMOUNT = AMMOUNT + 1 WHERE MEMORY_ID = item_ordered.MEMORY;
    END IF;
    IF item_ordered.OS_LOL IS NOT NULL THEN
      UPDATE OS SET AMMOUNT = AMMOUNT + 1 WHERE OS_ID = item_ordered.OS_LOL;
    END IF;
  END LOOP;
END;
--������ ��������� ������� +
--������� ������� +
--���� ������ �������  ???
--����� ������� +
--������ ��� ���������+
--JSON