CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(50)
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(50)
);

CREATE TABLE vehicle(
    serial_number VARCHAR(20) PRIMARY KEY,
    color VARCHAR(20),
    model VARCHAR(20),
    make VARCHAR(20),
    model_year VARCHAR(5)
);

CREATE TABLE vehicle_invoice(
    invoice_id SERIAL PRIMARY KEY,
    serial_number VARCHAR(20) REFERENCES vehicle(serial_number),
    price INT,
    paid BOOLEAN,
    customer_id INT REFERENCES customer(customer_id),
    salesperson_id INT REFERENCES salesperson(salesperson_id)
);

CREATE TABLE service_record(
    record_id SERIAL PRIMARY KEY,
    service_done TEXT [],
    service_date DATE,
    invoice_id INTEGER REFERENCES vehicle_invoice(invoice_id),
    mechanic_id INTEGER REFERENCES mechanic(mechanic_id),
    serial_number VARCHAR(20) REFERENCES vehicle(serial_number)
);

CREATE TABLE ticket (
    ticket_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    service_requested TEXT [],
    service_date DATE,
    serial_number VARCHAR(20) REFERENCES vehicle(serial_number)
);
