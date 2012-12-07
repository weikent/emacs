# MacPorts Installer addition on 2012-09-27_at_20:54:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Emacs.app/Contents/MacOS/:$PATH
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:$PATH
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/weiqing/.profile file was backed up as /Users/weiqing/.profile.macports-saved_2012-10-10_at_20:40:44
##

# MacPorts Installer addition on 2012-10-10_at_20:40:44: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Setting PATH for Python 3.3
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH

echo "1"
alias ls="ls -G"
alias py="python3.3"
# source ~/.bashrc
