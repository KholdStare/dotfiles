# From http://ubuntuforums.org/showthread.php?t=733397

# Wraps a completion function
# make-completion-wrapper <actual completion function> <name of new func.>
#                         <command name> <list supplied arguments>
# eg.
# 	alias agi='apt-get install'
# 	make-completion-wrapper _apt_get _apt_get_install apt-get install
# defines a function called _apt_get_install (that's $2) that will complete
# the 'agi' alias. (complete -F _apt_get_install agi)
#
function make-completion-wrapper () {
	local function_name="$2"
	local arg_count=$(($#-3))
	local comp_function_name="$1"
	shift 2
	local function="
function $function_name {
	((COMP_CWORD+=$arg_count))
	COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
	"$comp_function_name"
	return 0
}"
	eval "$function"
	#echo $function_name
	#echo "$function"
}

# may not work if completion hasn't run yet (e.g. for docker)
# TODO: can this be fixed?
function __get_completion_function()
{
    complete -p $1 | sed -E -e 's/.* -F ([^ ]+) .*/\1/'
}
