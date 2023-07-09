# Python Project Creator

This is a simple Bash script that creates a standard directory structure for python projects. The script also sets up a new conda environment and installs a set of predefined Python packages.

## Usage

To use the script, you need to pass the name of the new project as the first command line argument, the conda environment as the second command line argument, and then the desired python packages as the remaining command line arguments.

```bash
./setup.sh path/to/my_new_project conda_env_name package1 package2...
```

To run the script, give it execute permissions (chmod +x setup.sh), and run it (./setup.sh).

Please note that this script assumes you have conda installed and available on your path. This script creates the repository structure locally, but does not push it to GitHub.

This will create a new directory with the following structure:

```
my_new_project
├── README.md
├── requirements.txt
├── data
│ ├── raw
│ └── processed
├── notebooks
├── src
│ ├── **init**.py
│ ├── data
│ │ ├── **init**.py
│ └── script.py
└── tests
```
