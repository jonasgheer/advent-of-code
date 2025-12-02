
my $zeros-seen = 0;
my $pos = 50;
for (lines) -> $line {
    my $ins = $line ~~ /(L|R)(\d+)/;
    for 1..$/[1] {
        given $ins[0] {
            when 'L' { $pos = rotate-left($pos) }
            when 'R' { $pos = rotate-right($pos) }
        }
        $zeros-seen++ if $pos == 0;
    }
}
say $zeros-seen;

sub rotate-right($n) {
    ($n + 1) % 100;
}

sub rotate-left($n) {
    ($n - 1) % 100;
}