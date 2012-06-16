package Test::Lite;
use strict;
use warnings;

use base qw(Exporter);
our @EXPORT = qw(each_ok);

use Test::More;

sub each_ok (&@) {
	my $code = shift;

	local $_;

	my $index = 0;

	my @bad;
	foreach (@_) {
		my $orig = $_;
		my (@got) = $code->();

		my $ok = 1;
		my $expected;

		if (@got == 1) {
			$ok = 0;
			$expected = 'something true';
		} elsif ($got[0] ne $got[1]) {
			$ok = 0;
			$expected = $got[1];
		}

		push @bad, {
			raw => $_,
			index => $index,
			got => $got[0],
			expected => $expected,
		} if ! $ok;

		$index++;
	}

	local $Test::Builder::Level = $Test::Builder::Level + 1;
	is_deeply( \@bad, [] );
}

1;
