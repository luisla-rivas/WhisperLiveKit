#!/bin/bash

IP=142.93.150.243
PORT=8000
USER=root

cmd="ssh -L $PORT:localhost:$PORT -N -o GatewayPorts=yes $USER@$IP"
echo $cmd
eval $cmd