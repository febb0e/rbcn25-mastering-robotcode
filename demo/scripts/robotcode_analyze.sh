#!/bin/sh

# Run the robotcode analyze command
hatch run robotcode analyze code
# Capture the return value
RETURN_VALUE=$?
# Check the return value bitwise
# Assuming bitwise 1 indicates errors
if [ $((RETURN_VALUE & 1)) -ne 0 ]; then
  echo "robotcode analyze found errors."
  exit $RETURN_VALUE
else
  echo "robotcode analyze completed successfully with no errors."
fi