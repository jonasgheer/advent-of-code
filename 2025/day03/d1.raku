
say [+] lines.map({
    $_.comb.combinations(2).map({$_.join}).max;
});