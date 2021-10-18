# to compile

open app/ and run ```ghc Main.hs```

## Keywords

- fish
- fin

## Primitive Data Types

- Num
- String
- Boolean
- Null

## Operators

- \+
- \-
- \*
- /
- ==
- /= (not equal)
- \^
- \<
- \>
- \<=
- \>=

# Sample Code

## Basic Arithmetic

```
<(+
    >(1)>
    >(1)>
)<
```
Returns 2.0

```
<(+
    >(1)>
    >(+
        >(2)>
        >(3)>
    )>
)<
```
Returns 6.0

### Boolean operations

```
<(==
    >(1.0)>
    >(1.0)>
)<
```
Returns True

## Control Flow

Control flow is done using the ```fin``` keyword.
fin is actually a function that takes three arguments:
- A boolean value
- A value to return if True
- A value to return if False

The following code will return ```5.0``` if some variable ```n``` is equal to the string ```\"yes\"```
Otherwise, it will return ```0.0```

```
fin
    >(==
        >(n)>
        >(\"yes\")>
    )>
    >(5.0)>
    >(0.0)>
```

## Function Declaration

Functions are declared with the ```fish``` keyword.

Following the keyword, a function name must be given. After the name comes a list of send fish which contain the function's positional arguments as well as any necessary sub-function or variable declarations.

Here is an example for some simple boolean logic:

```
fish and
    >(cond_x)>
    >(cond_y)>
    <(
        fin
            >(cond_x)>
            >(cond_y)>
            >(False)>
    )<
```

```
fish or
    >(cond_x)>
    >(cond_y)>
    <(
        fin
            >(cond_x)>
            >(True)>
            >(cond_y)>
    )<
```

So calling,

``` and >(True)> >(False)> ```
returns ```False```

Here is an example definition for factorial with a sub-function defined in the argument list:

```
fish factorial
    >(n)>
    >(
        fish sub_fact
            >(sub_n)>
            >(prod)>
            <(
                fin
                    >(<=
                        >(sub_n)>
                        >(0)>
                    )>
                    >(prod)>
                    >(sub_fact
                        >(-
                            >(sub_n)>
                            >(1)>
                        )>
                        >(*
                            >(prod)>
                            >(sub_n)>
                        )>
                    )>
            )<
    )>
    <(sub_fact
        >(n)>
        >(1)>
    )<
```

so here we can see that calling factorial is essentially just a wrapper for the hidden sub-function ```sub_fact```

It should also be noted that Sakana does not have a loop, so any looping must be defined recursively.

Hope you enjoyed your quick primer on Sakana!