---
layout: post
title: Scala for Rubyists (Part One)
---
## Why should you care about Scala?
You should care because Scala has many properties that make it attractive to developers. With that said it is not 
necesarily a cure-all or the "one true language". Though having worked in a few different contexts: academia, a startup,
school, open source, I've found the langauge to be one of the first tools I reach for. There are a few reasons for this:

- concise
- scalable (wrt to the language and its abstractions)
- fast
- productive 
- mature
- build tools
- corectness

On top of these advantages, Scala has one of the most advanced type systems around, allowing one to encode
very powerful abstractions(which we will talk about it later parts). I believe that a advanced type system allows a 
measure of productivity and safety not found in many other languages. Many people love dynamic languages for
their developer productivity. Although beloved by programmers these languages have away traded safety and
performance for developer happiness. 

In regards to you might say, "That isn't true, look at all these great JIT's like PyPy, and Rubinius. Dynamic languages 
can be fast too!". Yes, they can be faster then they have been in the past, but JITs are not a silver bullet.
I've heard many people  post non-truths like "Dynamic Languages aren't inherently slow.", which is not true. 
Adaptability comes at a price of specificity. Static languages have a whole set of properties that allow compilers
to generate faster code, most JIT optimizations attempt to hopefully type a subset of your dynamic language enabling
the compiler to generate very static code. 

Crafting these optimizations is especially difficult in languages like JavaScript, its optimization is one of the core
topics of my research group, everyone of us can attest to how difficult JavaScript is to reason about and optimize, many 
of these things are also issues in Ruby, and Python(think eval). 

At the same time, there are some awesome things built in these languages. I would argue frameworks like Rails are the
*best* at doing *easy* and *fast* development on the web. 

If you are a company running a rapidly growing web service you may be running into trouble scaling to your users.
The canonical example of this would be Twitter. Since running into many scaling issues(circa 2007), they have 
moved most of their backend into Scala. This has paid off and allowed them to handle the massive load that 
events like the 2012 presidential election create. You don't need to be Twitter's size to run into scaling problems
though. One of my main goals this summer will be helping fix some scaling problems at much, much smaller company.
You could have a host of scaling problems due to the nature of Ruby, such as concurrency.

*What do you do?*

You could try carefully optimizing each piece, heavily profiling everything, isolating the precise problems areas, 
and then optimizing and in the process most likely write inelegant code that obfuscates the logic. 

I would argue that you don't have to give up the fun and ease of programming for scalability 
or efficiency.There are some great options for complementing your stack, without having to change everything up.

Traditional people went to these languages when they need more power:

- C
- C++
- Java
- C#

The first two are not great choices if you love Ruby, C and C++ the require very rigid coding practices
to avoid memory bugs, and require expert knowledge to tune. Also debugging corner case behavior in C and C++ 
can be major time sinks even for the most experienced developer. Finally they are in no universe expressive, and 
require many lines of code to accomplish relatively common operations, for example C doesn't even have a string 
replacement function built-in.

While Java and C# are definitely an improvement, as they remove a huge class of bugs, and
can be much more efficient than naive C++ code(especially in long running processes thanks to their JITs).
Expressiveness is barely improved, and in the case of Java it is actually decreased thanks to the removal of
many features which aid the writing expressive code (templates, operator overloading, lambdas, ect).

If you look to *newer* languages people seem to be the most excited about:

- Clojure
- Go
- Haskell
- Rust
- Scala

From the title I think you can guess where we are going, but I'm going to talk a little bit about these options, and 
why I think Scala is the best of them.

### Clojure
Clojure has some very interesting features and is much more performant than MRI Ruby, or CPython. It also provides
access to Java code through its interoperability features. In the end I don't think its the best option for people 
looking to complement something like Ruby. Being a Lisp it has a large syntax departure, and the fact that large 
parts of the language are macros makes for an inconsistent and sometimes confusing learning experience for new developers
as they learn to differentiate between macros, and functions. One of the biggest challenges that writing Clojure faces is
that it tries very hard to be dynamic and pure, which causes many issues.
Finally it doesn't' net as big performance gains as other options, so it is a questionable switch for performance seekers.

### Go
Go is seen often on HN these day but in my opinion Go is by far the worst option. It feels more like an 
updated C than anything. The history of the language designers and their opinions about 'advanced' features 
resulted in what I consider to be major failures, primarily:
- No Generics
- Non-Existent error handling
- Crippled interfaces instead of traits.
The language is also very syntactically inflexible, and kind of ugly after spending a significant amount of time in
Ruby.

### Haskell
I'm personally a big fan of Haskell as a language, but I think it is impractical to try and convert a team to using 
Haskell. It has big learning curve that requires major shifts in thinking even for the most experienced programmers.
Contrary to popular belief the Haskell tool chain has become quite mature, and in my opinion is strong enough to 
run a company on, but would really require a core team who were already very familiar or experts at the language. 
Considering that the number of people who write Haskell is currently around [38](http://steve-yegge.blogspot.com/2010/12/haskell-researchers-announce-discovery.html), finding a core team can be challenging.

### Rust
Rust looks like a very promising system language, but is a more fitting replacement for C++ then Ruby. It
has a lot of very interesting ways of dealing with memory and concurrency, features intended for people 
writing software like web browsers. On top of that it is still in a pre-release stage, I think it will be something
to look at going forward, but is not stable enough for production systems (Release by the end of the year according
to the last I heard).

### Scala
Obviously I believe Scala is by the best option, it provides many things that appeal to Rubyists, and provides
features most don't even know they need. 
- runs on the JVM
- very expressive
- type inference
- pattern matching
- DSLs
- pure OO
- collections
- traits (mixin inheritance)
Scala also can be very functional, meaning a team can begin writing Scala very much like they would write Java or
Ruby, and over time shift to code that reads much more like Haskell. Gaining the advantages of both. It is also 
very performant, running at Java speed, which in this decade means blazing fast, the JVM has evolved past its 
1990s speed.

With our motivation out of the way, the rest of the series will focus on the language itself.
