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
                 '1JQxM1wh6Aio70BZGPs6lNEMa',
                 username="eudes.edu@gmail.com",
                 password="&#69Maria")

# Convert to pandas DataFrame
results_df = pd.DataFrame.from_records(client)