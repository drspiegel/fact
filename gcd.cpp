int gcd (int a, int b) {
	if (b == 0)
		return a;
	else
		return gcd (b, a % b);
}

int gcd (int a, int b) {
	return b ? gcd (b, a % b) : a;
}

int gcd (int a, int b) {
	while (b) {
		a %= b;
		swap (a, b);
	}
	return a;
}

gcd(a, 0) = a

int lcm (int a, int b) {
	return a / gcd (a, b) * b;
}

int gcd(int a, int b) {
    while ((a %= b) && (b %= a));
    return a | b;
}

int gcd(int a, int b) {
    while (b^=a^=b^=a%=b);
    return a;
}
////////////////////////////////////////////////////////

while (a != b) if (a > b) a -= b; else b -= a;

/////////////////////////////////////////////////////
do
{
	if(a>b) a=a%b;
	else b=b%a;
}
while(a!=0&&b!=0);
