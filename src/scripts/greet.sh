#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
export MY_ENV_VAR="Hello, World!"
export ANOTHER_VAR= "42"
export RANDOM_VAR= "foo-bar"
source $BASH_ENV
