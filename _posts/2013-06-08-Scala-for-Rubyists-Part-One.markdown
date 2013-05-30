---
layout: post
title: Scala for Rubyists (Part One)
---
You might have seen a dozen posts about why *you* should care about new language X or Y, and you might find 
yourself asking:

## Why should you care about Scala?
Because Scala has many properties that make it attractive to developers. With that said it is not 
necesarily a cure-all or the "one true language". Having worked in different contexts: academia, a startup,
school, open source, I've found the langauge to be one of the first tools I reach for. There are a few reasons why,
Scala is:

- concise
- scalable (wrt to the language and its abstractions)
- fast
- productive 
- mature
- well tooled
- correct

As well as these advantages, Scala has a very advanced type systems, allowing one to encode very powerful 
abstractions, and invariants. A powerful type system allows a  measure of productivity and safety not found 
in many languages. Many people love dynamic languages for their developer productivity, decrying the old statically
typed languages. Although beloved by programmers these languages have away traded safety and performance for 
developer happiness. 

You might be saying, "That isn't true, look at all these great JIT's like PyPy, and Rubinius. Dynamic languages 
can be fast too!". Their performance is getting better and better, but JITs are not a silver bullet. JITs can only
do so much before their overhead out weighs their performance increases. At the same time coming up with novel JIT
operations is really hard espeically especially difficult in languages like JavaScript. Optimization of it is one 
of the core topics of my research group, and everyone of us can attest to how difficult JavaScript is to reason about 
and optimize, many of these things are also issues in Ruby, and Python (like eval). 

At the same time, there are some awesome things built in these languages. There is a middle ground in which type
infered languages exist. They bring the productivity gains offered by dynamic languages with greater safety. Being
statically typed there are some great performance wins as well.

Let's suppose that you are running a rapidly growing web service. You have recently moved out of the early startup phase
and are running analytics. You have recently grown in size and are having trouble scaling. The canonical example of this
is Twitter. They began running into many scaling issues(circa 2007), and began moving pieces to Scala. In the intervening
years they have moved a large chunk of their backend into Scala. This has paid off and allowed them to handle the 
massive load that events like the 2012 presidential election create. You don't need to be Twitter's size to run 
into scaling problems. 

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
