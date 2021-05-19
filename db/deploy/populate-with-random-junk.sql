-- Deploy graphql-perl-example:populate-with-random-junk to pg

BEGIN;


  INSERT INTO survey_week
  ( survey_week_id, week_length, start_day, end_day, n_week_households )
    VALUES
  (1, 5, 'Monday', 'Friday', 345),
  (2, 2, 'Tuesday', 'Thursday', 222)
  ;

  INSERT INTO address
  ( address_id, address, suburb, postcode, x, y )
    VALUES
  (1, '333 The Best Street', 'Melbourne', 3000, 23, 23),
  (2, '1 Marylou Ct', 'Delahey', 3037, 21, 12)
  ;

  INSERT INTO household
  (household_id, address_id, survey_week_id, notes)
  VALUES
  (1, 1, 1, 'Some random notes'),
  (2, 2, 2, 'Nooooooooooooootes')
  ;


COMMIT;
