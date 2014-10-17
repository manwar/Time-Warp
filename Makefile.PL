use ExtUtils::MakeMaker;

require 5.005;  # maybe 5.004_65+ OK

my %hash = (
	    NAME => 'Time::Warp',
	    VERSION_FROM => 'Warp.pm',
	    OBJECT => 'Warp.o',
	    OPTIMIZE => '-g',
	    );

WriteMakefile(%hash);
