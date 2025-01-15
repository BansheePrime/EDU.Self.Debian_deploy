#!/usr/bin/env bash

python3 -m venv .venv && ln -s ./.venv/bin/activate && source activate
pip install setuptools --upgrade && pip install pip --upgrade
touch log.md
echo ".venv/" >> .gitignore
echo "activate" >> .gitignore
deactivate

git init
sleep 2s
git add . && git commit -m "initial commit"

echo "Ready to proceed..."
