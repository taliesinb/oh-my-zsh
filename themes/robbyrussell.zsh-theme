precmd() { 
	LASTCODE=$?
	if [[ LASTCODE -ne 0 ]]; then
		printf "$fg[red]exitcode: %d$reset_color\n" $LASTCODE
	else
		print 
	fi
}

sepcol=%{$fg[white]%}
pathcol=%{$fg[default]%}
tilde=%{$fg[blue]%}~$pathcol
tilde='~'

PROMPT='%{%K%} $pathcol${${${$(pwd)/#$HOME/$tilde}//[\/]/_Z_}//_Z_/$sepcol/$pathcol} %{%k%} '
RPROMPT='$(git_prompt_info) %{$fg[black]%}%T%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} M%{$fg[yellow]%}"
