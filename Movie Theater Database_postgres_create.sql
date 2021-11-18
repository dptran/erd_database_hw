CREATE TABLE "public.Customers" (
	"id" serial,
	"first_name" VARCHAR(255) NOT NULL,
	"last_name" VARCHAR(255) NOT NULL,
	"created_at" DATETIME,
	"concession_id" integer NOT NULL,
	"ticket_id" VARCHAR(255) NOT NULL,
	CONSTRAINT "Customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tickets" (
	"id" serial,
	"customer_id" integer,
	"movie_id" integer NOT NULL,
	"price" FLOAT NOT NULL,
	CONSTRAINT "Tickets_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Concessions" (
	"id" serial,
	"name" VARCHAR(255),
	"created_at" DATETIME NOT NULL,
	"updated_at" DATETIME NOT NULL,
	"customer_id" integer NOT NULL,
	"purchases" FLOAT NOT NULL,
	CONSTRAINT "Concessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Movies" (
	"id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"title" VARCHAR(255) NOT NULL,
	"rating" VARCHAR(255) NOT NULL,
	CONSTRAINT "Movies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Customers" ADD CONSTRAINT "Customers_fk0" FOREIGN KEY ("concession_id") REFERENCES "Concessions"("id");
ALTER TABLE "Customers" ADD CONSTRAINT "Customers_fk1" FOREIGN KEY ("ticket_id") REFERENCES "Tickets"("id");

ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id");
ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_fk1" FOREIGN KEY ("movie_id") REFERENCES "Movies"("id");

ALTER TABLE "Concessions" ADD CONSTRAINT "Concessions_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id");

ALTER TABLE "Movies" ADD CONSTRAINT "Movies_fk0" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id");





