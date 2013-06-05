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
#include <stdbool.h>
#include <iostream>

#include <sys/socket.h>
#include <sys/types.h>
//#include <linux/in.h>
#include <arpa/inet.h>

#include <string.h>

using namespace std;

#define MAX_DATA_SEND_TO_SERVER 1024


msgqueue msg;

int message_t;
int localID;
struct mymsgbuf qbuf;
int connectModel = -1;   // 0: 短连接    1:长连接   -1:程序首次启动
bool hasDataToSend = false; 

pthread_t thread[2];  // thread1: getotherID,  thread2: send data to server
char dataForServer[MAX_DATA_SEND_TO_SERVER];

int socketTOServer;

void *connectServer(void *arg)
{

    int recbytes;
    int sin_size;
    char buffer[1024]={0};    /* 接受缓冲区 */

    unsigned short portnum=0x8888;  /* 服务端使用的通信端口，可以更改，需和服务端相同 */


    printf ("%s\n",*(char**)arg);


    for ( ;  ;  )
    {
	if (connectModel == -1)
	{
	    //一次socket 连接到server, 通知server
	    socketTOServer = socket(AF_INET, SOCK_STREAM, 0);
	    if (socketTOServer == -1)
	    {
		//send message to local.
	    }

	    struct sockaddr_in s_add; 

	    bzero(&s_add,sizeof(struct sockaddr_in));
	    s_add.sin_family=AF_INET;
	    inet_pton(AF_INET, "127.0.0.1", &s_add.sin_addr);
	    s_add.sin_port=htons(portnum); 

	    if(-1 == connect(socketTOServer,(struct sockaddr *)(&s_add), sizeof(struct sockaddr)))
	    {
		printf("connect fail !\r\n");

	    }

	    if (write(socketTOServer, "connect", 7) == -1)
	    {
		printf ("write error\n");

	    }
	    for ( ;  ;  )
	    {
		if(-1 == (recbytes = read(socketTOServer,buffer,1024)))
		{
		    printf("read data fail !\n");

		}
		printf("read ok\nREC:\n");

		buffer[recbytes]='\0';
		printf("%s\n",buffer);
		break;
	    }

	    printf ("close connect\n");
	    close(socketTOServer);

	    

	    char bbb[1024];
	    strncpy(bbb, buffer, 5);
	    printf ("%d\n",strcmp(bbb,"model"));


	    connectModel = 0;
	}

	if (connectModel == 0)//short socket connect.
	{
	    if (hasDataToSend)
	    {
		//send data to server
	    }
	    else
	    {
		//do nothing.
	    }
	}

	if (connectModel == 1)
	{
	    if (hasDataToSend)
	    {
		//send data to server
	    }
	    else
	    {
		//心跳数据
	    }
	}
    }

}

void localData(int i)
{
    msg.read_message(message_t, (struct mymsgbuf *) &qbuf, 2);
}

void clear(int i)
{
    printf ("clear\n");
    msg.remove_queue(message_t);
    exit(0);
}

void *getlocalID(void *arg)
{
    getOtherID otherID;
    
    const char * local = "local";
    for (; ; )
    {
	localID = otherID.getID(local);
//	printf ("%d\n",localID);
	sleep(1);
    }
}


int main(int argc,char ** argv)
{
    struct mymsgbuf qbuf;

    message_t = msg.create_queue();



    int temp; 
    memset(&thread, 0, sizeof(thread));

    if((temp = pthread_create(&thread[0], NULL, getlocalID, NULL)) != 0)
	printf("获取ID线程创建失败!\n"); 
    else 
	printf("获取ID线程被创建\n"); 


    char *aa = argv[2];
    printf ("%s\n",aa);

    if ((temp = pthread_create(&thread[1], NULL, connectServer, &aa)) != 0)
    {
	printf ("failed\n");
    }
    else
    {
	printf ("ok\n");
    }
	    

    signal(SIGUSR1, localData);
    signal(SIGINT, clear);
    while(1)
    {

//注释此些行，不用这些来发数据给local，而是等server发来数据之后，再发给local。
// 	if (localID > 0)
// 	{
// 	    char cmd[256];
// 	    memset(cmd, 0, 256);
// 	    printf ("please input a msessage(send to local):");
// 	    fgets(cmd, 255, stdin);
// 	    msg.send_message(message_t, (struct mymsgbuf *) &qbuf, 1, cmd);
// 	    kill(localID, SIGUSR1);
// //	    sleep(3);
// 	}
    }
}

