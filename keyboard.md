```
-----------------------------------------
 x x x x x x x             x x x x x x x
 x { ' " } ? x             x ; [ ] ( ) x
 x ^ = - $ * x   ~ x x x   x . L D U R x
 x < | - > /       x x       * \ & ` ~ S
 x x x x x     % : x x x x     x x x x x
-----------------------------------------
```

Reference: https://sunaku.github.io/moergo-glove80-keyboard.html#symbol-layer

# RULE !!!

This layout was built specifically for Kinesis Advantage 360.

This layout is intended for 3x6 layer,
but also can reduce to 3x5 or extend to 4x6 if needed. (e.g. Charybdis)

Most of the symbol keys are in homerow and 2 adjacent rows.

These keys are positioned to support in VIM action, also language like Go/Python/Yaml/Bash.

## Math

| 0      | 2   | Meaning     |
| ------ | --- | ----------- |
| O or 9 | (   | open        |
| P or 0 | )   | close       |
| S      | =   | eq sign     |
| Tab S  | !=  | not eq      |
| AS     | ^=  | bitwise XOR |
| X      | \|  | OR          |
| ` or , | &   | AND         |
| C      | -   |             |
| S_S    | +   |             |

## VIM stuffs

| 0            | 2        | Meaning                                     |
| ------------ | -------- | ------------------------------------------- |
| A and F      | ^ and $  | start/end of current line                   |
| Esc and G    | # and \* | search behind/forward for word under cursor |
| S            | =        | indent current line                         |
| Q R          | { }      | jump to next paragraph                      |
| Z V          | < >      | decrease/increase indentation               |
| T B          | ? /      | search behind/ahead for regex               |
| L_Space      | %        | jump to matching delimeter                  |
| BSPC         | :        | command mode                                |
| L_Space BSPC | :%       | command across the whole buffer             |

## Regex

| 0   | 2   | Meaning   |
| --- | --- | --------- |
| HN  | .\* | match all |
| HB  | ./  | directory |
| HT  | .?  | optional  |

## Vertical

| 0        | 2       | Meaning       |
| -------- | ------- | ------------- |
| Esc Tab  | #!      | Sbang         |
| BG or GB | /\* \*/ | comment block |

## Adjacent

| 0          | 2   | Meaning              |
| ---------- | --- | -------------------- |
| Delete S   | :=  | Golang assign        |
| 234 or UIY | (); | function call        |
| 2E         | ("  | function call string |

## Bash

| 0       | 2   | Meaning               |
| ------- | --- | --------------------- |
| FT      | $?  | last exit status      |
| Tab F   | !$  | last argument         |
| FQ      | ${  | open variable         |
| FZ      | $<  | makefile first source |
| FA      | $^  | makefile all sources  |
| F Shift | $@  | makefile all target   |
| V`      | >&  | fd redirect           |
| `Z      | &<  | fd redirect           |
| VVV     | >>> | write to file         |
