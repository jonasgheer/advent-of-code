
my @input =  roundrobin(lines.map(*.comb)).map(*.join).grep(/\S/);

sub do-math(@numbers) {
    my @results;
    my $first = @numbers.shift;
    my @nums = $first.comb(/\d+/);
    my $op = $first ~~ /<[+*]>/;
    for @numbers -> $n {
        if ($n ~~ /<[+*]>/) {
            given $op {
                when "+" {@results.push([+] @nums)}
                when "*" {@results.push([*] @nums)}
            }
            @nums = $n.comb(/\d+/);
            $op = $n ~~ /<[+*]>/;
        } else {
            @nums.push($n);
        }
    }
    given $op {
        when "+" {@results.push([+] @nums)}
        when "*" {@results.push([*] @nums)}
    }
}

say [+] do-math(@input);

