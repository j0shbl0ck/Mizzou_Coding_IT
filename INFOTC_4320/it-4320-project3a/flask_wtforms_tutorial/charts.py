'''
This web service extends the Alphavantage api by creating a visualization module, 
converting json query results retuned from the api into charts and other graphics. 

This is where you should add your code to function query the api
'''
import requests
from datetime import datetime
from datetime import date
import pygal
import json


#Helper function for converting date
def convert_date(str_date):
    return datetime.strptime(str_date, '%Y-%m-%d').date()

def make_url(symbol, time_series):
    return "https://www.alphavantage.co/query?function=" + time_series_to_api_text(time_series) + "&symbol=" + symbol + "&interval=5min&outputsize=full&apikey=LIE8L1SQATAK0ZTM"

def get_json(url):
    r = requests.get(url)
    data = r.json()
    return data

def parse_json(data):
    data = str(data)
    data = data.replace("'", '"')
    parsed_json = json.loads(str(data))
    return parsed_json

def choose_graph(chart_type):
    if chart_type == 'bar': line_chart = pygal.Bar(x_label_rotation=40)
    elif chart_type == 'line': line_chart = pygal.Line(x_label_rotation=40)
    return line_chart

def chart_creation():
            ss = get_stock_symbol()
            ct = get_chart_type()
            ts = get_time_series_func()
            d1 = get_beginning_date()
            d2 = get_end_date(d1)

            # make URL for API query
            url = make_url(ss, ts)
            # get JSON data
            json_data = get_json(url)
            # parse JSON data
            parsed_json = parse_json(json_data)

            # change the time series string to a string that can 
            # be used to access data in the parsed_json variable
            if ts == "TIME_SERIES_INTRADAY":
                ts = "Time Series (5min)"
            elif ts == "TIME_SERIES_DAILY":
                ts = "Time Series (Daily)"
            elif ts == "TIME_SERIES_WEEKLY": 
                ts = "Weekly Time Series"
            elif ts == "TIME_SERIES_MONTHLY":
                ts = "Monthly Time Series"

            # lists to hold open, high, low, and close prices for stocks
            open_list = []
            high_list = []
            low_list = []
            close_list = []

            # the below for loop loops through the json data, assigning each price
            # to its respective list.

            beginning_date_split = d1.split("-")
            ending_date_split = d2.split("-")

            beg_year = int(beginning_date_split[0])
            beg_month = int(beginning_date_split[1])
            beg_day = int(beginning_date_split[2])

            end_year = int(ending_date_split[0])
            end_month = int(ending_date_split[1])
            end_day = int(ending_date_split[2])

            beg_date = datetime(beg_year, beg_month, beg_day)
            end_date = datetime(end_year, end_month, end_day)

            return beg_date

            # date_list is used for generating a list of dates to use for x_values
            date_list = []
            for date in parsed_json[ts]:
                d = date.split("-")
                dy = int(d[0])
                dm = int(d[1])
                dd = d[2]
                
                if len(dd.split()) > 1:
                    dd = dd.split()
                    d_day = int(dd[0])
                    dt = dd[1]
                    dt_split = dt.split(":")
                    dhour = int(dt_split[0])
                    dmin = int(dt_split[1])
                    dsec = int(dt_split[2])
                    d_date = datetime(dy, dm, d_day, dhour, dmin, dsec)
                else: d_date = datetime(dy, dm, int(dd))


                # if statement filters out data that is outside range of beginning and end dates
                if beg_date <= d_date and d_date <= end_date:
                    date_list.append(date)
                    open_list.append(float(parsed_json[ts][date]["1. open"]))
                    high_list.append(float(parsed_json[ts][date]["2. high"]))
                    low_list.append(float(parsed_json[ts][date]["3. low"]))
                    close_list.append(float(parsed_json[ts][date]["4. close"]))
                else: continue
            
            # reverses the data because the dates are in reverse chronological order
            date_list.reverse()
            open_list.reverse()
            high_list.reverse()
            low_list.reverse()
            close_list.reverse()

            # the following code makes the chart
            title = "Stock Data for " + ss + ": " + d1 + " to " + d2

            line_chart = choose_graph(ct)
            line_chart.title = title
            line_chart.x_labels = map(str, date_list)
            line_chart.add('Open', open_list)
            line_chart.add('High', high_list)
            line_chart.add('Low', low_list)
            line_chart.add('Close', close_list)
            line_chart.render_in_browser()

            