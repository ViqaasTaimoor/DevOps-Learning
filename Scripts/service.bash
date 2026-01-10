#!/bin/bash

read -rp "Enter service name: " service

if systemctl is-active --quiet "$service"; then
	echo "Service '$service' is already running"
else
	echo "Service '$service' is not running"
	echo " Strarting '$service'.."

	if systemctl start "$service"; then
		echo "Service '$service' started successfully"
	else
		echo "Failed to start service '$service'"
	fi
fi
