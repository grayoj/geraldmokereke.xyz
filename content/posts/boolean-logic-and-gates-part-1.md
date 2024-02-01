---
title: "Boolean Logic and Gates Part One"
date: 2023-10-08T19:46:32+01:00
draft: false
banner: https://www.visitlincolnshire.com/wp-content/uploads/2022/11/George-Boole-Statue-1.png
cover:
  image: "https://www.visitlincolnshire.com/wp-content/uploads/2022/11/George-Boole-Statue-1.png"
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: "V"
  caption: "A statue of George Boole"
relative: false # To use relative path for cover image, used in hugo Page-bundles
---

> This is part one of the [Boolean Logic and Gates series]().

Worthy to think George Boole may actually be the grandfather of the digital world.
![grandfather of the digital world](https://www.visitlincolnshire.com/wp-content/uploads/2022/11/George-Boole-Statue-1.png)

## Brief Overview

Boolean Logic is quintessential to the field of computer science and programming
in general. It is an integral component and foundational cornerstone to the way
digital circuits are constructed and data is manipulated.

[I've been revisting a lot of content concerning Boolean Logic](https://www.youtube.com/watch?v=JQBRzsPhw2).
Boolean Logic and Logic Gates, were among the topics I enjoyed while in high
school in my computer science class.

In this essay — I will be taking you down a nice path on Boolean Logic, the
implementation and Gates. Let's get started.

## What is Boolean Logic?

Boolean Logic is a mathematical system used to represent values that can be
manipulated, which is either 0 (FALSE) or 1 (TRUE)

The number system implemented here, which is 0 and 1, is known as the
[binary system](https://en.wikipedia.org/wiki/Binary_number#:~:text=A%20binary%20number%20is%20a,a%20bit%2C%20or%20binary%20digit.).

This is simply Boolean Logic in a nutshell. Let's review Logic Gates so you
understand where these principles apply.

## Logical Operations

Boolean logic defines a set of logical operations that can be performed on
provided binary variables. The three primary logical operations in Boolean logic
include:

- Conjunction (AND): The AND operation always returns true (1) if and only if
  both of its inputs are true. In symbolic notation, it is represented as "∧" or
  simply by multiplication, such as A \* B.

- Disjunction (OR): The OR operation returns true (1) if at least one of its
  inputs is true. In symbolic notation, it is represented as "∨" or by addition,
  such as A + B.

- Negation (NOT): The NOT operation is a unary logic operator that returns the
  opposite value of its input. If the input is true, it returns false, and if
  the input is false, it returns true. In symbolic notation, it is represented
  as "¬" or simply by a bar over the variable, such as ¬A.

Boolean Logic still includes other operations such as XOR, XNOR, NAND, and NOR
which are combinations between the standard three operations as aforementioned
above.

These principles are applied every day to electronics and computer programming.
It's common to set theory — which you did in your high-school mathematics or
computer science class.

## Logic Gates

[Logic Gates](https://www.techtarget.com/whatis/definition/logic-gate-AND-OR-XOR-NOT-NAND-NOR-and-XNOR#:~:text=A%20logic%20gate%20is%20a,of%20logic%20gates%20in%20them)
are a building block in computer science and electronics which describe a
digital circuit that takes in one or more inputs in binary and produces either a
single or multiple outputs. They handle binary data.

We have several types of logic gates — inheriting those concepts of Boolean
Logic.

- **AND Gate** The AND gate performs a logical "and" operation on two inputs, A
  and B. It mimics the logical "and" operation. We could describe the AND Gate
  above below using a logic table:

|  A  |  B  |  Q  |          Description          |
| :-: | :-: | :-: | :---------------------------: |
|  0  |  0  |  0  | If A is 0 AND B is 0, Q is 0. |
|  0  |  1  |  0  | If A is 0 AND B is 1, Q is 0. |
|  1  |  0  |  0  | If A is 1 AND B is 0, Q is 0. |
|  1  |  1  |  1  | If A is 1 AND B is 1, Q is 1. |

We could express this logic gate in code using C++ below:

```c
#include <iostream>

bool AND(bool a, bool b) {
    return a && b;
}

int main() {
    bool a = true;
    bool b = false;
    bool q = AND(a, b);
    std::cout << a << " AND " << b << " = " << q << std::endl;
    return 0;
}
```

For the corresponding cases in the table, we can express it below as so:

```c
#include <iostream>

bool AND(bool A, bool B) {
    return A && B;
}

int main() {
    bool A, B, Q;

    // Case 1: A = 0, B = 0
    A = false;
    B = false;
    Q = AND(A, B);
    std::cout << "If A is " << A << " AND B is " << B << ", Q is " << Q << std::endl;

    // Case 2: A = 0, B = 1
    A = false;
    B = true;
    Q = AND(A, B);
    std::cout << "If A is " << A << " AND B is " << B << ", Q is " << Q << std::endl;

    // Case 3: A = 1, B = 0
    A = true;
    B = false;
    Q = AND(A, B);
    std::cout << "If A is " << A << " AND B is " << B << ", Q is " << Q << std::endl;

    // Case 4: A = 1, B = 1
    A = true;
    B = true;
    Q = AND(A, B);
    std::cout << "If A is " << A << " AND B is " << B << ", Q is " << Q << std::endl;

    return 0;
}
```

- **OR Gate** The OR Gate performs a logical "OR" operation on two inputs, A and
  B. It mimics the logical "OR" operation. We could describe the output signals
  of the OR Gate using the table below:

| A   | B   | Q   | Description                  |
| --- | --- | --- | ---------------------------- |
| 0   | 0   | 0   | If A is 0 OR B is 0, Q is 0. |
| 0   | 1   | 1   | If A is 0 OR B is 1, Q is 1. |
| 1   | 0   | 1   | If A is 1 OR B is 0, Q is 1. |
| 1   | 1   | 1   | If A is 1 OR B is 1, Q is 1. |

We could express this in Code using C++ below:

```c
#include <iostream>

bool OR(bool a, bool b) {
    return a || b;
}

int main() {
    bool a = true;
    bool b = false;
    bool q = OR(a, b);
    std::cout << a << " OR " << b << " = " << q << std::endl;
    return 0;
}
```

For the corresponding cases in the table, we can express it below as so:

```c
#include <iostream>

bool OR(bool A, bool B) {
    return A || B;
}

int main() {
    bool A, B, Q;

    // Case 1: A = 0, B = 0
    A = false;
    B = false;
    Q = OR(A, B);
    std::cout << "If A is " << A << " OR B is " << B << ", Q is " << Q << std::endl;

    // Case 2: A = 0, B = 1
    A = false;
    B = true;
    Q = OR(A, B);
    std::cout << "If A is " << A << " OR B is " << B << ", Q is " << Q << std::endl;

    // Case 3: A = 1, B = 0
    A = true;
    B = false;
    Q = OR(A, B);
    std::cout << "If A is " << A << " OR B is " << B << ", Q is " << Q << std::endl;

    // Case 4: A = 1, B = 1
    A = true;
    B = true;
    Q = OR(A, B);
    std::cout << "If A is " << A << " OR B is " << B << ", Q is " << Q << std::endl;

    return 0;
}
```

- **NOT Gate**

The NOT Gate performs a logical "NOT" operation. It is the simplest Gate. It
takes one bit as input and produces an output signal which is the reverse or
opposite of the received input. We can illustrate this below with the logic
table:

| A   | Q   | Description                |
| --- | --- | -------------------------- |
| 0   | 1   | If A is 0, Q is 1 (NOT 0). |
| 1   | 0   | If A is 1, Q is 0 (NOT 1). |

We can express the NOT gate also in C++ likewise for clarity:

```c
#include <iostream>

bool NOT(bool a) {
    return !a;
}

int main() {
    bool a = true;
    bool q = NOT(a);
    std::cout << "NOT " << a << " = " << q << std::endl;
    return 0;
}
```

Then we can derive the case in code too:

```c
#include <iostream>

bool NOT(bool A) {
    return !A;
}

int main() {
    bool A, Q;

    // Case 1: A = 0
    A = false;
    Q = NOT(A);
    std::cout << "If A is " << A << ", Q is " << Q << std::endl;

    // Case 2: A = 1
    A = true;
    Q = NOT(A);
    std::cout << "If A is " << A << ", Q is " << Q << std::endl;

    return 0;
}
```

This brings an end to the first part of the series. If you want to see the next,
stay tuned.
