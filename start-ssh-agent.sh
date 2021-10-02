#!/bin/bash

if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
	echo "Please load with 'source ${0}'"
	exit 1
fi

eval "`cat ~/ssh-agent-config 2>/dev/null`"

if [ "" != "$SSH_AGENT_PID" ] && ps -p $SSH_AGENT_PID > /dev/null
then
	echo "SSH agent is already running with PID $SSH_AGENT_PID"
else
	ssh-agent -s > ~/ssh-agent-config
	eval "`cat ~/ssh-agent-config 2>/dev/null`"
	echo "SSH agent started"
	echo "Adding user private key ..."
	ssh-add
fi

