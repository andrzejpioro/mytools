#!/bin/bash

# GitLab API endpoint and access token
GITLAB_API_URL="https://gitlab.com/api/v4"
GITLAB_ACCESS_TOKEN="<YOUR_GITLAB_ACCESS_TOKEN>"

# Project and package registry details
PROJECT_ID="<YOUR_PROJECT_ID>"
PACKAGE_NAME="<YOUR_PACKAGE_NAME>"
PACKAGE_VERSION="<YOUR_SNAPSHOT_VERSION>"

# Construct the API endpoint URL for the package
PACKAGE_API_URL="${GITLAB_API_URL}/projects/${PROJECT_ID}/packages/maven/${PACKAGE_NAME}/${PACKAGE_VERSION}"

# Make the API request and extract the URL for the jar file
JAR_URL=$(curl --header "PRIVATE-TOKEN: ${GITLAB_ACCESS_TOKEN}" ${PACKAGE_API_URL} | jq -r '.package_files[] | select(.file_name | endswith(".jar")) | .download_path')

# Print the URL for the jar file
echo ${JAR_URL}
