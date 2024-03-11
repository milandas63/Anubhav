DROP DATABASE IF EXISTS charlsFIFO;
CREATE DATABASE IF NOT EXISTS charlsFIFO;
USE charlsFIFO;

########################
####   Department   ####
########################
SELECT 'department';
CREATE TABLE department(
	dept_id			INT(6)			NOT NULL AUTO_INCREMENT,
	dept_name       VARCHAR(30)     NOT NULL UNIQUE,
	PRIMARY KEY(dept_id)
);
INSERT INTO department VALUES
	(1, 'Administration'),
	(2, 'Production'),
	(3, 'Sales & Marketing'),
	(4, 'Finance'),
	(5, 'Stock');


##########################
####   Designations   ####
##########################
SELECT 'designation';
CREATE TABLE designation(
	desig_id		INT(6)			NOT NULL AUTO_INCREMENT,
	desig_name      VARCHAR(30)     NOT NULL UNIQUE,
	PRIMARY KEY(desig_id)
);
INSERT INTO designation VALUES
	(1, 'Chief Executive Officer'),
	(2, 'Chief General Manager'),
	(3, 'Sr. Manager Production'),
	(4, 'Sr. Manager Administration'),
	(5, 'Sr. Manager Sales');


######################
####   Location   ####
######################
SELECT 'location';
CREATE TABLE location(
	loc_id          INT(6)          NOT NULL AUTO_INCREMENT,
	loc_name        VARCHAR(30)     NOT NULL UNIQUE,
	PRIMARY KEY(loc_id)
);
INSERT INTO location VALUES
	(1, 'Angul'),
	(2, 'Balasore'),
	(3, 'Bhubaneswar'),
	(4, 'Cuttack'),
	(5, 'Dhenkanal');


####################
####   Employ   ####
####################
SELECT 'employ';
CREATE TABLE employ(
	emp_id			INT(6)			NOT NULL AUTO_INCREMENT,
	emp_name        VARCHAR(30)     NOT NULL UNIQUE,
	gender          ENUM('M','F')   DEFAULT 'M',
	dob             DATE,
	dept_id			INT(6)          NOT NULL REFERENCES department(dept_id),
	desig_id        INT(6)          NOT NULL REFERENCES designation(desig_id),
	loc_id          INT(6)          NOT NULL REFERENCES location(loc_id),
	PRIMARY KEY(emp_id)
);
INSERT INTO employ VALUES
	(1, 'Milan Das','M','1965-11-25',1,1,3),
	(2, 'Anubhav Sengupta','M','2006-02-24',3,2,2),
	(3, 'Prateekshya Patnaik','F','2001-07-11',2,3,1),
	(4, 'Adit Jena','M','1970-06-03',5,4,4);

SELECT e.emp_id, e.emp_name, e.gender, e.dob, dept_name,desig_name,loc_name FROM employ AS e
LEFT JOIN department AS dp ON e.dept_id=dp.dept_id
LEFT JOIN designation AS dg ON e.desig_id=dg.desig_id
LEFT JOIN location AS l ON e.loc_id=l.loc_id;

