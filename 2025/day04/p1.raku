
sub neighbors($x, $y) {
    gather for -1..1 X -1..1 -> ($dx, $dy) {
        take ($x + $dx, $y + $dy) unless $dx == $dy == 0;
    }
}

my %grid = gather for lines.kv -> $x, $line {
    for $line.comb.kv -> $y, $value {
        take ($x, $y) => $value;
    }
}

say [+] %grid.kv.map(-> $pos, $value {
    next if $value ne '@';
    %grid{neighbors(|$pos.split(" "))}.grep(*.defined).grep(* eq '@').elems < 4;
});