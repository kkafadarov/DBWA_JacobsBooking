#!/usr/bin/python
import config
import imp
from expected_errors import *

f, filename, description = imp.find_module('requests', ['requests'])
requests = imp.load_module('requests', f, filename, description)

def api_url(api):
  return '{0}/{1}'.format(config.openJubUrl, api)

def login(username, password):
  url = api_url('auth/signin')
  payload = { 'username':username, 'password':password }
  response = requests.post(url, json=payload)

  if response.status_code != 200:
    raise LoginException("Error when authenticating with OpenJUB: %s" % response.text)
  
  token = response.json()['token']
  return token

def utf_to_ascii(s):
  return s.decode("utf-8").encode("ascii","ignore")

class JacobsUser:
  def __init__(self, json_data):
    self.json_data = json_data
    self.first_name = utf_to_ascii(json_data['firstName'])
    self.last_name = utf_to_ascii(json_data['lastName'])
    self.email = utf_to_ascii(json_data['email'])
    self.username = utf_to_ascii(json_data['username'])
    self.major = utf_to_ascii(json_data['major'])
    self.country = utf_to_ascii(json_data['country'])
    self.description = utf_to_ascii(json_data['description'])

  def __str__(self):
    return repr(self.json_data)

def get_user(username):
  url = api_url('user/name/%s' % username)

  response = requests.get(url)
  if response.status_code != 200:
    raise Exception("Cannot get user: %s" % response.text)
  return JacobsUser(response.json())

def auth_status(token):
  url = api_url('auth/status')
  payload = { 'token':token }

  response = requests.get(url, json=payload)
  if response.status_code != 200:
    print "Auth error: %s" % response.text
    return False
  return True

def get_users(query):
  url = api_url('query/%s' % q)

  if token != None:
    payload = { 'token': token }
  else:
    payload = None

  users = []
  while url != False and url != 'false':
    response = requests.get(url, json=payload)
    if response.status_code != 200:
      raise Exception("Error when retrieving users: %s" % response.text)

    json_data = response.json()
    url = json_data['next']
    for user in json_data['data']:
      users.append(JacobsUser(user))

  return users
