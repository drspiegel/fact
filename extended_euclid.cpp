#include <stdio.h>
#define DEBUG

// расширенный алгоритм Евклида
void extended_euclid(long a, long b, long *x, long *y, long *d)
/* calculates a * *x + b * *y = gcd(a, b) = *d */
{
  long q, r, x1, x2, y1, y2;
  if (b == 0) {
    *d = a, *x = 1, *y = 0;
    return;
  }

  x2 = 1, x1 = 0, y2 = 0, y1 = 1;

  #ifdef DEBUG
  printf("------------------------------");
  printf("-------------------\n");
  printf("q    r    x    y    a    b    ");
  printf("x2   x1   y2   y1\n");
  printf("------------------------------");
  printf("-------------------\n");
  #endif

  while (b > 0) {

    q = a / b, r = a - q * b;

    *x = x2 - q * x1, *y = y2 - q * y1;

    a = b, b = r;

    x2 = x1, x1 = *x, y2 = y1, y1 = *y;

    #ifdef DEBUG
    printf("%4ld %4ld %4ld %4ld ", q, r, *x, *y);
    printf("%4ld %4ld %4ld %4ld ", a, b, x2, x1);
    printf("%4ld %4ld\n", y2, y1);
    #endif

  }

  *d = a, *x = x2, *y = y2;

  #ifdef DEBUG
  printf("-------------------\n");
  #endif
}

// главная фукнция
int main(void)
{
  long a = 4864, b = 3458, d, x, y;
  extended_euclid(a, b, &x, &y, &d);
  printf("x = %ld y = %ld d = %ld\n", x, y, d);
  return 0;
}

// =================================================================

int gcdex(int a, int b, int &x, int &y) {
  if (b == 0) {
    x = 1;
    y = 0;
    return a;
  }
  int x1, y1;
  int d1 = gcdex(b, a % b, x1, y1);
  x = y1;
  y = x1 - (a / b) * y1;
  return d1;
}

// Function returns 1 if such element doesn't exist and 0 if exists and puts it
// in result.
int ReverseElement(int a, int N, int &result) {
  int x, y, d;
  d = gcdex(a, N, x, y);
  if (d != 1) {
    return 1;
  } else {
    result = x;
    return 0;
  }
}

// =================================================================

function dioph2( a,b:int64; var x0,y0:int64 ):int64;
var x1,y1,q,r,x,y:int64;
begin
  x0 := 1; y0 := 0;
  x1 := 0; y1 := 1;
  while b <> 0 do begin
    q := a div b; { Частное }
    r := a mod b; { Остаток }
    a := b;
    b := r;
    x := x0 - x1 * q; y := y0 - y1 * q;
    x0 := x1; y0 := y1;
    x1 := x; y1 := y;
  end;
  dioph2 := a; { НОД(a,b) }
end;
