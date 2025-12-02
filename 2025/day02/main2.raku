
my @ranges = slurp.split(',').map({
    $_  ~~ /(\d+)"-"(\d+)/;
    $/[0]..$/[1];
});

my @invalid-ids = [];
for @ranges -> $range {
    for $range.list -> $n {
        @invalid-ids.push($n) if is-invalid-id($n);
    }
}

sub is-invalid-id($n) {
    $n ~~ /^^(\d+)$0 ** 1..*$$/;
}

say [+] @invalid-ids;   
