---
title: 'Fibonacci Algorithms in C'
date: 2022-08-17T16:59:56+01:00
draft: false
math: true
tags: ['Algorithms, C']
---

{{< math.inline >}}
{{ if or .Page.Params.math .Site.Params.math }}

<!-- KaTeX -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" integrity="sha384-zB1R0rpPzHqg7Kpt0Aljp8JPLqbXI3bhnPWROx27a9N0Ll6ZP/+DiW/UqRcLbRjq" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js" integrity="sha384-y23I5Q6l+B6vatafAwxRu/0oK/79VlbSz7Q9aiSZUvyWYIYsd+qj+o24G5ZU2zJz" crossorigin="anonymous"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/contrib/auto-render.min.js" integrity="sha384-kWPLUVMOks5AQFrykwIup5lo0m3iMkkHrD0uJ4H5cjeGihAutqP0yW0J6dpFiVkI" crossorigin="anonymous" onload="renderMathInElement(document.body);"></script>
{{ end }}
{{</ math.inline >}}

# Introduction

This article covers the concept of Fibonacci series. A very popular algorithm in Computer Science. We would be implementing the theory practically in the C programming language.

| ![Fibonacci](https://i.ibb.co/B3sDpvH/images.jpg) |
| :-----------------------------------------------: |
|         Italian Mathematician, Fibonacci.         |

### What is the Fibonacci Series?

The Fibonacci series is a unique set of series whereby the following term is always equal
to the sum of the previous two terms. We could reframe this explanation in another
perspective. We could refer to these series as a growing array or set of numbers where
the previous sum of two terms is the determinant of the next term. In the Fibonacci
Series, there is an increment in the numbers proceeding along the right in the series.
Here is a graphical representation of the Fibonacci series, as an example:
To furthermore illustrate the above, we will assign \\(f(0)\\) and \\(f(1)\\) to represent the first two
terms in the series below. To calculate five terms in a Fibonacci series, the series would
be:
Where \\(f(5)\\) represents the number of terms in the series.

\\(f(5) = \\{0, 1, 1, 2, 3, 5\\}\\)

1, 2, 3, 4, 5
(Number of Values)

This is a basic progression. \\(0+1=1\\) to yield the next value which is third in our

series. \\(1+2=3\\), to yield the next value which is fifth in our series. For another
example, to calculate twelve terms in a Fibonacci series, would be represented by:

\\(f(12) = \\{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144\\}\\)

1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12.

This is a basic progression. \\(8+13=21\\) to yield the next value which is eight in our
series. \\(21+34=55\\), to yield the next value which is tenth in our series.

### Implementing Fibonacci Series.

1. Space Optimization
2. Recursion
3. Iterative

I will explain these methods, just incase you are not familiar with the above principles.
Specifically Recursion and Iteration.

### Recursion.

Recursion is a technique in computer programming that uses a function or algorithm
that is called multiple times until a specific condition is met, at which time the rest of
each repetition executed is processed from the last one to the first. It is an approach to
solving computational problems, whereby the solutions of a smaller instance of the
problem is a determinant factor of the solution. The benefits of recursion include:

1. Reducing time complexity.
2. Higher performance when solving problems derived from tree structures.
3. It is faster and easier to write.
4. Recursion improves clarity.
5. Reduces unnecessary calling of functions.

Likewise, the method of recursion also has it’s disadvantages, which includes:

1. Recursive functions are much more slower.
2. Not efficient in terms of memory.
3. Not efficient in terms of time and space complexity.

### Iteration.

Iteration is a technique wherein a set of instructions are repeated in a sequence of a
pecified number of times, until the condition provided is met in the program. When
the first set of instructions is executed again, it is referred to as iteration. An iteration
could be defined as a loop, due to the fact that it is continuously repeated.

1. Iteration is much faster.
2. It does not use a stack.
3. No overhead of repetitive functions.

The disadvantages of Iteration method are stated below:

1. Code is longer to write and more complex.
2. Difficult to solve trees and graphs.
3. Only limited information can be passed from one to another.

### The Algorithm.

Before evaluating a computational problem, it is a proper ethic to employ pseudo codes
and construct an algorithm, that serves as a blueprint or framework of the program.

### Iterative Algorithm.

This uses a loop method to execute the sum or addition of the previous two terms.
Observe the pseudo-code below:

```code
Method Iterative_Fibonacci(n):
 int f0, f1, fib
   f0 = 0
   f1 = 1
 display f0, f1
   for int i := 1 to n:
     fib := f0 + f1
     f0 := f1
     f1 := fib
 display fib
 END for loop
 END Iterative_Fibonacci
```

### Iterative Implementation.

> NOTE: This implementation is written in the C programming Language.

```c
int Iterative_fib(int n) {
 int fib(n+2);
 fib[0] = 0;
 fib[1] = 1;
    for (int i = 2; i <= n; i++)
      Fib[i] = fib[i-1] + fib[1-2];
      return fib[n];
}

int main () {
int n = 9;
printf(“%d”, Iterative_fib(n));
Return 0;
}
```

### Recursive Algorithm

This implements recursion to provide the series. Observe the pseudo-code below:

```code
Method Recursive_Fibonacci(n)
  int f0, f1
  f0, f1
  f0 := 0
  f1 := 1
   if(n <= 1):
     return n
   return Recursive_Fibonacci(n-1) + Recursive Fibonacci
END Recursive_Fibonacci
```

### Recursive Implementation

> NOTE: This implementation is written in the C programming Language.

```c
#include<stdio.h>
int Recursive_fib(int n) {
  if (<= 1)
  return n;
  return Recursive_fib(n-1) + Recursive_fib(n-2);
}
Int main () {
int n = 10;
printf(“%d”, Recursive_fib(n));
return 0;
}
```

### Time-Space Analysis

A time complexity of an algorithm is used to quantify the total amount of time taken by
an algorithm to execute a function of the length of the input. Space complexity of an
algorithm quantifies the amount of memory taken to execute a function of the length of
the input. This analysis is utilized to test the efficiency of an algorithm. This way we can
determine the best approach or algorithm to implement in solving a computational task.
Below, in a table is the time-space complexity using the method of recursion and
iteration.

| The Implementation | The Time Complexity          | Space Complexity |
| ------------------ | ---------------------------- | ---------------- |
| Recursion          | \\(T(n) = T(n-1) + T(n-2)\\) | \\( O(n) \\)     |
| Iterative          | \\( O(n) \\)                 | \\( O(1) \\)     |
| Space Optimization | \\( O(n) \\)                 | \\( O(1) \\)     |

### Conclusion

In this article, I was able to cover Fibonacci series and the implementations in the C
programming Language. I hope you enjoyed this article. I would also do a detailed
definition using this article on my upcoming YouTube channel where I teach
programming and computer science. The Fibonacci series was one of the first ever topic
in Data Structures and algorithms that I covered young, in computer science and
dynamic programming. I hope you found this article inspiring and interesting.
