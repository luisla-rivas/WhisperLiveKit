#!/bin/bash

IP=68.183.192.21
PORT=8000
USER=root

cmd="ssh -L $PORT:localhost:$PORT -N -o GatewayPorts=yes $USER@$IP"
echo $cmd
eval $cmd