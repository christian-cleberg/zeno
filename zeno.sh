#!/bin/sh

# TODO: Accept a git directory that may be full of repos, then loop through
read -p "Enter the path to the git repo: " path
# echo "Path: $path"

cd $path

get_branches() {
  branch=$(git branch)
}

get_log() {
  log=$(git log)
}

get_diff() {
  diff=$(git show)
}

get_files() {
  files=$(git ls-tree --full-tree -r HEAD)
}

html_index() {
  # INDEX: List of repos
  title=$1
  description=$2

  echo ""
}

html_repo() {
  # TODO: grab an HTML template and fill this info into it:
    # REPO: Tabs for each:
      # README: Default page
      # TREE:   List of files
      # LOG:    List of commits
      # DIFF:   Most recent diff/commit

  title=$1
  description=$2

  echo ""
}

get_branches
echo "Branches: $branch"

get_log
echo "Log: $log"

get_diff
echo "Diff: $diff"

get_files
echo "Files: $files"

# TODO: Loop and create index page with a list of links for each repository
html_index $title $description

# TODO: Loop and add each sub-page (or sub-tabs) noted above for each 
# repository
html_repo $title $description
