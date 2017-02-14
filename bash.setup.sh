: ${USER:=$LOGNAME}
PS1="${USER}@`hostname` \!:: "
alias ll='ls -lrt'
alias hi='history 100'
alias rm='rm -i'
bind '"\C-p": history-search-backward' '"\C-n": history-search-forward'

cd /opt/dcae-startup-vm-controller
