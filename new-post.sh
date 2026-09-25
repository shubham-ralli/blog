#!/usr/bin/env bash
# Create a new post skeleton. Usage: ./new-post.sh "My Post Title"
# Prints the file path. Claude Code fills the body, then: git add -A && git commit -m ... && git push
set -euo pipefail
title="${1:?Usage: ./new-post.sh \"Title\"}"
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-|-$//g')
date=$(date +%Y-%m-%d)
ts=$(date "+%Y-%m-%d %H:%M:%S %z")
file="_posts/${date}-${slug}.md"
cat > "$file" <<EOF
---
layout: post
title: "$title"
date: $ts
categories: general
---

Write body here.
EOF
echo "$file"
