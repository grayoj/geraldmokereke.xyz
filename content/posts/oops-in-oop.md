---
title: 'Avoiding The Oops in Oop'
date: 2023-01-05T09:13:23+01:00
draft: true
tags: ['OOP', 'Java', 'Best Practices']
---

# Introduction

There is an awful lot that goes into writing good code that abides by proper Object-Oriented Programming principles. In this tutorial I will basically cover the importance and significance of writing quality code (though I feel that quality code is subjective) thereby avoding "Oops in Oop."

> Note: "Oops" is basically an exclamation made after a significant mistake or accident rather.

### Getting Started

Before being able to follow this tutorial and get the best out of it, you have to meet up with the following perquisites.

1. Java (Java Development Kit)
2. Functioning IDE, Intelli J or Vscode works fine. You can use Netbeans.

If you do not have a Java Installation, kindly proceed to the foruth section.

### Java: OOP's Bastard God Son

What is Java? Java is a general purpose language developed by James Gosling. It fully supports the Object-Oriented Paradigm and runs on the Java Virtual Machine, where it is compiled to Bytecode, that enables it appear as a universal language that can run anywhere! Yes that's right. Fortunately unlike languages like Swift and C# that are platform otherwise operating system dependent - Java runs on all operating systems conveniently. Java is used heavily by huge firms, enterprise organisations, educational and government facilities. Java was the primary choice of development on the Android platform, before the advent of Kotlin's full adoption. Java is stil used for building the server infrastructure for applications, games, mobile applications and so much more. Java's JVM serves as a platform to compile Java programs into bytecode. Not only Java, but the JVM is so powerful that it is used to compile other languages such as Scala and Kotlin which I refer toas Java's cousins.

Diagram of the Java-Virtual-Machine:

![Java Virtual Machine Image](data:image/png;base64,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)

Java comes bundled in a package known as the JDK. The JDK is the Java Development Kit. It comes with the right tools for developing in Java. Not the IDE, but components such as the language itself, the Java Virtual Machine and Java Runtime environment. There are about three Java Editions offered by Oracle. They include: The Standard Edition, Enterprise Edition and Micro Edition.

But in this case, we would be using the Java Standard Edition.

### Installing Java

To install Java is dependent on the operating system you are on. For Windows, it's as simple as getting the installer up and running on yourmachine, and you can download here: [JDK for Windows](https://www.oracle.com/java/technologies/downloads/#jdk19-windows).
Let's use Java 19. Or of you are a terminal dude like myself use Choclatey.

If you're on a MacOS, you can install by opening up your terminal and running:

```shell
brew install openjdk@19
```

That would get you the Open JDK installed using the Homebrew Package Manager. Homebrew is a package management system for Linux and Unix machines that you can use for free. I'm on Linux now, but I prefer to use the `apt-install` package.
For debian Linux, which I am on, run on bash"

```bash
sudo apt install openjdk-19-jdk-headless
```

> On windows, you may need to add JAVA_HOME to your PATH within your environment variables, so you can get it to work globally.

To Verify your installation, run on Linux and Mac:

```shell
javac -version
```

For Windows, run:

```shell
java --version
```

If it prints out your current version for you, then my friend you are good, ready set and up to go.

### Setting up your Environment

It is advisable to use an enabling Integrated Development Environment for ease of development in opposition to the traditional editors such as Emacs, Vim, or even Sublime Text. Please use Visual Studio Code, Netbeans or Intelli J (which by many is the best Java Development IDE available in the market)

### What Exactly Is OOP?

OOP is a programming paradigm, that is responsible for basically writing scalable, functional and organized code for software systems. OOP, known as Object-Oriented-Programming is a model of programming and software design that is conceptualized on the implementation of data types and objects as opposed to functions. For more on Object Oriented Programming, check [here](https://en.wikipedia.org/wiki/Object-oriented_programming).

I won't really dive deep into OOP, but you get the context here.

### Principles of OOP

OOP has several principles that govern its implementation in programming. They include:

1. Encapsulation
2. Inheritance
3. Polymorphism
4. Abstraction

Those are thr four basic principles we will cover. We will leave out composition and aggregration for another day.

**1. Encapsulation**

Not to confuse with abstraction, is a means of data security to help protect your daya stored in a class from unauthorised access. Anytime you come across methods such as Public, Private and Protected, these are methods of encapsualtion to save gaurd your code.

**2. Inheritance**

This is one of my favourite concepts of OOP. Inheritance is a means of referencing classes in code, i.e Parent to Child, otherwise Superclasses (Parent Classes) to Base Classes. By employing the `extend` keyword each time, you tell Java to implement inheritance. Inheritance pretty much solves the **DRY Problem** which is "Do not Repeat Yourself."

**3. Polymorphism**

Polymorphism is how a program can execute an action in different ways. Polymorphism has two forms in the Java Programming language, which includes method overloading (when various functions with the same name are within a class) and method overriding (when a child class overrides the parent method)

**4. Abstraction**

This is a process used to hide the overall complexity from users and present information that is relevant. In Java you can hide the details of implementation using interfaces or abstract classes. Abstraction also helps present the important piece of functionality.

### Putting in Practice

Let's write some code to implement the above principles of Object Oriented Programming. 

**1. Encapsulation/Data Hiding**

You may have seen this example before. To find the area of a rectangle.

```java
// Create parent class to accept fields.
class Area {
  int breadth;
  int length;

  // Initialize Values
  Area(int length, int breadth) {
      this.length = length;
      this.breadth = breadth; 
    }

  // Function to calculate the Area
  public void CalcArea() { 
      int area = length * breadth;
      system.out.println("Area: " + area);
    }
} 
class Main {
  public static void man(string[] args) {
    Area rectangle = new Area(2. 16);
    rectangle.calcArea():
  }
}

```

This example above is to calculate the area of a rectangle. So included the two fields otherwise variables inside a single class which is accessible from other classes.