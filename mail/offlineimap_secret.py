#! /usr/bin/env python2
import subprocess
from os.path import expanduser, join

HOME_DIR = expanduser('~')

def get_secret(secretfile):
    path = join(HOME_DIR, '.mail', secretfile)
    return subprocess.check_output(['gpg', '--quiet', '--batch', '-d', path]).strip()
    #return subprocess.check_output('gpg -dq %s' % path, shell=True).strip("\n")

def get_client_id():
    return get_secret('oauth2_client_id.gpg')

def get_client_secret():
    return get_secret('oauth2_client_secret.gpg')

def get_refresh_token():
    return get_secret('oauth2_refresh_token.gpg')
