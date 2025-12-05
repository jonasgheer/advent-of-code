
my ($fresh-ranges, $ingredients) = slurp.split("\n\n");

my @fresh-ranges = $fresh-ranges.lines.map({
    my ($low, $high) = $_.split("-")>>.Int;
    $low..$high;
});
my @ingredients = $ingredients.lines>>.Int;

say @ingredients.grep({ $_ (elem) any(@fresh-ranges) }).elems;


