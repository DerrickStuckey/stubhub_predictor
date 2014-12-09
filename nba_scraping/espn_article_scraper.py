# -*- coding: utf-8 -*-
"""
Created on Tue Nov 11 16:49:29 2014

@author: nectaryyo
"""

import datetime
import urllib2
from bs4 import BeautifulSoup
import pandas as pd

def espn_articles(days = 20):

    end_search = datetime.datetime.now()        # Defines current day as the last day of search
    dtdelta = datetime.timedelta(days)          # Defines # of days to go back, default 10
    beg_search = end_search - dtdelta     # Defines day of beginning of search based on number of day to go back

    # Extract year, month and day from beginning and end dates
    beg_year = str(beg_search.year)
    beg_month = str(beg_search.month)
    beg_day = str(beg_search.day)
    end_year = str(end_search.year)
    end_month = str(end_search.month)
    end_day = str(end_search.day)
    
    # Creates a list for seach for each team
    team_search = ['Atlanta+Hawks',  'Boston+Celtics',  'Brooklyn+Nets',  'Charlotte+Hornets',  'Chicago+Bulls',  'Cleveland+Cavaliers',  'Dallas+Mavericks',  'Denver+Nuggets',  'Detroit+Pistons',  'Golden+State+Warriors',  'Houston+Rockets',  'Indiana+Pacers',  'LA+Clippers',  'LA+Lakers',  'Memphis+Grizzlies',  'Miami+Heat',  'Milwaukee+Bucks',  'Minnesota+Timberwolves',  'New+Orleans+Pelicans',  'New+York+Knicks',  'Oklahoma+City+Thunder',  'Orlando+Magic',  'Philadelphia+76ers',  'Phoenix+Suns',  'Portland+Trail+Blazers',  'Sacramento+Kings',  'San+Antonio+Spurs',  'Toronto+Raptors',  'Utah+Jazz',  'Washington+Wizards']
    
    num_results_list = []
    for team in team_search:
        url = 'http://search.espn.go.com/results?startDate=' + beg_month + '%2F' + beg_day + '%2F' + beg_year + '&endDate=' + end_month + '%2F' + end_day + '%2F' + end_year + '&searchString=' + team + '&soccernetSearch=false&dims=5&dateFilter=GO'
        article_search = urllib2.urlopen(url)
        soup = BeautifulSoup(article_search)
        soup_results = soup.findAll('div',{'class':'mod-paginator mod-results mod-results-header'})
        num_results = int(soup_results[0].text.partition(' ')[0].strip().encode('utf-8'))
        num_results_list.append(num_results)
    
    return num_results_list

article_num = espn_articles()

teams = ['Atlanta Hawks',  'Boston Celtics',  'Brooklyn Nets',  'Charlotte Hornets',  'Chicago Bulls',  'Cleveland Cavaliers',  'Dallas Mavericks',  'Denver Nuggets',  'Detroit Pistons',  'Golden State Warriors',  'Houston Rockets',  'Indiana Pacers',  'Los Angeles Clippers',  'Los Angeles Lakers',  'Memphis Grizzlies',  'Miami Heat',  'Milwaukee Bucks',  'Minnesota Timberwolves',  'New Orleans Pelicans',  'New York Knicks',  'Oklahoma City Thunder',  'Orlando Magic',  'Philadelphia 76ers',  'Phoenix Suns',  'Portland Trail Blazers',  'Sacramento Kings',  'San Antonio Spurs',  'Toronto Raptors',  'Utah Jazz',  'Washington Wizards']


team_count = pd.DataFrame({'Team': teams,'Article_Num': article_num})

team_count.to_csv('/Users/nectaryyo/Desktop/GW/Fall2014/Programming/Group Project/codes_/Article_Search.csv')