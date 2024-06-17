#!/bin/bash

# Проверка на наличие аргумента
if [ -z "$1" ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

DIR=$1

# Проверка существования директории
if [ -d "$DIR" ]; then
  # Удаление файлов с расширениями .bak, .tmp, .backup
  rm -f "$DIR"/*.bak "$DIR"/*.tmp "$DIR"/*.backup
  echo "Files with extensions .bak, .tmp, .backup have been deleted from $DIR."
else
  echo "Error: Directory $DIR does not exist."
  exit 1
fi