#!/bash/bash
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    return
fi

# Git Bash does not provide https://github.com/scop/bash-completion
# but many tools offer completions which seem require _filedir
# function from bash-completion package.

# Perform tilde (~) completion
# @return  True (0) if completion needs further processing,
#          False (> 0) if tilde is followed by a valid username, completions
#          are put in COMPREPLY and no further processing is necessary.
_tilde()
{
    local result=0
    if [[ ${1-} == \~* && $1 != */* ]]; then
        # Try generate ~username completions
        COMPREPLY=($(compgen -P '~' -u -- "${1#\~}"))
        result=${#COMPREPLY[@]}
        # 2>/dev/null for direct invocation, e.g. in the _tilde unit test
        ((result > 0)) && compopt -o filenames 2>/dev/null
    fi
    return $result
}

# This function quotes the argument in a way so that readline dequoting
# results in the original argument.  This is necessary for at least
# `compgen' which requires its arguments quoted/escaped:
#
#     $ ls "a'b/"
#     c
#     $ compgen -f "a'b/"       # Wrong, doesn't return output
#     $ compgen -f "a\'b/"      # Good
#     a\'b/c
#
# See also:
# - https://lists.gnu.org/archive/html/bug-bash/2009-03/msg00155.html
# - https://www.mail-archive.com/bash-completion-devel@lists.alioth.debian.org/msg01944.html
# @param $1  Argument to quote
# @param $2  Name of variable to return result to
_quote_readline_by_ref()
{
    if [ -z "$1" ]; then
        # avoid quoting if empty
        printf -v $2 %s "$1"
    elif [[ $1 == \'* ]]; then
        # Leave out first character
        printf -v $2 %s "${1:1}"
    elif [[ $1 == \~* ]]; then
        # avoid escaping first ~
        printf -v $2 \~%q "${1:1}"
    else
        printf -v $2 %q "$1"
    fi

    # If result becomes quoted like this: $'string', re-evaluate in order to
    # drop the additional quoting.  See also:
    # https://www.mail-archive.com/bash-completion-devel@lists.alioth.debian.org/msg01942.html
    [[ ${!2} == \$* ]] && eval $2=${!2}
} # _quote_readline_by_ref()


# This function performs file and directory completion. It's better than
# simply using 'compgen -f', because it honours spaces in filenames.
# @param $1  If `-d', complete only on directories.  Otherwise filter/pick only
#            completions with `.$1' and the uppercase version of it as file
#            extension.
#
_filedir()
{
    local IFS=$'\n'

    _tilde "${cur-}" || return

    local -a toks
    local reset arg=${1-}

    if [[ $arg == -d ]]; then
        reset=$(shopt -po noglob)
        set -o noglob
        toks=($(compgen -d -- "${cur-}"))
        IFS=' '
        $reset
        IFS=$'\n'
    else
        local quoted
        _quote_readline_by_ref "${cur-}" quoted

        # Munge xspec to contain uppercase version too
        # https://lists.gnu.org/archive/html/bug-bash/2010-09/msg00036.html
        # news://news.gmane.io/4C940E1C.1010304@case.edu
        local xspec=${arg:+"!*.@($arg|${arg^^})"} plusdirs=()

        # Use plusdirs to get dir completions if we have a xspec; if we don't,
        # there's no need, dirs come along with other completions. Don't use
        # plusdirs quite yet if fallback is in use though, in order to not ruin
        # the fallback condition with the "plus" dirs.
        local opts=(-f -X "$xspec")
        [[ $xspec ]] && plusdirs=(-o plusdirs)
        [[ ${COMP_FILEDIR_FALLBACK-} || -z ${plusdirs-} ]] ||
            opts+=("${plusdirs[@]}")

        reset=$(shopt -po noglob)
        set -o noglob
        toks+=($(compgen "${opts[@]}" -- $quoted))
        IFS=' '
        $reset
        IFS=$'\n'

        # Try without filter if it failed to produce anything and configured to
        [[ -n ${COMP_FILEDIR_FALLBACK-} && -n $arg && ${#toks[@]} -lt 1 ]] && {
            reset=$(shopt -po noglob)
            set -o noglob
            toks+=($(compgen -f ${plusdirs+"${plusdirs[@]}"} -- $quoted))
            IFS=' '
            $reset
            IFS=$'\n'
        }
    fi

    if ((${#toks[@]} != 0)); then
        # 2>/dev/null for direct invocation, e.g. in the _filedir unit test
        compopt -o filenames 2>/dev/null
        COMPREPLY+=("${toks[@]}")
    fi
} # _filedir()
