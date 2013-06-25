---
layout: post
title: Scala for Rubyists (Part One)
---
## Why should you care about Scala?
You should be interested in Scala because it has properties that make an it attractive tool for doing development. Having worked in a few different contexts: academia, a startup, a more company, and open source. I've found the language to be one of the first tools I reach for. There are a few reasons for this, Scala is:

- concise
- scalable (wrt to the language and its abstractions)
- fast
- productive 
- mature
- correct

Scala also has an advanced type systems, allowing one to encode very powerful abstractions(which we will talk about later in the series). I believe that a sufficiently good type system allows a measure of productivity and safety not found in many other languages. Although many people love dynamic languages for their developer productivity these languages have away traded 
safety and performance in turn. Scala is able to achieve a good balance between developer happiness, and safety.

I hope that as a computer scientist or engineer that you may just be interested in a new language for learning's sake. But if you need a motivation, lets detail one now(if you are sold on checking Scala out feel free to move to part 2).

### Motivation
For many Scala is interesting is as an alternative for or complement to Ruby. Some heavy users of Ruby have actually turned away from the language in favor of Scala. The canonical example of this is Twitter. The ran into massive scaling issues(circa 2007). Since then they have moved most of their backend services into Scala. This has paid off and allowed them to handle the massive load of events like the 2012 presidential election with ease. You don't need to be Twitter's size to run into scaling problems. You could have a host of similar scaling problems as you transition from being small company to a larger one.  

Let's say that you are in fact having performance issues in your stack, what do you do?

You could try carefully optimizing each piece, heavily profiling them, isolating precise problems areas, and then optimizing them. Most likely generating inelegant code that obfuscates your logic in the process. Even after expending a lot of effort it may not be enough.

Traditionally when developers needed performance they went to these languages:

- C
- C++
- Java
- C#

The first two are not great choices if you love Ruby. C and C++ require very rigid coding practices to avoid memory bugs, and offer very little in terms of abstraction. Debugging the corner case behavior can be a major time sink even for experienced developers.

While Java and C# are definitely an improvement in some ways, removing a huge class of bugs, and providing relatively efficient code due to their JIT compilers. Expressiveness is only somewhat improved, and there is an added burden of having to heavily annotate types. In the case of Java expressiveness is actually reduced somewhat due to features, which aid writing expressive code (templates, operator overloading, lambdas, ect.) not being part of the language.

I would like to argue that one doesn't have to give up the fun and ease of programming for scalability or efficiency. Luckily, there are viable new alternatives to the old guard.

If you look to *new* languages people seem to be the most excited about, the list would seem to be:

- Clojure
- Go
- Haskell
- Rust
- Scala

### Clojure
Clojure has some very interesting features and is much more performant than MRI Ruby, or CPython. It provides
access to Java code through interoperability features. I don't think its the best option for people looking to complement or replace something like Ruby. As a Lisp there is a large syntax departure. With many parts of the language being macros. It makes for an inconsistent and sometimes confusing learning experience as one learns to differentiate between macros, and functions differing behavior. One of the biggest challenges I found while writing Clojure is that it tries very hard to be dynamic both and pure, each bringing challenges with it.
It doesn't' net as big performance gains as other options, so it is a questionable switch if you are seeking performance.

### Go
Go is appearing often these days, and seems to be growing steadily in popularity. In my opinion Go is by far the worst option. It feels more like ALGOL 68 then anything new. The history of the language's designers and their opinions about 'advanced' features resulted in what I consider to be
major failures, primarily:
- No Generics
- Non-Existent error handling
- Crippled interfaces instead of traits.
The language is very syntactically inflexible, and looks ugly after spending a significant amount of time in languages like Ruby, or Scala which amenable to DSLs, and "custom" syntax.

### Haskell
I'm personally a big fan of Haskell as a language, but I think it is impractical to try and convert a team of Rubyist's
immediately to using Haskell. It has a long learning curve that requires major shifts in thinking even for experienced programmers.Contrary to popular belief the Haskell tool chain has become quite mature, and in my opinion is strong enough to 
run a company on. I think that it would require a core team who were already very familiar/experts at the language. 
Considering that the number of people who write Haskell is currently around [38](http://steve-yegge.blogspot.com/2010/12/haskell-researchers-announce-discovery.html), finding a core team could be challenging.

### Rust
Rust looks like a very promising systems language, but is targeted as replacement for C++ more so then Ruby. But it could very well could be as time goes on. The language has interesting ways for dealing with memory and concurrency, intended for those
writing heavy weight software like web browsers. Unfortunately it is still in a pre-release stage, and is not yet stable enough for production systems with major things like keywords still changing from release to release. It is starting to stabilize, and there should be a 1.0 release by the end of the year.

### Scala
Obviously I believe Scala is by the best option right now, it provides features that appeal to Rubyists. 

- runs on the JVM
- very expressive
- type inference
- pattern matching
- makes DSLs easy
- pure OO
- collections
- traits (mixin inheritance)

Scala is able to be written in very functional style. A team can begin writing Scala very much like they would write Java or
Ruby, and over time shift to code that reads much more like Haskell. Gaining advantages from both. It is also 
very performant, running at Java or near Java speed, which in this decade means blazing fast, especially in comparison
to dynamic scripting languages. 

With our motivation out of the way, the rest of the series will focus on the language itself.
