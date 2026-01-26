#!/bin/bash


LENGTH=$1

if [ -z "$1" ]; then
	LENGTH=64
fi

openssl rand -hex $LENGTH
