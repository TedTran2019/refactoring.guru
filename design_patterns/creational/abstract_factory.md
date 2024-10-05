# Abstract Factory

Creational pattern

## High Level Overview

1. Abstract factories are interfaces for concrete factories
    - Factory is a design pattern to provide a way to create objects without specifying the exact class of object
2. Concrete factories have methods to create products. These concrete products all have an interface (an abstract product)
    - This means all factories and all products that inherit from the same interface must pass the duck test

What does this result in? The client doesn't need to care about the concrete implementation at all.

## Use Cases (in Ruby)

Not much, I guess? This is kind of an anti-pattern in Ruby.
A much better solution in Ruby would be just utilizing modules. Ruby's strengths are that it's dynamically typed and has strong meta-programming capabilities which make the abstract factory kind of pointless.

[This is an article about the factory (not the abstract factory) pattern being replaced with the use of modules.](https://www.sitepoint.com/solving-design-anti-patterns-in-ruby-fix-the-factory/)
