use utf8;
package API::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces(
    default_resultset_class => "+API::Schema::ResultSet",
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-02-21 11:39:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g7n8qcBtO61x2jSVAjsxQg

use Function::Parameters    qw( :strict );
use Scope::Guard            qw( guard );

# Sets DBIC_TRACE=$trace_on for as long as the returned object stays in scope.
# When the object goes out of scope, the previous value is restored.
# You have to save the return value for the scope guard to work. You'll get a
# fatal error if not.
method trace($trace_on = 1) {
    my $previous = $self->storage->debug;
    $self->storage->debug($trace_on);
    return guard { $self->storage->debug($previous) };
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
