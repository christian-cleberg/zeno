#!/bin/sh

# TODO: Accept a git directory that may be full of repos, then loop through
read -p "Enter the path to the git repo: " path

cd $path
rm -rf build && mkdir build

html_index() {
  title=$1
  description=$2
  # git_list=$()
  git_list="git list example string"
  datetime=$(date)

  cat <<EOF
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="$description">
    <title>$title</title>
    <link rel="stylesheet" href="styles.css">
  </head>
  <body>
    <main>
      <nav>
        <a href="/">$title</a>
      </nav>
      <hr>
      <h2>Repositories</h2>
      <ul>
        $(while IFS= read -r line; do echo "<li>$line</li>"; done < <(printf '%s\n' "$git_list"))
      </ul>
    </main>
    <hr>
    <footer>
      <p>Generated by <a href="https://git.cleberg.net/cgit.cgi/zeno.git/">zeno</a> at $datetime</p>
    </footer>
  </body>
</html>
EOF
}

# TODO: Parse commit/diff variables for + or - signs at the beginning of a line, 
# then wrap in a <span class="diff-add"> of <span class="diff-del"> tag so that 
# we can color-code them
html_repo() {
  title=$1
  description=$2
  branches=$3
  log=$4
  diff=$5
  files=$6
  repo_name=$7
  git_url=$8
  ssh_url=$9
  datetime=$(date)

  cat <<EOF
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="$description">
    <title>$repo_name | $title</title>
    <link rel="stylesheet" href="styles.css">
  </head>
  <body>
    <main>
      <nav>
        <a>$title</a>
      </nav>
      <hr>
      <p>Clone</p>
      <p>git://$git_url/$repo_name.git</p>
      <p>ssh://$ssh_url/$repo_name.git</p>
      <hr>
      <p>Branches</p>
      <p>$(while IFS= read -r line; do echo "<br>$line"; done < <(printf '%s\n' "$branches"))</p>
      <hr>
      <p>Tree</p>
      <p>$(while IFS= read -r line; do echo "<br>$line"; done < <(printf '%s\n' "$files"))</p>
      <hr>
      <p>Last Commit</p>
      <p>$(while IFS= read -r line; do echo "<br>$line"; done < <(printf '%s\n' "$diff"))</p>
      <hr>
      <p>Log</p>
      <p>$(while IFS= read -r line; do echo "<br>$line"; done < <(printf '%s\n' "$log"))</p>
    </main>
    <hr>
    <footer>
      <p>Generated by <a href="https://git.cleberg.net/cgit.cgi/zeno.git/">zeno</a> at $datetime</p>
    </footer>
  </body>
</html>
EOF
}

# Get repository info
branches=$(git branch)
log=$(git log)
diff=$(git show)
files=$(git ls-tree --name-only --full-tree -r HEAD)

# Gather HTML options
read -p "Please provide a site title: " title
read -p "Please provide a site description: " description
read -p "Please provide the Git clone URL: " git_url
read -p "Please provide the SSH clone URL: " ssh_url

# TODO: Loop and create index page with a list of links for each repository
html_index "$title" "$description" > build/index.html

# TODO: Loop and add a page for each repository
repo_name=$(basename `git rev-parse --show-toplevel`)
repo_description=$(> .git/description)
html_repo "$title" "$repo_description" "$branches" "$log" "$diff" "$files" "$repo_name" "$git_url" "$ssh_url" > build/"$repo_name.html"

# TODO: Minify CSS on move (OPTIONAL FLAG)
# https://github.com/tdewolff/minify/tree/master/cmd/minify
cp styles.css build/styles.css
