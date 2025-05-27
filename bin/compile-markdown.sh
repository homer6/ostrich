#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONTENT_DIR="$PROJECT_ROOT/content"
COMPILED_DIR="$PROJECT_ROOT/compiled"
OUTPUT_FILE="$COMPILED_DIR/compiled_content.md"

if [ ! -d "$CONTENT_DIR" ]; then
    echo "Error: Content directory not found at $CONTENT_DIR"
    exit 1
fi

echo "Compiling content files from $CONTENT_DIR to $OUTPUT_FILE"

rm -rf "$COMPILED_DIR"
mkdir -p "$COMPILED_DIR"

echo "# Compiled Content" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "This file contains all markdown and JSONL files from the content directory." >> "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

file_count=0

find "$CONTENT_DIR" \( -name "*.md" -o -name "*.jsonl" \) -type f | sort | while read -r file; do
    relative_path="${file#$CONTENT_DIR/}"
    
    echo "Processing: $relative_path"
    
    echo "---" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "## File: $relative_path" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    
    if [[ "$file" == *.jsonl ]]; then
        echo "\`\`\`jsonl" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "\`\`\`" >> "$OUTPUT_FILE"
    else
        cat "$file" >> "$OUTPUT_FILE"
    fi
    
    echo "" >> "$OUTPUT_FILE"
    
    file_count=$((file_count + 1))
done

echo "Compilation complete. All content combined in $OUTPUT_FILE"
echo "Total files processed: $file_count"