import pandas as pd
from sodapy import Socrata
import importlib
import argparse
import os
import sys

def f_load_crimes_full_socrata(url, token, email, password, tag):
    """
    Non-public datasets require a token authentication to extract the full records of information.
    """
    d_crime_socrata = Socrata(url, token, email, password).get(tag, limit=50000)
    d_crime_full = pd.DataFrame.from_records(d_crime_socrata)
    return d_crime_full

def f_main():
    """
    Automated execution to generate the environment configuration.
    """
    descr = """
        Define the parser argument.
    """
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument('-load_dataset_socrata', 
                        dest='load_dataset_socrata', 
                        action='store_const', 
                        const=True, 
                        help='Call the environment function')
    cmd_args = parser.parse_args()
    importlib.import_module('mod-environment')
    if cmd_args.load_dataset_socrata: 
        f_load_crimes_full_socrata(os.environ.get('API_URL'), 
                                   os.environ.get('API_TOKEN'), 
                                   os.environ.get('API_EMAIL'), 
                                   os.environ.get('API_PASSWORD'),
                                   os.environ.get('API_TAG'))

if __name__ == '__main__':
    f_main()
    sys.exit(0)
