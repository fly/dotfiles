#basic stuff
autoload -U compinit promptinit add-zsh-hook
compinit -u
promptinit
prompt walters

#sources
source ~/.zsh/zsh-git-prompt/zshrc.sh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-sprunge/sprunge.zsh
source ~/.zsh/zsh-ssh-agent/ssh-agent.plugin.zsh

#update prompt
PROMPT='%B%(?..[%?] )%b%n@%U%m%u$(git_super_status)> '

#binds
bindkey "^R" history-incremental-search-backward

#alias
alias cdc='cd;clear'
alias vit='vim ~/.todo.txt'
alias grep='LC_ALL=C grep'
alias c='clear'
alias cls='clear && ls'
alias vime='vim -u ~/.vimencrypt -x'
alias rake="noglob rake"
alias bower='noglob bower'

if [ "$(uname)" = "Darwin" ]; then
    alias ls='gls --color=auto --group-directories-first'
    alias l='gls'
    alias mv='gmv -i'
    alias cp='gcp -i'
    alias rm='grm -i'
else
    alias ls='ls --color=auto --group-directories-first'
    alias l='ls'
    alias mv='mv -i'
    alias cp='cp -i'
    alias rm='rm -i'
fi

#package management aliases
if [ -f /etc/debian_version ]; then
    alias upgrade='sudo apt-get update && sudo apt-get upgrade'
    alias install='sudo apt-get install '
    alias purge='sudo apt-get purge '
elif [ -f /etc/pacman.conf ]; then
    alias upgrade='sudo yaourt -Syyu'
fi

#exports
export EDITOR=vim
export HISTSIZE=10000
export SAVEHIST=5000
export HISTFILE=~/.zshistory
export NODE_PATH=/usr/local/lib/node/:/usr/local/lib/jsctags/:$NODE_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export PERL_MM_USE_DEFAULT=1
export PERL_EXTUTILS_AUTOINSTALL="--defaultdeps"
export GITHUB_HOST=bits.linode.com
export GITHUB_URL=https://bits.linode.com/
export TERM="xterm-256color"

#functions
calc() { awk "BEGIN { print $* }"; }
record_pwd() { pwd > /tmp/.cwd }

#__git_files () {
#    _wanted files expl ‘local files’ _files
#}
#__git_files () { 
#    _wanted files expl ‘local files’ _files 
#}

#register hooks
add-zsh-hook chpwd record_pwd

LS_COLORS='no=38;5;244:rs=0:di=38;5;33:ln=38;5;33:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=38;5;64:*.tar=38;5;61:*.tgz=38;5;61:*.arj=38;5;61:*.taz=38;5;61:*.lzh=38;5;61:*.lzma=38;5;61:*.tlz=38;5;61:*.txz=38;5;61:*.zip=38;5;61:*.z=38;5;61:*.Z=38;5;61:*.dz=38;5;61:*.gz=38;5;61:*.lz=38;5;61:*.xz=38;5;61:*.bz2=38;5;61:*.bz=38;5;61:*.tbz=38;5;61:*.tbz2=38;5;61:*.tz=38;5;61:*.deb=38;5;61:*.rpm=38;5;61:*.jar=38;5;61:*.rar=38;5;61:*.ace=38;5;61:*.zoo=38;5;61:*.cpio=38;5;61:*.7z=38;5;61:*.rz=38;5;61:*.apk=38;5;61:*.jpg=38;5;136:*.JPG=38;5;136:*.jpeg=38;5;136:*.gif=38;5;136:*.bmp=38;5;136:*.pbm=38;5;136:*.pgm=38;5;136:*.ppm=38;5;136:*.tga=38;5;136:*.xbm=38;5;136:*.xpm=38;5;136:*.tif=38;5;136:*.tiff=38;5;136:*.png=38;5;136:*.svg=38;5;136:*.svgz=38;5;136:*.mng=38;5;136:*.pcx=38;5;136:*.dl=38;5;136:*.xcf=38;5;136:*.xwd=38;5;136:*.yuv=38;5;136:*.cgm=38;5;136:*.emf=38;5;136:*.eps=38;5;136:*.pdf=38;5;245:*.tex=38;5;245:*.rdf=38;5;245:*.owl=38;5;245:*.n3=38;5;245:*.tt=38;5;245:*.nt=38;5;245:*.log=38;5;240:*.bak=38;5;240:*.aux=38;5;240:*.bbl=38;5;240:*.blg=38;5;240:*.aac=38;5;166:*.au=38;5;166:*.flac=38;5;166:*.mid=38;5;166:*.midi=38;5;166:*.mka=38;5;166:*.mp3=38;5;166:*.mpc=38;5;166:*.ogg=38;5;166:*.ra=38;5;166:*.wav=38;5;166:*.axa=38;5;166:*.oga=38;5;166:*.spx=38;5;166:*.xspf=38;5;166:*.mov=38;5;166:*.mpg=38;5;166:*.mpeg=38;5;166:*.m2v=38;5;166:*.mkv=38;5;166:*.ogm=38;5;166:*.mp4=38;5;166:*.m4v=38;5;166:*.mp4v=38;5;166:*.vob=38;5;166:*.qt=38;5;166:*.nuv=38;5;166:*.wmv=38;5;166:*.asf=38;5;166:*.rm=38;5;166:*.rmvb=38;5;166:*.flc=38;5;166:*.avi=38;5;166:*.fli=38;5;166:*.flv=38;5;166:*.gl=38;5;166:*.axv=38;5;166:*.anx=38;5;166:*.ogv=38;5;166:*.ogx=38;5;166:';
export LS_COLORS

#cd to the most recent place
touch /tmp/.cwd
cd `cat /tmp/.cwd`

export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

if [ "$(uname)" = "Darwin" ]; then
    ~/.zsh/archey-osx
fi


