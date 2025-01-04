#!/bin/bash

NAME="sialyh"
DJANGODIR=$(dirname $(cd `dirname $0` && pwd))
SOCKFILE=/home/sistemas/sialyh/sialyh/gunicorn/socket/gunicorn-sialyh.sock
LOGDIR=/home/sistemas/sialyh/sialyh/gunicorn/logs/gunicorn.log
USER=sistemas
GROUP=sistemas
NUM_WORKERS=5
DJANGO_WSGI_MODULE=sialyh.wsgi

rm -frv $SOCKFILE

echo $DJANGODIR

cd $DJANGODIR

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=$LOGDIR
