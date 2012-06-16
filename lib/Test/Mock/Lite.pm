package Test::Mock::Lite;

use strict;
use warnings;

our $VERSION = 0.01;

1;

__END__
=pod

=head1 NAME

Test::Mock::Lite - Lite-weight heavy-hitting mock object library, primarily for unit testing.

=head1 SYNOPSIS

XXX

=head1 DESCRIPTION

This module allows you to mock out a target class and install arbitrary code in its place. The mocking behavior
is lexically scoped to a destructor object; once the destructor object goes out of scope, the original class
is re-installed.

=head1 APOLOGY

Is this really a wheel that needs reinvention? ... Well, I wrote and released this, so clearly B<I> think the
answer is a resounding "Yeah, sure, maybe?".

First and foremost, installing a testing library should require few dependencies. Adding Test::Mock::Lite to your
toolchain means installing only one other library, Test::Resub.

Second, other mocking libraries have various bugs in them:

=over 4

=item * they may not handle prototyped subs correctly;

=item * they probably blow away scalars and other non-subs that have the same name as the subs you are mocking out

=item * the mocked objects may not correctly hide themselves in a callstack

=back

=head1 SEE ALSO

=over 4

=item * L<Test::MockObject>

=item * L<Test::Mock::Guard>

=item * L<Mock::Quick::Class>

=back

=head1 AUTHOR AND COPYRIGHT

(c) 2012 Belden Lyman, belden@cpan.org

=head1 SUPPORT AND CONTRIBUTING

You may find documentation by running 'perldoc Test::Mock::Lite'.  Examples are available in the t/ directory. The
comparisons/ directory shows how the various mocking libraries handle the same tasks.

This library is available on GitHub at https://github.com/belden/test-mock-lite. Please submit feature requests, bug
reports, documentation updates, or patches through Github's interface. Or just email them to me, that's fine.

=head1 LICENSE

Test::Mock::Lite is free software. You may modify and redistribute it under the same terms as the Perl language itself.
