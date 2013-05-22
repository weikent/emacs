/* @(#)getOtherID.h
 */

#ifndef _GETOTHERID_H
#define _GETOTHERID_H 1

class getOtherID
{
public:
    getOtherID();
    virtual ~getOtherID();
private:
    int isdir(char *path);
    char * getfile(char *path);
    char *readstatus(char *filename);
public:
    int getID(char *filename);
};

#endif /* _GETOTHERID_H */

