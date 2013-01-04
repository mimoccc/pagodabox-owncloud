#!/bin/bash

echo "after_build.sh running."

echo "Installing latest official app files."
rsync -avz /var/www/apps/ /var/www/core/apps

echo "Installing necessary 3rd party library files"
mkdir -m 0644 /var/www/core/3rdparty
rsync -avz /var/www/3rdparty/ /var/www/core/3rdparty

# echo "Creating data folder"
# mkdir -m 0777 /var/www/core/data

echo "Altering ownCloud installation files to work with Pagoda Box"
cp -f /var/www/core/lib/setup.php /var/www/scripts/setup_original.php
cp -f /var/www/scripts/setup_modified.php /var/www/core/lib/setup.php
cp -f /var/www/scripts/templates/installation.php /var/www/core/core/templates/installation.php

echo "Cleaning up"
rm -rf -- /var/www/apps
rm -rf -- /var/www/3rdparty