drop schema dbmsproject cascade;
create schema dbmsproject;
SET search_path TO dbmsproject;
begin;
create table model(
	model_number varchar(5) primary key check( length(model_number)=5 ),
	company varchar(50) not null,
	model_name varchar(50) not null,
	fuel_type varchar(20) not null,
	weight numeric(7,2)
	
);

create table safety(
	model_number varchar(5) check( length(model_number)=5 ),
	safety_feature varchar(20) not null,
	primary key(model_number,safety_feature),
	foreign key (model_number) references model(model_number)
	on update cascade on delete cascade
);

create table vehicle(
	vehicle_id varchar(10) primary key check( length(vehicle_id)=10 ),
	model_number varchar(5) default 'AAAAA' not null check( length(model_number)=5 ),
	vehicle_type varchar(20) not null,
	foreign key (model_number) references model(model_number)
	on update set default on delete set default
);


create table cause(
	cause_id varchar(5) primary key,
	cause_type varchar(50) not null,
	cause varchar(100) not null
);

create table region(
	region_id serial primary key,
	pincode int not null,
	localities varchar(50) not null
);

create table case_info(
	case_id serial primary key,
	time_of_accident timestamp,
	cause_id varchar(5) not null default 'NN',
	region_id int not null default 1,
	foreign key (cause_id) references cause(cause_id) 
	on update set default on delete set default,
	foreign key (region_id) references region(region_id)
	on update set default on delete set default
);

create table Aadhar_info(
	Aadhar_Number int,
 	First_Name varchar(50) not null,
 	Last_Name varchar(50),
	Date_Of_Birth date not null,
	primary key(Aadhar_Number)
);

create table Victim(
 	Aadhar_Number int default 0000000000,
	Case_id int,
	Victim_Category varchar(20),
 	is_alive boolean,
 	vehicle_id  varchar(10) check (LENGTH(vehicle_id)=10),
 	

	primary key (case_id,Aadhar_Number),
	Foreign key (vehicle_id) references vehicle(vehicle_id) 
	on update set default on delete set default,
	Foreign key (Aadhar_Number) references Aadhar_info(Aadhar_Number) 
	on update set default on delete set default,
	Foreign key (case_id) references case_info(case_id)
	on update cascade on delete cascade
);




commit;
