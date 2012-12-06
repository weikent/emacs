alias ls='ls -G'
export PS1="\u@\W\$ "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# export EDITOR=/usr/bin/vi
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PYTHONSTARTUP=~/.pythonstartup

export MANPATH="/usr/local/man:$MANPATH"

alias mr='./manage.py runserver'
alias ms='./manage.py syncdb'
alias mvm='./manage.py validate'
# alias hu='hg pull -u'

# export RUBYOPT=rubygems

export PATH=/usr/local/bin:/usr/local/sbin/:$PATH
export PYTHONPATH=~/emacs/python:~/emacs/project:~/emacs/PP4E/Preview:$PYTHONPATH

# 第一行让命令行提示显示用户和当前路径就行了, 太长了不好看,
# 第三和四行就是让terminal输出显示颜色. 默认编辑器设置成vi, 编码设置utf-8, 
# 第八行就是python shell启动时调用的文件, 
# 12~14行是方便我使用django设置的alias, 
# 15是为了方便使用hg, 最后就是PATH和MANPATH了.
