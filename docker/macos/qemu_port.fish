#!/usr/bin/env fish

ssh -L "$argv[1]:localhost:$argv[2]" -p 10022 -Nf docker@localhost 
