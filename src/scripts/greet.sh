#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
#!/bin/bash

# Combine multiple exports in a single block and redirect to $BASH_ENV once
{
  echo 'export MY_ENV_VAR="Hello, World!"'
  echo 'export ANOTHER_VAR="42"'
  echo 'export RANDOM_VAR="foo-bar"'
} >> "$BASH_ENV"

# Source the BASH_ENV file to load the environment variables
# Adding a directive to ignore SC1090 for non-constant source
# shellcheck source=/dev/null
source "$BASH_ENV"
