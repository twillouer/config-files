alias use="mysql -h 127.0.0.1 -u root"
alias playf="/usr/local/java/play/play"
alias bzip2="pbzip2"

alias junitfailure='grep -P "(Errors|Failures): [1-9]"'

alias mavenjunitfailure='grep -P "(Errors|Failures): [1-9]" **/target/*-reports/*.txt'
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

export MAVEN_OPTS="-Xmx2048m -Xms512m  -Djava.awt.headless=true"

alias ll='ls -latr --color'
alias ip='ip --color'
alias ipb='ip --color --brief'

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
export M2_HOME=/usr/local/java/apache-maven-3
alias cpuperf='for i in "0 1 2 3 4 5 6 7" ; do sudo cpufreq-set -c $i -g performance ; echo $i ; done'

alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
alias dockip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias battery_stat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

alias jjabber="cd ~/.purple/logs/jabber/wd-dw@jabber.deveryware.net"

test -d ~/.nvm/mvn.sh && source ~/.nvm/nvm.sh

export PROJETS=~/Projets
export DOCUMENT_DIR=~/Projets/documents

test -r ~/.perso_aliases && source ~/.perso_aliases

#https://gist.github.com/lelandbatey/8677901
alias whiteboard='convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"'

alias geohub_numergy=". <(gpg -qd ~/bin/numergy_openstask.sh.gpg)"
alias appgeohub_numergy=". <(gpg -qd ~/bin/deveryware_appgeohub-dw-openrc.sh.gpg)"
alias ovh_gra1=". <(gpg -qd ~/bin/ovh_openstack.sh.gpg)"
alias ovh2_gra1=". <(gpg -qd ~/bin/ovh_openstack2.sh.gpg)"
alias opdpa3_geohub=". <(gpg -qd ~/bin/geohub-integ-pa3-openrc.sh.gpg)"
alias opdcdc_geohub=". <(gpg -qd ~/bin/geohub-integ-cdc-openrc.sh.gpg)"
alias bazar_prod_gra5=". <(gpg -qd ~/bin/bazar-prod-ovh.sh.gpg)"
alias jenkins_geohub_numergy=". <(gpg -qd ~/bin/jenkins_numergy_openstack.sh.gpg)"
alias coffre_fort_numergy=". <(gpg -qd ~/bin/dev-coffre-fort-openrc.sh.gpg)"

export SBT_OPTS=-XX:MaxPermSize=256m
#alias terraform='DOCKER_HOST= docker run --rm --net=host --user=$UID:$GID -v $PWD:/data -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -ti uzyexe/terraform'
#alias nova='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova'
#alias neutron='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient neutron'
#alias openstack='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient openstack'
#alias glance='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -e OS_IMAGE_API_VERSION="1" -v $PWD:/data twillouer/mydocker:openstackclient'
#alias glance-add-iso='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -e OS_IMAGE_API_VERSION="1" -v $PWD:/data twillouer/mydocker:openstackclient glance image-create --progress --disk-format=qcow2 --name $1 --container-format=bare  --file /data/$2'

export MYSQL_PS1="\u@\h \d > "

export PACKER_CACHE_DIR=${HOME}/packer_cache

# FlameGraph

if [ -d ~/src/perf-map-agent/bin ] ;
then
 export FLAMEGRAPH_DIR=~/src/FlameGraph
 export PERF_RECORD_SECONDS=60
 export PATH=$PATH:~/src/perf-map-agent/bin
fi

alias generate_password='cat /dev/urandom | tr -dc A-Z-a-z-0-9 | head -c${1:-16} ; echo'

function gwhereis_f() { 
   grep -A1000000000 places:  "$HOME/Projets/deploy-geohub/configs/config-geohub/$1.yaml" |  grep -E "srv-gh|$2"  | grep -B1 "$2"
}

alias gwhereis="gwhereis_f pf4-pa3"
alias gwhereis_opv="gwhereis_f opv"

function dns_f() {
  grep -A4 -B3 -E "$1" ~/Projets/puppet5-deveryware/./data/production/roles/dns_internal.yaml
}
alias dnsi="dns_f"

function prx_f() {
  grep -E "^prx|$1" ~/Projets/doc-pf4/02_Architecture/Liste_VMS_Hyperviseurs.txt | grep -B1 "$1" 
}
alias prx="prx_f"

PATH=$PATH:~/.local/bin
mr () {
#	assigneeTrigraph=$1
#	targetBranch=${2:-master}
	targetBranch=${1:-master}
	sourceBranch=$(git rev-parse --abbrev-ref HEAD)
        COUNT=$(git diff ${targetBranch} | wc -l)
        if (( $COUNT == 0 ))
        then
          echo "nothing do to, no diff between this branch ${sourceBranch} and ${targetBranch}"
        else
#	assigneeId=$(gitlab user list --per-page 10000 | grep "\b${assigneeTrigraph}\b" -B 1 | sed -n 's/id: //p')
  	  projectName=$(git config --get remote.origin.url | sed -e 's/git@forge.deverywa.re://' -e 's/.git//')
	  projectId=$(gitlab project get --id $projectName | sed -n 's/id: //p' )
	  titleCaseTitle=$(python -c "print '$sourceBranch'.title()")
#	  gitlab project-merge-request create --project-id $projectId --source-branch $sourceBranch --target-branch $targetBranch --title $titleCaseTitle --assignee-id $assigneeId
	  echo gitlab -v project-merge-request create --project-id $projectId --source-branch $sourceBranch --target-branch $targetBranch --title $titleCaseTitle --remove-source-branch True
	  gitlab -v project-merge-request create --project-id $projectId --source-branch $sourceBranch --target-branch $targetBranch --title $titleCaseTitle --remove-source-branch True
#gitlab -v project-merge-request get --project-id $projectId --id 4531
       fi
}

alias mrp="git push -u origin \$(git symbolic-ref --short -q HEAD | tr -d '\n') && mr $*"

_asyncprof() {
  STRAT=${2:-cpu}
  PROG=$1
  TIME=${3:-60}
  if [ "x$1" = "x" ] ;
  then
    echo Usage $0 <pgrep regexp> [strategy] [time in second]
    echo "  strategy: cpu, alloc"
  fi
  set -x
  ~/src/async-profiler/profiler.sh -e ${STRAT} -d ${TIME} -f /tmp/${PROG}-${STRAT}-$(date +"%Y%m%d-%H%M%S").svg $(pgrep -f "java.*${PROG}")
}

alias asyncprof=_asyncprof

#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi


# color for man https://russellparker.me/post/2018/02/23/adding-colors-to-man/
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

export IBUS_ENABLE_SYNC_MODE=1

export PATH=$PATH:~/Projets/deveryadmin2/./node_modules/.bin/

alias k='kubectl'
alias mk='/usr/local/bin/minikube'
complete -F __start_kubectl k
