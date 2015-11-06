alias use="mysql -h 127.0.0.1 -u root"
alias playf="/usr/local/java/play/play"
alias bzip2="pbzip2"

alias junitfailure='grep -P "(Errors|Failures): [1-9]"'

alias mavenjunitfailure='grep -P "(Errors|Failures): [1-9]" **/target/surefire-reports/*.txt'
alias maventests='for i in `find . -type d -name surefire-reports` ; do echo $i : `grep "Tests run: " $i/*.txt | cut -d " " -f 3 | tr -s "\n" " " | sed -e "s/,/ +/g" -e "s/$/0\n/" | bc` ; done'
alias topmemproc='ps aux|head -1;ps aux |tail -n+1 |sort -nrk4 |head -$(($(tput lines)-2)) |cut -c 1-$(tput cols)' # Alias with header 
alias ducks='du -cms -- * .* | sort -rn | head || du -cms -- * | sort -rn | head'
alias cpuinfo=" cpufreq-info | grep -P 'comprise entre|actuelle' | grep -e '[0-9.]*'" 
scp(){ if [[ "$@" =~ : ]];then /usr/bin/scp "$@" && notify-send scp "Transfert terminé" ; else echo 'You forgot the colon dumbass!'>&2 ; return 1; fi;}
vin(){ vi `find . -name $@`;}
alias myip='curl ifconfig.me'
alias free="LANG=C free"

# Curl
alias get='curl -X GET -H "Accept:application/json"'
alias post='curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias put='curl -X PUT -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias patch='curl -X PATCH -H "Accept:application/json" -H "Content-Type:application/json" -d'
alias delete='curl -X DELETE -H "Content-Type:application/json"'
alias options='curl -X OPTIONS -H "Content-Type:application/json"'
alias json='curl -H "Accept: application/json" -L'

export ANDROID_HOME=/usr/local/java/android-sdk-linux_x86/
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export MAVEN_OPTS="-Xmx2048m -Xms512m"

alias ll='ls -latr --color'

#alias mvn='/usr/local/bin/mvnc -T2.0C'
alias grin='grep -Hrn'
alias fin="find . -name"
alias finsrc="find src -name"

alias addtime='xargs -d"\n" -I {} date +"%Y-%m-%d %H:%M:%S {}"'



# Eliminer les commentaires d'un fichier
alias cgrep="grep -E -v '^(#|$|;)'"
alias nocomment='cgrep'

# Reviens à faire  cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak 
function cpb() { cp $@{,.bak} ;}
# Crée une sauvegarde du fichier passé en paramètre, en rajoutant l'heure et la date
#function bak() { cp "$1" "$1_`date +%Y-%m-%d_%H-%M-%S`" ; }
alias bak="bak"
#alias back="bak"

# Êtres gentil avec les ressources de son système
function nicecool() {
    if ! [ -z "$1" ] 
    then
        # Prendre en paramètre un pid
        ionice -c3 -p$1 ; renice -n 19 -p $1
    else
        # Si il n'y a pas de paramètre on nice le pid courant (le bash)
        ionice -c3 -p$$ ; renice -n 19 -p $$
    fi
}
alias niceprod="nicecool"
alias np="nicecool"

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
alias extract="extract"
alias unall="extract"

# Bannir l'IP d'un méchant rapidement
function ban() {
    if [ "`id -u`" == "0" ] ; then
        iptables -A INPUT -s $1 -j DROP
    else
        sudo iptables -A INPUT -s $1 -j DROP
    fi
}
alias ban="ban"

# Divers petits raccourcis : 
alias maj='sudo apt-get update && sudo apt-get dist-upgrade'
alias c='clear'
#alias rm='rm --interactive --verbose'
alias wget='wget -c'
#alias mv='mv --interactive --verbose'
#alias cp='cp --verbose'
alias grepr='grep -r'
alias tree="find . | sed 's/[^/]*\\//|   /g;s/| *\\([^| ]\\)/+--- \\1/'"
#alias mkdir='mkdir -pv'
alias pg='ps aux | grep'
alias pl='ps faux | less'
#function mkcd () { mkdir $1 && cd $1 }
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias mkcd="mkcd"
alias rsync="rsync --progress"

alias gff="git fetch -p --all"
alias gbr='git for-each-ref --sort="-authordate:iso8601" --format=" %(color:green)%(authordate:iso8601)%09%(color:white)%(refname:short)" refs/heads'

# Vagrant
alias v='vagrant version && vagrant global-status'
alias vst='vagrant status'
alias vup='vagrant up'
alias vdo='vagrant halt'
alias vssh='vagrant ssh'
alias vkill='vagrant destroy'

# Sources : 
#  - http://root.abl.es/methods/1504/automatic-unzipuntar-using-correct-tool/
#  - http://forum.ubuntu-fr.org/viewtopic.php?id=20437&p=3

#export M2_HOME=/usr/local/java/apache-maven-3.1.0
export M2_HOME=/usr/local/java/apache-maven-3.2.3
alias cpuperf='for i in "0 1 2 3 4 5 6 7" ; do sudo cpufreq-set -c $i -g performance ; echo $i ; done'

alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
alias dockip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias battery_stat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

test -d ~/.nvm/mvn.sh && source ~/.nvm/nvm.sh

export PROJETS=~/Projets

test -r ~/.perso_aliases && source ~/.perso_aliases

#https://gist.github.com/lelandbatey/8677901
alias whiteboard='convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"'


export SBT_OPTS=-XX:MaxPermSize=256m
alias terraform='DOCKER_HOST= docker run --rm --net=host --user=$UID:$GID -v $PWD:/data -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -ti uzyexe/terraform'
alias nova='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova'
alias neutron='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient neutron'
alias openstack='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient openstack'
