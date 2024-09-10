#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
#!/bin/bash

# Combine multiple exports in a single block and redirect to $BASH_ENV once
 WORKFLOW_ID=${CIRCLE_WORKFLOW_ID}
echo "Workflow ID: ${WORKFLOW_ID}"  # Print the workflow ID for debugging

WORKFLOW_INFO=$(curl -s -H "Circle-Token: ${CIRCLE_TOKEN}" "https://circleci.com/api/v2/workflow/${WORKFLOW_ID}")
echo "Workflow Info: ${WORKFLOW_INFO}"  # Print the workflow info for debugging

# Parse `started_by` email from the workflow info
STARTED_BY_UUID=$(echo "$WORKFLOW_INFO" | jq -r '.started_by')
echo "Started By: ${STARTED_BY_UUID}"  # Print started_by for debugging

# Add started_by to the environment
echo "STARTED_BY_UUID=${STARTED_BY_UUID}" >> $BASH_ENV

# STARTED_BY=$(curl -s -H "Circle-Token: ${CIRCLE_TOKEN}" "https://circleci.com/api/v2/user/${STARTED_BY_UUID}")
echo "Extracted circle token: ${CIRCLE_TOKEN}"
STARTED_BY=$(curl -s -H "Circle-Token: ${CIRCLE_TOKEN}" "https://circleci.com/api/v2/user/${STARTED_BY_UUID}")
echo "User Info: ${STARTED_BY}"  # Print user info for debugging

# Extract `name` from user info
STARTED_BY=$(echo "$STARTED_BY" | jq -r '.name')
echo "STARTED_BY=${STARTED_BY}" >> $BASH_ENV
echo "Extracted user name: ${STARTED_BY}"

if [ "$STARTED_BY" == "qdbrowserstack@gmail.com" ]; then
  echo "User is qdbrowserstack@gmail.com, running orb command"
  {
    echo 'export MY_ENV_VAR="Hello, World!"'
    echo 'export ANOTHER_VAR="42"'
    echo 'export RANDOM_VAR="foo-bar"'
  } >> "$BASH_ENV"
else
    echo "User is not qdbrowserstack@gmail.com, setting default values"
fi
# Source the BASH_ENV file to load the environment variables
# Adding a directive to ignore SC1090 for non-constant source
# shellcheck source=/dev/null
source "$BASH_ENV"
