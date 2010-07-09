package Facebook::Graph::Role::Uri;
BEGIN {
  $Facebook::Graph::Role::Uri::VERSION = '0.0100';
}

use Moose::Role;
use URI;

sub uri {
    return URI->new('https://graph.facebook.com')
}


1;

=head1 NAME

Facebook::Graph::Role::Uri - The base URI for the Facebook Graph API.

=head1 VERSION

version 0.0100

=head1 DESCRIPTION

Provides a C<uri> method in any class which returns a URI object that points to the  Facebook Graph API. 

=cut