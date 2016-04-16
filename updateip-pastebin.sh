#!/bin/bash

login_url='http://pastebin.com/api/api_login.php'
url='http://pastebin.com/api/api_post.php'
api_dev_key=       # your pastebin dev key
api_user_name=     # your pastebin username
api_user_password= # your pastebin password
ip=`curl ipecho.net/plain`
api_user_key=`curl --data "api_dev_key=${api_dev_key}&api_user_name=${api_user_name}&api_user_password=${api_user_password}" ${login_url}`
curl --data "api_dev_key=${api_dev_key}&api_user_key=${api_user_key}&api_paste_private=1&api_option=paste&api_paste_expire_date=1D&api_paste_name=currip.txt&api_paste_code=${ip}" ${url} ; echo
