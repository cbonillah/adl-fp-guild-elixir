# Elixir - Matching & Recursion

This section contains code illustrating Elixir's pattern matching and recursion.

## Pattern matching

In the previous section we wrote code to define modules, functions, and within them we assigned values to variables using the `=` operator.

The `=` operator is called a matching operator. Here are some examples of the matching operator in action.

> iex(1)> x = 1  
> 1  
> iex(2)> 1 = x  
> 1  
> iex(3)> x = 2  
> 2

It can be used to assign values to variables if a variable is not yet defined. It can also be used to re-assign values to variables.

> iex(4)> { p, q, r } = { :ok, "Message", 23.2 }  
> {:ok, "Message", 23.2}  
> iex(5)> p  
> :ok  
> iex(6)> q  
> "Message"  
> iex(7)> r  
> 23.2  
> iex(8)> [ head | tail ] = [ 1, 2, 3, 4, 5, 6]  
> [1, 2, 3, 4, 5, 6]  
> iex(9)> head  
> 1  
> iex(10)> tail  
> [2, 3, 4, 5, 6]

As seen above, it can also be used to destructure tuples and lists. Using the `|` operator, lists can be destructured to retrieve the first item. 

## Pin operator

As seen above, a variable can be re-assigned using the match operator. However, we can also strictly match the current value of a variable without re-assigning it using the pin operator `^`.

> iex(1)> x = 1  
> 1  
> iex(2)> ^x = 1  
> 1  
> iex(3)> ^x = 2  
> ** (MatchError) no match of right hand side value: 2

Furthermore, the pin operator can also be used while matching structures:

> iex(1)> x = 1  
> 1  
> iex(2)> { p, q, ^x } = { :ok, "String", 1 }  
> {:ok, "String", 1}  
> iex(3)> { r, s, ^x } = { :ok, "String", 2 }  
> ** (MatchError) no match of right hand side value: {:ok, "String", 2}

## Underscore variables

When we are not intereseted in storing a particular value while matching, we can bind those values to `_`. The variable `_` can never be read from, and trying to fires an error.

> iex(1)> [ head | _ ] = [1, 2, 3, 4, 5, 6]  
> [1, 2, 3, 4, 5, 6]  
> iex(2)> head  
> 1  
> iex(3)> _  
> ** (CompileError) iex:3: invalid use of _. "_" represents a value to be ignored in a pattern and cannot be used in expressions

## Maching and logic

### The case clause

Case works just as a switch case, except it uses pattern matching against each case. And you can use the pin operator to match against existing variables as well.

> iex(1)> x = 1  
> 1  
> iex(2)> case {1, 2, 3} do  
> ...(2)>     {4, y, 6} -> "This won't match"  
> ...(2)>     {^x, y, 3} -> "This will match and the variable sum is #{x + y}"  
> ...(2)>     _ -> "This will match any value"  
> ...(2)> end  
> warning: variable "y" is unused (if the variable is not meant to be used, prefix it with an underscore)  
  iex:3  
> "This will match and the variable sum is 3"

### The cond clause

The `cond` and `case` checks are ver similar. However, instead of matching against different values, `cond` lets you check different conditions to find the first one does not evaluate to`nil` or `false`.

> iex(1)> cond do  
> ...(1)>     2 + 2 == 5 -> "This will not be true"  
> ...(1)>     2 * 2 == 3 -> "Nor this"  
> ...(1)>     1 + 1 == 2 -> "But this will"  
> ...(1)> end  
> "But this will"

If every condition returns `nil` or false, a `CondClauseError` will be raised. Because of this, it's common practice to add a final condition equal to true, that will always match.

### The if clause

As in many other languages, an `if` clause is available for checking a single condition. In addition, an `unless` clause is also available.

> iex(1)> if true do  
> ...(1)>     "The statement is true"  
> ...(1)> else  
> ...(1)>     "The statement is false"  
> ...(1)> end  
> "The statement is true"  
> iex(2)> unless true do   
> ...(2)>     "This will never be seen"  
> ...(2)> end  
> nil

