function call_github_api() {
  local header_content_type="Accept: application/vnd.github+json"
  local header_version="X-GitHub-Api-Version: 2022-11-28"
  local github_rest_host="https://api.code.rbi.tech"

  REQUEST="${github_rest_host}/${1}"
  METHOD="${2:-GET}"
  BODY="${3:-}"

  if [ -n "${BODY}" ]; then
    curl -sS \
        -X ${METHOD} \
        -H "${header_content_type}" \
        -H "Authorization: Bearer ${GITHUB_KEY}" \
        -H "${header_version}" \
        "${REQUEST}" \
        -d "${BODY}"
  else
    curl -sS \
        -X ${METHOD} \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${GITHUB_KEY}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "${REQUEST}"
  fi
}