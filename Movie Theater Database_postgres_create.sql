CREATE TABLE "public.Customers" (
	"id" serial,
	"first_name" VARCHAR(255) NOT NULL,
	"last_name" VARCHAR(255) NOT NULL,
	"created_at" date,
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
	"created_at" date NOT NULL,
	"updated_at" date NOT NULL,
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



ALTER TABLE "public.Customers" ADD CONSTRAINT "Customers_fk0" FOREIGN KEY ("concession_id") REFERENCES "public.Concessions"("id");
ALTER TABLE "public.Customers" ADD CONSTRAINT "Customers_fk1" FOREIGN KEY ("ticket_id") REFERENCES "public.Tickets"("id");

ALTER TABLE "public.Tickets" ADD CONSTRAINT "Tickets_fk0" FOREIGN KEY ("customer_id") REFERENCES "public.Customers"("id");
ALTER TABLE "public.Tickets" ADD CONSTRAINT "Tickets_fk1" FOREIGN KEY ("movie_id") REFERENCES "public.Movies"("id");

ALTER TABLE "public.Concessions" ADD CONSTRAINT "Concessions_fk0" FOREIGN KEY ("customer_id") REFERENCES "public.Customers"("id");

ALTER TABLE "public.Movies" ADD CONSTRAINT "Movies_fk0" FOREIGN KEY ("customer_id") REFERENCES "public.Customers"("id");





