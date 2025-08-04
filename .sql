1.
create table Tour(
TID number(10) constraint TID_pk primary key,
TNAME varchar2(100),
TDESCRIPTION varchar2(100),
TCOST number(10),
TDURATION number(10)
)

2.
create table Hotel(
HID number(10) constraint HID_pk primary key,
HNAME varchar2(20),
HLOCATION varchar2(20),
HCONTACT_NO number(20),
HRATING number(10)
)

3.
create table Room(
RID varchar2(20) constraint RID_pk primary key,
RTYPE varchar2(20),
RCAPACITY number(10),
RCOST number(10),
HID number(10),
constraint HID_fk foreign key(HID) references Hotel(HID))

4.
create table Transport(
T_ID number(10) constraint T_ID_PK primary key,
T_TYPE varchar2(20),
T_CAPACITY number(10),
T_COST number(10),
T_PICKUPPOINT varchar2(20))

5.
create table Designation(
DID number(10) constraint DID1_pk primary key,
DTITLE varchar2(100),
DDPARTMENT varchar2(50),
DSALARY number(10),
DWORK_SCHEDULE varchar2(50)
)

6.
create table Employee(
EID number(10) constraint EID1_pk primary key,
EFIRST_NAME varchar2(20),
ELAST_NAME varchar2(20),
ESALARY number(10),
DID number(10),
constraint fk_DID1 foreign key(DID) references Designation(DID))


7.
create table Customer(
CID number(10) constraint CID_pk1 primary key,
CNAME varchar2(20),
Cphn_no number(10),
CEMAIL varchar2(50),
CADDRESS varchar2(20),
HID number(10),
T_ID number(10),
EID number(10),
constraint fk_HID foreign key(HID) references Hotel(HID),
constraint fk_T_ID_fk foreign key(T_ID) references Transport(T_ID),
constraint EID1_fk foreign key(EID) references Employee(EID))


8.
create table Review(
R_ID number(10) constraint R_ID_pk primary key,
R_Date date,
R_Rating number(10),
R_Comment varchar2(100),
CID number(10),
constraint fk_CID foreign key(CID) references Customer(CID))

9.
create table Destination(
D_ID number(10) constraint D_ID_pk primary key,
D_Name varchar2(50),
D_Description varchar2(100),
D_Location varchar2(50),
CID number(10),
constraint fk1_CID foreign key(CID) references Customer(CID))

10.
create table Tour_Destination(
TID number(10),
D_ID number(10),
constraint fk_TID foreign key(TID) references Tour(TID),
constraint fk_D_ID foreign key(D_ID) references Destination(D_ID))

11.
create table Booking(
BID number(10) constraint BID_pk primary key,
BDate date,
BAmount number(10),
BStatus varchar2(50),
TID number(10),
CID number(10),
constraint TID_fk foreign key(TID) references Tour(TID),
constraint CID_fk1 foreign key(CID) references Customer(CID))

12.
create table Payment(
PID number(10) constraint PID_pk1 primary key,
PMethod varchar2(50),
PDate date,
PAmount number(10),
PStatus varchar2(20),
BID number(10),
constraint fk_BID foreign key(BID) references Booking(BID))





