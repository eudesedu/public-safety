import os
import getpass 

def f_env_config():
    """
    The environment configuration is a dictionary of path directory, URLs, email, passwords, 
    and access tokens to set function arguments.
    """
    # https://opendata.socrata.com/login:
    os.environ['API_URL'] = 'data.cityofchicago.org' # The City of Chicago's data portal.
    os.environ['API_TOKEN'] = getpass.getpass(prompt='Socrata-Token: ', stream=None)
    os.environ['API_EMAIL'] = 'eudes.edu@gmail.com' # Socrata personal login.
    os.environ['API_PASSWORD'] = getpass.getpass(prompt='Socrata-Password: ', stream=None) 
    os.environ['API_TAG'] = 'ijzp-q8t2' # Dataset Identifier.
    # Local dataset directory:
    os.environ['DIR_DATASET'] = 'C:\\Users\\eudes\\Documents\\python\\dataset'
    
f_env_config()