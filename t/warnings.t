use strict;
use warnings;

use Test::More tests => 7;

{
    my $warning;
    local $SIG{__WARN__} = sub {
        like($_[0], $warning, $warning);
    };

    $warning = qr/ Time::HiRes is not loaded/;
    require Time::Warp;
    Time::Warp->import(qw(time scale to reset));

    $warning = qr/ cannot stop time/;
    scale(0);
    is(scale(), 0.001, "Can't stop");

    $warning = qr/ cannot go backwards/;
    scale(-1);
    is(scale(), 1, "Can't go backwards");

    to(-10);
    cmp_ok(&time, '<', 0, 'Can go before epoch');

    $warning = qr/called more than once/;
    do $INC{'Time/Warp.pm'};
}
