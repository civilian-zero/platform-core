#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-civilian-zero}"
REPO="${REPO:-platform-core}"
API="https://api.github.com/repos/${OWNER}/${REPO}"

if [[ -z "${GITHUB_TOKEN:-}" && -z "${GH_TOKEN:-}" ]]; then
  echo "Set GITHUB_TOKEN or GH_TOKEN with repo admin permissions." >&2
  exit 1
fi

TOKEN="${GITHUB_TOKEN:-${GH_TOKEN}}"

api() {
  local method="$1"
  local path="$2"
  shift 2

  curl -fsSL \
    -X "${method}" \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2026-03-10" \
    "${API}${path}" \
    "$@"
}

echo "Configuring merge settings for linear history..."
api PATCH "" \
  -d '{"allow_merge_commit":false,"allow_squash_merge":true,"allow_rebase_merge":true}'

echo "Applying main branch protection ruleset..."
api POST "/rulesets" \
  --data-binary "@.github/rulesets/main-protection.json"

echo "Done."
