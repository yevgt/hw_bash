#!/bin/bash
#
DIR=/opt/111124-ptm/YevgeniyG/hw_19/1
#
# Создание директории, если она не существует
mkdir -p "$DIR"
# Создание 100 файлов со случайными названиями
for i in {1..100}; do
    FILENAME=$RANDOM
    touch "$DIR/$FILENAME"
done
#
echo "100 файлов созданы в директории $DIR."
