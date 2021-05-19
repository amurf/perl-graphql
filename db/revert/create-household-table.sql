-- Revert graphql-perl-example:create-household-table from pg

BEGIN;

CREATE TABLE household (
  household_id          SERIAL      PRIMARY KEY,
  address_id            INTEGER     NOT NULL REFERENCES address,
  survey_week_id        INTEGER     NOT NULL REFERENCES survey_week,
  notes                 TEXT,
  valid                 BOOLEAN     DEFAULT (true),
  do_not_contact        BOOLEAN     DEFAULT (false),
  status                TEXT        DEFAULT ('Unverified'),
  created_utc           TIMESTAMPTZ NOT NULL DEFAULT (now() at time zone 'UTC'),
  modified_utc          TIMESTAMPTZ NOT NULL DEFAULT (now() at time zone 'UTC'),

  UNIQUE (address_id),
  CHECK (modified_utc >= created_utc)
);


COMMIT;
