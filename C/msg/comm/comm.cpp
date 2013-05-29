/* 
 *     Created:  15 May 2013 14:45:57
 *     Author:   weishijian@ubuntu
 Description:  
*/

//#include <config.h>
#include "getOtherID.h"
#include "msgqueue.h"

#include "global/global.h"

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
int main2ID;

pthread_t thread[1]; 


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

void *thread1(void *arg)
{
    getOtherID otherID;
    
    const char * main2 = "local";
    for (; ; )
    {
	main2ID = otherID.getID(main2);
//	printf ("%d\n",main2ID);
	sleep(1);
    }

}


int main(int argc,char ** argv)
{
    
    
    struct mymsgbuf qbuf;

    message_t = msg.create_queue();



    int temp; 
    memset(&thread, 0, sizeof(thread));          //comment1 
    /*创建线程*/ 
    if((temp = pthread_create(&thread[0], NULL, thread1, NULL)) != 0)       //comment2 
	printf("线程1创建失败!\n"); 
    else 
	printf("线程1被创建\n"); 


    signal(SIGUSR1, hello);
    signal(SIGINT, clear);
    while(1)
    {
	if (main2ID > 0)
	{
	    char cmd[256];
	    memset(cmd, 0, 256);
	    printf ("please input a msessage:");
	    fgets(cmd, 255, stdin);
	    msg.send_message(message_t, (struct mymsgbuf *) &qbuf, 1, cmd);
	    kill(main2ID, SIGUSR1);
//	    sleep(3);
	}
    }
}

