/* 
 *     Created:  15 May 2013 14:45:57
 *     Author:   weishijian@ubuntu
 Description:  
*/

//#include <config.h>
#include "getOtherID.h"
#include "msgqueue.h"

#include "global.h"

#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <csignal>

#include <iostream>
using namespace std;

msgqueue msg;

int message_t;


void hello(int i)
{
    printf ("ddd");
}

void clear(int i)
{
    printf ("clear\n");
    msg.remove_queue(message_t);
    exit(0);
}

int main(int argc,char ** argv)
{
    getOtherID otherID;
    
    struct mymsgbuf qbuf;

    message_t = msg.create_queue();

    int id;

    signal(SIGUSR1, hello);
    signal(SIGINT, clear);
    while(1)
    {
	id = otherID.getID(argv[1]);

	printf ("%d",id);

	if (id > 0)
	{
	    printf ("%d\n",id);
	    cout<<id<<endl;
	    char cmd[256];
	    memset(cmd, 0, 256);
	    printf ("please input a msessage:");
	    fgets(cmd, 255, stdin);
	    msg.send_message(message_t, (struct mymsgbuf *) &qbuf, 1, cmd);
	    kill(id, SIGUSR1);
//	    sleep(3);
	}
    }
}

