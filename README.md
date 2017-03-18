# Crystallize

A static site generator, maybe

Ideally with just enough content compatibility to reproduce the out from my middleman-powered blog — but much quicker. Currently It takes 10-15mins to render ~1600 pages

It'll be pretty opinionated, with the first goal to be able to render [my blog](http://jamie.ideasasylum.com) before potentially branching out to be more general purpose. I don't much care for some that can render _anything_ if it can't solve my immediate needs. Likewise, it'll never be as overly complex as [Hugo](http://gohugo.io) — if you enjoy configuring something to that degree just use Hugo.

Tasks and ideas, in no particular order

[ ] Serve files
[ ] Parse YAML frontmatter
[ ] Copy files without processing
[ ] Call external tools for processing, e.g. compress images, concat javascript
[ ] Render markdown files to disk
[ ] Render ERC files to disk
[ ] Blog post rendering (i.e., 2017-01-01-my-post.md => /2017/01/01/mypost.html)
[ ] Templates and partials
[ ] Tags
[ ] Basic view helpers (link_to, stylesheet etc)
[ ] Render XML files for sitemaps/rss feeds
[ ] Livereload
[ ] Incremental builds
[ ] Upload to s3
[ ] Syntax highlighting of markdown
[ ] Byte-for-byte translation of my blog (crystallize output == middleman output)


## Contributing

1. Fork it ( https://github.com/ideasasylum/crystallize/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [ideasasylum](https://github.com/ideasasylum) Jamie Lawrence - creator, maintainer
