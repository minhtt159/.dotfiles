```
-----------------------------------------
 x ` ( ) ; , x             x x x x x x x
 ! { ' " } ? x             x ; ( ) [ ] x
 # ^ = _ $ * x   x x x x   x . : = > ; x
 @ < | - > /       x x       * \ , . / x
 x & [ ] +     % : x x x x     x x x x x
-----------------------------------------
```
Reference: https://sunaku.github.io/moergo-glove80-keyboard.html#symbol-layer

## Generic

| 0 | 2 | Meaning | 
| --- | --- | --- |
| D  | _ | snake_case |
| E |  " | double quote |
| W |  ' | single quote  |
| CV | -> | functional |
| ZC | <- ||
| SV | => ||
| ZS | <= ||
| ZX | <\| || 
| XV | \|> ||
| ZB | </ | HTML |

## Math

| 0 | 2 | Meaning | 
| --- | --- | --- |
| U or 2 | (  | open |
| I or 3 | )  | close |
| S  | = | eq sign | 
| Tab S | != | not eq |
| AS | ^= | bitwise XOR |
| X | \| | OR |
| ` | & | AND |
| C  | -  |  |
| → | + |  |
  
## VIM stuffs

| 0 | 2 | Meaning |
| --- | --- | --- | 
| A and F | ^ and $ | start/end of current line |
| Esc and G | # and * | search behind/forward for word under cursor |
| S | = | indent current line |
| 2 3 | ( ) | jump to next sentence |
| Q R | { } | jump to next paragraph |
| Z V | < > | decrease/increase indentation |
| T B | ? / | search behind/ahead for regex |
| L_Space | % | jump to matching delimeter |
| BSPC | : | command mode |
| L_Space BSPC | :% | command across the whole buffer |

## Regex

| 0 | 2 | Meaning |
| --- | --- | --- | 
| HN | .* | match all |
| H/ | ./ | directory |
| HT | .? | optional |

## Vertical

| 0 | 2 | Meaning |
| --- | --- | --- | 
| Esc Tab | #! | Shebang |
| 1 S_1 | !~ | not match - but idk |
| BG or GB | /* */ | comment block |

## Adjacent 

| 0 | 2 | Meaning |
| --- | --- | --- | 
| JK | := | Golang assign |
| 234 or UIY | (); | function call |
| 2E | (" | function call string |

## Bash

| 0 | 2 | Meaning |
| --- | --- | --- | 
| FT | $? | last exit status |
| Tab F | !$ | last argument |
| FD | $_ | value of last argument |
| FQ | ${ | open variable |
| FZ | $< | makefile first source |
| FA | $^ | makefile all sources |
| F Shift | $@ | makefile all target |
| V` | >& | fd redirect |
| `Z | &< | fd redirect |
| VVV | >>> | write to file |
