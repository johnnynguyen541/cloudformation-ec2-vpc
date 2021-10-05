#!/bin/bash

#############################################################################
# Function: Check_Kwargs_Count
#   Checks correct number of kwargs
# Globals:
#   args_count=${#}
#   
# Returns:
#   0 if correct
#   1 if incorrect count
#############################################################################
Check_Kwargs_Count () {
  args_count=${#}

  if [ ${args_count} -eq 4 ]
  then
    printf "Correct number of parameters\n"
    return 0
  else
    printf "Incorrect number of parameters\n"
    printf "Usage: ./update.sh [STACK_NAME] [TEMPLATE_FILE] [PARAMETERS_FILE]\n"
    return 1
  fi
}

# Script Start
Check_Kwargs_Count

aws cloudformation update-stack \
--stack-name $1 \
--template-body file://$2 \
--parameters file://$3 \
--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
--region=us-west-2