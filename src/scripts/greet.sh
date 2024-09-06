#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
export MY_ENV_VAR="Hello, World!" >> $BASH_ENV
export ANOTHER_VAR="42"  >> $BASH_ENV
export RANDOM_VAR="foo-bar" >> $BASH_ENV
source $BASH_ENV
