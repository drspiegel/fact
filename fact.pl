: # -*- perl -*-
eval 'exec perl -S $0 ${1+"$@"}'
   if 0;

$|=1;

use Data::Dumper;
use bigint;

# Usage:
#   %perl fact.pl 99
#   %perl fact.pl 1763 4

#  2**99 =  633825300114114700748351602688
# 2**100 = 1267650600228229401496703205376

my ($A, $bit) = @ARGV;

sub isPrime ($) {
    my $i = shift;

    for my $j (2 .. sqrt($i))
    {
        return 0 if $i % $j == 0;
    }
    return 1;
}

sub fact ($) {
    my $n = shift;
    my $a = 2;
    my %hh = ();
    while ($a <= $n) {
        while ($n % $a == 0) {
            $n /= $a;
            $hh{$a}++;
        }
        do {
            $a++
            } until (isPrime($a));
    }
    my $flag = 1;
    while (my ($k, $v) = each %hh) {
        if ($k != 2 and $v > 1) { $flag = 0 }
    }
    return ($flag, \%hh);
}

my $P = 1;
my %prime_factors = ();
my $pi = 3;

if ($bit) {
    $pi = 2 ** ($bit-1);
    while (! isPrime($pi)) {
        $pi++
    }
}

while ($pi <= $A) {
    my $q = $pi - 1;
    my ($flag, $hh) = fact($q);
    if ($flag) {
        $P *= $pi;
        $prime_factors{$pi} = $hh;
        if ($P >= $A) {
            last;
        }
    }
    do {
        $pi++
        } until (isPrime($pi));
    if ($bit) {
        if ($pi >= 2 ** $bit) {
            print "Warning: Searching for factors with bit length ", $bit + 1, "!\n";
        }
        if ($pi >= 2 ** ($bit+1)) {
            print "Error: There are no factors with bit length $bit and ", $bit + 1, "!\n";
            last;
        }
    }
}

#print Data::Dumper->Dump([\%prime_factors], ["*prime_factors"]);

print "A = $A;\n";
print "P = ", (my $str = join(" * ", sort {$a <=> $b} keys %prime_factors)), " = ", $P, ";\n";
print "Error: $P=P < A=$A\n" unless ($P >= $A);
my $i = 0;
for my $pi (sort {$a <=> $b} keys %prime_factors) {
    print "q[$i] = $pi - 1 = ", join(" * ", map { $prime_factors{$pi}{$_} > 1 ? "($_**$prime_factors{$pi}{$_})" : "$_" } (sort {$a <=> $b} keys %{$prime_factors{$pi}})), ";\n";
    $i++;
}
