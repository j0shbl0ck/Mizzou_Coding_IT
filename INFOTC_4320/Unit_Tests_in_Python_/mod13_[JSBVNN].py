##Challenge: Unit Tests in Python
##Course: INFOTC 4320
##Name: Josh Block [JSBVNN]
##Date: 11/19/21
##Sources: https://docs.python.org/3/library/unittest.html

import json
import pygal
import lxml
import requests
from datetime import datetime
import unittest

#Unit Test for Symbol
def get_stock_symbol():
    while True:
        try:
        stock_symbol = input("user_input")
        upper_var = stock_symbol.isupper()
        alpha_var = stocksymbol.isalpha()

        if stock_symbol.isupper() and stock_symbol.isalpha()
            print(stock_symbol)
        else:
            print("Not accepted")
    return stock_symbol

#Unit Test for Chart Type
def get_chart_type():
    while True:
        try:
            chart_int = int(input("Enter chart type (1,2)"))
            chart_type = ""

            if chart_int == 1: chart_type = "bar"
            elif chart_int == 2: chart_type = "line"
            else:
                print("Please enter either 1 or 2\n")
                continue
            break
        except ValueError:
            print("Please enter either 1 or 2\n")
            continue
    return chart_type

#Unit Test for Time Series
def get_time_series_func():
    while True:
        try:
            print("1")
            print("2")
            print("3")
            print("4")
            time_series = int(input("\nPlease enter the time series function you would like to use (1, 2, 3, 4): "))

            ts = ""
            if time_series == 1: ts = "TIME_SERIES_INTRADAY"
            elif time_series == 2: ts = "TIME_SERIES_DAILY"
            elif time_series == 3: ts = "TIME_SERIES_WEEKLY"
            elif time_series == 4: ts = "TIME_SERIES_MONTHLY"
            else: 
                print("Please enter the integer corresponding to your desired Time Series.")
                continue
            break
        except ValueError:
            print("Please enter the integer corresponding to your desired Time Series.")
            continue
    return ts

#Unit Test for Start Date:
def get_beginning_date():
    while True:
        try:
            date1 = input("\nPlease enter the beginning date (YYYY-MM-DD): ")
            split_date = date1.split('-')

            year = int(split_date[0])
            month = int(split_date[1])
            day = int(split_date[2])

            beginning_date = datetime(year, month, day)
            current_date = datetime.today()

            if beginning_date > current_date:
                print("Beginning date must be before current date.")
                continue
            break
        except:
            print("Please enter a beginning date in proper YYYY-MM-DD format.")
            continue
    return beginning_date.strftime('%Y-%m-%d')

#Unit Test for End Date:
def get_end_date(beginning_date):
    while True:
        try:
            date2 = input("\nPlease enter the end date (YYYY-MM-DD): ")
            split_date = date2.split('-')
            split_beginning_date = beginning_date.split('-')

            year = int(split_date[0])
            month = int(split_date[1])
            day = int(split_date[2])

            year2 = int(split_beginning_date[0])
            month2 = int(split_beginning_date[1])
            day2 = int(split_beginning_date[2])

            ending_date = datetime(year, month, day)
            begin_date = datetime(year2, month2, day2)
            current_date = datetime.today()

            if begin_date > ending_date:
                print("Ending date must be after beginning date.")
                continue
            elif ending_date > current_date:
                print("Ending date must be equal to or before the current date.")
                continue
            break
        except:
            print("Please enter an ending date in proper YYYY-MM-DD format.")
            continue
    return ending_date.strftime('%Y-%m-%d'

##class TestStringMethods (unittest.TestCase):
##    def stock(self):
##        self.assertTrue(self.issuper())
##        self.assertTrue(self.isalpha())
##
##        if stock_symbol.isupper() and stock_symbol.isalpha()
##            print(stock_symbol)
##        else:
##            print("Not accepted")
##    return stock_symbol
##
##    def chart_type(self):
##        self.assertTrue(self.isnumeric())
##
##        if (self)
    
        




        
