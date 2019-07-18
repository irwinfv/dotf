#!/bin/bash

#  check deps
which virtualenv >/dev/null || (echo "Please install virtualenv/python" && exit 1)
which git >/dev/null || (echo "Please install git" && exit 1)

virtualenv_dir=".provenv"
if [ ! -d "$virtualenv_dir" ]; then
	virtualenv "$virtualenv_dir"
	./"${virtualenv_dir}"/bin/pip install -r requirements.txt
fi
"${virtualenv_dir}"/bin/ansible-playbook -v main.yml
