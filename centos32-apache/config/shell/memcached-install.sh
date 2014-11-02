#!/bin/env bash

cd /tmp 
cp /vagrant/pack/memcached/*.gz /tmp
cd /tmp
tar xvf libmemcached-1.0.16.tar.gz
cd libmemcached-1.0.16 && ./configure; make && sudo make install && sudo yes '' | pecl i memcached







