use utf8;
package API::Schema::Result::SurveyWeek;
use strict;
use warnings;

use parent 'DBIx::Class::Core';



__PACKAGE__->table("survey_week");

__PACKAGE__->add_columns(
  "survey_week_id",
  { data_type => "integer", is_nullable => 0 },
  "week_length",
  { data_type => "integer", is_nullable => 0 },
  "start_day",
  { data_type => "text", is_nullable => 0 },
  "end_day",
  { data_type => "text", is_nullable => 0 },
  "n_week_households",
  { data_type => "integer", is_nullable => 0 },
  "created_utc",
  {
    data_type     => "timestamp with time zone",
    default_value => \"timezone('UTC'::text, now())",
    is_nullable   => 0,
  },
  "modified_utc",
  {
    data_type     => "timestamp with time zone",
    default_value => \"timezone('UTC'::text, now())",
    is_nullable   => 0,
  },
);

__PACKAGE__->set_primary_key("survey_week_id");

__PACKAGE__->has_many(
  "households",
  "API::Schema::Result::Household",
  {
    "foreign.survey_week_id" => "self.survey_week_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
