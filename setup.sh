#!/bin/bash

echo "Creating ~/.vimrc"
cp vimrc ~/.vimrc

echo "Disabling terminal alert sound"
echo "" >> ~/.bashrc
echo "# Mude sound" >> ~/.bashrc
echo "bind 'set bell-style none'" >> ~/.bashrc
