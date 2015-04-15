divert(-1)
#
# usage: m4 bf.m4 < input.bf
#

# > ip
# < dp
# + ic
# - dc
# . pr
# [ bn(`
# ] ')ed

## convert brainfuck code to internal code.

define(`token', `changequote({,})ifelse(
		{$1}, {>}, {`'ip},
		{$1}, {<}, {`'dp},
		{$1}, {+}, {`'ic},
		{$1}, {-}, {`'dc},
		{$1}, {.}, {`'pr},
		{$1}, {[}, {`'bn(`},
		{$1}, {]}, {')`'ed}){}changequote')

define(`parse', `ifelse(
	eval(len(`$*')>0), 1,
	`token(substr(`$*',0,1))`'parse(substr(`$*',1))')')

define(`internal', parse(include(`/dev/stdin')))


## processor

# pointer
define(`ptr', `0')

# initialize buffer
define(`init', `ifelse(`$1', `-1', , `define(`_$1_', 0)init(decr($1))')')
init(1000)

# current value
define(`cv', `defn(_`'defn(`ptr')`'_)')

# increment ptr (>)
define(`ip', `define(`ptr', incr(defn(`ptr')))`'')

# decrement ptr (<)
define(`dp', `define(`ptr', decr(defn(`ptr')))`'')

# increment current value (+)
define(`ic', `define(`_'defn(`ptr')`_', incr(cv))`'')

# decrement current value (-)
define(`dc', `define(`_'defn(`ptr')`_', decr(cv))`'')

# begen loop ([)
define(`bn', `pushdef(`s', `ifelse(eval(cv>0), 1, `$1`'s')')')

# end loop (])
define(`ed', `s`'popdef(`s')')

# print current value (.)
define(`pr', `ifelse(
   cv, 09, `	',
   cv, 10, `
',
   cv, 32, ` ',
   cv, 33, `!`'',
   cv, 34, `"`'',
   cv, 35, `#`'',
   cv, 36, `$`'',
   cv, 37, `%`'',
   cv, 38, `&`'',
   
   cv, 40, `(`'',
   cv, 41, `)`'',
   cv, 42, `*`'',
   cv, 43, `+`'',
   cv, 44, `,`'',
   cv, 45, `-`'',
   cv, 46, `.`'',
   cv, 47, `/`'',
   cv, 48, `0`'',
   cv, 49, `1`'',
   cv, 50, `2`'',
   cv, 51, `3`'',
   cv, 52, `4`'',
   cv, 53, `5`'',
   cv, 54, `6`'',
   cv, 55, `7`'',
   cv, 56, `8`'',
   cv, 57, `9`'',
   cv, 58, `:`'',
   cv, 59, `;`'',
   cv, 60, `<`'',
   cv, 61, `=`'',
   cv, 62, `>`'',
   cv, 63, `?`'',
   cv, 64, `@`'',
   cv, 65, `A`'',
   cv, 66, `B`'',
   cv, 67, `C`'',
   cv, 68, `D`'',
   cv, 69, `E`'',
   cv, 70, `F`'',
   cv, 71, `G`'',
   cv, 72, `H`'',
   cv, 73, `I`'',
   cv, 74, `J`'',
   cv, 75, `K`'',
   cv, 76, `L`'',
   cv, 77, `M`'',
   cv, 78, `N`'',
   cv, 79, `O`'',
   cv, 80, `P`'',
   cv, 81, `Q`'',
   cv, 82, `R`'',
   cv, 83, `S`'',
   cv, 84, `T`'',
   cv, 85, `U`'',
   cv, 86, `V`'',
   cv, 87, `W`'',
   cv, 88, `X`'',
   cv, 89, `Y`'',
   cv, 90, `Z`'',
   cv, 91, `[`'',
   cv, 92, `\`'',
   cv, 93, `]`'',
   cv, 94, `^`'',
   cv, 95, `_`'',

   cv, 97, `a`'',
   cv, 98, `b`'',
   cv, 99, `c`'',
   cv, 100, `d`'',
   cv, 101, `e`'',
   cv, 102, `f`'',
   cv, 103, `g`'',
   cv, 104, `h`'',
   cv, 105, `i`'',
   cv, 106, `j`'',
   cv, 107, `k`'',
   cv, 108, `l`'',
   cv, 109, `m`'',
   cv, 110, `n`'',
   cv, 111, `o`'',
   cv, 112, `p`'',
   cv, 113, `q`'',
   cv, 114, `r`'',
   cv, 115, `s`'',
   cv, 116, `t`'',
   cv, 117, `u`'',
   cv, 118, `v`'',
   cv, 119, `w`'',
   cv, 120, `x`'',
   cv, 121, `y`'',
   cv, 122, `z`'',
   cv, 123, `{`'',
   cv, 124, `|`'',
   cv, 125, `}`'',
   cv, 126, `~`'',
   `.')')

divert(0)dnl
internal
