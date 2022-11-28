CREATE TABLE "Movie" (
  "ticket_id" SERIAL,
  "movie_id" INTEGER,
  "movie_dirctor" VARCHAR(50),
  "movie_duration" INTEGER,
  PRIMARY KEY ("movie_id")
);

CREATE TABLE "Employee" (
  "employee_id" SERIAL,
  "employee_first_name" VARCHAR(50),
  "employee_last_name" VARCHAR(50),
  "address" VARCHAR(100),
  "phone_number" VARCHAR(15),
  PRIMARY KEY ("employee_id")
);

CREATE TABLE "Ticket" (
  "ticket_id" SERIAL,
  "movie_id" INTEGER,
  "seat_number" INTEGER,
  "start_time" VARCHAR(100),
  "theater_id" INTEGER,
  "employee_id" INTEGER,
  "row_number" VARCHAR(1),
  PRIMARY KEY ("ticket_id"),
  FOREIGN KEY ("employee_id")
    REFERENCES "Employee"("employee_id")
     
);

CREATE TABLE "Theater" (
  "theater_id" SERIAL,
  "num_seats" INTEGER,
  PRIMARY KEY ("theater_id")
  
     
);

CREATE TABLE "Seat" (
  "ticket_id" SERIAL,
  "row_number" VARCHAR(50),
  "seat_number" INTEGER,
  "theater_id" INTEGER,
  "start_time" INTEGER,
  PRIMARY KEY ("seat_number")
 
);

CREATE TABLE "Concessions" (
  "employee_id" SERIAL,
  "conces_order_id" INTEGER,
  "order_amount" INTEGER,
  PRIMARY KEY ("conces_order_id")
);
                           
SELECT *
FROM Seat;