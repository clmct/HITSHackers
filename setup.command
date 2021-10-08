#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
if hash xcodegen 2>/dev/null; 
then
    echo xcodegen is installed
else    
    brew install xcodegen
fi
sh xcodegen.command
