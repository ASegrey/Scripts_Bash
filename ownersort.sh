#!/bin/bash

# Проверка на наличие аргумента
if [ -z "$1" ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

DIR=$1

# Проверка существования директории
if [ -d "$DIR" ]; then
  # Перебор всех файлов в директории
  for FILE in "$DIR"/*; do
    if [ -f "$FILE" ]; then
      OWNER=$(stat -c '%U' "$FILE")
      OWNER_DIR="$DIR/$OWNER"

      # Создание директории для владельца, если она не существует
      [ -d "$OWNER_DIR" ] || mkdir "$OWNER_DIR"

      # Копирование файла в директорию владельца
      cp "$FILE" "$OWNER_DIR/"
    fi
  done
  echo "Files have been sorted by owner in $DIR."
else
  echo "Error: Directory $DIR does not exist."
  exit 1
fi