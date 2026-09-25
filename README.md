# Pixellize Blog (GitHub Pages)

Live: https://shubham-ralli.github.io/blog

Static Jekyll blog. GitHub Pages builds on every push to `main`. No server, no DB.

## Write a post (Claude Code auto-blog flow)

1. `./new-post.sh "Post Title"` -> creates `_posts/YYYY-MM-DD-post-title.md`
2. Claude Code writes the body into that file.
3. Publish:
   ```
   git add -A && git commit -m "post: Post Title" && git push
   ```
4. Live in ~1 min at `/blog`.

Posts are plain markdown in `_posts/`. Front matter needs `layout: post`, `title`, `date`.
