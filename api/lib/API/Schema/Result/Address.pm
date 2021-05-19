use utf8;
package API::Schema::Result::Address;
use strict;
use warnings;

use parent 'DBIx::Class::Core';


__PACKAGE__->table("address");

__PACKAGE__->add_columns(
  "address_id",
  { data_type => "integer", is_nullable => 0 },
  "address",
  { data_type => "text", is_nullable => 0 },
  "suburb",
  { data_type => "text", is_nullable => 0 },
  "postcode",
  { data_type => "text", is_nullable => 0 },
  "x",
  { data_type => "numeric", is_nullable => 0, size => [9, 6] },
  "y",
  { data_type => "numeric", is_nullable => 0, size => [9, 6] },
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

__PACKAGE__->set_primary_key("address_id");

__PACKAGE__->might_have(
  "household",
  "TMR::Admin::Schema::Result::Household",
  {
    "foreign.address_id" => "self.address_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
