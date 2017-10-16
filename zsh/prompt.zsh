# https://lord.re/posts/56-foldcat/
function preexec() {
	# on initialise timer pour chronométrer les commandes et oldpwd pour foldcat
  timer=${timer:-$SECONDS}
  oldpwd=$(pwd)
}
function precmd() {
  # reset le background en noir
  /bin/echo -e "\033]11;#080808\007"

  # déclenchement de foldcat. Penser à modifier le chemin de foldcat.db où vous voulez le mettre
  if [ "$oldpwd" != "$(pwd)" ] ;
  then
    /bin/grep "$PWD " $HOME/.config/foldcat/foldcat.db | cut --delimiter='"' -f2;
  fi

  # affichage de la durée d'execution de la dernière commande
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}
 # bon là c'est juste la customisation du prompt
autoload -U colors
colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"

