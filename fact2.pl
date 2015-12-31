: # -*- perl -*-
eval 'exec perl -S $0 ${1+"$@"}'
   if 0;

$|=1;
#D:/Artem/Perl64/bin/perl.exe
# p - модуль(простое число) - генерится из диапазона для входного n
# n - битность модуля (вход)
# nq - битность простого делителя qi составного числа Q (Q = q1*q2*...*qm), где Q = p-1

#use lib "D:/Artem/Perl64/site/lib";
use Data::Dumper;
use bigint;

#my $aaaa = 2 ** 164;
#print "aaaa=$aaaa;\n"; 

sub min ($$) {
    my ($n1, $n2) = @_;
    if ($n1 < $n2) { return $n1 }
    else { return $n2 }
}

sub gcd ($$) {
    my ($n1, $n2) = @_;
    for (my $k = min($n1, $n2); $k > 1; $k--) {
        last if ($k == 0);
        if ($n1 % $k == 0 and $n2 % $k == 0) {
            return $k; # gcd
            #last;
        }
    }
    return 1;
}

sub isMutuallyCoprime {
    my @S = @_;
    for my $e1 (@S) {
        for my $e2 (@S) {
            next if ($e1 == $e2);
            if (gcd($e1, $e2) != 1) {
                return 0;
            }
        }
    }
    return 1;
}

#my ($aa, $bb) = (12, 13);
#print "gcd($aa,$bb)=", gcd($aa,$bb), "\n";
#print "isMutuallyCoprime($aa,$bb)=", isMutuallyCoprime($aa,$bb), "\n";

my $dr = $ARGV[0];
my $dr2 = 2 ** $dr;
my $bit = $ARGV[1];
my $n = 1;
print "dr=$dr;\n";
print "2**$dr=$dr2;\n";

if (0) {

while (1) {
    my $mult = ((2**$n)-1)*(2**$n)*((2**$n)+1);
    if ($mult >= $dr2) {
        if (1) {#isMutuallyCoprime(((2**$n)-1),(2**$n),((2**$n)+1))
            print "basis = {(2**$n)-1, 2**$n, (2**$n)+1}\n";
            last;
        }
    }
    $n++;
}

#sub isPairwiseCoprime {}
#sub isMutuallyCoprime {
#    return 1
#}

exit unless $bit;
}

$n = $bit;

my @M = ((2**$n)-1);
my @K = (1);
my $mult = (2**$n)-1;
print "-->   =$mult;\n";
if (((2**$n)-1) >= $dr2) {
    print "basis = {(2**$n)-1}\n";
    exit;
}

#print "run\n";

my $c = 1;
my $k = 2;
while (1) {
##for (my $k = 2; 1 ; $k++) {
  


   #print "k=$k\n";
    my $m = (2**$n)-$k;
    if (isMutuallyCoprime(@M, $m)) {
        push @M, $m;
        push @K, $k;
        $mult *= $m;
        print "-->   =$mult;\n";
        last if ($mult >= $dr2);
    }
    
    #if ($c == 50) {last;}
    $c++;
    $k++;
}

print "\@K = @K\n";
print "basis = {", join(", ", map {"(2**$n)-$_"} @K), "}\n";

#the pairwise coprime numbers 
#Dumper($aaaa);
#In mathematics, especially number theory, a set of integers is said to be pairwise coprime (or pairwise relatively prime, also known as mutually coprime) if every pair of integers "a" and "b" in the set are coprime (that is, have no common divisors other than 1)...

use bigint;

sub isPrime ($) {
    my $i = shift;

    for my $j (2 .. sqrt($i))
    {
        return 0 if $i % $j == 0;
    }
    return 1;
}

my $dr = 128;
my $dr2 = 2**128;

if ($dr2 != 340282366920938463463374607431768211456) {
	print "Error: 1!\n";
}

my @basis = ((2**16)-1, (2**16)-3, (2**16)-5, (2**16)-8,
             (2**16)-9, (2**16)-15, (2**16)-17, (2**16)-27, (2**16)-33);
			 
my @basis2 = ((2**16)-1, (2**16)-3, (2**16)-5,
             (2**16)-9, (2**16)-15, (2**16)-17, (2**16)-27, (2**16)-33);			 


my @basis3 = ((2**16)-1, (2**16)-3, (2**16)-5, (2**16)-8,
             (2**16)-9, (2**16)-15, (2**16)-17, (2**16)-27);
			 			 
my $mult = 1; my $mult2 = 1; my $mult3 = 1;

$mult *= $_ for (@basis);
$mult2 *= $_ for (@basis2);
$mult3 *= $_ for (@basis3);

print "dr2  =$dr2\n";
print "mult0=$mult\n";
print "mult2=$mult2\n";
print "mult3=$mult3\n";

unless ($mult >= $dr2) {
	print "Error: 2!\n";
}
			 
unless ($mult2 >= $dr2) {
	print "Error: 3!\n";
}

unless ($mult3 >= $dr2) {
	print "Error: 4!\n";
}

if ($mult > $mult2) { print "mult > mult2\n" }
if ($mult < $mult2) { print "mult < mult2\n" }


for my $ee (@basis2) {
	if (isPrime($ee)) {
		print "$ee is prime\n";
	} else {
		print "$ee\n";
	}
}
	 
__END__
exit;
#use nowarning;
#use Math::Prime::FastSieve;
#use Excel::Writer::XLSX;
require "farrago.pm";

# linux RHEL 5.6 perl v5.8.8
# $ C:/Dwimperl/perl/bin/perl -v v5.14.2
# $ D:/Artem/Perl64/bin/perl.exe -v v5.20.1
# $ D:/Artem/cygwin64/bin/perl.exe -v v5.14.4


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
    print "n=$n; ";
    my $a = 2;
    my %hh = ();
    while ($a <= $n) { # sqrt($N)
        ##print "n=$n a=$a\n";
        while ($n % $a == 0) {
            ##print "---> n=$n; a=$a\n";
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
    
    print "n=$n; flag=$flag;\n";
    
    
    return ($flag, \%hh);
}

#print "A=", Data::Dumper->Dump([(fact($A))[1]], ["*A"]), "\n";

my $P = 1;
my %prime_factors = ();
my $pi = 3;

if ($bit) {
    $pi = 2 ** ($bit-1);
    while (! isPrime($pi)) {
        $pi++
    }
}

while ($pi <= $A) { # for my $pi ( 3 .. $A )
    my ($flag, $hh) = fact($pi - 1); # my $q = $pi - 1;
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
            # Range iterator outside integer range
            print "Error: There are no factors with bit length $bit and ", $bit + 1, "!\n";
            last;
        }
    }
}

#print Dumper(\%prime_factors);

print "A = $A;\n";
print "P = ", (my $str = join(" * ", sort {$a <=> $b} keys %prime_factors)), " = ", $P, ";\n";
print "Error: $P=P < A=$A\n" unless ($P >= $A);
my $i = 0;
for my $pi (sort {$a <=> $b} keys %prime_factors) {
    print "q[$i] = $pi - 1 = ", join(" * ", map { $prime_factors{$pi}{$_} > 1 ? "($_**$prime_factors{$pi}{$_})" : "$_" } (sort {$a <=> $b} keys %{$prime_factors{$pi}})), ";\n";
    $i++;
}
    
__END__

for my $fact (sort {$a <=> $b} $hhh{$pi}) {

    
    
    
    


my @out;

join(" * ", sort {$a <=> $b} keys %hhh);


for my $pi (sort {$a <=> $b} keys %hhh) {
    my $power = $hhh{$pi};
    #if ($prime != 2 and $power > 1) {
    #    print "Warning: Incorrect power=$power for prime=$prime!\n";
    #}
    my $a = $prime;
    $a .= "**$power" if ($power > 1);
    push @out, $a;
}

print Dumper(@out);




__END__

readln(N);
writeln(1);
a:=2; 
while (a<=trunc(sqrt(n))) do
 begin
  inc(a); b:=0;
  while (n mod a = 0) do
    begin
     n:=n div a;
     inc(b);
   end;
   if (b>0) then writeln(a,' ',b);
end;
if n>1 then writeln(n,' ',1);

sub fact ($) {
    my $n = shift;
    my $a = 2;
    while ($a <= $n) { # sqrt($N)
        $a++;
        my $b = 0;
        while ($n % $a == 0) {
            my $n \= $a;
            $b++;
        }
        if ($b > 0) { print "$a $b\n"}
    }
    if ($n > 1) { print "$n 1\n" };
}    
    
   




    
    if (isPrime($i) and $i >= $A) {
        $p = $i;
        last;
    }
}

my $Q = $p-1;
my $q = $Q;

print "A=$A\n";
print "p=$p\n";
print "Q=$Q\n";

# this is simply prototype of factorization into the primes.

# (my $q) = (my $n) = $ARGV[0];

sub gcd ($$) {
    my ($a, $b) = @_;
    return $b ? gcd($b, $a%$b) : $a;
}

my $previ = 2;

for my $i (2 .. $q) {
    #chomp $i;
	print "i=$i;q=$q\n";
    
    if ($i == 2 and $q % $i == 0) {
        $q /= $i;
        $prime_factors{$i}++;
        last if ($q == 1);
        redo;
    } elsif ($i > 2 and $q % $i == 0 and $prime_factors{$i} == 0 and gcd($previ, $i) == 1) {
        $q /= $i;
        $prime_factors{$i}++;
        $previ = $i;
        last if ($q == 1);
    }
}

print Dumper(\%prime_factors);

__END__
        
        
        
        
        
        
        
        
        }
    
    if ($q % $i == 0 and $prime_factors{$i} == 0) {
        #print "--> i=$i;q=$q";
        $q /= $i;
        #print " -> q=$q\n";
        #push @prime_factors, $i;
        $prime_factors{$i}++;

        last if ($q == 1);
        redo;
    }
}


#|| pow2(50);

#if (isPrime($n)) {
#    $q = $n - 1;
#}
# 123
#print Dumper($q);
@prime_factors = ();
%prime_factors = ();

#printf "sqrt($q) = %.2f\n", sqrt($q);

#$q = 1267650600228229401496703205375;
#./primegen-0.97/primes  1 10

my $q = (2 ** $q) - 1;
my $qq = $q;

for my $i (`./primegen-0.97/primes 1 10000000`) {
    chomp $i;
	print "i=$i;q=$q\n";
    if ($q % $i == 0 and $prime_factors{$i} == 0) {
        #print "--> i=$i;q=$q";
        $q /= $i;
        #print " -> q=$q\n";
        #push @prime_factors, $i;
        $prime_factors{$i}++;

        last if ($q == 1);
        redo;
    }
}

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
print "Sort "
fact($Q);

print Dumper(\%prime_factors);

print "Num=$qq\n";

my @out;
for my $prime (sort {$a <=> $b} keys %prime_factors) {
    my $power = $prime_factors{$prime};
    if ($prime != 2 and $power > 1) {
        print "Warning: Incorrect power=$power for prime=$prime!\n";
    }
    my $a = $prime;
    $a .= "**$power" if ($power > 1);
    push @out, $a;
}

print Dumper(@out);

# p - модуль(простое число) - генерится из диапазона для входного n
# n - битность модуля (вход)
# nq - битность простого делителя qi составного числа Q (Q = q1*q2*...*qm), где Q = p-1

#sub prepareInput ($$$) {}
#sub gen_tt($$$) {}
#sub run_espr($$$) {}
#sub gen_tt2($$$) {}

# sum_mod3_espr
# sum_mod3_quine
# sum_mod3_quine.


