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

# current value
define(`cv', `eval(defn(_`'defn(`ptr')`'_)+0)')

# increment ptr (>)
define(`ip', `define(`ptr', incr(defn(`ptr')))`'')

# decrement ptr (<)
define(`dp', `define(`ptr', decr(defn(`ptr')))`'')

# increment current value (+)
define(`ic', `define(`_'defn(`ptr')`_', incr(cv))`'')

# decrement current value (-)
define(`dc', `define(`_'defn(`ptr')`_', decr(cv))`'')

# begin loop ([)
define(`bn', `pushdef(`s', `ifelse(eval(cv>0), 1, `$1`'s')')')

# end loop (])
define(`ed', `s`'popdef(`s')')

# print current value (.)
define(`pr', `format(`%c', cv)')

divert(0)dnl
internal`'dnl
