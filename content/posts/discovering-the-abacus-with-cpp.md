---
title: "Discovering the Binary Abacus With C++"
date: 2023-09-23
draft: false
cover:
  image: "https://static.vecteezy.com/system/resources/previews/021/875/452/original/wooden-abacus-outline-drawing-illustration-isometric-style-3d-colored-abacus-ancient-calculator-calculating-tool-with-wooden-beads-sliding-on-wires-chinese-abacus-line-art-vector.jpg"
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: "V"
  caption: "A standard abacus"
  relative: false # To use relative path for cover image, used in hugo Page-bundles
  showToc: false
---

## The Binary Abacus

An abacus was one of the earliest computing devices created that was used to
perform the four basic operations in mathematics — addition, subtraction,
multiplication, and division.

> In this article, we are going to be designing a binary abacus from scratch
> using C++

This program will be CLI/Terminal based. We would not need any GUI software
necessary to begin. I got interested by stumbling across the video below:

{{< youtube okF9_LzkMi4 >}}

Firstly we must understand what an abacus does, and how it works.
[Here's a video
explaining in depth how an Abacus works](https://www.youtube.com/watch?v=A1eItdu85hM)
— available operations — and how to use it in general. A binary abacus is
different and it is what we will be building. However, it is pertinent that you
understand the functionality of the standard abacus.

A binary abacus is merely an abacus that operates the binary system. While the
binary abacus works with base two, the standard abacus works with base ten.

The normal abacus allows values from 0 - 9 to be manipulated and worked with,
but with the binary abacus you're constrained to 1 and 0. The binary abacus can
perform operations available in the binary system, which you would see as you
follow this article.

## Structure of the Binary Abacus

The binary abacus has the following components which make up its Structure:

- **Frame**: This is the structure of the abacus.
- **Rod**: These are the stick, slender-like structures each containing a bead
  (called node in the project implementation) We will also be using two rods to
  keep this implementation as simple as possible.
- **Beads**: The beads are called nodes and are used to perform the
  calculations.

The frame is the body of the abacus, where the rods are fixed. The beads are on
each rod and can be moved vertically — at least in this visual structure I am
attempting to illustrate.

So, let's start building already:

> Things to note: I referred to **beads** as nodes. That's the only significant
> change.

## The Implementation

- The first thing we would need to do is carry out some imports.

```c
// import necessary libraries.
#include <iostream>
#include <vector>
```

- Secondly, we create the abacus Class and define the rods in a private class.

```c
class BinaryAbacus {
private:
    std::vector<bool> rod1;  // First rod (represents 2^0)
    std::vector<bool> rod2;  // Second rod (represents 2^1)
}
```

- Now we've created the rods, we can create the bead (node) and this would be an
  integer value, like so:

```c
public:
    BinaryAbacus(int numNodes) : rod1(numNodes, false), rod2(numNodes, false) {}
```

- Next, we would need to display the values of the abacus effectively. To do
  this, we create a function to display and update the state of the Abacus:

```c
    // Display the state of the binary abacus
    void display() const {
        std::cout << "Rod 1: ";
        for (bool node : rod1) {
            std::cout << (node ? "1" : "0") << " ";
        }
        std::cout << std::endl;

        std::cout << "Rod 2: ";
        for (bool node : rod2) {
            std::cout << (node ? "1" : "0") << " ";
        }
        std::cout << std::endl;
    }
```

- Since this is a vertical structure, we need to write a function that controls
  the movement of the nodes up and down the _first_ rod.

```c
// Move a node up on the first rod
void moveUpRod1(int nodeIndex) {
    if (nodeIndex >= 0 && nodeIndex < rod1.size()) {
        rod1[nodeIndex] = true;
    }
}
```

```c
// Move a node down on the first rod
void moveDownRod1(int nodeIndex) {
    if (nodeIndex >= 0 && nodeIndex < rod1.size()) {
        rod1[nodeIndex] = false;
    }
}
```

Here, we created methods to move the bead (node) up and down on the first rod.

```c
    // Move a node up on the second rod
    void moveUpRod2(int nodeIndex) {
        if (nodeIndex >= 0 && nodeIndex < rod2.size()) {
            rod2[nodeIndex] = true;
        }
    }

    // Move a node down on the second rod
    void moveDownRod2(int nodeIndex) {
        if (nodeIndex >= 0 && nodeIndex < rod2.size()) {
            rod2[nodeIndex] = false;
        }
    }
```

Here, we created methods to move the bead (node) up and down on the second rod.

- Lastly, the main function that handles the beads (nodes) and movea them
  accordingly.

```c
int main() {
    // Create a binary abacus with 5 nodes on each rod
    BinaryAbacus abacus(5);

    // Move some nodes to represent binary values
    abacus.moveUpRod1(1);  // Rod 1: 00100
    abacus.moveUpRod2(2);  // Rod 2: 00010
    abacus.moveUpRod1(3);  // Rod 1: 00101

    // Display the state of the binary abacus
    abacus.display();

    return 0;
}
```

There. We have correctly implemented a binary abacus from in C++ from scratch.
Hope you enjoyed it. Will be back in the next one.
