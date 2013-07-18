// -*- C++ -*-

/* @(#)dataparse.h
 */

#ifndef _DATAPARSE_H
#define _DATAPARSE_H 1


#include <string>
#include <deque>
//#include "IPC_message/message.h"
#include "message.h"

using namespace std;

class dataparse
{
public:
    dataparse();
    virtual ~dataparse();

public:
//    struct Sys *createStruct();
    void createStruct();
    void deleteStruct();
    int parse(const char *jsondata); 
    int packageSignalCtrl(SrvCmd cmdStruct, string &str);
    int packageMutipleCtrl(deque<SrvCmd> cmdQue, string &str);
    int packageSignalSensor(MeteringData meterStruct, string &str);
//    struct Sys *sys;
    deque<SrvCmd> cmdQueue;
private:
    string getCurrentTime();
    string intToStr(int i);
private:
    SrvCmd theCmd;

};

#endif /* _DATAPARSE_H */

