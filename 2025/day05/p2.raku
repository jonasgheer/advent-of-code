
my @ranges = slurp.split("\n\n")[0].lines.map({
    my ($low, $high) = $_.split("-")>>.Int;
    $low..$high;
}).sort;

sub merge-ranges(@ranges) {
    my @sorted = @ranges.sort(*.min);
    my @merged;
    my $current = @sorted.shift;

    for @sorted -> $next {
        if $current.max >= $next.min {
            $current = $current.min .. max($current.max, $next.max);
        } else {
            @merged.push($current);
            $current = $next;
        }
    }
    @merged.push($current);
    @merged
}

say merge-ranges(@ranges).map(*.elems).sum;

