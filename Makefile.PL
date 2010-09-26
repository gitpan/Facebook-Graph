
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A fast and easy way to integrate your apps with Facebook.',
  'AUTHOR' => 'JT Smith <jt@plainblack.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Facebook-Graph',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Facebook::Graph',
  'PREREQ_PM' => {
    'Any::Moose' => '0.13',
    'Crypt::SSLeay' => '0.57',
    'DateTime' => '0.61',
    'DateTime::Format::Strptime' => '1.4000',
    'Digest::SHA' => '5.47',
    'JSON' => '2.16',
    'LWP' => '5.836',
    'MIME::Base64::URLSafe' => '0.01',
    'Test::More' => '0',
    'URI' => '1.54',
    'URI::Encode' => '0.02'
  },
  'VERSION' => '0.0704',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



