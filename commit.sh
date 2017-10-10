#!/usr/bin/env sh
git pull
git add -A
git commit -m "update: $1"
git push
