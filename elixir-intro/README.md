# Elixir - Intro

This section contains code illustrating Elixir's basic types, modules, and functions.

## Basic Types

Before heading into the code, we will use the Elixir Shell (IEX) to run some code and get to know basic types.
Type `iex` in your favorite terminal and let's get to it.

### Numbers

Elixir works with two types of numbers, integers, and floating point numbers. These are stored differently in memory by Elixir, and can cause you a headache if you are not aware. While integers are very precise and can be small or big, float numbers have limited precision, in fact Elixir uses the 64-bit IEEE 754-1985 “double precision” representation while dealing with these numbers.

Float numbers require the use of the decimal dot, and can also be written using the `e` notation:

> iex(1)> 5  
> 5  
> iex(2)> 5.0  
> 5.0  
> iex(3)> 5.0e-2  
> 0.05

While in the Elixir Shell, try different calculations using numbers to see how Elixir behaves. *e.g. `23516 * 513`*
To see how the limited precision affects floating numbers try these calculations:

> iex(1)> :math.sin(0)  
> 0.0  
> iex(2)> :math.sin(:math.pi)  
> 1.2246467991473532e-16

Elixir also supports shortcut notations for binary, octal and hexadecimal numbers, in the Elixir shell, try typing:

> iex(1)> 0b101001  
> 41  
> iex(2)> 0o757  
> 495  
> iex(3)> 0xFF52A  
> 1045802

### Strings

Strings are notated in Elixir using double quotes, and can even be interpolated!

> iex(1)> name = "world"  
> "world"  
> iex(2)> "Hello #{name}!"  
> "Hello world!"

### Booleans

Elixir supports true and false as boolean values.

> iex(1)> true  
> true

### Atoms

Atoms are constants or symbols, their value is their own name. Atoms are equal if their names are equal.

`true` `false` and `nil` are atoms, although Elixir lets you skip the `:`.

> iex(1)> :earth == :earth  
> true  
> iex(1)> :earth == :moon  
> false

