echo "Checking target state on Cloudflare..."

# Query API to get project's lists. If project found, skip. If not, then creating new.
if npx wrangler pages project list | grep -q "my-private-docs"; then
  echo "State matches: Project 'my-private-docs' already exists. Skipping creation."
else
  echo "State mismatch: Project missing. Provisioning now..."
  npx wrangler pages project create my-private-docs --production-branch main
fi
