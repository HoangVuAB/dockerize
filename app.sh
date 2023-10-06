#!/bin/bash

# Define your laravel project .env path
ENV_PATH=./src/laravel-app/.env

function _up() {
  docker-compose --env-file ${ENV_PATH} up -d;
  echo 'OK';
}

function _stop() {
  docker-compose --env-file ${ENV_PATH} stop;
  echo 'OK';
}

function _down() {
  docker-compose down --remove-orphans;
  echo 'OK';
}


function _rebuild() {
  docker-compose --env-file ${ENV_PATH} up  --build -d --force-recreate --remove-orphans;
  echo 'OK';
}

function _ssh() {
  docker-compose --env-file ${ENV_PATH} exec app bash;
}

function _refresh() {
  echo 'Restarting server, network and database ...';
  docker-compose down --remove-orphans;

  echo 'Rebuiding container...';
  docker-compose --env-file ${ENV_PATH} up --build -d --force-recreate --remove-orphans;
  echo 'OK';
}


case $1 in
"start") _up ;;
"stop") _stop ;;
"rebuild") _rebuild ;;
"ssh") _ssh ;;
"refresh") _refresh ;;
"down") _down ;;
esac