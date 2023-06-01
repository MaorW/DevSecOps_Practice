#!/bin/bash
# set -e

# Instructions
"""
Mission:
The script first checks if jq cli is installed, if not, it prints a message to the user with a link to download the tool: https://stedolan.github.io/jq/download/

The script checks that exactly one argument was sent to it, which representing the ip address to check. Otherwise, an informative message is being printed to stdout.

The acript checks that the given IP argument is not equal to '127.0.0.1'

The script performs an HTTP GET request to http://ip-api.com/json/<ip> while <ip> is the IP argument. The results should be stored in a variable.

Using jq tool and the variable containing the HTTP response, check that the request has been secceeded by checking that status key has a value of success. The command jq -r '.<key>' can extract a key from the json (e.g. echo $RESPONSE | jq -r '.status'

If the request succeed, print the following information to the user:

country
city
regionName
""" &>/dev/null

# Check if jq cli is installed
jq -V &>/dev/null

if [ $? -ne 0  ]; then
  echo "jq client has not been installe. Please donwload it. Use the link https://stedolan.github.io/jq/download/."
  exit 1
fi

if [ $# -eq 1 -a $1 != "127.0.0.1" ]
then
  IPAdrr=$1
  result=$(curl -s  http://ip-api.com/json/$IPAdrr)
  status_response=$(echo "$result"| jq -r '.status')

else
  echo "Please provide only one IPAdress which is not 127.0.0.1"
  exit 1
fi

echo "Your status check for your IP $IPAdrr is:"
echo
if [ $status_response == "success" ]
then
  country=$(echo "$result"| jq -r '.country')
  city=$(echo "$result"| jq -r '.city')
  regionName=$(echo "$result"| jq -r '.regionName')

  echo "The info of this IPAddress are:"
  echo -n "Country is $country, "
  echo -n "City is $city,"
  echo "Region name is $regionName"
fi
