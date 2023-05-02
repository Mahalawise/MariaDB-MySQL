/* TEAM NUMBER 04: Mahala Wise, Stella Callahan, Ben Rooks */

/*DROPING TABLES IF THEY ARE ALREADY THERE*/
DROP TABLE IF EXISTS parent CASCADE;
DROP TABLE IF EXISTS student_instrument CASCADE;
DROP TABLE IF EXISTS tutor_lesson CASCADE;
DROP TABLE IF EXISTS instrument_details CASCADE;
DROP TABLE IF EXISTS payment_details CASCADE;
DROP TABLE IF EXISTS location_details CASCADE;
DROP TABLE IF EXISTS tutor_instrument CASCADE;
DROP TABLE IF EXISTS tutor_phone CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS instrument CASCADE;
DROP TABLE IF EXISTS tutor CASCADE;
DROP TABLE IF EXISTS lesson CASCADE;
DROP TABLE IF EXISTS lesson_location CASCADE;

/* CREATING TABLES */
CREATE TABLE student (
id INT auto_increment,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
dob DATE,
gender VARCHAR(15),
PRIMARY KEY(id))
ENGINE = innodb;

CREATE TABLE student_instrument (
student_id INT NOT NULL,
instrument_type VARCHAR (50),
FOREIGN KEY (student_id) REFERENCES student(id))
ENGINE = innodb;

CREATE TABLE parent (
student_id INT NOT NULL,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
phone VARCHAR (15),
type VARCHAR (10),
FOREIGN KEY (student_id) REFERENCES student (id))
ENGINE = innodb;

CREATE TABLE instrument (
id INT NOT NULL,
instrument_type VARCHAR (15),
PRIMARY KEY (id))
ENGINE = innodb;

CREATE TABLE tutor (
id INT auto_increment,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
dob DATE,
gender VARCHAR(15),
joined_date DATE NOT NULL,
left_date DATE,
PRIMARY KEY(id))
ENGINE = innodb;

CREATE TABLE tutor_instrument (
tutor_id INT NOT NULL,
instrument_type VARCHAR (50),
FOREIGN KEY (tutor_id) REFERENCES tutor (id))
ENGINE = innodb;

CREATE TABLE tutor_phone (
tutor_id INT NOT NULL,
phone VARCHAR (15),
type VARCHAR (10),
FOREIGN KEY (tutor_id) REFERENCES tutor(id))
ENGINE = innodb;

CREATE TABLE lesson (
id INT NOT NULL,
instrument_type VARCHAR (15),
length TIME,
days_taught VARCHAR (50),
PRIMARY KEY (id))
ENGINE = innodb;

CREATE TABLE tutor_lesson (
tutor_id INT NOT NULL,
lesson_id INT NOT NULL,
type VARCHAR (15),
FOREIGN KEY (tutor_id) REFERENCES tutor (id),
FOREIGN KEY (lesson_id) REFERENCES lesson (id))
ENGINE = innodb;

CREATE TABLE lesson_location (
id INT NOT NULL,
location VARCHAR (50),
PRIMARY KEY (id))
ENGINE = innodb;

CREATE TABLE instrument_details (
instrument_id INT NOT NULL,
student_id INT NOT NULL,
method VARCHAR (15),
cost INT,
time_begin TIME,
time_end TIME,
home_stay BOOLEAN,
FOREIGN KEY (instrument_id) REFERENCES instrument (id),
FOREIGN KEY (student_id) REFERENCES student (id))
ENGINE = innodb;

CREATE TABLE payment_details (
tutor_id INT NOT NULL,
student_id INT NOT NULL,
lesson_id INT NOT NULL,
method VARCHAR (15),
cost INT,
payment_plan VARCHAR(15),
FOREIGN KEY (tutor_id) REFERENCES tutor(id),
FOREIGN KEY (student_id) REFERENCES student(id),
FOREIGN KEY (lesson_id) REFERENCES lesson(id))
ENGINE = innodb;

CREATE TABLE location_details (
lesson_id INT NOT NULL,
location_id INT NOT NULL,
atTheStore BOOLEAN NOT NULL,
time_begin TIME,
time_end TIME,
cost INT,
FOREIGN KEY (lesson_id) REFERENCES lesson(id),
FOREIGN KEY (location_id) REFERENCES lesson_location(id))
ENGINE = innodb;

/*Inserting Values Into The Table*/

INSERT INTO student (id,fname,lname,dob,gender) VALUES
(1,'Bert','Carmody','2011-02-28','Female'),
(2,'Leigha','Ledingham','2000-04-15','Female'),
(3,'Ingaberg','Vear','1992-01-14','Female'),
(4,'Hildagard','Auston','1987-04-10','Female'),
(5,'Hobard','Smallsman','1991-04-13','Male'),
(6,'Marysa','Trousdale','2016-12-23','Female'),
(7,'Pail','Gigg','2010-11-04','Male'),
(8,'Ash','McQuirter','1996-12-13','Male'),
(9,'Minna','Tytherton','1986-12-31','Polygender'),
(10,'Murdoch','Roden','1981-10-18','Male'),
(11,'Carling','Seiler','1992-04-06','Male'),
(12,'Laurie','Basilone','1992-09-04','Female'),
(13,'Aldis','Vardy','2010-12-13','Male'),
(14,'Toiboid','Carlsson','2015-08-05','Male'),
(15,'Billy','Buckthorpe','1988-12-16','Male'),
(16,'Chad','Caridom','2011-02-28','Female'),
(17,'Lee','Lenders','2000-04-15','Polygender'),
(18,'Anna','Vixson','1992-01-14','Female'),
(19,'Haley','Aubern','1987-04-10','Female'),
(20,'Harry','Scott','1991-04-13','Male'),
(21,'Milley','Tittle','2016-12-23','Female'),
(22,'Patrick','German','2010-11-04','Male'),
(23,'Aaron','Muncie','1996-12-13','Male'),
(24,'Micheal','Tyson','1986-12-31','Polygender'),
(25,'Mitchell','Robin','1981-10-18','GenderFluid'),
(26,'Karl','Seilizer','1992-04-06','Male'),
(27,'Larissa','Bell','1992-09-04','Female'),
(28,'Gerdi','Kelp','2010-12-13','Male'),
(29,'Tommy','Carls','2015-08-05','Male'),
(30,'Bardie','Bilson','1988-12-16','Female');

INSERT INTO student_instrument (student_id, instrument_type) VALUES
(1,'Piano'),
(2,'Trumpet'),
(3,'French Horn'),
(4,'Saxophone'),
(5,'Cello'),
(6,'Piano'),
(7,'Mandolin'),
(8,'Harp'),
(9,'French Horn'),
(10,'Saxophone'),
(11,'Harp'),
(12,'Guitar'),
(13,'Bagpipes'),
(14,'Drums'),
(15,'Flute'),
(16,'Violin'),
(17,'Tuba'),
(18,'Harp'),
(19,'Flute'),
(20,'Drums'),
(21,'Banjo'),
(22,'Violin'),
(23,'Piano'),
(24,'Trumpet'),
(25,'French Horn'),
(26,'Saxophone'),
(27,'Cello'),
(28,'Piano'),
(29,'Mandolin'),
(30,'Harp'),
(1,'Violin'),
(4,'Tuba'),
(7,'Harp'),
(9,'Flute'),
(12,'Drums'),
(13,'Banjo'),
(15,'Violin'),
(20,'Marimba');

INSERT INTO parent (student_id,fname,lname,phone,type) VALUES
(1,'Christophorus','Enticott','744-218-8130','mobile'),
(6,'Ara','Trasler','749-164-3507','work'),
(7,'Amye','Gisburn','571-501-3284','home'),
(13,'Blair','Gamage','243-443-6885','mobile'),
(14,'Herschel','Moorey','596-920-3878','home'),
(1,'Quentin','Mathelin','793-639-5527','work'),
(7,'Laurella','Itzkovwich','536-842-1970','mobile'),
(6,'Fraze','Treby','190-736-9451','work'),
(13,'Kilian','Musslewhite','683-216-0304','mobile'),
(14,'Katee','Caurah','705-211-5122','home'),
(16,'Cathie','Everysome','744-218-8130','mobile'),
(21,'Avery','Tyler','749-164-3507','work'),
(22,'Amy','Gallus','571-501-3284','home'),
(28,'Blake','Monka','243-443-6885','mobile'),
(29,'Halsey','Mandon','596-920-3878','home'),
(16,'Quin','Everysome','793-639-5527','work'),
(21,'Landon','Tyler','536-842-1970','mobile'),
(22,'Freddy','Gallus','190-736-9451','work'),
(28,'Kelly','Monka','683-216-0304','mobile'),
(29,'Kyle','Mandon','705-211-5122','home');

INSERT INTO instrument (id,instrument_type) VALUES
(1,'Piano'),
(2,'Trumpet'),
(3,'French Horn'),
(4,'Saxophone'),
(5,'Cello'),
(6,'Flute'),
(7,'Mandolin'),
(8,'Harp'),
(9,'Bagpipes'),
(10,'Violin'),
(11,'Guitar'),
(12,'Drums'),
(13,'Tuba'),
(14,'Banjo'),
(15,'Marimba');

INSERT INTO tutor (id,fname,lname,dob,gender,joined_date,left_date) VALUES
(1,'Jacintha','Barns','1999-10-27','Female','2019-04-22',NULL),
(2,'Vania','Lilford','1958-09-24','Female','2011-03-12',NULL),
(3,'Edwina','Knight','1964-09-17','Female','2012-09-12',NULL),
(4,'Kahlil','Chirm','1957-12-22','Male','2000-03-12',NULL),
(5,'Kalinda','Sterland','1971-11-22','Female','2001-07-15',NULL),
(6,'Osmond','Pontain','2000-04-11','Male','2020-03-12',NULL),
(7,'Tressa','Porteous','1979-11-10','Non-binary','1999-07-12',NULL),
(8,'Romonda','Blow','1968-10-19','Female','1998-03-12',NULL),
(9,'Dulcy','Pasfield','1978-07-16','Female','2005-12-11',NULL),
(10,'Leena','Scough','1982-09-17','Genderfluid','2018-05-12',NULL),
(11,'Barry','Allen','2000-12-20','Male','2020-06-12','2022-07-26'),
(12,'Mark','Penson','1995-03-12','Genderfluid','2018-08-22','2019-07-16'),
(13,'Daniel','Wise','1980-07-25','Non-binary','2006-05-18','2011-07-06'),
(14,'Mary','Allen','1987-02-19','Female','2013-06-12','2017-07-06'),
(15,'Katie','Wilson','1976-09-11','Female','1999-03-12','2011-07-06');

INSERT INTO tutor_instrument (tutor_id,instrument_type) VALUES
(1,'Piano'),
(2,'Trumpet'),
(3,'French Horn'),
(4,'Saxophone'),
(5,'Cello'),
(6,'Piano'),
(7,'Mandolin'),
(8,'Harp'),
(9,'French Horn'),
(10,'Saxophone'),
(1,'Flute'),
(3,'Bagpipes'),
(4,'Banjo'),
(6,'Violin'),
(7,'Guitar'),
(8,'Harp'),
(4,'Drums'),
(9,'Tuba'),
(10,'Saxophone');

INSERT INTO tutor_phone (tutor_id,phone,type) VALUES
(1,'215-512-8613', 'mobile'),
(2, '502-252-6137', 'home'),
(3, '505-300-5320', 'home'),
(4, '219-524-4091', 'mobile'),
(5, '315-354-2698', 'home'),
(6, '505-674-4104', 'mobile'),
(7, '323-566-3739', 'work'),
(8, '304-645-3986', 'work'),
(9, '424-509-3389', 'mobile'),
(10,'202-859-5502', 'mobile'),
(11,'215-512-8613', 'mobile'),
(12, '502-252-6137', 'home'),
(13, '505-300-5320', 'home'),
(14, '219-524-4091', 'mobile'),
(15, '315-354-2698', 'home');


INSERT INTO lesson (id,instrument_type,length,days_taught) VALUES
(1, 'Piano', '00:30:00', 'Monday' ),
(2, 'Trumpet', '00:50:00', 'Thursday'),
(3, 'French Horn', '00:40:00', 'Tuesday'),
(4, 'Saxophone', '01:10:00', 'Monday'),
(5, 'Cello', '00:20:00', 'Friday'),
(6, 'Piano', '00:50:00', 'Tuesday'),
(7, 'Mandolin', '01:20:00', 'Wednesday'),
(8, 'Harp', '00:53:00', 'Friday'),
(9, 'French Horn', '00:30:00', 'Monday'),
(10, 'Saxophone', '00:50:00', 'Thursday'),
(11, 'Flute', '00:45:00', 'Tuesday' ),
(12, 'Bagpipes', '00:30:00', 'Monday' ),
(13, 'Banjo', '00:50:00', 'Sunday'),
(14, 'Violin', '00:40:00', 'Saturday'),
(15, 'Guitar', '01:10:00', 'Monday'),
(16, 'Harp', '00:20:00', 'Friday'),
(17, 'Drums', '00:50:00', 'Thursday'),
(18, 'Tuba', '01:20:00', 'Monday'),
(19, 'Saxophone', '00:53:00', 'Wednesday');

INSERT INTO tutor_lesson (tutor_id, lesson_id ,type) VALUES
(1,1,'In Person'),
(2,2,'In Person'),
(3,3,'In Person'),
(4,4,'In Person'),
(5,5,'In Person'),
(6,6,'Zoom'),
(7,7,'In Person'),
(8,8,'In Person'),
(9,9,'In Person'),
(10,10,'In Person'),
(1,11,'In Person'),
(3,12,'In Person'),
(4,13,'In Person'),
(6,14,'In Person'),
(7,15,'In Person'),
(8,16,'Hybrid'),
(4,17,'In Person'),
(9,18,'In Person'),
(10,19,'In Person');

INSERT INTO lesson_location (id,location) VALUES
(1,'Rm 201'),
(2,'Park'),
(3,'Auditorium'),
(4,'Rm 109'),
(5,'Rm 405'),
(6,'Rm 200'),
(7,'Rm 031'),
(8,'Rm 002'),
(9,'Rm 323'),
(10,'Rm 211'),
(11,'Home'),
(12,'Zoom'),
(13,'Church'),
(14,'School'),
(15,'Recording Studio');

INSERT INTO instrument_details (instrument_id,student_id,method,cost,time_begin,time_end,home_stay) VALUES
(1, 1, 'Rent', 28, '08:00:00', '11:20:00', True),
(2, 2, 'Rent', 60, '07:00:00', '11:00:00', False),
(3, 3, 'Rent', 20, '02:45:00', '9:54:00', True),
(4, 4, 'Rent', 90, '08:00:00', '10:00:00', False),
(5, 5, 'Rent', 67, '04:00:00', '07:00:00', True),
(6, 1, 'Rent', 23, '08:20:00', '13:11:00', False),
(7, 7, 'Rent', 32, '08:30:00', '08:00:00', False),
(8, 8, 'Rent', 89, '11:00:00', '15:20:00', True),
(9, 3, 'Rent', 100, '08:00:00', '16:50:00', True),
(10, 4, 'Purchase', 230, NULL, NULL, True),
(10, 15, 'Rent', 54, '01:58:00', '08:00:00', True),
(1, 16, 'Rent', NULL, '08:00:00', NULL, True),
(5, 20, 'Purchase', 467, NULL, NULL, True),
(10, 30, 'Rent', 54, '06:58:00', '08:00:00', True),
(15, 20, 'Rent', 167, '06:58:00', '27:00:00', FALSE);

INSERT INTO payment_details (tutor_id,student_id,lesson_id,method,cost) VALUES
(1, 1, 1, 'Check', 100),
(2, 2, 2, 'Credit', 120),
(3, 3, 3, 'Credit', 60),
(4, 4, 4, 'Credit', 80),
(5, 5, 5, 'Check', 26),
(6, 6, 6, 'Cash', 56),
(7, 7, 7, 'Credit', 117),
(8, 8, 8, 'Credit', 113),
(9, 9, 9, 'Credit', 145),
(10, 10, 10, 'Credit', 56),
(8, 11, 11, 'Credit', 78),
(7, 12, 1, 'Cash', 24),
(3, 13, 3, 'Credit', 98),
(4, 14, 4, 'Cash', 356),
(1, 15, 5, 'Credit', 115),
(1, 16, 1, 'Check', 90),
(2, 17, 2, 'Credit', 134),
(3, 18, 3, 'Credit', 45),
(4, 19, 4, 'Credit', 67),
(5, 20, 5, 'Check', 62),
(6, 21, 6, 'Cash', 76),
(7, 22, 7, 'Credit', 233),
(8, 23, 8, 'Credit', 313),
(9, 24, 9, 'Credit', 190),
(10, 25, 10, 'Credit', 156),
(8, 26, 11, 'Credit', 76),
(7, 27, 1, 'Cash', 43),
(3, 28, 3, 'Credit', 45),
(4, 29, 4, 'Cash', 34),
(1, 30, 5, 'Credit', 454),
(6, 1, 6, 'Check', 76),
(9, 4, 7, 'Credit', 25),
(8, 7, 8, 'Check', 11),
(1, 9, 9, 'Credit', 167);


INSERT INTO location_details (lesson_id, location_id,atTheStore,time_begin,time_end,cost) VALUES
(1, 2, False, '03:00:00', '03:30:00',30),
(2, 8, True, '04:00:00', '04:50:00',50),
(3, 10, True, '10:10:00', '11:00:00',50),
(4, 1, True, '07:00:00', '09:00:00',67),
(5, 3, False, '08:00:00', '11:00:00',245),
(6, 12, True, '09:00:00', '11:00:00',140),
(7, 4, True, '08:00:00', '12:00:00',98),
(8, 5, True, '05:00:00', '08:00:00',56),
(9, 8, True, '05:30:00', '11:00:00',45),
(10, 7, True, '04:00:00', '11:00:00',87),
(11, 10, True, '04:00:00', '11:00:00',110),
(12, 9, True, '11:00:00', '11:30:00',37),
(13, 9, True, '04:00:00', '07:00:00',84),
(14, 10, True, '08:20:00', '11:00:00',68),
(15, 1, True, '04:00:00', '11:00:00',76),
(16, 7, True, '12:30:00', '01:00:00',104),
(17, 6, True, '04:00:00', '12:00:00',100),
(18, 8, True, '09:20:00', '11:00:00',84),
(19, 11, False, '11:00:00', '12:00:00',60);