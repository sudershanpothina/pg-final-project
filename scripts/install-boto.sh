#!/bin/bash
# install boto
sudo apt install python3-pip -y
pip install virtualenv
mkdir ~/.virtualenvs
virtualenv ~/.virtualenvs/boto

# activate boto
source ~/.virtualenvs/boto/bin/activate

# install boto
pip install boto