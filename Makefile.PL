use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME                => 'Test::Mock::Lite',
  AUTHOR              => 'Belden Lyman <belden@cpan.org>',
  VERSION_FROM        => 'lib/Test/Mock/Lite.pm',
  ABSTRACT_FROM       => 'lib/Test/Mock/Lite.pm',
  PL_FILES            => {},
  PREREQ_PM => {
    'Test::Resub'     => 2.00,
  },
  META_MERGE => {
    resources => {
      bugtracker => 'https://github.com/belden/test-mock-lite/issues',
    },
  },
  dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
  clean               => { FILES => 'Test-Mock-Lite-*' },
);
