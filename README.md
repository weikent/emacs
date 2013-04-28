lisp目录包含emacs配置文件。

project目录包含python练习文件。


2012-11-15 : 添加/lisps/python目录, 保存备份rope、ropemacs、ropemode、pymacs。添加init_python.el对python设置。


2013-3-14
用jedi替换rope ropemacs ropemode pymacs , 不用python-mode.


2013-4-23
添加cscope。 在unbuntu下直接sudo apt-get install cscope 即可。
在mac下安装，看mac.org

2013-4-28
今天发现一个问题，就是在安装了auto-complete-clang之后，由于把auto-complete和auto-complete-clang的配置代码整合在一起，写在了init_initjedi.el中。导致jede:complete的快捷键定制失效。
虽然最后也没有弄清楚具体是为什么会这样。但是，可以把关于auto-complete和auto-complete-clang的配置整合到init_auto-complete-clang.el文件中，并把init_initjedi.el文件放到.emacs最后。