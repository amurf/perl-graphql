-- Deploy graphql-perl-example:create-surveyweek-table to pg

BEGIN;

  CREATE TABLE survey_week (
    survey_week_id       INTEGER     PRIMARY KEY,
    week_length          INTEGER     NOT NULL,
    start_day            TEXT        NOT NULL,
    end_day              TEXT        NOT NULL,
    n_week_households    INTEGER     NOT NULL,
    created_utc          TIMESTAMPTZ NOT NULL DEFAULT (now() at time zone 'UTC'),
    modified_utc         TIMESTAMPTZ NOT NULL DEFAULT (now() at time zone 'UTC'),
    CHECK (modified_utc >= created_utc)
  );

COMMIT;
