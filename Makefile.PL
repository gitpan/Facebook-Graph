
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A fast and easy way to integrate your apps with Facebook.",
  "AUTHOR" => "JT Smith <jt\@plainblack.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Facebook-Graph",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Facebook::Graph",
  "PREREQ_PM" => {
    "Any::Moose" => "0.13",
    "AnyEvent::HTTP::LWP::UserAgent" => "0.08",
    "DateTime" => "0.61",
    "DateTime::Format::Strptime" => "1.4000",
    "JSON" => "2.16",
    "MIME::Base64::URLSafe" => "0.01",
    "Ouch" => "0.0400",
    "Test::More" => 0,
    "URI" => "1.54"
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "1.0501",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



