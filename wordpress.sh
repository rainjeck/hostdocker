#!/bin/bash

while true; do
    read -p "Do you want to install Wordpress? [y] or [n] " yn
    case $yn in
        [Yy]* )
          rm latest.tar.gz
          wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz
          mv wordpress/wp-content wordpress/assets
          mv wordpress/wp-config-sample.php wordpress/wp-config.php
          rm latest.tar.gz
          break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
