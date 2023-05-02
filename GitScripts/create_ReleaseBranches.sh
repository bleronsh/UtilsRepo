set -eu -o pipefail

REPO_SRC="${1}"
BRANCHNAME="${2}"
NEW_BRANCHNAME="${3}"
SOURCE_BRANCH="${4:-main}"

if [ "$#" -lt 2 ]; then
  echo "Y u no give REPO src??"
  echo "Usage: $0 <repo> <branchname>"
  exit 1
fi

source generic_utils.sh

exec_post_branches(){
  local repo_name="${1}"
  local branch_name="${2}"
  local new_branchname="${3}"


  if [ -z "${repo_name}" ]; then echo "Repo name not provided!"; exit 1; fi
  if [ -z "${branch_name}" ]; then echo "Branch name not provided!"; exit 1; fi
  if [ -z "${new_branchname}" ]; then echo "New branch name not provided!"; exit 1; fi

  }



echo $REPO_SRC

echo $BRANCHNAME
