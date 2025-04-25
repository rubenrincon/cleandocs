#!/bin/zsh

# Output file
OUTPUT_FILE="index.md"

# Start the index with a title
echo "# Documentation Sitemap" > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Find all .md files inside docs/, excluding index.md
find docs -type f -name "*.md" ! -name "index.md" | sort | while read filepath; do
  # Get relative path (remove 'docs/')
  relpath="${filepath#docs/}"

  # Convert .md to .html for GitHub Pages linking
  link="${relpath%.md}.html"

  # Generate a readable title
  title=$(basename "$relpath" .md)
  title=$(echo $title | sed 's/-/ /g; s/_/ /g')

  echo "- [${title:u}](${link})" >> $OUTPUT_FILE
done

echo "✅ index.md updated with .html links!"

