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

export_HTML() {
  # TODO: cat the README file from each repo
  # TODO: grab an HTML template and fill this info into it:
    # INDEX: List of repos
    # REPO: Tabs for each:
      # README: Default page
      # TREE:   List of files
      # LOG:    List of commits
      # DIFF:   Most recent diff/commit

  title=$1
  description=$2

  # TODO: Loop and add link for each repository here

  # TODO: Loop and add each sub-page (or sub-tabs) noted above for each 
  # repository

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

export_HTML $title $description
