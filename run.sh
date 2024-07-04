#!/bin/bash

echo "Starting server"
python server.py &
sleep 3  # Sleep for 3s to give the server enough time to start

#env_list=("highway" "crowded_highway" "merge" "crowded_merge")
#env_list=("crowded_highway" "crowded_highway" "crowded_highway" "crowded_highway")
env_list=("CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0")

for ((i = 0; i < ${#env_list[@]}; i++))
do
    echo "Starting client $i"
    python FERclient_FixState.py -i ${i} &
done

# This will allow you to use CTRL+C to stop all background processes
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM
# Wait for all background processes to complete
wait
