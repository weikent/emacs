/* 
 *     Created:  22 May 2013 10:51:03
 *     Author:   weishijian@ubuntu
 Description:  
*/



#include "msgqueue.h"
#include "global.h"

#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <csignal>

#include <iostream>


msgqueue msg;
int message_t;
struct mymsgbuf qbuf;

void hello(int i)
{
//    printf ("%d\n",i);
    msg.read_message(message_t, (struct mymsgbuf *) &qbuf, 1);
}

void clear(int i)
{
    printf ("clear\n");
    msg.remove_queue(message_t);
    exit(0);
}

int main(int argc, char *argv[])
{

    signal(SIGUSR1, hello);
    signal(SIGINT, clear);
    message_t = msg.create_queue();
    printf ("%d\n",message_t);
    while(1)
    {

    }
    return 0;
}


