# Zeno

A simple bash script to generate static HTML files from Git repositories.

While this is still a work-in-progress, it is a minimally useable state. 
However, it won't be very useful until more of the TODOs are complete below.

## Development

### TODO

- [x] Set-up initial commands to gather git info
- [x] Export list of git repos to HTML
- [x] Loop through git parent dir and create an HTML page per repo
- [ ] Create second nav bar for repo pages
  - [ ] Split each repo's page into sub-dirs
    - [ ] About ("/$repo/" : README, clone info, description, owner)
    - [ ] Tree ("/$repo/tree/" : top-level files/dirs with links to open each)
    - [ ] Log ("/$repo/log/" : limit max commits shown or split into pages)
    - [ ] Diff ("/$repo/diff/" : last commit info)
    - [ ] MAYBE: Stats page? ("/$repo/stats/" : could show language makeup of 
          repo, # commits, # authors, etc.)
- [ ] Add name, description, owner, and last modified date to home page
- [ ] Add optional flag for minifying CSS
  - [ ] Option: https://github.com/tdewolff/minify/tree/master/cmd/minify

### Testing Details

Developed and tested with `GNU bash, version 5.2.15(1)-release 
(x86_64-alpine-linux-musl)`
