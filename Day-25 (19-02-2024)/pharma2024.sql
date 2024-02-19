# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # #                                SOFTWARE ON                                # # # #
# # # #                    PHARMACEUTICALS PRODUCT DISTRIBUTION                   # # # #
# # # #                      SYSTEM REQUIREMENT SPECIFICATION                     # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

DROP TABLE IF EXISTS pharma2024;
CREATE TABLE IF NOT EXISTS pharma2024;
USE pharma2024;


##############
###  User  ###
##############
SELECT 'User';



################
###  Action  ###
################
SELECT 'Action';



###################
###  Privilege  ###
###################
SELECT 'Privilege';



#################           This table is used to keep the company name, GST No.,
###  Control  ###           Drug License No., Address, etc.
#################
SELECT 'Control';
DROPT TABLE IF EXISTS control;
CREATE TABLE IF NOT EXISTS control(
    con_id          INT(6)              NOT NULL AUTO_INCREMENT,
    org_name        VARCHAR(50)         NOT NULL UNIQUE,
    org_abbr        VARCHAR(10)         DEFAULT NULL UNIQUE,
    org_address     VARCHAR(150)        DEFAULT NULL,
    org_regd_no     VARCHAR(30)         DEFAULT NULL,
    db_name         VARCHAR(30)         NOT NULL UNIQUE,
    gst_no          VARCHAR(30),
    dl_no           VARCHAR(30),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(con_id)
);
INSERT INTO control(con_id,org_name,org_abbr,org_address,org_regd_no,db_name,gst_no,dl_no) VALUES
    (1, 'Alpha Pharmaceuticals','AP','E/43, iHub, Infocity Avenue, Chandrasekharpur, Bhubaneswar 751024', 'ORPH346/1999', 'pharma2024', 'GSTN13306', '1323N/1324LN');

######################
###  Manufacturer  ###
######################
SELECT 'Manufacturer';
DROP TABLE IF EXISTS manufacturer;
CREATE TABLE IF NOT EXISTS manufacturer(
    mfr_id          INT(6)              NOT NULL AUTO_INCREMENT,
    mfr_name        VARCHAR(50)         NOT NULL UNIQUE,
    mfr_abbr        VARCHAR(10)         NOT NULL UNIQUE,
    con_id          INT(6)              NOT NULL REFERENCES control(con_id),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(mfr_id)
);
INSERT INTO manufacturer(mfr_id,mfr_name,mfr_abbr,user_id,dlu,del) VALUES
    ( 1, 'Sun Pharmaceutical Industries',       'SUN',     1, 1, NULL, NULL),
    ( 2, 'Divi's Laboratories',                 'DIVI',    1, 1, NULL, NULL),
    ( 3, 'Dr. Reddy's Laboratories',            'DR',      1, 1, NULL, NULL),
    ( 4, 'Cipla Limited',                       'CIPLA',   1, 1, NULL, NULL),
    ( 5, 'Emcure Pharmaceuticals',              'EMCURE',  1, 1, NULL, NULL),
    ( 6, 'Biocon Limited',                      'BIOCON',  1, 1, NULL, NULL),
    ( 7, 'Torrent Pharma',                      'TORREN',  1, 1, NULL, NULL),
    ( 8, 'Lupin Limited',                       'LUPIN',   1, 1, NULL, NULL),
    ( 9, 'Zydus Lifesciences Limited',          'ZYDUS',   1, 1, NULL, NULL),
    (10, 'Aurobindo Pharma Limited',            'AURO',    1, 1, NULL, NULL),
    (11, 'Intas Pharmaceuticals Limited',       'INTAS',   1, 1, NULL, NULL),
    (12, 'Glenmark Pharma Limited',             'GLENM',   1, 1, NULL, NULL),
    (13, 'Mankind Pharma Limited',              'MANKIND', 1, 1, NULL, NULL),
    (14, 'Piramal Enterprises Limited',         'PIRAMAL', 1, 1, NULL, NULL),
    (15, 'Laurus Labs Ltd.',                    'LAURUS',  1, 1, NULL, NULL),
    (16, 'Abbott India Ltd.',                   'ABBOTT',  1, 1, NULL, NULL),
    (17, 'Alkem Laboratories',                  'ALKEM',   1, 1, NULL, NULL),
    (18, 'Alembic Pharmaceuticals',             'ALEMBIC', 1, 1, NULL, NULL),
    (19, 'Innovexia Life Sciences Pvt. Ltd.',   'INNOVEX', 1, 1, NULL, NULL),
    (20, 'Biophar Lifesciences Pvt. Ltd.',      'BIOPHAR', 1, 1, NULL, NULL);


#################
###  Product  ###
#################
SELECT 'Product';
DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product(
    prod_id         INT(6)              NOT NULL AUTO_INCREMENT,
	mfr_id          INT(6)              NOT NULL REFERENCES manufacturer(mfr_id),
	prod_name       VARCHAR(30)         NOT NULL UNIQUE,
	packing			VARCHAR(20)         DEFAULT NULL,
	store_id        INT(6)              DEFAULT NULL REFERENCES stores(store_id),
    con_id          INT(6)              NOT NULL REFERENCES control(con_id),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(prod_id)
);


###################
###  SalesArea  ###
###################
SELECT 'SalesArea';




#################
###  Debtors  ###
#################
SELECT 'Debtors';



###################
###  Creditors  ###
###################
SELECT 'Creditors';



###################
###  Tran-Type  ###
###################
SELECT 'TranType';
DROP TABLE IF EXISTS trantype;
CREATE TABLE IF NOT EXISTS trantype(
	tt_id			INT(6)				NOT NULL AUTO_INCREMENT,
	tt_desc			VARCHAR(50)			NOT NULL UNIQUE,
	tt_action       ENUM('+','-','=')	NOT NULL,
    con_id          INT(6)              NOT NULL REFERENCES control(con_id),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(tt_id)
);
INSERT INTO trantype VALUES
	(1, 'Opening Stock',			'+', 1, 1, NULL, NULL),
	(1, 'Purchase',					'+', 1, 1, NULL, NULL),
	(1, 'Return from Customer',		'+', 1, 1, NULL, NULL),
	(1, 'Replacement from Company', '+', 1, 1, NULL, NULL),
	(1, 'Sales',					'-', 1, 1, NULL, NULL),
	(1, 'Replacement to Customer',	'-', 1, 1, NULL, NULL),
	(1, 'Return from Customer',		'-', 1, 1, NULL, NULL),
	(1, 'Breakage & Expiry',		'-', 1, 1, NULL, NULL),
	(1, 'Theft',					'-', 1, 1, NULL, NULL);

###############
###  Stock  ###
###############
SELECT 'Stock';



##################
###  StockTrn  ###
##################
SELECT 'StockTrn';







/*
+-----------------------------------------------------------------------------------------------+
|                                   STOCK TRANSACTION ENTRY                                     |
+-----------------------------------------------------------------------------------------------+
|   1. Date:	 ##-##-####                                                                     |
|   2. Stk-No.:  ######                                 5. Party Name: xxxxxxxxxxxxxxxxxxxxxx   |
|   3. Trn-Type: !!!!!!!!!!!!!!!!!!!!!!!                6. DL.No.:     xxx-auto-fill-xxxxxxxx   |
|   4. Trn-No.:  ######                                 7. Address:    xxx-auto-fill-xxxxxxxx   |
+----+------+-----------------------+----------+--------+-------+------+--------+-----+---------+
| SL | MODE | PRODUCT-NAME          | BATCH-NO |  RATE  |  MRP  |  QTY | EXP-DT | TAX | NET-AMT |
+----+------+-----------------------+----------+--------+-------+------+--------+-----+---------+
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
|    |      |                       |          |        |       |      |        |     |         |
+-----------------------------------------------------------------------------------------------+
*/
