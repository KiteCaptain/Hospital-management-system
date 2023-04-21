drop database if exists hospital;
CREATE DATABASE hospital;
    
USE hospital;
ALTER TABLE employee MODIFY eid INT AUTO_INCREMENT;

Create table Employee
(eid int primary key auto_increment,
ename varchar(30),
gender varchar(10),
dob datetime,
salary int,
address varchar(100),
phoneno varchar(15));

create table leaves
(leaveid int primary key,
l_eid int ,
fromdate datetime,
todate datetime,
FOREIGN KEY (l_eid) REFERENCES Employee(eid)
);

create table Nurse
(n_eid int primary key,
 patientcount int,
 FOREIGN KEY (n_eid) REFERENCES Employee(eid));

create table Wards
 (room_id int primary key,
 floor_num int);

create table Patient
(pid int PRIMARY key,
 pname varchar(25),
gender varchar(15),
dob datetime,
age int);

create table Outpatient
(o_pid int primary key,
 appt_num int,
 disease varchar(50),
 appt_date datetime,
 FOREIGN KEY (o_pid) REFERENCES Patient(pid));

create table inpatient
 (i_pid int PRIMARY KEY,
 disease varchar(20),
 admitted_date datetime,
 discharge_date datetime,
 FOREIGN KEY (i_pid) REFERENCES Patient(pid));

create table Guardian
(g_pid int,
name varchar(30),
realtionship varchar(10),
mobilenumber int,
FOREIGN KEY (g_pid) REFERENCES inpatient(i_pid));

create table Receptionist
(r_eid int primary key,
desknumber int,
 FOREIGN KEY (r_eid) REFERENCES Employee(eid));

-- drop table if  exists hospital.register;
create table Register 
(r_id int primary key ,
r_eid int,
pid int,
appointment_no int,
r_description varchar (20),
r_date datetime);

create table Doctor
(d_eid int primary key,
specialisation varchar(10),
FOREIGN KEY (d_eid) REFERENCES Employee(eid));

Create table Surgeon
(s_eid int primary key,
degree varchar(15),
department varchar(10),
FOREIGN KEY (s_eid) REFERENCES Employee(eid));

create table Internist
(i_eid int primary key,
degree varchar(15),
FOREIGN KEY (i_eid) REFERENCES Employee(eid));
create table Driver
(d_eid int primary key,
vehicleno varchar(10),
shiftno int,
licenseno varchar(15),
FOREIGN KEY (d_eid) REFERENCES Employee(eid));
create table Ambulance 
(vehicleno varchar(10) PRIMARY key,
d_eid int,
rcnumber varchar(15),
FOREIGN KEY (d_eid) REFERENCES Employee(eid));
create table Generalward
 (p_pid int Primary key,
 g_roomid int,
 patient_count int,
 FOREIGN KEY (g_roomid) REFERENCES Wards(room_id));
 
 create table ICU
 (p_pid int Primary key,
 i_roomid int,
 patient_count int,
 Equipment varchar(150),
 FOREIGN KEY (i_roomid) REFERENCES Wards(room_id));
 
 create table Mortuary
 (m_roomid int primary key,
m_pid int,
 date_of_death datetime,
 reason varchar(30),
 FOREIGN KEY (m_roomid) REFERENCES Wards(room_id),
 FOREIGN KEY (m_pid) REFERENCES inpatient(i_pid));
 
 create table Pharmaceuticals
 (med_id int primary key,
 p_pid int,
 expirydate datetime,
 medicinename varchar(20),
 ph_date datetime,
 FOREIGN KEY (p_pid) REFERENCES Patient(pid));
 
 create table Diagnostics
 (testid int primary key,
 d_pid int ,
 testname varchar(20),
 testdate datetime,
 results varchar(30),
 FOREIGN KEY (d_pid) REFERENCES Patient(pid));
 
 create table bills
 (billnum int Primary key,
b_pid int,
 cost int,
 paymentmode varchar(10),
 FOREIGN KEY (b_pid) REFERENCES Patient(pid));

-- Inserting data into the tables
insert into Wards
 (room_id,
 floor_num )
 values(1,4);
 
insert into Patient
(pid,pname,gender ,dob ,age)
values(1,'steve','male',DATE '1997-10-18',25);

insert into Outpatient
(o_pid ,appt_num ,disease ,appt_date)
 values(1,123,'cancer',DATE '2021-10-18');
 
 insert into inpatient
 (i_pid,
 disease,
 admitted_date ,
 discharge_date)
 values(1,'cancer',DATE '2021-10-18',DATE '2021-11-18');
 
insert into Guardian
(g_pid,
name ,
realtionship,
mobilenumber)
values(1,'harry','father',12345);

insert into Receptionist
(r_eid,
desknumber)
values(1,123);

insert into Register 
(r_id,
r_eid ,
appointment_no ,
r_description,
r_date)
values(1,1,123,'admit',DATE '2021-10-18');

insert into Doctor
(d_eid ,
specialisation)
values(1,'heart');

insert into Surgeon
(s_eid,
degree,
department)
values(1,'MBBS','heart');

insert into Internist
(i_eid,
degree)
values(1,'Degree');

insert into Driver
(d_eid ,
vehicleno ,
shiftno ,
licenseno )
values(1,'NRH1007',2,'a1s2d3');

insert into Ambulance 
(vehicleno ,
d_eid ,
rcnumber)
values('NRH1007',1,'asd123');

insert into generalward
 (p_pid,
 g_roomid,
 patient_count)
values(1,1,23);
 
 insert into ICU
 (p_pid,
 i_roomid ,
 patient_count ,
 Equipment)
 values(1,1,25,'heart');
 
insert into Mortuary
 (m_roomid,
m_pid ,
 date_of_death ,
 reason)
 values(1,1,DATE '2021-10-18','cancer');
 
 insert into Pharmaceuticals
 (med_id,
 p_pid ,
 expirydate ,
 medicinename ,
 ph_date)
 values(1,1,DATE '2024-10-18','aspirin',DATE '2021-10-18');
 
 insert into Diagnostics
 (testid,
 d_pid ,
 testname ,
 testdate ,
 results )
 values(1,1,'ecg',DATE '2021-10-18','positive');
 
 insert into bills
 (billnum,
b_pid,
 cost,
 paymentmode)
 values(1,1,150,'credit');
 
























