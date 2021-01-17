package Koha::Plugin::Com::ByWaterSolutions::KitchenSink;

use Modern::Perl;
use base qw(Koha::Plugins::Base);

use C4::Context;
use C4::Auth;
use Koha::Patron;
use Koha::DateUtils;
use Koha::Libraries;
use Koha::Patron::Categories;
use Koha::Account;
use Koha::Account::Lines;
use MARC::Record;
use Cwd qw(abs_path);
use Mojo::JSON qw(decode_json);;
use URI::Escape qw(uri_unescape);
use LWP::UserAgent;

our $VERSION = "1.0";
our $MINIMUM_VERSION = "1.0";

## Here is our metadata, some keys are required, some are optional
our $metadata = {
    name            => 'Hello World',
    author          => 'Petro Nugged',
    date_authored   => '2021-01-14',
    date_updated    => "2021-01-14",
    minimum_version => $MINIMUM_VERSION,
    maximum_version => undef,
    version         => $VERSION,
    description     => 'This is a test plugin.',
};

sub uninstall() {
    my ( $self, $args ) = @_;

    my $table = $self->get_qualified_table_name('mytable');

    return C4::Context->dbh->do("DROP TABLE IF EXISTS $table");
}
