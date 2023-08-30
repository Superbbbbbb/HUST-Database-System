use flight_booking;

create table if not exists user(
    user_id int primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    dob date not null,
    sex char(1) not null,
    email varchar(50),
    phone varchar(30),
    username varchar(20) not null unique,
    password char(32) not null,
    admin_tag tinyint not null default 0
);

create table if not exists passenger(
    passenger_id int primary key auto_increment,
    id char(18) not null unique,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    mail varchar(50),
    phone varchar(20) not null,
    sex char(1) not null,
    dob date
);

create table if not exists airport(
    airport_id int primary key auto_increment,
    iata char(3) not null unique,
    icao char(4) not null unique,
    name varchar(50) not null,
    city varchar(50),
    country varchar(50),
    latitude decimal(11,8),
    longitude decimal(11,8)
);

create table if not exists airline(
    airline_id int primary key auto_increment,
    airport_id int not null,
    name varchar(30) not null,
    iata char(2) not null unique,
    CONSTRAINT fk1 FOREIGN KEY(airport_id) REFERENCES airport(airport_id)
);

create table if not exists airplane(
    airplane_id int primary key auto_increment,
    airline_id int not null,
    type varchar(50) not null,
    capacity smallint not null,
    identifier varchar(50) not null,
    CONSTRAINT fk2 FOREIGN KEY(airline_id) REFERENCES airline(airline_id)
);

create table if not exists flightschedule(
    flight_no char(8) primary key,
    airline_id int not null,
    departure time not null,
    arrival time not null,
    duration smallint not null,
    monday tinyint default 0,
    tuesday tinyint default 0,
    wednesday tinyint default 0,
    thursday tinyint default 0,
    friday tinyint default 0,
    saturday tinyint default 0,
    sunday tinyint default 0,
    `from` int not null,
    `to` int not null,
    CONSTRAINT fk11 FOREIGN KEY(`from`) REFERENCES airport(airport_id),
    CONSTRAINT fk12 FOREIGN KEY(`to`) REFERENCES airport(airport_id),
    CONSTRAINT fk13 FOREIGN KEY(airline_id) REFERENCES airline(airline_id)
);

create table if not exists flight(
    flight_id int primary key auto_increment,
    flight_no char(8) not null,
    airplane_id int not null,
    airline_id int not null,
    `from` int not null,
    `to` int not null,
    departure datetime not null,
    arrival datetime not null,
    duration smallint not null,
    CONSTRAINT fk3 FOREIGN KEY(airline_id) REFERENCES airline(airline_id),
    CONSTRAINT fk4 FOREIGN KEY(airplane_id) REFERENCES airplane(airplane_id),
    CONSTRAINT fk5 FOREIGN KEY(flight_no) REFERENCES flightschedule(flight_no),
    CONSTRAINT fk6 FOREIGN KEY(`from`) REFERENCES airport(airport_id),
    CONSTRAINT fk7 FOREIGN KEY(`to`) REFERENCES airport(airport_id)
);

create table if not exists ticket(
    ticket_id int primary key auto_increment,
    flight_id int not null,
    passenger_id int not null,
    user_id int not null,
    seat char(4),
    price decimal(10,2) not null,
    CONSTRAINT fk8 FOREIGN KEY(flight_id) REFERENCES flight(flight_id),
    CONSTRAINT fk9 FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id),
    CONSTRAINT fk10 FOREIGN KEY(user_id) REFERENCES user(user_id)
);
