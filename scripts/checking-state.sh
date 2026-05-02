#!/bin/bash
set -euo pipefail

# --- Configuration ---
# The name of the Cloudflare Pages project to check/create.
PROJECT_NAME="my-private-docs"
PRODUCTION_BRANCH="main"
# ---------------------

echo "Checking state for project '${PROJECT_NAME}' on Cloudflare Pages..."

# Query API to get project's lists. If project found, skip. If not, then creating new.
# Use `wrangler pages project get` which fails if the project doesn't exist.
# This is more direct than listing all projects and grepping.
if npx wrangler pages project get "${PROJECT_NAME}" > /dev/null 2>&1; then
  echo " Project '${PROJECT_NAME}' already exists. No action needed."
else
  echo "Project '${PROJECT_NAME}' not found. Creating it now..."
  npx wrangler pages project create "${PROJECT_NAME}" --production-branch "${PRODUCTION_BRANCH}"
  echo " Successfully created project '${PROJECT_NAME}'."
fi
