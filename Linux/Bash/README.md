# Variables
```
a=375
hello=$a

echo hello      # hello
echo $hello     # 375
echo ${hello}   # 375
echo "$hello"   # 375
echo "${hello}" # 375

echo
echo

hello="A B   C     D"       # If there is whitespace embedded within a variable, then quotes are necessary.
echo $hello     # A B C D


# Quoting a variable preserves whitespace.
echo "$hello"   # A B   C     D 

# Variable referencing disabled (escaped) by single quotes
echo '$hello' # $hello

Output:
hello
375
375
375
375


A B C D
A B   C     D
$hello

```

## Uninitialized variable
```
if [ -z "$unassigned" ]
then
  echo "\$unassigned is NULL."
fi

```

## Bash Variables Are Untyped
```
a=2334            # Integer.
let "a += 1"      
echo "a = $a "    # a = 2335
```

# Environment variables
```
printenv
```

# Special bash variables
```
$@ - Expands to the positional parameters, starting from one.

$# - Expands to the number of positional parameters in decimal.

$? - Expands to the exit status of the most recently executed foreground pipeline.

$$ - Expands to the process ID of the shell.

$0 - Expands to the name of the shell or shell script.
```

# Conditional statements
## if TEST-COMMANDS; then CONSEQUENT-COMMANDS; fi
```
if TEST-COMMANDS
then
  CONSEQUENT-COMMANDS
elif ANOTHER-TEST-COMMANDS
then
  CONSEQUENT-COMMANDS
else
  CONSEQUENT-COMMANDS
fi
```

```
#!/bin/bash
# positional.sh

# This script reads 3 positional parameters and prints them out.

echo "$0 invoked with the following erguments: $@"

POSPAR1="$1"
POSPAR2="$2"
POSPAR3="$3"

echo "$1 is the first positional parameter, \$1."
echo "$2 is the second positional parameter, \$2."
echo "$3 is the third positional parameter, \$3."
echo
echo "The total number of positional parameters is $#."

if [ -n "${10}" ]               # Parameters > $9 must be enclosed in {brackets}.
then
  echo "Parameter #10 is ${10}"
fi
```

## Testing files
```
echo "This scripts checks the existence of the messages file."
echo "Checking..."
if [ -f /var/log/messages ]
then
  echo "/var/log/messages exists."
fi
echo
echo "...done."
```

## Testing exit status
```
curl google.com &> /dev/null

if [ $? -eq 0 ]
then
  echo "Request succeeed"
else
  echo "Request failed, trying again..."
fi
```

## Numeric comparisons
```
# num=$(wc -l /etc/passwd | awk '{ print $1 }')

num=$(wc -l /etc/passwd)

echo $num

if [ "$num" -gt "20" ]; then
  echo "Too many users in the system."
fi
```

## String comparisons
```
if [[ "$(whoami)" != 'root' ]]; then
  echo "You have no permission to run $0 as non-root user."
  exit 1;
fi
```


# Exercise1
Write a bash script (e.g. my-script.sh) that given an ip address, prints geo-location details, as follows:

* The script first checks if `jq` cli is installed, if not, it prints a message to the user with a link to download the tool: https://stedolan.github.io/jq/download/

* The script checks that **exactly one argument** was sent to it, which representing the ip address to check. Otherwise, an informative message is being printed to stdout. 

* The acript checks that the given IP argument is not equal to '127.0.0.1'

* The script performs an HTTP GET request to `http://ip-api.com/json/<ip>` while `<ip>` is the IP argument. The results should be stored in a variable. 

* Using `jq` tool and the variable containing the HTTP response, check that the request has been secceeded by checking that `status` key has a value of `success`. The command `jq -r '.<key>'` can extract a key from the json (e.g. `echo $RESPONSE | jq -r '.status'`

* If the request succeed, print the following information to the user: 
  * country 
  * city
  * regionName

```
#!/bin/bash

command -v jq > /dev/null
IP_ADDR=$1

if [ $? -ne 0 ]; then
	echo "Please download jq tool https://stedolan.github.io/jq/download/"
	exit 0
fi 


# here we can assume jq is isntalled


if [[ $# -ne 1 || "$IP_ADDR" = "127.0.0.1" ]]
then
	echo "Public ip address argument is expected, e.g. 0.0.0.0 but found ${@}"
	exit 1
fi

# here we can assume the program has a single arguement which is not the loopback

RESPONSE=$(curl http://ip-api.com/json/$IP_ADDR)

STATUS=$(echo $RESPONSE | jq -r '.status')

if [ "$STATUS" = "success" ]; then
	echo $RESPONSE | jq -r '.status , .city , .country , regionName'
fi 
```

# Loops
## For loop
```
function foo {
  echo "accessing file file${a}.json"
}


# version 1
for a in {1..10}
do
  foo
done


for a in {30..40}
do
  foo
done

# version 2
for a in {1..10} {30..40}
do
  foo
done


# version 3
for a in {1..40}
do
  if [[ $a -gt 10 && $a -lt 30 ]]
  then
    continue
  fi

  foo
done
```

## While loops
```
while [ condition ]
do
  command(s)...
done
```