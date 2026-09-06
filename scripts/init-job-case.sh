#!/usr/bin/env bash

# Create a case folder for one Upwork job in the drafting stage.
#
# Usage: init-job-case.sh <job-slug> [title] [url]
#
# JOBS_ROOT (env) is the pipeline root; default ./upwork-jobs relative to the
# current working directory. Stage folders are created on demand.
# Idempotent: re-running on an existing slug leaves meta.yaml untouched.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <job-slug> [title] [url]" >&2
  exit 1
fi

slug="$1"
title="${2:-}"
url="${3:-}"
jobs="${JOBS_ROOT:-./upwork-jobs}"

for stage in drafting review ready submitted; do
  if [[ -d "$jobs/$stage/$slug" && "$stage" != "drafting" ]]; then
    echo "ERROR: '$slug' already exists in $jobs/$stage/ — reuse that case instead of creating a new one." >&2
    exit 1
  fi
done

root="$jobs/drafting/$slug"
timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

mkdir -p "$root"

meta_file="$root/meta.yaml"

if [[ ! -f "$meta_file" ]]; then
  cat > "$meta_file" <<META
job_id: ""
title: "$title"
slug: "$slug"
url: "$url"
status: drafting
round: 0
latest_score: ""
created_at: "$timestamp"
updated_at: "$timestamp"
source_type: ""
screening_recommendation: ""
screening_reason: ""
screened_at: ""
screening_confirmed_by_user: false
job_fit: ""
selected_asset: ""
demo_readiness: ""
demo_reason: ""
client_industry: ""
problem_type: ""
writer: upwork-proposal-workflow/writer
reviewer: upwork-proposal-workflow/reviewer
send_recommendation: ""
submitted: false
submitted_date: ""
META
fi

touch "$root/source-job.md"

echo "$root"
