# add .gitignore and ignore node_modules
touch .gitignore
echo "node_modules" >> .gitignore

# setup husky and commit linter
# Step 1. Install commitlint dependency
yarn add -D @commitlint/cli
# Step 2. Install conventional commit config
yarn add -D @commitlint/config-conventional
# Step 3. Configure commitlint to use conventional commits
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js
# Step 4. Install Husky (v7)
yarn add -D husky 
# Step 5. Enable Husky
yarn husky install
# Step 6. Add commitlint commit-msg hook 
npx husky add .husky/commit-msg  'npx --no -- commitlint --edit ${1}'

# do a failed commit message to show commitlint in action
g a .
g c "test"
