/* 
 *     Created:  15 May 2013 14:45:57
 *     Author:   weishijian@ubuntu
 Description:  
*/

//#include <config.h>
/* #include "getOtherID.h" */
/* #include "msgqueue.h" */

//#include "global/global.h"

#include <iostream>
#include <string>
#include <ctype.h>
#include <sys/types.h>
#include <pthread.h> 
#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <csignal>
#include <stdbool.h>
#include <sys/socket.h>
#include <sys/types.h>
//#include <linux/in.h>
#include <arpa/inet.h>

#include "msgsnd_cmd.h"
#include "dataparse.h"

using namespace std;

#define MAX_DATA_SEND_TO_SERVER 1024

#define HEARTINTERVAL 2



/* msgqueue msg; */

/* int message_t;  //消息队列 */
//int localID;   //本地进程ID
//struct mymsgbuf qbuf;   // 消息队列的结构体，用来保存消息队列中的信息。

dataparse dp;



int connectModel = 1;   // 0: 短连接    1:长连接   -1:程序首次启动
int sameLAN = 0;    //0:不在同一个LAN   1:在同一个LAN
bool hasDataToSend = false; // 本地层是不是有信息要发到服务器。
pthread_t thread[2];  // thread1: getotherID(deleted),  thread2: send data to server   thread3: the same LAN, start this thread to create a socket server.
//char dataForServer[MAX_DATA_SEND_TO_SERVER];  //
int socketTOServer;  //与服务器连接的socket描述符。



string& trim(string &str, string oldstr,string::size_type pos = 0)
{
    string delim = oldstr; //删除空格或者tab字符
    pos = str.find_first_of(delim, pos);
    if (pos == string::npos)
        return str;
    return trim(str.erase(pos, 1), delim);
}
/********************************************************/
/* 检查从服务器接收的数据，是不是要改变程序的连接模式。 */
/* 即设置长/短连接				        */
/********************************************************/
int changeConnetModel(char *buff)
{
    char temp[10];

    bzero(temp, sizeof(temp));
    strncpy(temp, buff, 6);
    printf ("%s\n",temp);
    if (strcmp(temp, "model0") == 0)
    {
	printf ("change connect mode to short connection!\n", 0);
	close(socketTOServer);
	return 0;
    }
    else if ((strcmp(temp, "model1") == 0) || (strcmp(temp, "heart") == 0))
    {
	printf ("change connect mode to long connection!\n", 1);
	return 1;
    }
    else
    {
	close(socketTOServer);
	printf ("change connect mode to short connection!\n", 0);
	return 0;
    }
}


/*****************************/
/* 检查是否与手机在同一个LAN */
/*****************************/
int checkIsTheSameLAN(char *buff)
{
    char temp[10];
    bzero(temp, sizeof(temp));
    strncpy(temp, buff, 4);
    if (strcmp(temp, "same") == 0)
    {
//same LAN
	return 1;
    }
    else
    {
// not the same LAN
// close thread.
	return 0;
    }
    return 0;
}

int socketConnect(char *ip, int portnum)
{
    socketTOServer = socket(AF_INET, SOCK_STREAM, 0);
    if (socketTOServer == -1)
    {
	return -1;
    }

    struct sockaddr_in s_add; 

    bzero(&s_add,sizeof(struct sockaddr_in));
    s_add.sin_family=AF_INET;
    inet_pton(AF_INET, "192.168.1.152", &s_add.sin_addr);
    s_add.sin_port=htons(portnum); 

    if(-1 == connect(socketTOServer,(struct sockaddr *)(&s_add), sizeof(struct sockaddr)))
    {
	printf("connect fail !\r\n");
	return -1;
    }
    
    return 0;
}


/**************************/
/* 与服务器连接的主要函数 */
/**************************/
void *connectServer(void *arg)
{
    /* char text6[] = "{\"sysID\":\"1\",\"seqOfIns\":\"1\",\"numOfDev\":\"1\",\"optCode\":\"0050\",\"timeout\":\"1234756609589\",\"devArray\":[{\"devID\":\"aa00ddeeffhh\",\"numOfCont\":\"1\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"1\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"}]}]},{\"devID\":\"aa00ddeeffhh\",\"numOfCont\":\"1\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"1\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"}]}]}]}"; */

    /* dp.parse(text6); */
    /* dp.parse(text6); */
    /* dp.parse(text6); */
    /* dp.parse(text6); */

    char text6[] = "{\"sysID\":\"1\",\"seqOfIns\":\"1\",\"numOfDev\":\"2\",\"optCode\":\"0050\",\"timeout\":\"1234756609589\",\"devArray\":[{\"devID\":\"aa00ddeeffhe\",\"numOfCont\":\"2\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"},{\"actType\":\"1\",\"actValue\":\"0\"}]},{\"contID\":\"1\",\"contType\":\"500\",\"numOfAct\":\"1\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"}]}]},{\"devID\":\"aa00ddeeffhh\",\"numOfCont\":\"2\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"1\",\"actValue\":\"0\"},{\"actType\":\"2\",\"actValue\":\"0\"}]},{\"contID\":\"1\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"1\",\"actValue\":\"0\"},{\"actType\":\"2\",\"actValue\":\"0\"}]}]}]}"; 

    cout << "parse data" << endl;

    dp.parse(text6);
    
    string str;
    dp.packageMutipleCtrl(dp.cmdQueue, str);
    
    string oldstr = "\n";
    trim(str,oldstr, 0);
    oldstr = "\t";
    trim(str, oldstr, 0);
    oldstr = " ";
    trim(str, oldstr, 0);
    oldstr = "\r";
    trim(str, oldstr, 0);

    char temp[4];
    sprintf(temp, "%04d", str.length());
    //str = temp+str;
    cout <<"str == " << str << endl;


//    dp.parse(str.c_str());
    
    int recbytes;
    int sin_size;

    char buffer[MAX_DATA_SEND_TO_SERVER]={0};    /* 接受缓冲区 */

    //char heart[] = "{\"optCode\":\"heart\",\"devID\":\"34bca6010203\"}";
    
    int strlen = str.length();
    char heart[MAX_DATA_SEND_TO_SERVER] = {0};

    int aa = str.length();
    strncpy(heart, str.c_str(), aa);
    
    heart[aa] = '\0';
    cout << "heart = " << heart << endl;
//    strcpy(heart, str.c_str());

//    char *heart = const_cast<char *>(str.c_str());
    int ret;
//    unsigned short portnum=0x8888;  /* 服务端使用的通信端口，可以更改，需和服务端相同 */
    unsigned short portnum=14567;

    printf ("%s\n",*(char**)arg);


    for ( ;  ;  )
    {

	if (connectModel == -1)
	{
	    printf ("connect init\n");
//一次socket 连接到server, 通知server
	    socketTOServer = socket(AF_INET, SOCK_STREAM, 0);
	    if (socketTOServer == -1)
	    {
//send message to local.
	    }

	    struct sockaddr_in s_add; 

	    bzero(&s_add,sizeof(struct sockaddr_in));
	    s_add.sin_family=AF_INET;
	    inet_pton(AF_INET, "192.168.1.152", &s_add.sin_addr);
	    s_add.sin_port=htons(portnum); 

	    if(-1 == connect(socketTOServer,(struct sockaddr *)(&s_add), sizeof(struct sockaddr)))
	    {
		printf("connect fail !\r\n");

	    }

	    if (write(socketTOServer, "init", 4) == -1)
	    {
		printf ("write error\n");

	    }
	    for ( ;  ;  )
	    {
		printf ("read\n");
		memset(buffer, 0, MAX_DATA_SEND_TO_SERVER);
		if(-1 == (recbytes = read(socketTOServer,buffer,MAX_DATA_SEND_TO_SERVER)))
		{
		    printf("read data fail !\n");
		}
		printf("read ok\nREC:\n");

		buffer[recbytes]='\0';
		printf("%s\n",buffer);
		break;
	    }

//	    connectModel = changeConnetModel(buffer);

	    if (dp.parse(buffer) == 0)
	    {
//need send to local app.
	    }


	    printf ("close connect\n");
	    connectModel = 1;
	    close(socketTOServer);

	}
	if (connectModel == 0)//short socket connection
	{
	    if (hasDataToSend)
	    {
//send data to server
		printf ("has Data to send!\n");

		socketTOServer = socket(AF_INET, SOCK_STREAM, 0);
		if (socketTOServer == -1)
		{
		    //send message to local.
		}

		struct sockaddr_in s_add; 

		bzero(&s_add,sizeof(struct sockaddr_in));
		s_add.sin_family=AF_INET;
		inet_pton(AF_INET, "192.168.1.152", &s_add.sin_addr);
		s_add.sin_port=htons(portnum); 

		if(-1 == connect(socketTOServer,(struct sockaddr *)(&s_add), sizeof(struct sockaddr)))
		{
		    printf("connect fail !\r\n");

		}

//need
/* printf ("%s\n",qbuf.mtext); */
/* if (write(socketTOServer, qbuf.mtext, sizeof(qbuf.mtext)) == -1) */
/* { */
/*     printf ("write error\n"); */

/* } */
		for ( ;  ;  )
		{
		    memset(buffer, 0, MAX_DATA_SEND_TO_SERVER);
		    if(-1 == (recbytes = read(socketTOServer,buffer,MAX_DATA_SEND_TO_SERVER)))
		    {
			printf("read data fail !\n");
		    }
		    printf("read ok\nREC:\n");

		    buffer[recbytes]='\0';
		    printf("%s\n",buffer);
		    break;
		}


		printf ("close this short connect\n");
		close(socketTOServer);
//		connectModel = changeConnetModel(buffer);

		hasDataToSend = false;

	    }
	    else
	    {
		//do nothing.
	    }
	}

	if (connectModel == 1)// long socket connection
	{
	    //send data to server, Although local app not send data, the comm app need send "heart" to server.

	    int connectIsOK = 0;
	    close(socketTOServer);

	    printf ("has Data to send!\n");

	    socketTOServer = socket(AF_INET, SOCK_STREAM, 0);
	    if (socketTOServer == -1)
	    {
		//create socket failed.
		//send message to local.
	    }

	    struct sockaddr_in s_add; 

	    bzero(&s_add,sizeof(struct sockaddr_in));
	    s_add.sin_family=AF_INET;
	    inet_pton(AF_INET, "192.168.1.152", &s_add.sin_addr);
	    s_add.sin_port=htons(portnum); 

	    if(-1 == connect(socketTOServer,(struct sockaddr *)(&s_add), sizeof(struct sockaddr)))
	    {
		printf("connect fail !\r\n");
		continue;
	    }
	    connectIsOK = 1;
	    /* if (write(socketTOServer, "init", 4) == -1) */
	    /* { */
	    /* 	printf ("write error\n"); */

	    /* } */

	    // use for when the first time change to long connection, send a "heart" to server.
	    long int li = HEARTINTERVAL;

	    fd_set fdsr;
	    struct timeval tv;
	    int maxsock;
	    maxsock = socketTOServer;



	    while(1 == connectIsOK)
	    {
		
		FD_ZERO(&fdsr);

		FD_SET(socketTOServer, &fdsr);

		// timeout setting
		tv.tv_sec = 9;
		tv.tv_usec = 0;


		ret = select(maxsock + 1, &fdsr, NULL, NULL, &tv);

		if (ret < 0) {
		    perror("select");
		    break;
		} else if (ret == 0) {
//		    printf("timeout\n");
		    /* continue; */
		}



		if (FD_ISSET(socketTOServer, &fdsr))
		{

		    ret = read(socketTOServer, buffer, MAX_DATA_SEND_TO_SERVER);

		    if (ret <= 0)
		    {        
			/* server close this socket connect. */
			printf("server close\n");

			close(socketTOServer);
			connectIsOK = 0;
			/* connectModel = 0; */
			connectModel = 1;

		    } 
		    else
		    {        
			/* receive data from server */
			if (ret < MAX_DATA_SEND_TO_SERVER)
			{
			    memset(&buffer[ret], '\0', 1);
			}
			printf("-----------%s------------\n", buffer);
			dp.parse(buffer);
//			send(fd_A[i], buf, sizeof(buf), 0);
		    }
		}


		if (hasDataToSend)
		{

		    //send data to server
//此处代码在7-10日的时候注释掉。原因是修改发送数据给本地层的代码时，qbuf提示没有定义。  此处用到qbuf是因为可以直接把从本地层接收到的数据直接发送给服务器。
		    /* printf ("%s\n",qbuf.mtext); */
		    /* if (write(socketTOServer, qbuf.mtext, sizeof(qbuf.mtext)) == -1) */
		    /* { */
		    /* 	printf ("write error\n"); */

		    /* } */

		    /* 以后可以试试不用下面的代码，而使用select来查询是否有服务器的数据。 */
		    for ( ;  ;  )
		    {
			memset(buffer, 0, MAX_DATA_SEND_TO_SERVER);
			if(-1 == (recbytes = read(socketTOServer,buffer,MAX_DATA_SEND_TO_SERVER)))
			{
			    printf("read data fail !\n");
			}
			printf("read ok\nREC:\n");

			buffer[recbytes]='\0';
			printf("%s\n",buffer);
//			connectModel = changeConnetModel(buffer);
			break;
		    }

		    hasDataToSend = false;
		}
		else
		{
		    /* sleep(5); */
		    cout << "heart" << endl;
		    //心跳数据
		    if (li == HEARTINTERVAL)
		    {
			li = 0;
			if (write(socketTOServer, heart, aa) == -1)
			{
			    printf ("write error\n");

			}

// 此处代码注释掉，使用上面的select来接收服务器端数据。
/* 			memset(buffer, 0, MAX_DATA_SEND_TO_SERVER); */
/* 			if(-1 == (recbytes = read(socketTOServer,buffer,MAX_DATA_SEND_TO_SERVER))) */
/* 			{ */
/* 			    printf("read data fail !\n"); */
/* 			} */
/* 			printf("read ok\nREC:\n"); */

/* 			buffer[recbytes]='\0'; */
/* 			printf("%s\n",buffer); */
/* //			connectModel = changeConnetModel(buffer); */
/* 			dp.parse(buffer); */
/* 			printf ("one connect finish-----------------------------\n"); */
		    }
		    li++;
		}
	    }
	}
    }
}

/* void localData(int i) */
/* { */
/*     msg.read_message(message_t, (struct mymsgbuf *) &qbuf, 2); */
/*     hasDataToSend = true; */
/* } */

/* void clear(int i) */
/* { */
/*     printf ("clear\n"); */
/*     msg.remove_queue(message_t); */
/*     exit(0); */
/* } */

void *sendmessage(void *arg)
{

    Msg_send msgsnd("tpt_snd_ctl_rcv");

    size_t sizMsg = sizeof(SrvCmd)+sizeof(long);
    MsgCmd tMsgCmd;
    while(1)
    {
//	printf ("sendmessage\n");
	usleep(182000);
    
//	printf ("dp.cmdQueue.size() = %d \n", dp.cmdQueue.size());

	while(dp.cmdQueue.size())
	{
//	    printf ("pop_front()\n");
	    tMsgCmd.msg_type = sizMsg;
	    strcpy(tMsgCmd.msg_text.sys_id, dp.cmdQueue.front().sys_id);
	    tMsgCmd.msg_text.ins_seq_no = dp.cmdQueue.front().ins_seq_no;
	    tMsgCmd.msg_text.dev_no = dp.cmdQueue.front().dev_no;
	    strcpy(tMsgCmd.msg_text.op_code, dp.cmdQueue.front().op_code);
	    strcpy(tMsgCmd.msg_text.dev_id, dp.cmdQueue.front().dev_id);
	    tMsgCmd.msg_text.ctrl_no = dp.cmdQueue.front().ctrl_no;

	    strcpy(tMsgCmd.msg_text.ctrl_id, dp.cmdQueue.front().ctrl_id);
	    strcpy(tMsgCmd.msg_text.ctrl_typ, dp.cmdQueue.front().ctrl_typ);
	    tMsgCmd.msg_text.act_no = dp.cmdQueue.front().act_no;
	
	    strcpy(tMsgCmd.msg_text.act_typ, dp.cmdQueue.front().act_typ);
	    strcpy(tMsgCmd.msg_text.act_val, dp.cmdQueue.front().act_val);
	    strcpy(tMsgCmd.msg_text.act_unit, dp.cmdQueue.front().act_unit);
	    tMsgCmd.msg_text.act_time, dp.cmdQueue.front().act_time;
	    tMsgCmd.msg_text.act_precs = dp.cmdQueue.front().act_precs;
	    tMsgCmd.msg_text.act_min = dp.cmdQueue.front().act_min;
	    tMsgCmd.msg_text.act_max = dp.cmdQueue.front().act_max;
	    strcpy(tMsgCmd.msg_text.act_stat, dp.cmdQueue.front().act_stat);
	    tMsgCmd.msg_text.act_stat_time = dp.cmdQueue.front().act_stat_time;

	    //用来测试
	    /* string str; */
	    /* dp.packageSignalCtrl(dp.cmdQueue.front(), str); */
	    /* cout << str << endl; */


	    /* ========== */
	    /* cout << tMsgCmd.msg_type << endl; */
	    /* cout << tMsgCmd.msg_text.sys_id << ": "; */
	    /* cout << tMsgCmd.msg_text.ins_seq_no << ": "; */
	    /* cout << tMsgCmd.msg_text.dev_no << ": "; */
	    /* cout << tMsgCmd.msg_text.op_code << ": "; */
	    /* cout << tMsgCmd.msg_text.dev_id << ": "; */
	    /* cout << tMsgCmd.msg_text.ctrl_no << ": "; */
	    /* cout << tMsgCmd.msg_text.ctrl_id << ": "; */
	    /* cout << tMsgCmd.msg_text.ctrl_typ << ": "; */
	    /* cout << tMsgCmd.msg_text.act_no << ": "; */
	    /* cout << tMsgCmd.msg_text.act_typ << ": "; */
	    /* cout << tMsgCmd.msg_text.act_val << ": "; */
	    /* cout << tMsgCmd.msg_text.act_unit << ": "; */
	    /* cout << tMsgCmd.msg_text.act_time << ": "; */
	    /* cout << tMsgCmd.msg_text.act_precs << ": "; */
	    /* cout << tMsgCmd.msg_text.act_min << ": "; */
	    /* cout << tMsgCmd.msg_text.act_max << ": "; */
	    /* cout << tMsgCmd.msg_text.act_stat << ": "; */
	    /* cout << tMsgCmd.msg_text.act_stat_time << endl; */

	    msgsnd.send_msg(tMsgCmd, sizMsg);
	   
	    /* msgsnd.send_msg(tMsgCmd, sizMsg); */

	    dp.cmdQueue.pop_front();
	}
    }
}
/* void *getlocalID(void *arg) */
/* { */
/*     getOtherID otherID; */
    
/*     const char * local = "local"; */
/*     for (; ; ) */
/*     { */
/* 	localID = otherID.getID(local); */
/* //	printf ("%d\n",localID); */
/* 	sleep(1); */
/*     } */
/* } */


int main(int argc,char ** argv)
{
    /* char text6[] = "{\"sysID\":\"1\",\"seqOfIns\":\"1\",\"numOfDev\":\"2\",\"optCode\":\"0050\",\"timeout\":\"1234756609589\",\"devArray\":[{\"devID\":\"aa00ddeeffhe\",\"numOfCont\":\"2\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"},{\"actType\":\"1\",\"actValue\":\"0\"}]},{\"contID\":\"1\",\"contType\":\"500\",\"numOfAct\":\"1\",\"actArray\":[{\"actType\":\"0\",\"actValue\":\"0\"}]}]},{\"devID\":\"aa00ddeeffhh\",\"numOfCont\":\"2\",\"contArray\":[{\"contID\":\"0\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"1\",\"actValue\":\"0\"},{\"actType\":\"2\",\"actValue\":\"0\"}]},{\"contID\":\"1\",\"contType\":\"500\",\"numOfAct\":\"2\",\"actArray\":[{\"actType\":\"1\",\"actValue\":\"0\"},{\"actType\":\"2\",\"actValue\":\"0\"}]}]}]}"; */

    /* cout << "parse data" << endl; */

    /* dp.parse(text6); */
    
    /* string str; */
    /* dp.packageMutipleCtrl(dp.cmdQueue, str); */
    /* string oldstr = "\n"; */
    /* trim(str,oldstr, 0); */
    /* oldstr = "\t"; */
    /* trim(str, oldstr, 0); */
    /* cout <<"str == " << str << endl; */

    /* dp.parse(str.c_str()); */

    /* while(dp.cmdQueue.size()) */
    /* { */
    /* 	printf ("pop_front()\n"); */

    /* 	//用来测试 */
    /* 	/\* string str; *\/ */
    /* 	/\* dp.packageSignalCtrl(dp.cmdQueue.front(), str); *\/ */
    /* 	/\* cout << str << endl; *\/ */




    /* 	cout << dp.cmdQueue.front().sys_id << ": "; */
    /* 	cout << dp.cmdQueue.front().ins_seq_no << ": "; */
    /* 	cout << dp.cmdQueue.front().dev_no << ": "; */
    /* 	cout << dp.cmdQueue.front().op_code << ": "; */
    /* 	cout << dp.cmdQueue.front().dev_id << ": "; */
    /* 	cout << dp.cmdQueue.front().ctrl_no << ": "; */
    /* 	cout << dp.cmdQueue.front().ctrl_id << ": "; */
    /* 	cout << dp.cmdQueue.front().ctrl_typ << ": "; */
    /* 	cout << dp.cmdQueue.front().act_no << ": "; */
    /* 	cout << dp.cmdQueue.front().act_typ << ": "; */
    /* 	cout << dp.cmdQueue.front().act_val << ": "; */
    /* 	cout << dp.cmdQueue.front().act_unit << ": "; */
    /* 	cout << dp.cmdQueue.front().act_time << ": "; */
    /* 	cout << dp.cmdQueue.front().act_precs << ": "; */
    /* 	cout << dp.cmdQueue.front().act_min << ": "; */
    /* 	cout << dp.cmdQueue.front().act_max << ": "; */
    /* 	cout << dp.cmdQueue.front().act_stat << ": "; */
    /* 	cout << dp.cmdQueue.front().act_stat_time << endl; */
    /* 	dp.cmdQueue.pop_front(); */
    /* } */
    /* return 0; */

    int temp; 
    memset(&thread, 0, sizeof(thread));

    if((temp = pthread_create(&thread[0], NULL, sendmessage, NULL)) != 0)
    	printf("create thread for send message to local app failed !\n");
    else
    	printf("create thread for send message to local app successed !\n");


    char *aa = argv[2];
//    printf ("%s\n",aa);

    if ((temp = pthread_create(&thread[0], NULL, connectServer, &aa)) != 0)
    {
	printf ("create thread for connectServer failed !\n");
    }
    else
    {
	printf ("create thread for connectServer successed !\n");
    }


    /* signal(SIGUSR1, localData); */
    /* signal(SIGINT, clear); */
    while(1)
    {
	sleep(10);
//注释此些行，不用这些代码来发数据给local，而是等server发来数据之后，再发给local。
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

