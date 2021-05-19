#!/usr/bin/env perl
use Mojolicious::Lite;

use GraphQL::Type::Scalar qw($String $Int);
use GraphQL::Schema;
use GraphQL::Type::Object;

use URI::db;
use API::Schema;

sub find_hashref {
    my ($resultset, $where) = @_;

    my $uri    = URI::db->new( $ENV{DATABASE_URL} );
    my $schema = API::Schema->connect($uri->dbi_dsn, $uri->user, $uri->password);

    return $schema->resultset($resultset)
                  ->search($where, { result_class => 'DBIx::Class::ResultClass::HashRefInflator' })->single;
}

my $survey_week_type = GraphQL::Type::Object->new(
    name => 'SurveyWeek',
    fields => {
        start_day => { type => $String },
        end_day   => { type => $String },
    },
);

my $address_type = GraphQL::Type::Object->new(
    name => 'Address',
    fields => {
        address  => { type => $String },
        suburb  => { type => $String },
        postcode  => { type => $String },
    },
);

my $household_type = GraphQL::Type::Object->new(
    name => 'Household',
    fields => {
        id => { type => $String },
        survey_week_id => { type => $String },
        notes => { type => $String },
        survey_week => {
            type => $survey_week_type,
            resolve => sub {
                my $root = shift;
                return find_hashref('SurveyWeek', { survey_week_id => $root->{survey_week_id} });
            },
        },
        address => {
            type => $address_type,
            resolve => sub {
                my $root = shift;
                return find_hashref('Address', { address_id => $root->{address_id} });
            },
        },
    },
);

my $schema = GraphQL::Schema->new(
    query => GraphQL::Type::Object->new(
        name => 'FindHousehold',
        fields => {
            household => {
                type => $household_type,
                args => { id => { type => $Int } },
                resolve => sub {
                    my ($root, $args) = @_;


                    return find_hashref('Household', { household_id => $args->{id} });
                },
            },
        },
    )
);


plugin GraphQL => {
    schema => $schema, graphiql => 1,
};

app->start;

