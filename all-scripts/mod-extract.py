#!/usr/bin/env python

# Install these packages before running:

import pandas as pd
import configparser
import configparser
import os
from sodapy import Socrata

config = configparser.ConfigParser()
config.sections()
# Non-public datasets require a token authentication to extract the full records of information:
client = Socrata(configparser,
                 'token',
                 username="email",
                 password="password")

# Convert to pandas DataFrame
results_df = pd.DataFrame.from_records(client)