INSERT INTO salesperson (first_name, last_name)
VALUES ('sean', 'currie'),
       ('william', 'currie');

SELECT * FROM salesperson;

INSERT INTO mechanic(first_name, last_name)
VALUES ('arnett', 'mcmurray'),
       ('rob', 'yoshimura');

SELECT * from mechanic;

INSERT INTO customer(first_name, last_name, address)
VALUES ('michael', 'jordan', '2323 All State Arena'),
       ('harry', 'carey', '1928 N Clark St');

SELECT * from customer;

INSERT INTO vehicle(serial_number, color, make, model, model_year) 
VALUES('3D4GG47B09T153263', 'RED', 'HONDA', 'DELSOL', '1994'),
      ('5NPEB4AC8DH617686', 'SILVER', 'AUDI', 'SCLASS', '1981');

SELECT * from vehicle;

INSERT INTO service_ticket(customer_id, service_requested, service_date, serial_number)
VALUES(1, ARRAY ['brakes'], '2021-12-20', '3D4GG47B09T153263'),
      (2, ARRAY ['oil change', 'low tire'], '2021-12-07', '5NPEB4AC8DH617686')

SELECT * FROM ticket;

INSERT INTO vehicle_invoice(serial_number, price, paid, customer_id)
VALUES('3D4GG47B09T153263', 100, TRUE, 1 ),
      ('5NPEB4AC8DH617686', 2000, TRUE, 2 );

SELECT * FROM invoice;

INSERT INTO service_record(service_done, service_date, invoice_id, mechanic_id, serial_number)
VALUES(ARRAY ['Tie Rods', 'Oil Change', 'Tire Check'], '2021-12-20', 3, 1, '3D4GG47B09T153263'),
      (ARRAY ['Oil Change', 'Head Gasket', 'Oil Pump Gasket'], '2021-12-09', 4, 2, '5NPEB4AC8DH617686');

SELECT * FROM record;