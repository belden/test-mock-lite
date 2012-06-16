#!/usr/bin/env perl

# The various other tests in t/ need some target class to mock out; they use
# t/lib/Mock/Me.pm. This is a test suite for that dummy class.
#
# Mock::Me is designed to have various characteristics that other mocking libraries
# do not handle properly. If these tests fail, then Mock::Me no longer has the
# desired characteristics, which invalidates all the other tests even if they
# themselves pass.

use strict;
use warnings;

use Test::More tests => 5;

use lib './lib';
use Mock::Me;
use Test::Lite;

# A function named Mock::Me::count() exists, and bumps some counter
each_ok { Mock::Me::count(), $_ } (1..5);

# We've provided a way to violate lexical scope on my()'d vars in Mock::Me; now
# it's time to prove that that actually does what it claims to do.
my %counts = Mock::Me::get_refs_to_counts;
my $fh = delete $counts{filehandle};
ok( fileno($fh), "Mock::Me::get_refs_to_counts's filehandle symbol is trustworthy" );
is_deeply( \%counts, {
	array => [qw(dont touch me bro)],
	hash => {me => 'neither'},
	scalar => \5,
}, '*Mock::Me::count symbols are correct' );

# A function name Mock::Me::tweak_count exists and has a prototype
{
	is( prototype(\&Mock::Me::tweak_count), '&', 'Mock::Me::tweak_count has the expected prototype' );

	my $warning;
	local $SIG{__WARN__} = sub { $warning = shift };

	no strict 'refs';
	no warnings 'redefine';
	*Mock::Me::tweak_count = sub { 'wrong prototype, so this assignment causes a prototype mismatch warning' };

	like( $warning, qr/Prototype mismatch/, "perl $] throws expected prototype mismatch error on subroutine redefinition" );
}
