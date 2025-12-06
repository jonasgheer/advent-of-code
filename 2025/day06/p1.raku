my @math-problems = [Z] lines.map(*.comb(/\d+|<[*+]>/));

say [+] @math-problems.map(-> @problem {
    given @problem[*-1] {
        when "+" { [+] @problem[^(*-1)] }
        when "*" { [*] @problem[^(*-1)] }
    }
});