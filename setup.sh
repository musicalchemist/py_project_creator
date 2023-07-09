#!/bin/bash

# Check if minimum arguments are provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 REPO_NAME CONDA_ENV_NAME PACKAGE1 PACKAGE2 ..."
    exit 1
fi

# Set repository name from first argument
REPO_NAME=$1

# Set environment name from second argument
ENV_NAME=$2

# Shift the first two arguments and leave only packages
shift 2
PACKAGES="$@"

# Create directory structure
mkdir -p $REPO_NAME/data/raw
mkdir -p $REPO_NAME/data/processed
mkdir $REPO_NAME/notebooks
mkdir -p $REPO_NAME/src/data
mkdir $REPO_NAME/tests

# Create empty .py and .md files
touch $REPO_NAME/README.md
touch $REPO_NAME/requirements.txt
touch $REPO_NAME/src/__init__.py
touch $REPO_NAME/src/script.py
touch $REPO_NAME/src/data/__init__.py

# Download Python .gitignore file in the repository directory
curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o $REPO_NAME/.gitignore

# Navigate to the repository directory
cd $REPO_NAME

# Initialize a Git repository
git init

# Create a conda environment with Python 3.10
conda create -n $ENV_NAME python=3.10 -y

# Activate the environment
source activate $ENV_NAME

# Define Python packages
echo "python=3.10" > requirements.txt
for PACKAGE in $PACKAGES
do
    echo $PACKAGE >> requirements.txt
done

# Install Python packages
while read requirement; do conda install --yes $requirement || pip install $requirement; done < requirements.txt

echo "Script completed successfully"
