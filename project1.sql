drop schema dbmsproject cascade;
create schema dbmsproject;
SET search_path TO dbmsproject;
begin;
create table model(
	model_number varchar(5) primary key check( length(model_number)=5 ),
	vehicle_type varchar(20) not null,
	company varchar(50) not null,
	model_name varchar(50) not null,
	fuel_type varchar(20) not null,
	weight numeric(7,2)
	
);

create table safety(
	model_number varchar(5) primary key check( length(model_number)=5 ),
	safety_feature varchar(20) not null,
	foreign key (model_number) references model(model_number)
	on update cascade on delete cascade
);

create table vehicle(
	vehicle_id varchar(10) primary key check( length(vehicle_id)=10 ),
	model_number varchar(5) default 1 not null check( length(model_number)=5 ),
	foreign key (model_number) references model(model_number)
	on update set default on delete set default
);


create table cause(
	cause_id varchar(3) primary key,
	cause_category varchar(50) not null,
	cause varchar(50) not null
);

create table region(
	region_id serial primary key,
	pincode int unique,
	localities varchar(50) not null,
	taluka varchar(100) not null,
	district varchar(50) not null
);

create table case_info(
	case_id serial primary key,
	time_of_accident timestamp,
	cause_id varchar(3) not null default 1,
	region_id int not null default 1,
	foreign key (cause_id) references cause(cause_id) 
	on update set default on delete set default,
	foreign key (region_id) references region(region_id)
	on update set default on delete set default
);


create table Victim(
 	Adhaar_Number int,
 	First_Name varchar(50) not null,
 	Last_Name varchar(50) not null,
 	is_alive boolean,
 	Date_Of_Birth date not null,
 	vehicle_id  varchar(10) check (LENGTH(vehicle_id)=10),
 	Victim_Category varchar(20),
	Case_id int,
	primary key (case_id,Adhaar_Number),
	Foreign key (vehicle_id) references vehicle(vehicle_id) 
	on update set default on delete set default,
	Foreign key (case_id) references case_info(case_id)
	on update cascade on delete cascade
);
commit;



-- vehicle entry



set search_path to dbmsproject;

begin;

insert into model(vehicle_type,company,model_name,fuel_type,weight)
values('deleted/updated','deleted/updated','deleted/updated','-',0.00), 
	  ('AMW','Truck','2518TP','Diesel',7500.00),
	  ('AMW','Truck','1618TP','Diesel',7800.00),
	  ('Ashok Layland','Truck','4940 Euro 6','Diesel',8200.00),
	  ('Bajaj','Bike','Pulsar NS200','Petrol',520.00),
	  ('Bajaj','Bike','Pulsar 220F','Petrol',155),
	  ('Bajaj','Bike','Pulsar 150','Petrol',144),
('BharatBenz','Truck','1617R','Diesel',7200),
('BharatBenz','Truck','2528','Diesel',7500),
('BharatBenz','Truck','3123R','Diesel',7600),
('Datsun','MPV','GO PLUS','Petrol',882),
('Ford','Hatchback','Figo FACELIFT','Petrol',900),
('Ford','SUV','EcoSport TITANIUM','Diesel',1285),
('Ford','SUV','EcoSport TREND','Diesel',1305),
('Ford','Hatchback','Ford TITANIUM','Petrol',1700),
('Ford','SUV','EcoSport TITANIUM','Petrol',1285),
('Hero','Bike','Splendor Plus','Petrol',111),
('Hero','Scooter','Hero Duet','Petrol',116),
('Honda','Sedan','Amaze S CVT','Petrol',950),
('Honda','Sedan','Amaze i-VTEC','Petrol',945),
('Honda','Sedan','City VX','Petrol',1175),
('Honda','Sedan','City ZX','Diesel',1175),
('Honda','Bike','CB Shine','Petrol',118),
('Honda','Scooter','Activa 5G','Petrol',109),
('Hyundai','Hatchback','i20 Active S','Diesel',910),
('Hyundai','Hatchback','i20 Active SX','Diesel',905),
('Hyundai','Hatchback','i20 Active SX','Petrol',905),
('Hyundai','Hatchback','Grand i10 MAGNA','Petrol',850),
('Hyundai','Hatchback','Grand i10 KAPPA','Petrol',925),
('Hyundai','Hatchback','Grand i10 SPORTZ','Petrol',855),
('Hyundai','SUV','Creta E','Petrol',1298),
('Hyundai','SUV','Creta SX','Diesel',1295),
('Isuzu','Pickup','D-Max','Diesel',1905),
('KTM','Bike','200 Duke','Petrol',134),
('Mahindra','SUV','Scorpio S9','Diesel',1515),
('Mahindra','SUV','Scorpio S5','Petrol',1520),
('Mahindra','SUV','Thar DI4X4','Diesel',1690),
('Mahindra','Hatchback','e20 Plus NXT','Electric',935),
('Mahindra','SUV','XUV300 W6','Diesel',1550),
('Mahindra','Pickup','Bolero Pick-Up','Diesel',1710),
('Mahindra','Pickup','Supro','Petrol',1795),
('Mahindra','Pickup','Bolero Camper','Diesel',1825),
('Maruti','Hatchback','Wagon R VXI','Petrol',825),
('Maruti','Hatchback','Alto K10','Petrol',764),
('Maruti','MPV','Ertiga LXI','Petrol',1343),
('Maruti','Hatchback','Wagon R LXI','Petrol',820),
('Maruti','Hatchback','Baleno RS','Diesel',950),
('Maruti','Hatchback','Alto K10','Petrol',760),
('Maruti','MPV','Ertiga VXI','Diesel',1329),
('Maruti','Hatchback','Wagon R LXI','Petrol',820),
('Maruti','Sedan','Swift Dezire VXI','Petrol',925),
('Maruti','Hatchback','Baleno RS','Petrol',886),
('Maruti','Hatchback','Alto 800','Diesel',695),
('Maruti','Sedan','Swift LXI','Petrol',865),
('Nissan','Sedan','Sunny XE','Petrol',1350),
('Nissan','Sedan','Sunny XV','Petrol',1390),
('Nissan','SUV','Terrano XL','Diesel',1316),
('Renault','SUV','Duster RXS CVT','Diesel',1168),
('Renault','SUV','Duster RXS','Diesel',1165),
('Renault','Hatchback','Kwid STD','Petrol',665),
('Royal Enfield','Bike','Classic 350','Petrol',193),
('Suzuki','Bike','Intruder','Petrol',148),
('Tata','Hatchback','Nano XT634','Petrol',590),
('Tata','Sedan','Zest XE','Petrol',880),
('Tata','Sedan','Zest XMS','Petrol',901),
('Tata','SUV','Safari Storme LX','Diesel',1920),
('Tata','Pickup','207 RX','Diesel',1910),
('Tata','Pickup','Xenon','Petrol',1905),
('Toyota','MPV','Innova Crysta ZX AT','Petrol',1525),
('Toyota','SUV','Fortuner 2.8 MT','Diesel',2100),
('Toyota','SUV','Fortuner 2.8 AT','Diesel',2098),
('TVS','Bike','Apache RTR 160 4V','Petrol',137),
('TVS','Scooter','Jupiter','Petrol',108),
('Volkswagen','Hatchback','Polo TDI','Diesel',1120),
('Volkswagen','Hatchback','Polo GT','Diesel',1175);

commit;