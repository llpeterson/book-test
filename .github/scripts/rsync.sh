#!/bin/bash

# $1: ssh_login_username
# $2: remote_server_ip
# $3: ssh_port

# $4: source_path
# $5: destination_path

# set -euo pipefail

echo "$1"
echo "$2"
echo "$3"
echo "$4"
echo "$5"

SSH_PRIVATE_KEY_FILE='./.github/scripts/id_rsa'

# echo "Saving private key......"

# printf "%s" "$4" >$SSH_PRIVATE_KEY_FILE
wc $SSH_PRIVATE_KEY_FILE
echo "Done"

# chmod 600 $SSH_PRIVATE_KEY_FILE

SSH_COMMAND="ssh -p $3 -i $SSH_PRIVATE_KEY_FILE -o StrictHostKeyChecking=no"

echo =========================================================================

start_time=$(date)

echo "{start_time}={start_time}" >> $GITHUB_OUTPUT
echo "Start time of synchronization  ->  $start_time"

rsync -e "$SSH_COMMAND" -av $4 $1@$2:$5

end_time=$(date)

echo "{end_time}={end_time}" >> $GITHUB_OUTPUT
echo "End time of synchronization  ->  $end_time"

echo =========================================================================

exit 0
