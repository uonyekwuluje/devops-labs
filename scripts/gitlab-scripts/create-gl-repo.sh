#!/bin/bash
GITLAB_USER="uonyekwuluje"
GITLAB_ADDRESS="https://gitlab.com/api/v4/"
#export GITLAB_TOKEN="" # Please export your GitLab Token

# ------------------------------- #
#  Create New Project in GitLab   #
# ------------------------------- #
createProject() {
    project="newUche"
    test -z ${project} && echo "Repo name required." 1>&2 && exit 1
    curl -H "Content-Type:application/json" \
      ${GITLAB_ADDRESS}/projects?private_token=${GITLAB_TOKEN} \
      -d "{ \"name\": \"${project}\" }"
}

# ------------------------------- #
#   Delete Project in GitLab      #
# ------------------------------- #
deleteProject() {
    project="newUche"
    curl -H "Content-Type:application/json" -H "Private-Token: ${GITLAB_TOKEN}" \
    -X DELETE ${GITLAB_ADDRESS}/users/${GITLAB_USER}/projects?${GITLAB_USER}/${project} 
}




# ------------------------------- #
#   Get User Projects in GitLab   #
# ------------------------------- #
getUserProjects() {
    # Get Number of Pages
    number_of_pages=$(curl -s --head "${GITLAB_ADDRESS}/users/${GITLAB_USER}/projects?private_token=${GITLAB_TOKEN}" \
    | grep x-total-pages | awk '{print $2}' | tr -d '\r\n')
    # List All Projects
    for page in $(seq 1 ${number_of_pages}); do
       curl -s "${GITLAB_ADDRESS}/users/${GITLAB_USER}/projects?private_token=${GITLAB_TOKEN}&page=${page}" | jq .[].name
    done
}


#createProject
deleteProject
#getUserProjects
