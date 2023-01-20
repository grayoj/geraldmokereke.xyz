---
title: 'Avoiding The Oops in Oop'
date: 2023-01-05T09:13:23+01:00
draft: false
tags: ['OOP', 'Java', 'Best Practices']
---

# Introduction

There is an awful lot that goes into writing good code that abides by proper Object-Oriented Programming principles. In this tutorial I will basically cover the importance and significance of writing quality code (well though I feel that is subjective) thereby avoiding "Oops in Oop" problems.

> Note: "Oops" is basically an exclamation made after a significant mistake or accident rather.

### Getting Started

Before being able to follow this tutorial and get the best out of it, you have to meet up with the following perquisites.

1. Java (Java Development Kit)
2. Functioning IDE, Intelli J or Vscode works fine. You can use Netbeans.

If you do not have a Java Installation, kindly proceed to the fourth section.

### Java: OOP's Bastard God Son

What is Java? Java is a general purpose language developed by James Gosling basically. It fully supports the Object-Oriented Language and runs on the Java Virtual Machine, where it is compiled to Bytecode, that enables it appear as a universal language that can run anywhere! Yes that's right, fortunately unlike languages like Swift and C# that are platform otherwise operating system dependent - Java runs on all operating systems conveniently. Java is used heavily by huge firms, enterprise organisations, educational and government facilities. Java was the primary choice of development on the Android platform, before the advent of Kotlin's full adoption. Java is still used for building the server infrastructure for applications, games, mobile applications and so much more. Java's JVM serves as a machine to compile Java programs into bytecode. Not only Java, but the JVM is so powerful that it is used to compile other languages such as Scala and Kotlin which I refer to as Java's cousins.

Diagram of the Java-Virtual-Machine:

![Java Virtual Machine Image](https://upload.wikimedia.org/wikipedia/commons/d/dd/JvmSpec7.png)

For better visualisation, kindly see the diagram above so it's clear.

Java comes bundled in a package known as the JDK. The JDK is the Java Development Kit, that comes with the right tools for developing in Java. Not the IDE, but components such as the language itself, the Java Virtual Machine and Java Runtime environment. There are about three Java Editions offered by Oracle. They include: Standard Edition, Enterprise Edition and Micro Edition.

But in this case, we would be using the Java Standard Edition.

### Installing Java

To install Java is dependent on the operating system you are on. For Windows, it's as simple as getting the installer up and running on your machine, and you can download here: [JDK for Windows](https://www.oracle.com/java/technologies/downloads/#jdk19-windows)
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

> On windows, you may need to add `JAVA_HOME` to your environment variables to get it up and running.

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

I usually advice people to use an enabling Integrated Development Environment for ease of development in opposition to the traditional editors such as Emacs, Vim, or even Sublime Text. Please use Visual Studio Code, Netbeans or Intelli J (which by many is the best Java Development IDE available in the market)

### What Exactly Is OOP?

OOP is a programming paradigm, that is responsible for basically writing scalable, functional and organised code for software systems. OOP, known as Object-Oriented-Programming is a model of programming and software design that is conceptualised on the implementation of data types and objects as opposed to functions. For more on Object Oriented Programming, check [here](https://en.wikipedia.org/wiki/Object-oriented_programming)

I won't really dive deep into OOP, but you get the context here.

### Principles of OOP

OOP has several principles that govern its implementation in programming. They include:

1. Encapsulation
2. Inheritance
3. Polymorphism
4. Abstraction

Those are the four basic principles we will cover. We will leave out composition and aggregation for another day.

**1. Encapsulation**

Not to confuse with abstraction, is a means of data security to help protect your data stored in a class from unauthorised access. Anytime you come across methods such as Public, Private and Protected, these are methods of encapsulation to save guard your code.

**2. Inheritance**

This is one of my favourite concepts of OOP. Inheritance is a means of referencing classes in code, i.e Parent to Child, otherwise Superclasses (Parent Classes) to Base Classes. By employing the `extend` keyword each time, you tell Java to implement inheritance. Inheritance pretty much solves the **DRY Problem** which is "Do not Repeat Yourself."

**3. Polymorphism**

Polymorphism is how a program can execute an action in different ways. Polymorphism has two forms in the Java Programming language, which includes method overloading (when various functions with the same name are within a class) and method overriding (when a child class overrides the parent method)

**4. Abstraction**

This is a process used to hide the overall complexity from users and present information that is relevant. In Java you can hide the details of implementation using interfaces or abstract classes. Abstraction also helps present the important piece of functionality.

### Putting in Practice
