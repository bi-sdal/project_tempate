#!/usr/bin/env bash

# This script is an adaptation from:
# https://github.com/chendaniely/computational-project-cookie-cutter/blob/master/setup_project_dir.sh

# don't overwrite files.
set -o noclobber

# Exit if no arguments were provided.
[ $# -eq 0 ] && { echo "Usage: $0 [target directory]"; exit 1; }

echo "Setting up folder structure in $1"

if [ ! -d "$1" ]; then
    mkdir $1
fi

echo "Creating gitignore"
echo "$1/$(basename $1)/gitignore"
cp gitignore $1/.gitignore

echo "Creating rstudio project"
echo "$1/$(basename $1).Rproj"
cp Rproj $1/$(basename $1).Rproj

echo "creating base folders"
mkdir $1/data $1/src $1/output

cd $1/data
echo "Data directory for storing fixed data sets" > README.md

cd $1/src
echo "src for source code" > README.md

cd $1/output
echo "Code output that should be tracked, like final figures, tables, etc" > README.md

echo "Folders created."

cat > $1/README.md << EOF

folder structure:

    ./
    |- data/      # data
    |
    |- src/       # any source code
    |
    |- output/    # evergrean results like figures, tables, etc


EOF

echo "Top-level README.md created"
