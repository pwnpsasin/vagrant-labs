#!/bin/env bash

cd /tmp 
sudo curl -s https://getcomposer.org/installer | php 
sudo cp /tmp/composer.phar /tmp/composer 
sudo chmod 777 /tmp/composer
sudo cp /tmp/composer /usr/bin/composer
sudo cp /tmp/composer /vagrant/project/InlineReader/ir/composer 






