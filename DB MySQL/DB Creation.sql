CREATE DATABASE cr09_ruben_petrisie_delivery
DEFAULT CHARACTER SET utf8;

CREATE TABLE c_address(
c_address_id INT NOT NULL,
street VARCHAR (50) NOT NULL,
zip VARCHAR (50) NOT NULL,
city VARCHAR (50),
PRIMARY KEY (c_address_id)  
);

CREATE TABLE customer(
customer_id INT NOT NULL,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
PRIMARY KEY (customer_id),
);

ALTER TABLE customer
ADD CONSTRAINT fk_c_address
FOREIGN KEY(fk_c_address)
REFERENCES c_address (c_address_id)
ON UPDATE CASCADE;

CREATE TABLE packages(
package_id INT NOT NULL,
package_weight FLOAT,
package_cost FLOAT,
fk_customer_id INT,
PRIMARY KEY (package_id)
);

ALTER TABLE packages
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (fk_customer_id) REFERENCES customer (customer_id)
ON UPDATE CASCADE;

CREATE TABLE ds_hours(
ds_hours INT NOT NULL,
open_hrs TIME,
close_hrs TIME,
PRIMARY KEY (ds_hours)  
);

CREATE TABLE drop_station(
drop_station_id INT NOT NULL,
ds_address VARCHAR (50),
package_id INT,
customer_id INT,
fk_ds_hours INT,
PRIMARY KEY(drop_station_id), 
FOREIGN KEY (fk_ds_hours) REFERENCES ds_hours (ds_hours)
);    

ALTER TABLE drop_station
ADD CONSTRAINT fk_package_id
FOREIGN KEY (fk_package_id) REFERENCES packages (packages_id)
ON UPDATE CASCADE;

CREATE TABLE mds(
mds_id INT NOT NULL,
mds_address VARCHAR(50),
mds_holidays DATETIME,
fk_employee INT,
package_id INT,
PRIMARY KEY (mds_id)
);

CREATE TABLE employee(
employee_id INT NOT NULL,
first_name VARCHAR(50),
last_name VARCHAR(50),
package_id INT,
fk_mds INT,
PRIMARY KEY(employee_id)
);

ALTER TABLE mds
ADD CONSTRAINT fk_employee
FOREIGN KEY (fk_employee) REFERENCES employee (employee_id)
ON UPDATE CASCADE;

CREATE TABLE process_status(
process_status_id INT NOT NULL,
received VARCHAR(50),
on_hold VARCHAR(50),
send VARCHAR(50),
package_id INT,
PRIMARY KEY(process_status_id)
);

CREATE TABLE process(
process_id INT NOT NULL,
process_st_date DATE,
process_end_date DATE,
fk_process_status INT,
package_id INT,
PRIMARY KEY(process_id)
);

ALTER TABLE process
ADD CONSTRAINT fk_process_staus
FOREIGN KEY (fk_process_staus) REFERENCES process_status (process_status_id)
ON UPDATE CASCADE;

CREATE TABLE recipient_status(
recipient_status_id INT NOT NULL,
received_date DATE,
received_time TIME,
package_id INT,
PRIMARY KEY(recipient_status_id)
);

CREATE TABLE recipient(
r_id INT NOT NULL,
r_fname VARCHAR(50),
r_lname VARCHAR(50),
fk_recipient_status INT,
package_id INT,
fk_process INT,
PRIMARY KEY(r_id)
);