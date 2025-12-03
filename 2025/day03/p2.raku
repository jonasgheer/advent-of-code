
multi sub biggest(@bank, 1) {
    @bank.max;
}

multi sub biggest(@bank, $n) {
    my @eligible = @bank[0 .. * - $n];
    my $max-i = @eligible.pairs.max(*.value).key;
    my @remaining = @bank[$max-i + 1 .. *];
    return @bank[$max-i] ~ biggest(@remaining, $n - 1);
}

say [+] lines.map({
    biggest($_.comb, 12);
});
