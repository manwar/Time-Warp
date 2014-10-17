#!./perl -w

# These tests may occationally fail due to small timing differences.

use Test; plan test => 8;
{
    local $SIG{__WARN__} = sub {
	if ($_[0] =~ /Time::HiRes/) {
	    ok 1;
	} else {
	    warn $_[0];
	}
    };
    require Time::Warp;
}
Time::Warp->import(qw(time to scale));
ok 1;
ok &scale, 1;

scale(2);
ok &scale, 2;
my $now = &time;
sleep 2;
ok(&time - $now, 4);

to(CORE::time);
ok(&time - CORE::time, 0);

scale(scale() * 2);
ok(&time - CORE::time, 0);

Time::Warp::reset(); to(&time + 5);
ok(&time - CORE::time, 5);
