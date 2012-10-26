#!/usr/bin/env python

# Time-stamp: <2010-07-17 22:26:31 Saturday by ahei>

# @version 1.0
# @author ahei


import tarfile
import sys
import os.path as op


def unpack(src, dest=None):
    #Check if file exist
    if not op.exists(src):
        print "The unpack file does not exist!"
        return
    #Ggt unpack file's extension
    extension = op.splitext(src)[-1]
    if extension not in ['.tz2','.gz']:
        print 'Don\'t support %s files!' % extension
        return
    #Get extract mode
    mode = 'r:%s' % extension[1:]
    if not op.isabs(src):
        #src = os.path.abspath(src)
        src = op.realpath(src)
    #Get destination path
    dest = dest or op.split(src)[0]
    dest = dest.replace('\\','/')
    tarobj = tarfile.open(src, mode)
    for tarinfo in tarobj:
        print 'Extract: %s/%s' % (dest,tarinfo.name)
        tarobj.extract(tarinfo.name, dest)
    tarobj.close()
    print "Finished!"

if __name__ == '__main__':
    argv_count = len(sys.argv)
    if argv_count == 3:
        unpack(sys.argv[1],sys.argv[2])
    elif argv_count == 2:
        unpack(sys.argv[1])
    else:
        print 'You must give unpack file!'
