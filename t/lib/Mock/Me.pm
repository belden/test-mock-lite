package Mock::Me;

use strict;
use warnings;

my @count = qw(dont touch me bro);
my %count = qw(me neither);
open 'count', __FILE__ or die "open " . __FILE__ . ": $!\n";
my $count;

sub get_refs_to_counts {
	return (
		array => \@count,
		hash => \%count,
		filehandle => \*count,
		scalar => \$count,
	);
}
sub count { ++$count }

our $tweak_count = 7;
sub tweak_count(&) {
	my $code = shift;
	$code->() for $count;
}

1;
