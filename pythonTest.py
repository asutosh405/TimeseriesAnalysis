# -*- coding: utf-8 -*-
"""
Created on Fri Oct 06 16:24:46 2017

@author: U6046212
"""

import csv


def readCSV(filename,sep=",",header=True,ignoreLines="#",printHeader=True):
    print filename
    rows=[]
    with open(filename,'r') as f:
        reader=csv.reader(f,delimiter=sep)
        rownum=0
        colnum=0
        
        for row in reader:
            #print row
            #Store the header in a list
            if rownum==0:
                header=row
                colnum=len(header)
                if(printHeader==True):
                    rows.append(header)

            else:
                if(row[0].startswith(ignoreLines)):
                    continue
                else:
                    if(len(row)!=colnum):
                        f1=open('C:\Users\U6046212\Desktop\\Error.bat','w')
                        count=0
                        for col in row:
                            
                            f1.write(col)
                            count=count+1
                            if(count<len(row)):
                                f1.write(",")
                        
                        f1.write("\n")
                        f1.close()
                    else:
                        rows.append(row)
            rownum=rownum+1
    return rows
                    
            


rows=readCSV(filename="C:\Users\U6046212\Desktop\\test.csv",sep=";",printHeader=False)