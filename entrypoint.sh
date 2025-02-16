#!/bin/bash

# Print a separator line for better readability in logs.
echo "======================"

# Configure the global Git username using the environment variable ${GITHUB_ACTOR}.
# This sets the name of the user running the script.
git config --global user.name "${GITHUB_ACTOR}"

# Configure the global Git email using the environment variable ${INPUT_EMAIL}.
# This sets the email address associated with Git commits.
git config --global user.email "${INPUT_EMAIL}"

# Add the /github/workspace directory as a safe directory in Git.
# This is necessary to avoid Git security warnings when working in certain environments.
git config --global --add safe.directory /github/workspace

# Run a Python script located at /usr/bin/feeed.py.
# Note: There is a typo in the script name ("feeed.py" should likely be "feed.py").
python3 /usr/bin/feed.py

# Stage all changes in the Git repository and create a commit with the message "Update Feed".
git add -A && git commit -m "Update Feed"

# Push the changes to the remote repository's `main` branch.
# The `--set-upstream` flag ensures the local branch tracks the remote branch.
git push --set-upstream origin main

# Print another separator line for better readability in logs.
echo "======================"
