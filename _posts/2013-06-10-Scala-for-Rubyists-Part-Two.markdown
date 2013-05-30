---
layout: post
title: Scala-for-Rubyists (Part Two)
---

## Variables
Declaring variables in Scala is fairly straight forward.  

```scala
val a = 5
val b = 10
var c = a 
c += b
```

```ruby
a = 5
b = 10
c = a
c += b
```

You may notice that we use two different declarations here, `var` and `val`. A `val` is an immutable binding,
meaning it is equivalent to `const int a = 1` in C or `final int a = 1` in Java, once a value has been assigned,
we can not reassign it. `var`s act like their Ruby equivalents, we are free to change the binding, given the type
is the same(we will talk about types below).

## Types
Scala is a statically typed language unlike Ruby. This means that all values of the language have a type,
and any reference to them must also have a type. As some one who cut their teeth in a statically typed language
the idea of types are baked in to my understanding of programming. I was recently talking to a Physics student
who has been writing Python for a long time, and he stopped me and asked, "What is a type?". I realized that
types are one of those concepts one takes for granted over time, like pointers, and we all forget they were
even hard.

A type can be interpreted in many ways, but a simple way is that it tells the compiler how to layout the memory
for an object of a certain type. In object oriented languages types also specify the kinds of operations that
a data type supports, in the form of methods. In many languages types are `nominal`, meaning that things are
given their type purely by name. A type can also be interpreted as a invariant, if you written software
for a long time you know invariants are important in writing software. Knowing that something can't happen
is very important, that is why many of us write tests, you want to enforce a set of constraints on your code, 
to make sure certain outcomes, can or can not happen. Types are a way to enforce invariants, ever caught yourself 
checking the type of an object in Ruby `x.is_a? String`. Types are a way to encode that, and say my length 
function should always return an `Int`, or to encode my function can fail with `Option[T]`. Types are interesting
and important constructs, and can be talked about in great depth, even in a [expository context](http://www.amazon.com/Types-Programming-Languages-Benjamin-Pierce/dp/0262162091).

## Immutable(by Default)
Ruby only has one type of variable, and it can point to any Ruby value, and be modified at any time

```ruby
1.class 

"Hello World!".class

/(H|h)ello (W|w)orld!/.class

x = 1
x = "string" # Assignment is fine here 
```

```scala
val a: Int = 5

val s: String = "String"

var sp: String = "Hello"

var sp = 1 // TypeError, reference of type String can't be assigned a value of type Int
```

## Expressions Everywhere
Scala and Ruby are similar in the fact that they treat (nearly) everything as an expression. There
are a few differences that are worth highlighting between the two.

### If 
Just like Ruby, `if`s return values.

```scala
val res = if (true) 1 else 2
val res2 = if (false) 2 else 1
```

Being a typed language the result type of an `if` is dependent on the values in each branch:

```scala
val res = if (true && false) 1 else "hello"
// res: Any = "hello"
```

```scala
val res = if (true) 1 else 1
// res: Int = "hello"
```
Scala does not have the ternary or in Ruyb parlance, the modifier `if`.

There is one case that you must be careful of in Scala, if you leave the else branch off an `if`
the when the condition is false you will get Unit returned from the else branch.

```scala 
def returnsInt(x: Int, y: Int): Int = if (false) x + y
// fails to compile
```

the above example will not compile because the type of the `if` will be AnyVal not Int. Although this may be initially
annoying to those comming from dynamically typed language, this guarantees that you will always receive an `Int` from 
addInt, and not a nil value like you would in Ruby.

```ruby
def returns_int(x, y)
  if (false) x + y
end

returns(1,2) # => nil
```

### For Comphrensions (Not Loops)
Scala is lacking the traditional for-loop, but has a powerful construct in for-comphrensions,
which act very similarl

### While & Do-While Loop
The normal C-Style `while` loop we all know and love, it also returns a value, but it is always Unit. 
Ignoring the method definition, this is a simple piece of code to sum an Array using a `while` loop.  

```scala
def sum(xs: Array[Int]): Int = {
    var i = 0
    var sum = 0
    while (i < xs.length) {
        sum += xs(i)
        i += 1
    }
    sum
}       
```

This is also our known and loved C-style do-while loop, this is something that appears very 
rarely in Scala code. 

```scala
do {
    body
} while(cond);
```
If you have never seen a C-style do-while loop, this simply executes the body at least once, then continues like
a normal while loop.

## Functions and Methods
We now get to the most important part of Scala functions. Scala differs from more traditional functional languages like
SML, or Haskell where everything is a function. It draws a distinction between Functions and Methods, very similar to 
Ruby's distiction between `Proc`s and methods. In my opinion Scala has a much cleaner handling of this, as instead of 
`Block`s, `Proc`s, and `Lambda`s Scala has methods and `Function`s. Scala's internals are much cleaner as well, to the
compiler everything is simply an object with methods. So Scala's 'Function literals' are actually just syntatic sugar. 
The compiler supports this translation, but these two definitions are no different.

```scala
val f1 = (x: Int) => x + 1
val f2 = new Function1[Int, Int] {
    def apply(x: Int): Int = x + 1
}
```
You might feel swamped by all the syntax shown here, but the take away point for now is to remember that Function's are 
simply an class, who's constructors syntax has special support. O

### Methods

```scala
def fact(n: Int): Int = {
    if (n) 0
    else n * fact(n - 1)
}
```

### Functions

## Classes
Scala supports traditioal OO, defining classes, and creating objects will be very familar to you if you've ever written
Java, and is not to different then Ruby.

Definfing a class for example:

```ruby
class Greeter
  def hello
    puts "Hello World!"
  end
end
```

```scala
class A {
  def hello() = prinln("Hello World!")
}
```

Creating an object, and invoking a method:

```ruby
greeter = Greeter.new
greeter.hello
```

```scala
val greeter = new Greeter
greeter.hello()
```

## Objects
Objects in Scala are a very powerful construct that enable a whole class of traditional OO boilerplate to be removed.
We will revisit them later on, but at first glance they can simply used a module.

```scala
object Module {
    some methods
}
```
If you are running your code as a script methods can appear at the top-level of a source file, otherwise they must be
contained inside an object or class. A simple way to convert your script into a source file which you can file is to 
just wrap your code in an `object`. 

### Script mode
To make running snippets of Scala code as easy as Ruby or Python, the runtime supports running code in script mode, 
where you simply pass your code as an argument to the runtime, without having to compile, and then run it.

```bash
scala scriptName.scala
```

## Everything is an Object (Redux)
This is one point that most Rubyist's will enjoy about Scala. This means even `Int`s can have methods defined on them.
This also means annoying things like [boxing and unboxing](http://docs.oracle.com/javase/tutorial/java/data/autoboxing.html)
are something you don't need to worry about. For example often times you will in Ruby you would do:

```ruby
(1..n).each do |i|
    # body here
end
```

```scala
1 to n foreach { i =>
    /* body here */
}
```

This piece of consistency is a real win in my opinion, and you can see it permeate the entire design, all data types, 
including functions are objects, meaning you can have a very simple mental model of how values work in the language.

## Method Invocations
```scala
def fact(n: Int) = (0 to n) reduce _ * _
```

## Tuples
Scala has a tuples built into the language. There are Tuple2 - Tuple22 in the language. They are just like Python's
tuples.

```scala
(1, 2)
(1, 2, 3)
(1, 2, 3, 4)
(1, 2, 3, 4, 5) 
/* and so on ... */
(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
```

Tuples are polymorphic (many-shapes), meaning that a Tuple can contain any type of value in each slot.

```scala
val strInt = ("hello", 1)
val intStr = (1, "hello")
```

One thing to note is that these tuples have different types. The type of the first one is (String, Int) and the second
one is (Int, String).

## Pattern Matching
Pattern matching is the feature that I miss most in other languages, because it is just *so* powerful. Pattern matching
provides a way to destructure data and obtain its component pieces. The simplest example is pulling apart a tuple.

Suppose I have two cartesian coordinates, simple x, y pairs like you had in highschool algebra.
```scala
val coord1 = (1, 2)
val coord2 = (3, 4)
```

Now let's say I want to compute the distance funciton on then.

```scala
import Math._

def distance(x: (Int, Int), y: (Int, Int)): Int = {
    val (x1, y1) = x
    val (x2, y2) = y
    sqrt(pow(x1 - x2, 2), pow(y1 - y2, 2))
}
```
One place a pattern can appear is on the left side of an assignment, this acts like destructing assignment in other
languages, breaking apart the value on the right.

We can make the above example even cleaner by exploiting another property of patterns: they nest.

```scala
import Math._

def distance(x: (Int, Int), y: (Int, Int)): Int = {
    val ((x1, y1), (x2, y2)) = (x, y)
    sqrt(pow(x1 - x2, 2), pow(y1 - y2, 2))
}
```

In the second attempt we simply created a tuple out of our points x and y, allowing us to then do two matches, we used
the outer tuple pattern to get each component, then we use two more tuple patterns to break apart both of those values.

