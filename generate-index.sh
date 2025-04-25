#!/bin/zsh

# Output file
OUTPUT_FILE="index.md"

# Start the index with a title
echo "# Documentation Sitemap" > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Find all .md files under docs/, excluding index.md
find docs -type f -name "*.md" ! -name "index.md" | sort | while read filepath; do
  # Create a relative URL and a readable title
  relpath="${filepath#docs/}"           # Remove leading "docs/"
  title=$(basename "$relpath" .md)      # Get the filename without extension
  title=$(echo $title | sed 's/-/ /g')  # Replace dashes with spaces

  echo "- [${title:u}](${relpath})" >> $OUTPUT_FILE
done

echo "✅ index.md generated!"

