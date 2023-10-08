---
title: "Unspoken Flaws of Dynamic Languages"
date: 2023-10-03T21:00:01+01:00
draft: false
cover:
  image: "https://i.redd.it/wtbzgdt2i6j71.jpg"
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: "V"
  caption: "Meme on Dynamic typing"
relative: false # To use relative path for cover image, used in hugo Page-bundles
---

> Disclaimer: Possible rant session.

## Introduction

I decided to write this essay after the recent rebuttals from the Vanilla
JavaScript community towards Typescript — Typecasting, Typesafety — call it
whatever you wish.

A lot of people who got into programming probably began with dynamic programming
languages — such as Ruby, PHP, Perl, and Python, for example. Hence, being their
"first love," it's really hard trying to convince them that those languages may
not be the best choice for large codebases where a lot of collaboration is
needed. Not only that, but runtime errors and clear-in-the-night sky type errors
go unnoticed.

This is bad. Some people would say otherwise, but hear me out. It's actually
bad.

For this article, we would be focusing heavily on the most popular language
there is and the web's backbone – Javascript.

## Javascript

Javascript, as you know, is a dynamic programming language used primarily for
web development. But thanks to the brilliant programming community and Meta,
we've seen Javascript used to build mobile applications using react native — a
library that I pretty much love.

Building in javascript or infact learning the language as a newbie appears to be
a seamless experience. It's less verbose. No matter your editor, it's not
throwing you red dots across your entire editor. It appears to be interpreted
to. It runs as you decide to execute the program.

You can even work outside the browser with javascript, as you know, by using
Nodejs. It's a cool runtime for javascript applications that can act as a server
as well.

So, javascript is fun. Yes, this doesn't mean it lacks a syntax. It has a
syntax. But it's intuitive and with less boilerplate. You know what I'm talking
about, friend? Or do you need me to refresh your memory with a "hello world"
program in C++ or Java?

Hmm. I guess not.

## Javascript bottlenecks

Despite javascript being dynamic, it was used to write Nodejs — basically. It
was also used to write some of the most popular, existing javascript frameworks
and libraries that you install via your favourite package manager. It was all
fine, no issues.

Then problems began to arise. The problem was that most of these libraries had
an awful amount of code to maintain and refactor, which was made hard due to the
lack of types in the codebase.

- OS (open source) developers had a hard time maintaining the existing codebase
  due to the lack of types, I could only imagine their pain, sigh.
- Developers who wanted to contribute and got into the codebase were confused.
- The fact that these libraries being used in production by enterprises was
  written in Javascript, this complicated things.
- Documenting, extending code with an absence of proper type annotations was
  risky.

## JSDoc's not the solution

So, then they brought out JSDoc. Funny, I didn't like JSDoc – not at all. It's
essentially a way to define types explicitly used in your javascript code.

I know. Why castigate a solution to a problem you've just complained about?
Here's my reasons.

## My Reasons

It's mainly a documentation tool. It's adding type annotations, yes, but it's
not technically enforcing them. Then again, it's not Typescript. It's not just
Typescript. JSDoc, from my point of view, only negates one thing "Type
annotations." But it doesn't enforce it, that's my problem. Hence, statically
typed languages rule.

That's why Typescript is just much, much better. Typescript gives you way more
quality code with type annotations applied to the code, which is readable
without the use of a "JSDoc" and is enforced. Typescript features a type
inference — which examines your code for possible hitches and glitches, i.e.,
(absence of type annotations), and enforces it. Hence, you get a statically
typed javascript — if that makes sense.

Featuring union types, generics, interfaces, and a powerful toolchain makes you
question the decisions of most developers to drop Typescript and embrace raw
Javascript in their codebases.

According to most people, they feel the type of annotations on the code is
unnecessary and creates an unnecessary overhead or abstraction over the code.
It's really weird to me, though. I know I'm biased towards statically typed
languages, but what?

Typescript code is frankly pretty if you'd ask me. What and where exactly is the
clutter? You know, sometimes I assume a lot of people are trolling. This flashes
me back to [Ben Awad's April Fool on Dropping Typescript]().

## Facts don't care about feelings

Now, this is one major flaw and the perils of being too stuck in the dynamic
land. Every single code with type enforcement and annotations would appear like
clutter. Or as verbose. Or "too strict." Or "slowing down my productivity."

I think it is okay to sacrifice the "productivity," which is spawning unsafe,
unmaintainable code in the future that may give you issues in production due to
type errors, for using a tool like Typescript

The downside to dynamic programming languages is the sense of entitlement they
give you. Future pain is masked as freedom. Laugh now, cry later.

Dynamic programming languages like Python too become very disgusting to maintain
and glance upon in large codebases.

Companies migrated from Ruby on Rails due to its dynamic nature and its lack of
type safety and type checking. I remember outrightly rejecting an offer to work
on a legacy Ruby codebase — with 0 type safety. Nothing. It would've been a
circus in there.

Lastly, no JSDoc is preventing Undefined or null in runtime either. It can't.

Now, this is not to downplay any of these languages. I still believe Python is a
fantastic choice for automating, scripting, prototyping software, and, in fact,
writing complicated machine learning models. So you can focus on the
implementation and not mind verbosity.

I still do believe Lua is great as well despite being dynamic as it lets us
craft the best IDE in the world, neovim. Better features.

Ruby lets you modify classes and objects at runtime.

PHP, too, but supports OOP, and around good tooling, you can really get the best
out of it. To even languages like LISP.

The point of contention is — dynamic languages do have flaws in real codebases.
It's important to understand this — and not absolutely downplay the importance.

To libraries that decided to drop it like Svelte. Fortunately, I never really
invested in the library anyway. Remain unbothered today, tomorrow, and forever
as long as your favourite library doesn't drop Typescript.
