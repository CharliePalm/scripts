if [ -z "$1" ]; then
  echo "*** Please provide the commit message as the first argument: ./git-go.sh "update code" ***"
  exit 1
fi

extract_after_last_slash() {
  local input_string="$1"
  # Use parameter expansion to get the substring after the last '/'
  echo "${input_string##*/}"
}

branch=$(git rev-parse --abbrev-ref HEAD)
branch=$(extract_after_last_slash "$branch")
echo "commit message: $branch | $1"
git add -A 
git commit -m "$branch | $1" 
git push