import configparser
import os

def config():
    """
    Config parser that records a dictionary of path directory, URLs, email, passwords, 
    and access tokens to set function arguments.
    """
    os.chdir('C:\\Users\\eudes\\Documents\\python\\public-safety\\config')
    config = configparser.ConfigParser()
    config['path'] = {'dataset': 'C:\\Users\\eudes\\Documents\\python\\dataset'}
    config['url'] = {'url_source': 'data.cityofchicago.org'}
    config['auth'] = {'email': 'eudes.edu@gmail.com',
                      'password': '&#69Maria',
                      'token': '1JQxM1wh6Aio70BZGPs6lNEMa'}
    with open('config.ini', 'w') as configfile: 
        config.write(configfile)

config() 