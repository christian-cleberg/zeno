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
  # TODO: properly diff the current HEAD commit from the previous commit
  diff=$(git diff $commit01 $commit02)
}

get_files() {
  # TODO: get file list (test in bare repo)
  echo ""
}

get_commit() {
  # TODO: get details on the most recent commit (author, commit #, parent, diff)
  echo ""
}

export_HTML() {
  # TODO: cat the README file
  # TODO: grab an HTML template and fill this info into it:
    # INDEX: List of repos
    # REPO: Tabs for each:
      # README: Default page
      # TREE:   List of files
      # LOG:    List of commits
      # DIFF:   Most recent diff
      # COMMIT: Most recent commit

  echo ""
}

get_branches
echo $branch
