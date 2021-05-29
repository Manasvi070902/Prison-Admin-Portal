REATE TABLE Admin(
	Admin_id int(11) not null AUTO_INCREMENT PRIMARY KEY,
    Admin_uname tinytext not null,
    Admin_pwd longtext not null,
    First_name varchar(25) not null,
    Last_name varchar(25) not null
);
CREATE TABLE Jailor(
	Jailor_id int(11) not null AUTO_INCREMENT PRIMARY KEY,
    Jailor_uname tinytext not null,
    Jailor_pwd longtext not null,
    First_name varchar(25) not null,
    Last_name varchar(25) not null
);

CREATE TABLE Jailor_phone(
	Jailor_phone varchar(10) not null,
    Jailor_id int(11) not null
);

CREATE TABLE Deleted_jailors(
	Jailor_id int(11) not null PRIMARY KEY,
    Jailor_uname tinytext not null,
    Jailor_pwd longtext not null,
    First_name varchar(25) not null,
    Last_name varchar(25) not null
);
CREATE TABLE Officer(
	Officer_id int(11) not null AUTO_INCREMENT PRIMARY KEY,
    Officer_uname tinytext not null,
    Officer_pwd longtext not null,
    First_name varchar(25) not null,
    Last_name varchar(25) not null,
    Title varchar(25) not null,
    Date_of_birth date not null
);
CREATE TABLE Officer_phone(
	Officer_phone varchar(10) not null,
    Officer_id int(11)  not null    
);
CREATE TABLE Prisoner(
	Prisoner_id int(11) AUTO_INCREMENT not null primary key,
    First_name varchar(25) not null,
    Last_name varchar(25) not null,
    Date_in date not null,
    Dob date not null,
    Height int(3) not null,
    Date_out date not null,
    Address longtext not null,
    Section_id int(3) not null,
    Status_inout varchar(3) not null
);

CREATE TABLE Section (
	Section_id int(3) AUTO_INCREMENT not null PRIMARY KEY,
    Section_name varchar(25) not null,
    Jailor_id int(11) not null
);
CREATE TABLE Crime(
	IPC int(11) PRIMARY KEY not null,
    Description longtext,
);
CREATE TABLE Commits (
	IPC int(11) NOT NULL,
    Prisoner_id int(11) NOT NULL
);
CREATE TABLE Visitor(
    	Aadhaar varchar(12) PRIMARY KEY not null,
	First_name varchar(25) not null,
    	Last_name varchar(25) not null
);
CREATE TABLE Visit(
	Visitor_aadhaar varchar(12) not null,
	Date_visit DATE not null,
	Time_slot varchar(25) not null,
	Prisoner_id int(11) not null,
	CONSTRAINT `fk_prisoner` FOREIGN KEY (Prisoner_id) REFERENCES Prisoner (Prisoner_id),
	CONSTRAINT `fk_visitor` FOREIGN KEY (Visitor_aadhaar) REFERENCES Visitor (Aadhaar)
);

INSERT INTO Officer (Officer_uname,Officer_pwd,First_name,Last_name,Title,Date_of_birth) VALUES ('officer1','officer1','Shaun','Brown','Inspector','1960-01-12');
INSERT INTO Officer_phone (Officer_phone,Officer_id) VALUES(9988776655,1);

INSERT INTO Jailor(Jailor_uname,Jailor_pwd,First_name,Last_name) VALUES ('jailor1','jailor1','Steve','Quay');
INSERT INTO Section(Section_id,Section_name,Jailor_id) VALUES ('111','A',1);
INSERT INTO Jailor_phone(Jailor_phone,Jailor_id) VALUES(8876171369,1);

INSERT INTO Jailor(Jailor_uname,Jailor_pwd,First_name,Last_name) VALUES ('jailor2','jailor2','Marcus','Quay');
INSERT INTO Section(Section_id,Section_name,Jailor_id) VALUES ('222','B',2);
INSERT INTO Jailor_phone(Jailor_phone,Jailor_id) VALUES(6559892327,2);

INSERT INTO Jailor(Jailor_uname,Jailor_pwd,First_name,Last_name) VALUES ('jailor3','jailor3','Jim','Smith');
INSERT INTO Section(Section_id,Section_name,Jailor_id) VALUES ('333','C',3);
INSERT INTO Jailor_phone(Jailor_phone,Jailor_id) VALUES(3893906914,3);

INSERT INTO Jailor(Jailor_uname,Jailor_pwd,First_name,Last_name) VALUES ('jailor4','jailor4','Cory','Roy');
INSERT INTO Section(Section_id,Section_name,Jailor_id) VALUES ('444','D',4);
INSERT INTO Jailor_phone(Jailor_phone,Jailor_id) VALUES(7473154442,4);

INSERT INTO Jailor(Jailor_uname,Jailor_pwd,First_name,Last_name) VALUES ('jailor5','jailor5','Rob','Cole');
INSERT INTO Section(Section_id,Section_name,Jailor_id) VALUES ('555','E',5);
INSERT INTO Jailor_phone(Jailor_phone,Jailor_id) VALUES(8251538586,5);



ALTER TABLE Commits ADD CONSTRAINT fk_1 FOREIGN KEY (IPC) REFERENCES Crime(IPC);

ALTER TABLE Commits ADD CONSTRAINT fk_2 FOREIGN KEY (Prisoner_id) REFERENCES Prisoner(Prisoner_id);
ALTER TABLE Prisoner ADD CONSTRAINT fk_3 FOREIGN KEY (Section_id) REFERENCES Section(Section_id);

ALTER TABLE Section ADD CONSTRAINT fk_4 FOREIGN KEY (Jailor_id) REFERENCES Jailor(Jailor_id) ON DELETE CASCADE;

ALTER TABLE Visitor ADD CONSTRAINT fk_5 FOREIGN KEY (Prisoner_id) REFERENCES Prisoner(Prisoner_id);
ALTER TABLE Officer_phone ADD CONSTRAINT fk_6 FOREIGN KEY (Officer_id) REFERENCES Officer(Officer_id);

ALTER TABLE Jailor_phone ADD CONSTRAINT fk_7 FOREIGN KEY (Jailor_id) REFERENCES Jailor(Jailor_id) ON DELETE CASCADE;
ALTER TABLE Commits ADD CONSTRAINT mul_pk PRIMARY KEY (IPC,Prisoner_id);

CREATE UNIQUE INDEX VISITOR_DUPL_INDEX ON Visit (Date_visit,Time_slot,Visitor_aadhaar);
CREATE UNIQUE INDEX PRISONER_DUPL_INDEX ON Visit (Date_visit,Time_slot,Prisoner_id);
CREATE UNIQUE INDEX PRISONER_ONE_DAY_LIMIT ON Visit (Date_visit,Prisoner_id);
CREATE UNIQUE INDEX VISITOR_ONE_DAY_LIMIT ON Visit (Date_visit,Visitor_aadhaar);