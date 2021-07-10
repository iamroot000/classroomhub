#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"


printlogfile="logs/classroom.log"

nohup /home/it-admin/myproj/venv/bin/python manage.py runserver & $printlogfile 2>>$printlogfile &
#python manage.py runserver 0.0.0.0:8080 >> log.log 2>&1

echo "stdout is at $printlogfile"

