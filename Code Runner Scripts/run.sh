#!/bin/bash

FILE="$1"
EXT="${FILE##*.}"
BASENAME="${FILE%.*}"

if [ "$EXT" = "c" ]; then
    gcc "$FILE" -o output && ./output
elif [ "$EXT" = "cpp" ]; then
    g++ "$FILE" -o output && ./output
elif [ "$EXT" = "py" ]; then
    python3 "$FILE"
elif [ "$EXT" = "java" ]; then
    javac "$FILE" && java "$BASENAME"
elif [ "$EXT" = "rs" ]; then
    rustc "$FILE" && ./"$BASENAME"
else
    echo "Unsupported file type: .$EXT"
fi
