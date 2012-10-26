# -*- coding:utf-8 -*-

import time;

def checkLeapYear():
    inputYear = 0
    inputYear = input('input year(need all number):');
    print (inputYear);

    
    if inputYear == '':
        inputYear = time.localtime().tm_year;
    else:
        if inputYear.isdigit():
            inputYear = int(inputYear);
        else:
            print ("wrong input");
            return ;

    if ((inputYear % 400 == 0)
        or 
        (inputYear % 4 ==0 
         and 
         inputYear % 100 != 0)
        ):
        print ("the year is %s, is a leap Year" %(inputYear));
    else:
        print ("the year is %s, is not a leap Year" % (inputYear));
        
if __name__ == "__main__":
    checkLeapYear();
