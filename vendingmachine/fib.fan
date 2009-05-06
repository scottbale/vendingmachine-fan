#! /usr/bin/env fan
class Fibonacci
{
  	
  static Void main() 
  { 
  	echo("fib") 
  	echo(fibNum(5))
  	echo(fib.call([5]))
  }

  const static Func fib := |Int i->Int|{
    if (i==0) return 1;
    if (i==1) return 1;
    
    // return ((Int)fib.call([i-2])) + ((Int)fib.call([i-1]))
    // a+b is shortcut for a.plus(b) which is statically typed,
    // below, try a->plus(b) instead to avoid casting
    return fib.call([i-2])->plus(fib.call([i-1]))
    
  }

  static Int fibNum(Int i) 
  { 
  	if (i==0) return 1;
  	if (i==1) return 1;
  	return fibNum(i-2) + fibNum(i-1)
  }
}