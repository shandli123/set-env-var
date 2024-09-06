#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
 echo "export MY_ENV_VAR='Hello, World!'" >> $BASH_ENV
echo "export ANOTHER_VAR='42'" >> $BASH_ENV
echo "export RANDOM_VAR='foo-bar'" >> $BASH_ENV
# Reload environment variables
source $BASH_ENV
