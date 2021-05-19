-- Deploy graphql-perl-example:create-address-table to pg

BEGIN;

CREATE TABLE address (
  address_id          INTEGER       PRIMARY KEY,
  address             TEXT          NOT NULL,
  suburb              TEXT          NOT NULL,
  postcode            TEXT          NOT NULL,
  x                   NUMERIC(9,6)  NOT NULL,
  y                   NUMERIC(9,6)  NOT NULL,
  created_utc         TIMESTAMPTZ   NOT NULL DEFAULT (now() at time zone 'UTC'),
  modified_utc        TIMESTAMPTZ   NOT NULL DEFAULT (now() at time zone 'UTC'),
  CHECK (modified_utc >= created_utc)
);



COMMIT;
