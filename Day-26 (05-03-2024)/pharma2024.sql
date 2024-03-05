# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # #                                SOFTWARE ON                                # # # #
# # # #                    PHARMACEUTICALS PRODUCT DISTRIBUTION                   # # # #

# # # #                      SYSTEM REQUIREMENT SPECIFICATION                     # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

DROP DATABASE IF EXISTS pharma2024;
CREATE DATABASE IF NOT EXISTS pharma2024;
USE pharma2024;


################
###  Action  ###
################
SELECT 'Action';
DROP TABLE IF EXISTS action;
CREATE TABLE IF NOT EXISTS action(
    act_id          INT(6)              NOT NULL AUTO_INCREMENT,
    act_desc        VARCHAR(50)         NOT NULL UNIQUE,
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(act_id)
);
INSERT INTO action VALUES
    (1, 'View',     NULL, NULL),
    (2, 'Add',      NULL, NULL),
    (3, 'Edit',     NULL, NULL),
    (4, 'Delete',   NULL, NULL),
    (5, 'Report',   NULL, NULL);


##############
###  User  ###
##############
SELECT 'User';



###################
###  Privilege  ###
###################
SELECT 'Privilege';



#################           This table is used to keep the company name, GST No.,
###  Control  ###           Drug License No., Address, etc.
#################
SELECT 'Control';
DROP TABLE IF EXISTS control;
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
INSERT INTO manufacturer(mfr_id,mfr_name,mfr_abbr,con_id,user_id,dlu,del) VALUES
    ( 1, 'Sun Pharmaceutical Industries',       'SUN',     1, 1, NULL, NULL),
    ( 2, 'Divi\'s Laboratories',                'DIVI',    1, 1, NULL, NULL),
    ( 3, 'Dr. Reddy\'s Laboratories',           'DR',      1, 1, NULL, NULL),
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
    packing         VARCHAR(20)         DEFAULT NULL,
    store_id        INT(6)              DEFAULT NULL REFERENCES stores(store_id),
    con_id          INT(6)              NOT NULL REFERENCES control(con_id),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(prod_id)
);
INSERT INTO product(prod_id,mfr_id,prod_name,packing,store_id,con_id,user_id,dlu,del) VALUES
    (1,   1, 'ABSENZ ORAL SOLUTION',                NULL,   1, 1, 1, NULL, NULL),
    (2,   1, 'ACAMPROL',                            NULL,   1, 1, 1, NULL, NULL),
    (3,   1, 'ADCAPONE',                            NULL,   1, 1, 1, NULL, NULL),
    (4,   1, 'SYNDOPA',                             NULL,   1, 1, 1, NULL, NULL),
    (5,   1, 'WAKLERT',                             NULL,   1, 1, 1, NULL, NULL),
    (6,   1, 'CAFIRATE',                            NULL,   1, 1, 1, NULL, NULL),
    (7,   1, 'MIDODRIVE',                           NULL,   1, 1, 1, NULL, NULL),
    (8,   1, 'ISTAMET XR CP',                       NULL,   1, 1, 1, NULL, NULL),
    (9,   1, 'SOMPRAZ HP',                          NULL,   1, 1, 1, NULL, NULL),
    (10,  1, 'EZACT',                               NULL,   1, 1, 1, NULL, NULL),

    (11,  2, 'Capecitabine',                        NULL,   1, 1, 1, NULL, NULL),
    (12,  2, 'Carbidopa',                           NULL,   1, 1, 1, NULL, NULL),
    (13,  2, 'Diltiazem',                           NULL,   1, 1, 1, NULL, NULL),
    (14,  2, 'lopamidol',                           NULL,   1, 1, 1, NULL, NULL),
    (15,  2, 'lrbesartan',                          NULL,   1, 1, 1, NULL, NULL),
    (16,  2, 'Naproxen',                            NULL,   1, 1, 1, NULL, NULL),
    (17,  2, 'Niacin',                              NULL,   1, 1, 1, NULL, NULL),
    (18,  2, 'Proguanil Hcl.',                      NULL,   1, 1, 1, NULL, NULL),
    (19,  2, 'Vigabatrin',                          NULL,   1, 1, 1, NULL, NULL),
    (20,  2, 'Valsartan',                           NULL,   1, 1, 1, NULL, NULL),

    (21,  3, 'Alverine',                            NULL,   1, 1, 1, NULL, NULL),
    (22,  3, 'Amlodipine',                          NULL,   1, 1, 1, NULL, NULL),
    (23,  3, 'Bisacody',                            NULL,   1, 1, 1, NULL, NULL),
    (24,  3, 'Cetirizine',                          NULL,   1, 1, 1, NULL, NULL),
    (25,  3, 'Ciprofloxacin',                       NULL,   1, 1, 1, NULL, NULL),
    (26,  3, 'Zoledronic Acid',                     NULL,   1, 1, 1, NULL, NULL),
    (27,  3, 'Pioglitazone',                        NULL,   1, 1, 1, NULL, NULL),
    (28,  3, 'Fluoxetine',                          NULL,   1, 1, 1, NULL, NULL),
    (29,  3, 'Omeprazole',                          NULL,   1, 1, 1, NULL, NULL),
    (30,  3, 'Sumatriptan',                         NULL,   1, 1, 1, NULL, NULL),

    (31,  4, 'Acivir DT',                           NULL,   1, 1, 1, NULL, NULL),
    (32,  4, 'Advent ',                             NULL,   1, 1, 1, NULL, NULL),
    (33,  4, 'Aerocort Forte Rotacap',              NULL,   1, 1, 1, NULL, NULL),
    (34,  4, 'Alfusin D Tablet',                    NULL,   1, 1, 1, NULL, NULL),
    (35,  4, 'Cromal Forte Eye Drops',              NULL,   1, 1, 1, NULL, NULL),
    (36,  4, 'DASATRUE',                            NULL,   1, 1, 1, NULL, NULL),
    (37,  4, 'LENVATOL 10',                         NULL,   1, 1, 1, NULL, NULL),
    (38,  4, 'Megaclox Capsule',                    NULL,   1, 1, 1, NULL, NULL),
    (39,  4, 'Rosulip',                             NULL,   1, 1, 1, NULL, NULL),
    (40,  4, 'Nova',                                NULL,   1, 1, 1, NULL, NULL),

    (41,  5, 'Asomex',                              NULL,   1, 1, 1, NULL, NULL),
    (42,  5, 'Atazor R',                            NULL,   1, 1, 1, NULL, NULL),
    (43,  5, 'CEASTRA',                             NULL,   1, 1, 1, NULL, NULL),
    (44,  5, 'EMLETRA',                             NULL,   1, 1, 1, NULL, NULL),
    (45,  5, 'Facer Sera',                          NULL,   1, 1, 1, NULL, NULL),
    (46,  5, 'GLIPSOV',                             NULL,   1, 1, 1, NULL, NULL),
    (47,  5, 'NABCURE',                             NULL,   1, 1, 1, NULL, NULL),
    (48,  5, 'Nucarnit M',                          NULL,   1, 1, 1, NULL, NULL),
    (49,  5, 'QCEPH O',                             NULL,   1, 1, 1, NULL, NULL),
    (50,  5, 'SPEGRA',                              NULL,   1, 1, 1, NULL, NULL),

    (51,  6, 'Alizap',                              NULL,   1, 1, 1, NULL, NULL),
    (52,  6, 'Blisto',                              NULL,   1, 1, 1, NULL, NULL),
    (53,  6, 'Calpsor C Lotion ',                   NULL,   1, 1, 1, NULL, NULL),
    (54,  6, 'Statix ',                             NULL,   1, 1, 1, NULL, NULL),
    (55,  6, 'Rapacan',                             NULL,   1, 1, 1, NULL, NULL),
    (56,  6, 'Gmab Plus Capsule',                   NULL,   1, 1, 1, NULL, NULL),
    (57,  6, 'Metadoze Ipr',                        NULL,   1, 1, 1, NULL, NULL),
    (58,  6, 'Aretha',                              NULL,   1, 1, 1, NULL, NULL),
    (59,  6, 'Zuker MF',                            NULL,   1, 1, 1, NULL, NULL),
    (60,  6, 'Telmisat AM',                         NULL,   1, 1, 1, NULL, NULL),

    (61,  7, 'Adcef Instause Syrup',                NULL,   1, 1, 1, NULL, NULL),
    (62,  7, 'Afogatran ',                          NULL,   1, 1, 1, NULL, NULL),
    (63,  7, 'Ampoxin ',                            NULL,   1, 1, 1, NULL, NULL),
    (64,  7, 'C Pram S',                            NULL,   1, 1, 1, NULL, NULL),
    (65,  7, 'Corbis H',                            NULL,   1, 1, 1, NULL, NULL),
    (66,  7, 'Droxyl ',                             NULL,   1, 1, 1, NULL, NULL),
    (67,  7, 'Nebicard H',                          NULL,   1, 1, 1, NULL, NULL),
    (68,  7, 'OCABILE 10',                          NULL,   1, 1, 1, NULL, NULL),
    (69,  7, 'Amazeo ',                             NULL,   1, 1, 1, NULL, NULL),
    (70,  7, 'Symbal',                              NULL,   1, 1, 1, NULL, NULL),

    (71,  8, 'Abel',                                NULL,   1, 1, 1, NULL, NULL),
    (72,  8, 'Ambrican',                            NULL,   1, 1, 1, NULL, NULL),
    (73,  8, 'ARZU',                                NULL,   1, 1, 1, NULL, NULL),
    (74,  8, 'Beipos',                              NULL,   1, 1, 1, NULL, NULL),
    (75,  8, 'Budamate Forte Transcap',             NULL,   1, 1, 1, NULL, NULL),
    (76,  8, 'Cefaxone 250mg Injection',            NULL,   1, 1, 1, NULL, NULL),
    (77,  8, 'Gluconorm PG',                        NULL,   1, 1, 1, NULL, NULL),
    (78,  8, 'Goodflo',                             NULL,   1, 1, 1, NULL, NULL),
    (79,  8, 'MIOFREE ET',                          NULL,   1, 1, 1, NULL, NULL),
    (80,  8, 'Telekast L Kid Syrup',                NULL,   1, 1, 1, NULL, NULL),

    (81,  9, 'Aerodil Sugar Free Expectorant',      NULL,   1, 1, 1, NULL, NULL),
    (82,  9, 'Aldonil',                             NULL,   1, 1, 1, NULL, NULL),
    (83,  9, 'Amlodac',                             NULL,   1, 1, 1, NULL, NULL),
    (84,  9, 'Epsolin ',                            NULL,   1, 1, 1, NULL, NULL),
    (85,  9, 'Falcigo',                             NULL,   1, 1, 1, NULL, NULL),
    (86,  9, 'Levoday ',                            NULL,   1, 1, 1, NULL, NULL),
    (87,  9, 'Linid IV',                            NULL,   1, 1, 1, NULL, NULL),
    (88,  9, 'Livafin O ',                          NULL,   1, 1, 1, NULL, NULL),
    (89,  9, 'MEXATE 15 ',                          NULL,   1, 1, 1, NULL, NULL),
    (90,  9, 'Epsolin ER ',                         NULL,   1, 1, 1, NULL, NULL),

    (91, 10, 'Aminocaproic Acid OS USP',            NULL,   1, 1, 1, NULL, NULL),
    (92, 10, 'Amlodipine & Olmesartan Medoxomil',   NULL,   1, 1, 1, NULL, NULL),
    (93, 10, 'Buspirone HCI Tabs',                  NULL,   1, 1, 1, NULL, NULL),
    (94, 10, 'Capecitabin',                         NULL,   1, 1, 1, NULL, NULL),
    (95, 10, 'Cefadroxil',                          NULL,   1, 1, 1, NULL, NULL),
    (96, 10, 'Cefixime Oral Suspension',            NULL,   1, 1, 1, NULL, NULL),
    (97, 10, 'Cefpodoxime Proxetil',                NULL,   1, 1, 1, NULL, NULL),
    (98, 10, 'Divalproex ER',                       NULL,   1, 1, 1, NULL, NULL),
    (99, 10, 'Dutasteride',                         NULL,   1, 1, 1, NULL, NULL),
    (100,10, 'Flucytosine',                         NULL,   1, 1, 1, NULL, NULL),

    (101,11, 'Acutrol C ',                          NULL,   1, 1, 1, NULL, NULL),
    (102,11, 'ALLEGIX Lotion ',                     NULL,   1, 1, 1, NULL, NULL),
    (103,11, 'CALGEL ',                             NULL,   1, 1, 1, NULL, NULL),
    (104,11, 'DAPARYL 10',                          NULL,   1, 1, 1, NULL, NULL),
    (105,11, 'ELEFTHA ',                            NULL,   1, 1, 1, NULL, NULL),
    (106,11, 'LAN',                                 NULL,   1, 1, 1, NULL, NULL),
    (107,11, 'Mecofol Plus NF ',                    NULL,   1, 1, 1, NULL, NULL),
    (108,11, 'Nervz D ',                            NULL,   1, 1, 1, NULL, NULL),
    (109,11, 'Oriel M ',                            NULL,   1, 1, 1, NULL, NULL),
    (110,11, 'Quikhale FF ',                        NULL,   1, 1, 1, NULL, NULL),

    (111,12, 'Ascoril Flu Syrup',                   NULL,   1, 1, 1, NULL, NULL),
    (112,12, 'Canditral',                           NULL,   1, 1, 1, NULL, NULL),
    (113,12, 'DABIGZA 15',                          NULL,   1, 1, 1, NULL, NULL),
    (114,12, 'Epithra',                             NULL,   1, 1, 1, NULL, NULL),
    (115,12, 'Glevo ',                              NULL,   1, 1, 1, NULL, NULL),
    (116,12, 'Irban',                               NULL,   1, 1, 1, NULL, NULL),
    (117,12, 'Mignar',                              NULL,   1, 1, 1, NULL, NULL),
    (118,12, 'Olmax',                               NULL,   1, 1, 1, NULL, NULL),
    (119,12, 'REMO M ',                             NULL,   1, 1, 1, NULL, NULL),
    (120,12, 'Telma 40mg',                          NULL,   1, 1, 1, NULL, NULL),

    (121,13, 'Asthakind ',                          NULL,   1, 1, 1, NULL, NULL),
    (122,13, 'Bengreat',                            NULL,   1, 1, 1, NULL, NULL),
    (123,13, 'Caldikind Suspension',                NULL,   1, 1, 1, NULL, NULL),
    (124,13, 'Dobimust 500mg',                      NULL,   1, 1, 1, NULL, NULL),
    (125,13, 'Ferikind M',                          NULL,   1, 1, 1, NULL, NULL),
    (126,13, 'Gudgesic Plus ',                      NULL,   1, 1, 1, NULL, NULL),
    (127,13, 'HERGRACE NF',                         NULL,   1, 1, 1, NULL, NULL),
    (128,13, 'Lecope AD',                           NULL,   1, 1, 1, NULL, NULL),
    (129,13, 'Panimun Bioral 50mg',                 NULL,   1, 1, 1, NULL, NULL),
    (130,13, 'Willgo SP',                           NULL,   1, 1, 1, NULL, NULL),

    (131,14, 'Arkamin ',                            NULL,   1, 1, 1, NULL, NULL),
    (132,14, 'Alecensa 150mg ',                     NULL,   1, 1, 1, NULL, NULL),
    (133,14, 'Castophene',                          NULL,   1, 1, 1, NULL, NULL),
    (134,14, 'Cabotres',                            NULL,   1, 1, 1, NULL, NULL),
    (135,14, 'Defcort 6 ',                          NULL,   1, 1, 1, NULL, NULL),
    (136,14, 'Dytor 10 ',                           NULL,   1, 1, 1, NULL, NULL),
    (137,14, 'Eliquis 2.5mg ',                      NULL,   1, 1, 1, NULL, NULL),
    (138,14, 'Metrogyl 400',                        NULL,   1, 1, 1, NULL, NULL),
    (139,14, 'Nefrosave ',                          NULL,   1, 1, 1, NULL, NULL),
    (140,14, 'Sompraz 40',                          NULL,   1, 1, 1, NULL, NULL),

    (141,15, 'Abacavir/Lamivudine Tabs',            NULL,   1, 1, 1, NULL, NULL),
    (142,15, 'Atazanavir capsules',                 NULL,   1, 1, 1, NULL, NULL),
    (143,15, 'Gabapentin Caps',                     NULL,   1, 1, 1, NULL, NULL),
    (144,15, 'Hydroxychloroquine Sulfate Tablets',  NULL,   1, 1, 1, NULL, NULL),
    (145,15, 'Lopinavir and Ritonavir Tablets',     NULL,   1, 1, 1, NULL, NULL),
    (146,15, 'Metformin HCL Tablets',               NULL,   1, 1, 1, NULL, NULL),
    (147,15, 'Ranolazine',                          NULL,   1, 1, 1, NULL, NULL),
    (148,15, 'Ursodiol',                            NULL,   1, 1, 1, NULL, NULL),
    (149,15, 'Levetiracetam',                       NULL,   1, 1, 1, NULL, NULL),
    (150,15, 'Fenofibrate',                         NULL,   1, 1, 1, NULL, NULL),

    (151,16, 'Anafortan Tablet',                    NULL,   1, 1, 1, NULL, NULL),
    (152,16, 'AQUAVIRON 40',                        NULL,   1, 1, 1, NULL, NULL),
    (153,16, 'Bactrim DS Tablet',                   NULL,   1, 1, 1, NULL, NULL),
    (154,16, 'Cefchamp 325mg',                      NULL,   1, 1, 1, NULL, NULL),
    (155,16, 'Diabetrol',                           NULL,   1, 1, 1, NULL, NULL),
    (156,16, 'Ebility Tablet ',                     NULL,   1, 1, 1, NULL, NULL),
    (157,16, 'ESGIPYRIN Tablet',                    NULL,   1, 1, 1, NULL, NULL),
    (158,16, 'Ismo Retard 40mg',                    NULL,   1, 1, 1, NULL, NULL),
    (159,16, 'Levesam Solution ',                   NULL,   1, 1, 1, NULL, NULL),
    (160,16, 'Setgi Capsule',                       NULL,   1, 1, 1, NULL, NULL),

    (161,17, 'Alevo 250mg ',                        NULL,   1, 1, 1, NULL, NULL),
    (162,17, 'Blukof Syrup ',                       NULL,   1, 1, 1, NULL, NULL),
    (163,17, 'Ceham P',                             NULL,   1, 1, 1, NULL, NULL),
    (164,17, 'DONEP M',                             NULL,   1, 1, 1, NULL, NULL),
    (165,17, 'Enzoflam ',                           NULL,   1, 1, 1, NULL, NULL),
    (166,17, 'Joykem ODT 400 ',                     NULL,   1, 1, 1, NULL, NULL),
    (167,17, 'LINAPIL 5 ',                          NULL,   1, 1, 1, NULL, NULL),
    (168,17, 'Migrabeta 10mg',                      NULL,   1, 1, 1, NULL, NULL),
    (169,17, 'NERVMAX NT',                          NULL,   1, 1, 1, NULL, NULL),
    (170,17, 'SIZLAC 100',                          NULL,   1, 1, 1, NULL, NULL),

    (171,18, 'Althrocin 500m',                      NULL,   1, 1, 1, NULL, NULL),
    (172,18, 'BLADMIR S 25 ',                       NULL,   1, 1, 1, NULL, NULL),
    (173,18, 'Cetanil CT',                          NULL,   1, 1, 1, NULL, NULL),
    (174,18, 'Deltone 30mg',                        NULL,   1, 1, 1, NULL, NULL),
    (175,18, 'Etrik 60mg',                          NULL,   1, 1, 1, NULL, NULL),
    (176,18, 'Gerijoint',                           NULL,   1, 1, 1, NULL, NULL),
    (177,18, 'ISOFIT Tablet',                       NULL,   1, 1, 1, NULL, NULL),
    (178,18, 'OSTEOFIT HD',                         NULL,   1, 1, 1, NULL, NULL),
    (179,18, 'PENTAB 20',                           NULL,   1, 1, 1, NULL, NULL),
    (180,18, 'Zeet Cough Syrup',                    NULL,   1, 1, 1, NULL, NULL),

    (181,19, 'VILDORA-M',                           NULL,   1, 1, 1, NULL, NULL),
    (182,19, 'TRUPOD 100 DT',                       NULL,   1, 1, 1, NULL, NULL),
    (183,19, 'TELMISOFT-H ',                        NULL,   1, 1, 1, NULL, NULL),
    (184,19, 'COLIQUIT DROP',                       NULL,   1, 1, 1, NULL, NULL),
    (185,19, 'INNOCEE-1000 Chewable',               NULL,   1, 1, 1, NULL, NULL),
    (186,19, 'LULILAST Cream',                      NULL,   1, 1, 1, NULL, NULL),
    (187,19, 'NEUROXIA G',                          NULL,   1, 1, 1, NULL, NULL),
    (188,19, 'QUADFIX',                             NULL,   1, 1, 1, NULL, NULL),
    (189,19, 'GUT ULTRA ',                          NULL,   1, 1, 1, NULL, NULL),
    (190,19, 'ACESOFT-P ',                          NULL,   1, 1, 1, NULL, NULL),

    (191,20, 'Aceclofenac 100 mg ',                 NULL,   1, 1, 1, NULL, NULL),
    (192,20, 'Artemether 8',                        NULL,   1, 1, 1, NULL, NULL),
    (193,20, 'Methyl Prednisolone',                 NULL,   1, 1, 1, NULL, NULL),
    (194,20, 'Deflazacort',                         NULL,   1, 1, 1, NULL, NULL),
    (195,20, 'Etodolac 600 er',                     NULL,   1, 1, 1, NULL, NULL),
    (196,20, 'Cefixime 200 mg ',                    NULL,   1, 1, 1, NULL, NULL),
    (197,20, 'Ofloxacin 200mg ',                    NULL,   1, 1, 1, NULL, NULL),
    (198,20, 'Rabeprazole 20mg',                    NULL,   1, 1, 1, NULL, NULL),
    (199,20, 'Telmisartan 40mg',                    NULL,   1, 1, 1, NULL, NULL),
    (200,20, 'Itraconazole 100mg',                  NULL,   1, 1, 1, NULL, NULL);


###################
###  SalesArea  ###
###################
SELECT 'salesArea';
DROP TABLE IF EXISTS salesArea;
CREATE TABLE IF NOT EXISTS salesArea(
    sarea_id            INT(6)              NOT NULL AUTO_INCREMENT,
    sarea_name          VARCHAR(50)         NOT NULL UNIQUE,
    sarea_abbr          VARCHAR(10)         UNIQUE,
    distance            DOUBLE(8,2)         DEFAULT NULL,
    con_id              INT(6)              NOT NULL REFERENCES control(con_id),
    user_id             INT(6)              NOT NULL REFERENCES user(user_id),
    dlu                 TIMESTAMP,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(sarea_id)
);


###############
###  Party  ###
###############
SELECT 'party';
DROP TABLE IF EXISTS party;
CREATE TABLE IF NOT EXISTS party(
    party_id            INT(6)              NOT NULL AUTO_INCREMENT,
    sarea_id            INT(6)              DEFAULT NULL REFERENCES salesArea(sarea_id),  # For Debtors only
    party_name          VARCHAR(50)         NOT NULL UNIQUE,
    party_type          ENUM('C','D')       NOT NULL,
    party_dlno          VARCHAR(20)         DEFAULT NULL,
    party_address       VARCHAR(150)        DEFAULT NULL,
    balance             DOUBLE(12,2)        DEFAULT 0.00,
    con_id              INT(6)              NOT NULL REFERENCES control(con_id),
    user_id             INT(6)              NOT NULL REFERENCES user(user_id),
    dlu                 TIMESTAMP,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(party_id)
);


###################
###  Tran-Type  ###
###################
SELECT 'TranType';
DROP TABLE IF EXISTS trantype;
CREATE TABLE IF NOT EXISTS trantype(
    tt_id           INT(6)              NOT NULL AUTO_INCREMENT,
    tt_desc         VARCHAR(50)         NOT NULL UNIQUE,
    tt_action       ENUM('+','-','=')   NOT NULL,
    con_id          INT(6)              NOT NULL REFERENCES control(con_id),
    user_id         INT(6)              NOT NULL REFERENCES user(user_id),
    dlu             TIMESTAMP,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(tt_id)
);
INSERT INTO trantype VALUES
    ( 1, 'Opening Stock',                '+', 1, 1, NULL, NULL),
    ( 2, 'Purchase',                     '+', 1, 1, NULL, NULL),
    ( 3, 'Salable Return from Customer', '+', 1, 1, NULL, NULL),
    ( 4, 'Expiry Return from Customer',  '=', 1, 1, NULL, NULL),
    ( 5, 'Expiry Return to Company',     '-', 1, 1, NULL, NULL),
    ( 6, 'Replacement from Company',     '+', 1, 1, NULL, NULL),
    ( 7, 'Return from Company',          '+', 1, 1, NULL, NULL),
    ( 8, 'Sales',                        '-', 1, 1, NULL, NULL),
    ( 9, 'Breakage & Expiry',            '-', 1, 1, NULL, NULL),
    (10, 'Burglary & Theft',             '-', 1, 1, NULL, NULL);


#####################
###  StockTrnHdr  ###
#####################
SELECT 'StockTrnHdr';
DROP TABLE IF EXISTS stockTrnHdr;
CREATE TABLE IF NOT EXISTS stockTrnHdr(
    stk_id              INT(6)          NOT NULL AUTO_INCREMENT,
    stk_date            DATE            NOT NULL,
    stk_type_id         INT(6)          NOT NULL REFERENCES trantype(tt_id),
    stk_type_slno       INT(6)          NOT NULL,
    stk_party_id        INT(6)          NOT NULL,
    stk_party_dlno      VARCHAR(20),
    stk_party_addr      VARCHAR(150),
    tax_amount          DOUBLE(10,2)    DEFAULT 0.00,
    net_amount          DOUBLE(12,2)    DEFAULT 0.00,
    PRIMARY KEY(stk_id)
);


#####################
###  StockTrnDtl  ###
#####################
SELECT 'StockTrnDtl';
DROP TABLE IF EXISTS stockTrnDtl;
CREATE TABLE IF NOT EXISTS stockTrnDtl(
    stk_dtl_id          INT(6)          NOT NULL AUTO_INCREMENT,
    stk_id              INT(6)          NOT NULL REFERENCES stockTrnHdr(stk_id),
    slno                INT(6)          NOT NULL,
    prod_id             INT(6)          NOT NULL REFERENCES product(prod_id),
    batch_no            VARCHAR(20)     DEFAULT NULL,
    purch_rate          DOUBLE(10,2)    DEFAULT 0.00,
    sale_rate           DOUBLE(10,2)    DEFAULT 0.00,
    mrp_rate            DOUBLE(10,2)    DEFAULT 0.00,
    qty                 DOUBLE(10,3)    DEFAULT 0.00,
    free                DOUBLE(10,3)    DEFAULT 0.00,
    exp_dt              DATE            DEFAULT NULL,
    tax_pc              DOUBLE(6,2)     DEFAULT NULL,
    tax_amt             DOUBLE(10,2)    DEFAULT NULL,
    amount              DOUBLE(10,2)    DEFAULT NULL,
    PRIMARY KEY(stk_dtl_id)
);


######################
###  ClosingStock  ###
######################
SELECT 'closingStock';
DROP TABLE IF EXISTS closingStock;
CREATE TABLE IF NOT EXISTS closingStock(
    cstk_id             INT(6)          NOT NULL AUTO_INCREMENT,
    prod_id             INT(6)          NOT NULL REFERENCES product(prod_id),
    batch_no            VARCHAR(20)     DEFAULT NULL,
    purch_rate          DOUBLE(10,2)    DEFAULT 0.00,
    sale_rate           DOUBLE(10,2)    DEFAULT 0.00,
    mrp_rate            DOUBLE(10,2)    DEFAULT 0.00,
    qty                 DOUBLE(10,3)    DEFAULT 0.00,
    free                DOUBLE(10,3)    DEFAULT 0.00,
    exp_dt              DATE            DEFAULT NULL,
    tax_pc              DOUBLE(6,2)     DEFAULT NULL,
    con_id              INT(6)          NOT NULL REFERENCES control(con_id),
    user_id             INT(6)          NOT NULL REFERENCES user(user_id),
    dlu                 TIMESTAMP,
    del                 ENUM("*")       DEFAULT NULL,
    PRIMARY KEY(cstk_id)
);
CREATE UNIQUE INDEX closingStock ON closingStock(prod_id, batch_no, mrp_rate);


/*
+-----------------------------------------------------------------------------------------------+
|                                   STOCK TRANSACTION ENTRY                                     |
+-----------------------------------------------------------------------------------------------+
|   1. Date:     ##-##-####                                                                     |
|   2. Stk-No.:  #######                                5. Party Name: !!!!!!!!!!!!!!!!!!!!!!.  |
|   3. Trn-Type: !!!!!!!!!!!!!!!!!!!!!!!.               6. DL.No.:     xxx-auto-fill-xxxxxxxx   |
|   4. Trn-No.:  ######                                 7. Address:    xxx-auto-fill-xxxxxxxx   |
+----+------+-----------------------+----------+--------+--------+-------+------+------+-----+---------+
| SL | MFR .| PRODUCT-NAME         .| BATCH-NO |  MRP   | EXP-DT |  RATE |  QTY | FREE | TAX | NET-AMT |
+----+------+-----------------------+----------+--------+--------+-------+------+------+-----+---------+
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
|    |      |                       |          |        |        |       |      |      |     |         |
+----+------+-----------------------+----------+--------+--------+-------+------+------+-----+---------+
*/
