# -*- coding: cp1251 -*-
# Extended Euclidean algorithm
def xgcd(x,y):
    a0=1; b0=0
    a1=0; b1=1
    if x<0:
    	x *= -1
    	a0 = -1
    if y<0:
    	y *= -1
    	b1 = -1
    if x<y:
    	x,y,a0,b0,a1,b1 = y,x,a1,b1,a0,b0
    while 1:
    	times = x/y
    	x -= times*y
    	a0 -= times*a1
    	b0 -= times*b1
    	if x==0:
    		break
    	x,y,a0,b0,a1,b1 = y,x,a1,b1,a0,b0
    return [y,a1,b1]

# Find multiplicative inverse
def invmod(x,p):
	[gcd,a,b] = xgcd(x,p)
	if gcd != 1:
		raise ValueError
	if a<0:
		a += p;
	return a

###################################################################################

def gcdex(a, b):
    if b == 0:
        return a, 1, 0
    else:
        d, x, y = gcdex(b, a % b)
        return d, y, x - y * (a // b)

###################################################################################

def EuclidExt(a, b):
  """
  Раширенный алгоритм Евклида.
  Возвращает (gcd(a,b), x, y), такие что gcd(a,b)= a*x + b*y
  """
  assert a != 0 or b != 0
  a0, a1, b0, b1 = 1, 0, 0, 1
  while b != 0:
    q, r = divmod(a, b) # q - целое от деления, r - остаток
    a, b = b, r
    a0, a1, b0, b1 = b0, b1, a0 - q*b0, a1 - q*b1
  return (a, a0, a1)

###################################################################################

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    gcd, x, y = egcd(a, m)
    if gcd != 1:
        return None  # modular inverse does not exist
    else:
        return x % m

###################################################################################

def extended_gcd(a, b):
    x = 0
    y = 1
    lx = 1
    ly = 0
    oa = a
    ob = b
    while b != 0:
        q = a // b
        (a, b)  = (b, a % b)
        (x, lx) = ((lx - (q * x)),x)
        (y, ly) = ((ly - (q * y)),y)
    if (lx < 0): lx += ob
    if (ly < 0): ly += oa
    return lx

###################################################################################


def mod(a ,b):
	'''
		Ввел для удобства использования
		в функции solve,
		так очевиднее, что куда передается нежели c %
	'''
	return a % b
    
## ExtendedGCD
# *********************************************************
def ExtendedGCD(a, b):
	'''
		Из книги Т. Корман <<Алгоритмы. Построение и Анализ>>
		стр 966
	'''
	if b == 0:
		return a , 1, 0
	d1, x1, y1 = ExtendedGCD(b, mod(a, b) )
	d, x, y = d1, y1, x1 - (a/b)*y1
	return d, x, y
