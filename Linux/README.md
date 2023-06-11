# Resource list
[Resource1](https://youtu.be/GzIFoJBVwh8)

[Resource2](https://www.opstrainerz.com/blog/linux-commands-for-devops)

[Resource3](https://www.redhat.com/sysadmin/troubleshooting-system-performance)

For more resources press [here](https://docs.google.com/spreadsheets/d/1P7U6IOTo2cTElbN8B7llTIu5uA4klXbcMokvnXKrzJ8/edit?usp=sharing)

For exercises press [here](https://github.com/MaorW/devops-exercises/blob/master/topics/linux/README.md#linux-exercises)

# Command-line interface
```
man <command>       # manual (use -k or apropos)
whereis <command>
whereiswhatis <command>
whoami                 # Who is the user
```            

# Navigation and basic file management
```
cp <source_file> <source_file>  # Copy commands
ls                              # List
mv <source_file> <source_file>  # Move commands
rm <file_name>                  # remove (-r for directory)
rmdir <empty_directory_name>    # remove empty directory
cd	                            # Change the current directory (folder)
ls	                            # List files in a directory
ln -s <file-path-you-want-to-point-to> <new-file-path>   # Symbolic link
ln (original file path) (new file path).                 # Hard link

# dd Convert and copy files. if = Import files. of = Output file
dd if = /dev/hda of = /dev/hdb
```

# Manioulating data in files
```
cat
grep        # -i Return insensitive results, -v Return not matching, -n Return match work along with its line number , -c Return the number of lines in which results match

sort        # -r Return the reverse order, -f Return case-sensitive order (Uppercase and Lowercase words), -n Return the result as per the numerical order

cut -c<num_of_start_char> <num_of_end_char> filename    # Cut only particular characters

sed  's/current_wod/replaced_word/' filename            # Use this command to replace a text in a file by searching it in a file

awk '/word_in_line/ {print}' awktest.txt                # Print every line that has the word
awk '{print $1}' awktest.txt                            # Print the first word

uniq filename       # To remove all the duplicate lines

cat file.txt | tr "[a-z]" "[A-Z]"                       # Translate to uppercase words

```
# List of open files
```
lsof        # -u For a particular user
```

# Args as a shell
```
eval args               # Execute areguments as a shell command
```

# Archiving
```
tar -cvf  filename source_folder    # Zip a folder
tar -xvf tar_filename               # UnZip a tar file
```

# Permissions
```
chown       # Change owner for a file
chmod       # Change permissions for a file. 1 - Execute, 2 - Write, 3 - Execute and write, 4 - Read
```

# User and group management
```
su                  # Switch user
useradd             # Add a user
userdel             # Delete a user
groupadd            # Add a group
groupdel            # Delete a group

id  <flag> username # -u prints only the effective user ID, -G prints all the group IDs, -n prints names instead of numbers, -r prints read IDs instead of numbers, -help displays the help messages ID, -version
```

# Environment Variables
```
env / printenv  # List all the environments 
env -i command  # Run a command with an empty environment
env -u variable # Remove a variable from the environment
```


# Resource usage
```
free   # Check for memory usage. -b displays the memory in bytes. -k for Kilobyte. -m for megabyte. -g for Gigabyte

df     # Reports the amount of available disk space being useed by the file systems
sudo df -h

du     # Report the size of directory trees inclusive of all their contencts and the size of individual files 
sudo du -h -d 1 /var/

```

# Processes
```

```

# Package management
```
# Debian
apt-get     # CLI which helps handling packages in Linux debian distribution

# RDHEL
subscriptio-manager register
subscriptio-manager attach
subscriptio-manager repos --disable='*' --enable-repo1

yum install/remove/update <package>     # CLI which helps handling packages in Linux RHEL distribution
yum repolist all # You may find more repo info on /etc/yum.repos.d
yum info <pkg-going-to-be-installed>
```

# SSH for secure way to remote other machines
```
ssh-keygen -t rsa                   # Generates RSA key
```

# Firewall
```

```

# Network configuration
```
ifconfig -a     # Display all the interfaces. -s displays a short version of your interfaces

ip address      # Show all the ip addresses assosiated on all network devices
ip a s enp0s3

ip link         # Displays link layer information

netstat  -at    # network layer information. -at shows all of the tcp ports that are available

nslookup        # Getting information from the DNS server

curl            # Transfer data to/from a server


# Network manager - The service that manages the network coneections
nmcli connection show
nmcli device show
nmcli connection add con-name static-connection type ethernet ifname enpls0
nmcli con mod static-connection ipv4.addresses 10.0.0.1/24
nmcli con mod static-connection ipv4.gateway 10.0.0.254
nmcli con mod static-connection ipv4.dns 10.0.0.254

nmcli con mod Wired\ connections \ 1 +ipv4.addresses 10.0.0.1/24
nmcli con mod Wired\ connections \ 1 ipv4.dns 10.0.0.254
nmcli con mod Wired\ connections \ 1 +ipv4.dns 8.8.8.8

# DNS records stores on /etc/resolv.conf file
```

# System units
```
systemctl list-unit-files
systemctl list-units
systemctl start/restart/status/enable/disable <unit-name>
systemctl reload <unit-name> # Prefer by restart the unit service
```

# System logs



# Watching in interactive mode logs
```
watch flag command      # -d Highlights the differences between the successive upadtes

tail -f filename
```

# Best Practice Tips
## [Documentation](https://www.redhat.com/sysadmin/poor-documentation)
```
Always document changes. Changes include software patches, updates of any kind, hardware replacements or upgrades, driver updates, firmware updates, code pushes, new software installs, and configuration changes.

your forensic investigation should contain the symptoms, deduction, and reasoning that led to your diagnosis along with the steps you took to solve the issue, the people that were involved, etc.
```
## Updating
```
There's always something that needs to be updated on a system: BIOS, firmware, drivers, the operating system, applications, agents, security software, databases, backup software, and so on.

Decide how often you need to update, or comply with your organization's patching policy to plan, schedule, and apply those updates.
```

## Rebooing
```
Reboot at least once a month. 

Reboot solves a lot of problems and helps you diagnose hardware problems with minimal effort. Powering off the system occasionally is also good practice, because bringing a system up from a cold boot can identify a lot of hardware problems that might hide on a running system.
```

## Research for a network issues
```
Check your other hosts for comparison. Is the problem localized to a single host, is it confined to a single group, or is it system-wide? This check will help you identify whether the problem is local, if it's confined to a single switch, if it affects an entire rack or row, or if the problem is more widespread.

Check your local network configurations. Check changelogs to see if something has recently changed. Next, do a physical check of your NIC. Do the lights look correct to you? Does the cable look good and does the plug appear undamaged? Does the wire configuration look correct? Check the entire length of the cable for physical damage, if possible. Check the physical switch and the cable terminator in the switch for physical defects.

Either check the switch configuration yourself or ask a network admin to do so. Physically check the switch location or refer to your documentation to find the correct port to report to the network admin. If the configuration looks good, have the network admin perform a quick reset on the port. Also, ask the admin about the last switch update and last reboot date.
```


# [Troubleshooting](https://www.redhat.com/sysadmin/troubleshooting-slow-servers)
## Initial login
```
The ssh command has three debug levels, each of which gives you a plethora of information before you’re even on the system. To enable debug, just add an additional v to the -v option.
[~]$ ssh -vvv hostname.domain.com
```

## CPU troubleshooting
### Checking CPU usage with top
```
The top utility gives you a real-time look at what’s going on with the server. By default, when top starts, it shows activity for all CPUs.

This view can be changed by pressing the numeric 1 key, which adds more detail regarding the usage values for each CPU.
```
![kiku](./top_command.png)

For more info about top click [here](https://www.site24x7.com/learn/linux/top-command.html).

## Memory
```
If you find that during the course of a day your system's memory is drained off, the first thing to check is your logging.

You should also look at swap space if you suspect a memory problem. In this output, my system is idle so the result isn't dramatic. Use the free -m command to check physical and virtual (swap) memory usage

```
For more info about RAM press [here](https://www.redhat.com/sysadmin/cloud-swap.

##  Network
```
Troublshooting Network Issues suppose to be checked by this order:
Layer 5: Application
Layer 4: Transport
Layer 3: Network/Internet
Layer 2: Data Link
Layer 1: Physical

Layer 1: The physical layer
Does our physical interface up? The ip link show command tells us:
> ip -br link show # ip link show

Before you start checking cables, though, it’s a good idea to make sure that the interface isn’t just disabled. Issuing a command to bring the interface up can rule this problem out:

> ip link set eth0 up

These commands are great for troubleshooting obvious physical issues, but what about more insidious issues? Interfaces can negotiate at the incorrect speed, or collisions and physical layer problems can cause packet loss or corruption that results in costly retransmissions. How do we start troubleshooting those issues?

We can use the -s flag with the ip command to print additional statistics about an interface. The output below shows a mostly clean interface, with only a few dropped receive packets and no other signs of physical layer issues:
> ip -s link show eth0

```


 