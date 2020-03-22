# Install these packages before running:
import pandas as pd
from sodapy import Socrata
import importlib
import argparse
import os
import sys

def f_load_dataset_crimes_full(url, token, email, password):
    """
    Non-public datasets require a token authentication to extract the full records of information.
    """
    d_crime_full = Socrata(url, token, username=email, password=password)
    d_crime_full = pd.DataFrame.from_records(d_crime_full)
    return d_crime_full

def main():
    """
    Automated execution to generate the environment configuration.
    """
    descr = """
        Define the parser argument.
    """
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument('-load_dataset', 
                        dest='load_dataset_crimes_full', 
                        action='store_const', 
                        const=True, 
                        help='Call the environment function')
    cmd_args = parser.parse_args()
    importlib.import_module('config')
    if cmd_args.env_config: 
        f_load_dataset_crimes_full(os.environ.get('API_URL'), 
                                   os.environ.get('API_TOKEN'), 
                                   os.environ.get('API_EMAIL'), 
                                   os.environ.get('API_PASSWORD'))

if __name__ == '__main__':
    main()
    sys.exit(0)