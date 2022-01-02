#Josh Block // Module 10 // NumStat 2
import math
import statistics
import os
import sys

def get_file():
    while(True):
        try:
            global filename
            filename = input('Enter a file name: ')

            print ('')

            file = open(filename,'r')

            print('File name: ',filename,sep='')
            
            print('')
        except FileNotFoundError:
            print('File Not Found')
            continue
        except ValueError as num_error:
            print('The following file could not be read properly\n(ex: blank line or non-integer):\n',num_error)
            continue
        else:
            break

    while(True):
        try:
            global num_list
            with open(filename,'r') as fh:
                num_list = sorted(map(int, fh))
                fnum_list = num_list
                fnum_list.sort()

                sumup = sum(num_list)
                count = len(num_list)
                average = sumup/count
                fmaximum = max(num_list)
                fminimum = min(num_list)
                ranger = fmaximum - fminimum
                median1 = len(fnum_list) // 2 #statistics.median(num_list)
                median4 = (fnum_list[median1] + fnum_list[~median1]) /2
                def mod(num_list):
                    frequency={}
                    for num in num_list:
                        frequency.setdefault(num,0)
                        frequency[num]+=1
                    highestFrequency=max(frequency.values())
                    highestFreqLst=[]
                    for num, freq in frequency.items():
                        if freq == highestFrequency:
                            highestFreqLst.append(num)
                    return highestFreqLst
                mode = mod(num_list) #statistics.multimode(num_list)


        except ZeroDivisionError:
            print('There are no numbers in',filename)
            print ('Please restart program and enter new filename.')
            print('')
            raise SystemExit
        except Exception as read_error:
            print('An error was found while reading file: ',filename)
            print('Given error:',read_error)
            print('')
        except ValueError as num_error:
            print('There are no numbers in',filename)

        else:
            print('Sum:',sumup)
            print('Count:',count)
            print('Average:',average)
            print('Max:',fmaximum)
            print('Minimum:',fminimum)
            print('Range:',ranger)
            print('Median:',str(median4))
            print('Mode:',mode)
            print('')
            return question_input()

def question_input():
    Question = input("Do you want to evaluate another program? (Y/N): ").lower().strip()
    if (Question == 'y'):
        return get_file()
    elif (Question == 'n'):
        print ("Program Closing...")
        print ("Program Terminated")
        raise SystemExit
    else:
        print('Please enter Y or N\n')
        return question_input()


get_file()
question_input()

            
            
            
