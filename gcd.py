# NOD
def gcd(a,b):
    while a != b:
        if a > b:
            a = a - b
        else:
            b = b - a        
    print (a) 

    
def gcd(a, b):
    if b == 0: return a
    else: return gcd(b, a % b)

  
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

# NOK
def mcd(n, m):
    return (n/gcd(n,m))*m

############################################################################3

def gcd(a,b):
    while a != b:
        if a > b:
            a = a - b
        else:
            b = b - a        
    print (a)

def gcd(a, b)
    while a!=0 and b!=0:
        if a > b:
            a = a % b
        else:
            b = b % a
    return (a + b)
    
############################################################################

def nod(x,y):
   while x*y!=0:
      if x>y: x=x%y
      else: y=y%x
   return x+y
   
############################################################################

def gcd(a, b):
    return b and gcd(b, a%b) or a

############################################################################    

def gcd(n,m):
    if n<m:
        n, m = m, n
    if m<>0:
        return gcd(m, n%m)
    else:
        return n

############################################################################

def gcd(a, b):
    return a if b == 0 else gcd(b, a % b)

def gcd(a, b):
    while b:
        a, b = b, a % b
    return a
############################################################################
def GCD(a,b): # Функция для вычисления НОД при помощи деления
  return a if b == 0 else GCD(b,a%b) # Вычисляем остаток от деления a на b, а заменяем на b, b заменяем на r=a mod b
  # НОД = a если b = 0 иначе НОД=НОД(b,r), r - остаток от деления a на b

############################################################################

#!/usr/bin/env python
a = 18
b = 30
 
while a!=0 and b!=0:
    if a > b:
        a = a % b
    else:
        b = b % a
 
print (a+b)
