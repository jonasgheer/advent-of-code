
my $zeros-seen = 0;
my $pos = 50;
for (lines) -> $line {
    my $ins = $line ~~ /(L|R)(\d+)/;
    given $ins[0] {
        when 'L' { $pos = rotate($pos, -$/[1]) }
        when 'R' { $pos = rotate($pos, $/[1]) }
    }
    $zeros-seen++ if $pos == 0;
}
say $zeros-seen;

sub rotate($n, $r) {
    ($n + $r) % 100;
}

