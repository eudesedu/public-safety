import pandas as pd
from sodapy import Socrata
import numpy as np
import importlib
import argparse
import os
import sys
import getpass

def f_load_crimes_full_socrata(url, token, email, password, tag):
    """
    Non-public datasets require a token authentication to extract a sample of records.
    """
    d_crime_socrata = Socrata(url, token, email, password).get(tag, limit=100)
    d_crime_full = pd.DataFrame.from_records(d_crime_socrata)
    return d_crime_full

def f_load_crimes_full_csv(setwd):
    """
    Chicago crimes dataset from 2001 to present for offline load.
    """
    os.chdir(setwd)
    variable_list = ['ID', 
                     'Date', 
                     'Block',  
                     'Primary Type', 
                     'Description',  
                     'Arrest',
                     'Community Area', 
                     'Latitude', 
                     'Longitude']
    d_crime_csv = pd.read_csv('Crimes_-_2001_to_present.csv',
                              usecols=variable_list).astype({'ID': np.uint32,
                                                             'Community Area': 'float16',
                                                             'Latitude': 'float16',
                                                             'Longitude': 'float16'})
    return d_crime_csv

def f_main():
    """
    Automated execution to generate the environment configuration and parser argument.
    """
    descr = """
        Define the parser argument to load a dataset via Socrata.
    """
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument('-load_dataset_socrata', 
                        dest='load_dataset_socrata', 
                        action='store_const', 
                        const=True, 
                        help='Call the f_load_crimes_full_socrata function')
    parser.add_argument('-load_dataset_csv', 
                        dest='load_dataset_csv', 
                        action='store_const', 
                        const=True, 
                        help='Call the f_load_crimes_full_csv function')
    cmd_args = parser.parse_args()
    # The environment configuration is a dictionary of path directory, URLs, email, passwords, 
    # and access tokens to set function arguments.
    importlib.import_module('mod-environment')
    if cmd_args.load_dataset_socrata: 
        f_load_crimes_full_socrata(os.environ.get('API_URL'), 
                                   os.environ.get('API_TOKEN'), 
                                   os.environ.get('API_EMAIL'), 
                                   os.environ.get('API_PASSWORD'),
                                   os.environ.get('API_TAG'))
    if cmd_args.load_dataset_csv: 
        f_load_crimes_full_csv(os.environ.get('DIR_DATASET'))

if __name__ == '__main__':
    f_main()
    sys.exit(0)