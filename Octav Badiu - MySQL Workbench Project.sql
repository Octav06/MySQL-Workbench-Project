create database Project;

use Project;

create table angajati (
id_angajat int not null auto_increment primary key,
nume varchar(20),
prenumele varchar(20),
data_nasterii date,
data_angajarii date,
data_plecarii date,
salariul int);

create table clienti(
id_client int not null auto_increment primary key,
nume varchar(20),
prenume varchar(20),
cnp varchar(20),
localitate varchar(20),
judet varchar(20));

create table datorii(
id_datorie int not null auto_increment primary key,
id_client int,
suma float,
data_scadenta date,
penalizari float,
foreign key (id_client) references Clienti(id_client));

create table rate(
id_rata int not null auto_increment primary key,
id_datorie int,
nr_rata int,
valoare float,
data_scadenta date,
rata_platita int,
foreign key(id_datorie) references Datorii(id_datorie));

create table tip_plata (
id_tip_plata int not null auto_increment primary key,
descriere varchar(50));

create table plati(
id_plata int not null auto_increment primary key,
id_rata int,
suma float,
data_platii date,
tip_plata int,
foreign key(id_rata) references rate(id_rata),
foreign key(tip_plata) references tip_plata(id_tip_plata));

create table tip_actiuni(
id_tip_actiune int not null auto_increment primary key,
descriere varchar(50));

create table actiuni (
id_actiune int not null auto_increment primary key,
id_angajat int,
id_client int,
data_actiune date,
id_tip_actiune int,
raspuns_primit varchar(100),
foreign key(id_angajat) references angajati(id_angajat),
foreign key(id_client) references clienti(id_client),
foreign key(id_tip_actiune) references tip_actiuni(id_tip_actiune));

show tables;
describe angajati;

insert into angajati values (1,'Chivu','Adrian','1990-10-27','2011-06-01',null,2400);

insert into angajati values (2,'Popescu','Alexandru','1985-08-16','2011-06-01','2012-09-10',1500),
(3,'Popescu','Vasile','1980-01-10','2011-06-01',null,2300),
(4,'Tom','Razvan','1979-02-12','2011-08-01','2013-01-15',1900),
(5,'Anghel','Adriana','1987-07-03','2011-08-01',null,2700),
(6,'Oprea','Dumitru','1991-06-18','2011-08-01',null,2000),
(7,'Vasilache','Alexandra','1960-05-01','2011-08-01',null,3500),
(8,'Mitea','Viorel','1963-04-18','2011-10-10','2012-09-01',2200),
(9,'Vlad','Cristina','1967-03-01','2012-04-01',null,3500),
(10,'Nicolae','Mariana','1984-09-22','2012-04-01',null,1850),
(11,'Neamtu','Sebastian','1981-12-21','2012-07-01','2014-04-10',1650),
(12,'Stanciu','Cezar','1982-09-17','2012-07-10','2013-09-01',1500),
(13,'Amariei','Cerassela','1974-05-14','2012-12-15',null,2150),
(14,'Mester','Ioan','1971-09-02','2013-03-10','2013-04-01',2300),
(15,'Stefan','Alexandru','1981-12-01','2013-03-10',null,3450),
(16,'Coman','Adelina','1984-01-24','2013-11-01',null,3200),
(17,'Iordache','Elena','1977-08-10','2014-03-10','2014-07-01',2200),
(18,'Radu','Robert','1990-04-15','2014-04-20',null,1950),
(19,'Mihai','Horia','1991-01-13','2014-05-01',null,1950),
(20,'Constantin','Rodica','1988-04-18','2014-06-15',null,1900);

insert into clienti values 
(1,'Trenchea','Daniel','1610727244229','Ploiesti','Prahova'),
(2,'Balaur','Catalin','1520203323941','Slatina','Olt'),
(3,'Radu','Florin','1560622520033','Giurgiu','Giurgiu'),
(4,'Chelariu','Octavian','1691227261471','Bucuresti','Bucuresti'),
(5,'Cucuteanu','Cristian','1430612120681','Calarasi','Calarasi'),
(6,'Pop','Gheorghe','1530507070025','Bucuresti','Bucuresti'),
(7,'Babiuc','Catalin','1661020264361','Targoviste','Dambovita'),
(8,'Regheni','Ionut','1610718341691','Ploiesti','Prahova'),
(9,'Filip','Valeriu','1740903321416','Bucuresti','Bucuresti'),
(10,'Balint','Tamas','1541223336045','Iasi','Iasi'),
(11,'Gulie','Petre','1740420312984','Otopeni','Ilfov'),
(12,'Tudor','Monica','2770405336043','Bucuresti','Bucuresti'),
(13,'Tudor','Mihaela','2781218205753','Targoviste','Dambovita'),
(14,'Trandafir','Carmen','2920304203821','Focsani','Vrancea'),
(15,'Cucu','Catalin','1840317203823','Buzau','Buzau');

insert into datorii values
(100,1,1274,'2013-12-31',53),
(101,7,1350,'2014-03-30',27),
(102,9,450,'2014-04-30',15),
(103,4,3210,'2014-02-28',85),
(104,1,250,'2014-01-10',20),
(105,2,457,'2013-12-15',89),
(106,3,9710,'2013-11-01',451),
(107,5,1700,'2014-05-15',35),
(108,8,6200,'2014-05-31',66),
(109,10,1100,'2014-06-30',0),
(110,14,1140,'2014-06-10',0),
(111,15,710,'2013-11-30',90),
(112,13,125,'2014-01-31',14),
(113,11,1350,'2014-03-30',65),
(114,12,1470,'2013-12-10',59);

insert into rate values
(500,103,1,823.75,'2014-04-30',1),
(501,103,2,823.75,'2014-05-31',0),
(502,103,3,823.75,'2014-06-30',0),
(503,103,4,823.75,'2017-07-31',0),
(504,107,1,216.87,'2014-06-20',1),
(505,107,2,216.87,'2014-07-20',1),
(506,107,3,216.87,'2014-08-20',0),
(507,107,4,216.87,'2014-09-20',0),
(508,107,5,216.88,'2014-10-20',0),
(509,107,6,216.88,'2014-11-20',0),
(510,107,7,216.88,'2014-12-20',0),
(511,107,8,216.88,'2015-01-20',0),
(512,111,1,150,'2014-01-25',1),
(513,111,2,150,'2014-02-25',1),
(514,111,3,150,'2014-03-25',1),
(515,111,4,150,'2014-04-25',1),
(516,111,5,150,'2014-05-25',0),
(517,111,6,50,'2014-06-25',0),
(518,104,1,50,'2014-06-01',1),
(519,104,2,50,'2014-07-01',1),
(520,104,3,50,'2014-08-01',0),
(521,104,4,50,'2014-09-01',0),
(522,104,5,35,'2014-10-01',0),
(523,104,6,35,'2014-11-01',0);

insert into tip_plata values 
(1000,'virament bancar'),
(1001,'cash la sediul companiei'),
(1002,'card la sediul companiei'),
(1003,'cash la domiciliul debitorului'),
(1004,'online, pe site-ul companiei');

insert into plati values
(1,512,150,'2014-01-23',1000),
(2,513,75,'2014-02-20',1002),
(3,513,75,'2014-08-28',1001),
(4,514,160,'2014-03-25',1004),
(5,515,140,'2014-04-20',1000),
(6,500,823.75,'2014-04-30',1004),
(7,518,50,'2014-05-31',1003),
(8,504,100,'2014-06-20',1000),
(9,504,116.87,'2014-06-30',1000),
(10,519,50,'2014-07-01',1001),
(11,505,220,'2014-07-21',1000);

insert into tip_actiuni values 
(1000,'vizita la domiciliul debitorului'),
(1001,'sunat debitor'),
(1002,'trimis e-mail'),
(1003,'trimis scrisoare'),
(1004,'vizita debitor la sediul companiei');

insert into actiuni values 
(1,18,4,'2014-06-01',1003,'scrisoare returnata'),
(2,17,2,'2014-06-10',1002,'primit raspuns'),
(3,5,7,'2014-06-20',1003,'scrisoare trimisa'),
(4,19,5,'2014-06-20',1002,'primit raspuns'),
(5,6,9,'2014-06-25',1003,'scrisoare trimisa'),
(6,5,7,'2014-06-25',1003,'scrisoare trimisa'),
(7,17,3,'2014-06-28',1001,'numar nealocat'),
(8,20,8,'2014-07-15',1000,'debitorul nu era acasa'),
(9,6,8,'2014-07-15',1001,'telefon inchis'),
(10,18,4,'2014-07-20',1000,'debitorul nu era acasa'),
(11,1,15,'2014-07-20',1001,'telefon inchis'),
(12,3,14,'2014-07-22',1000,'debitorul nu era acasa'),
(13,19,5,'2014-07-31',1004,'datorie nerecunoscuta'),
(14,1,15,'2014-07-31',1000,'debitorul nu era acasa');

select * from angajati;

select * from clienti;

select nume, prenume from clienti;

select * from actiuni;

select data_actiune, raspuns_primit from actiuni;