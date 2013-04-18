---
layout: post
title: Coffee Import
---
A simple program that I wrote to add an `import` statement to Javascript. Intended to show off the site re-design
and syntax highlighting.

```scala

import java.io.File
import scala.io.Source 

object CoffeeImport extends App {
  try {
    val result = args.toList match {
      case Nil         => throw new Exception("Please provide a filename: coffee-import <filename>")
      case file :: Nil => resolve(file)
    }
    print(result)
  } catch {
    case e => println(e.getMessage)
  }
  
  class InsertionSet[A](o: List[A], s: Option[Set[A]] = None) {
    val ordering = o
    val set = s match {
      case None     => Set(o: _*)
      case Some(st) => st
    }
  
    def +(e: A): InsertionSet[A] = 
      if (!set.contains(e)) new InsertionSet(e :: ordering, Some(set + e)) else this
  
    def contains(e: A): Boolean = set contains e
      
    def toList = ordering.reverse
    
    override def toString = toList.toString /* make more efficent */
  }

  /* Implicits for treating File's and Strings interchangeable */
  implicit def fileToString(f: File): String = f.getAbsolutePath
  implicit def stringToFile(s: String) = new File(s)


  def readFile(file: String): String = Source.fromFile(file).mkString
  
  def extractName(line: String) = {
    def stripQuotes(s: String) = s.substring(1, s.length - 1)
    val importR = """#import (("|').*("|'))""".r
    val fileR   = """(("|').*("|'))""".r 
    importR findFirstIn line match {
      case None          => ""
      case Some(importS) => fileR findFirstIn importS match {
        case None           => throw new Exception("Import ERROR: " + line)
        case Some(filename) => stripQuotes(filename)
      }
    }
  }
  
  def dirContents(dir: File) = dir.listFiles.toList.map(_.getAbsolutePath).filter(!_.isHidden)

  def rootPath(file: String) = {
    val i = (file lastIndexOf "/") + 1
    file.substring(0, i)
  }
  
  def expandWildCard(filename: String): List[String] = 
    filename endsWith "/*" match {
      case false => filename :: Nil
      case true  => dirContents(filename)
    }
  
  def getDeps(filename: String) = { 
    val contents = readFile(filename)
    val lines    = contents.lines 
    lines.map(extractName).filter { _ != "" }
  }
  
  def orderDeps(set: InsertionSet[String], file: String): List[String] = {
    val root = rootPath(file)
    /* need to make it a method not a val to fix forward declare */
    def _step(set: InsertionSet[String], file: String): InsertionSet[String] = {
      val files = getDeps(file).map(root + _).flatMap(expandWildCard)
      files.foldLeft(set)(_step) + file
    }
    _step(set, file).toList
  }
  
  def resolve(file: String): String = {
    val emptySet = new InsertionSet[String](List())
    val deps = orderDeps(emptySet, file)
    val result = deps.map(x => "#" + x + "\n" + readFile(x)).reduce(_ + "\n\n" + _)
    result
  }
}
```
