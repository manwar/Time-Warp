use ExtUtils::MakeMaker;

require 5.006;

my %hash = (
	NAME => 'Time::Warp',
	VERSION_FROM => 'Warp.pm',
	ABSTRACT_FROM => 'Warp.pm',
	OBJECT => 'Warp.o',
	OPTIMIZE => '-g',
	PREREQ_PM    => {
		'Test::More'    => '1.00',
	},
);

WriteMakefile(%hash);
