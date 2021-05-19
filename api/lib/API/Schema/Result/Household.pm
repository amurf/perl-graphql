use utf8;
package API::Schema::Result::Household;
use strict;
use warnings;

use parent 'DBIx::Class::Core';


__PACKAGE__->table("household");

__PACKAGE__->add_columns(
  "household_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "admin.household_household_id_seq",
  },
  "address_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "survey_week_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "valid",
  { data_type => "boolean", default_value => \"true", is_nullable => 1 },
  "do_not_contact",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
  "status",
  { data_type => "text", default_value => "Unverified", is_nullable => 1 },
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


__PACKAGE__->set_primary_key("household_id");

__PACKAGE__->belongs_to(
  "address",
  "API::Schema::Result::Address",
  { address_id => "address_id", project_id => "project_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

__PACKAGE__->belongs_to(
  "survey_week",
  "API::Schema::Result::SurveyWeek",
  { project_id => "project_id", survey_week_id => "survey_week_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

1;
