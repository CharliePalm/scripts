if [ -z "$1" ]; then
  echo "*** Please provide the commit message as the first argument: ./git-go.sh "update code" ***"
  exit 1
fi

extract_dash_word() {
  local input="$1"

  if [[ "$input" =~ ^([^_-]*-[^_-]*) ]]; then
    echo "${BASH_REMATCH[1]}"
  else
    echo "${input%%[^a-zA-Z0-9]*}"  # Strip trailing special characters
  fi
}

branch=$(git rev-parse --abbrev-ref HEAD)
branch=$(extract_dash_word "$branch")
echo "commit message: $branch | $1"
git add -A 
git commit -m "$branch | $1" 
git push