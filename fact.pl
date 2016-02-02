: # -*- perl -*-
eval 'exec perl -S $0 ${1+"$@"}'
   if 0;

$|=1;

#use Math::Prime::FastSieve;
#use Excel::Writer::XLSX;
require "farrago.pm";

# p - модуль(простое число) - генерится из диапазона для входного n
# n - битность модуля (вход)
# nq - битность простого делителя qi составного числа Q (Q = q1*q2*...*qm), где Q = p-1

isMutuallyCoprime()
isPairwiseCoprime()

#the pairwise coprime numbers 
#In mathematics, especially number theory, a set of integers is said to be pairwise coprime (or pairwise relatively prime, also known as mutually coprime) if every pair of integers "a" and "b" in the set are coprime (that is, have no common divisors other than 1)...

#this is simply prototype of factorization into the primes.

sub isPrime ($) {
    my $i = shift;

    for my $j (2 .. sqrt($i))
    {
        return 0 if $i % $j == 0;
    }
    return 1;
}

# linux RHEL 5.6 perl v5.8.8
# $ C:/Dwimperl/perl/bin/perl -v v5.14.2
# $ D:/Artem/Perl64/bin/perl.exe -v v5.20.1
# $ D:/Artem/cygwin64/bin/perl.exe -v v5.14.4
# use lib "D:/Artem/Perl64/site/lib";

sub gcd ($$) {
    my ($a, $b) = @_;
    return $b ? gcd($b, $a%$b) : $a;
}

#./primegen-0.97/primes 1 10000000


getCeilPrime($)

getNextPrime()
getFloorPrime()
getPrevPrime()

my $A = $ARGV[0];
my $p = getCeilPrime($A); # p >= A
my $Q = $p - 1;
my $bw_A = bitWidth($A);
my $bw_p = bitWidth($p);
print "Primes in [2;$p]: ", primes(2, $p), "\n";

#sub prepareInput ($$$) {}
#sub gen_tt($$$) {}
#sub run_espr($$$) {}
#sub gen_tt2($$$) {}

# sum_mod3_espr
# sum_mod3_quine
# sum_mod3_quine.
