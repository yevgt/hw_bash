#!/bin/bash
#
DIR=/opt/111124-ptm/YevgeniyG/hw_19/1
NEWDIR=/opt/111124-ptm/YevgeniyG/hw_19/2
#
mkdir -p "$NEWDIR"
#
# Перенос файлов с четными номерами
for file in "$DIR"/*; do
    if [ -f "$file" ]; then
         FILENAME=$(basename "$file")
         if (( FILENAME % 2 == 0 )); then
               mv "$file" "$NEWDIR"
               echo "Перемещено: $file"
         else
               echo "Оставлено: $file"
         fi
    fi
done

echo "Файлы с четными номерами перемещены в директорию $NEWDIR."
