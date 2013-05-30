---
layout: post 
title: Clojure vs. Haskell
author: Jared Roesch
date: July 12, 2012
description: A quick post on why Haskell is the *more* consistent and clear than Clojure.
---
I recently started writing Clojure again after not using for many months. From the beginning I've had a really high 
opinion of the language and I think it gets a lot of things right, and is a lot of fun to write. As I've been getting 
back on the horse, I returned to finishing and reviewing the Joy of Clojure while hacking on some small ideas. 
What has changed in the intervening time is that I've now I've become a Haskell fanatic. Meaning many of the ideas in the
langauge make much more sense.

My journey on the path to true enlightement (learning and loving Haskell) has changed the way I've written code 
across the board, espcecially in  JavaScript. So when coming back to Clojure idea that everything behaved like a
function (or could be modeled as such). Of course in the presence of macros that goes out the window. 

One of my exercises was writing an HTML templating system that allowed aribtrary embedded Clojure code. I started 
writing a function to remove the splice from the template and I wanted to verify that a list of indices 
were above -1, which is the error value returned by String functions in Java.

In Haskell my line of reasoning, "Hey I have a [Int], and I want a [Bool]". Let me use a comparator, sections make
this easy: 

```haskell
(> 0) :: (Num a, Ord a) => a -> Bool
```
I have the the function with the type I wanted, now let me apply it easily:

```haskell
map (> 0) [1, 2, 3]
```

Then I can simply fold over the resulting list using `(&&)`:

```haskell
foldl (&&) True $ map (> 0) [1, 2, 3]
```

This is great everything works on the first try, the types guided my solution and I have the result I want.
Attempting the samething in Clojure turned out to be much more diffcult at first galance, I had forgot certain
things were macros.

I first transliterated the Haskell to Clojure:

```clojure
(reduce and true (map #(< 0 %) nums))
```

This quickly blew up in my face, because of my own forgetfulness. 

I quickly rememeber `and` was variadic and does reduction for me, but it took me multiple minutes to figure out what
I was doing because of the inconsistent behavior of macros vs. functions, and the very confusing error messages provided
by Coljure.


I then found out in 1.3 the newest release they had added a function, every-pred that takes a predicate function 
and does a map, and reduce.

```clojure
(def grtr-zero (every-pred #(< 0 %))
```

My experince of writing Clojure made me appreciate consistency of Haskell even more. The combination of types and
consistent semantics help tremendously while writing code.

