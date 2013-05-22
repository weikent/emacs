/* 
 *     Created:  10 May 2013 12:50:15
 *     Author:   weishijian@ubuntu
 */

//#include <config.h>


#include <signal.h>

#include <stdio.h>


void hello()
{
    printf ("ccc\n");
}


int main(int argc, char *argv[])
{
    signal(SIGUSR1, hello);
    while(1)
    {

    }
    return 0;
}



