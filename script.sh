#!/bin/sh

read -p "define directory to save wallpapers: " dir
read -p "define tagname(options:anime,dark,abstract and etc): " tag
read -p "define sorting (options: relevance, random, views, favorites, toplist): " sorting

wget $(curl -s https://wallhaven.cc/api/v1/search/?q\=$tag\&sorting\=$sorting | jq '.' | grep path | sed 's/\"path"://g;s/\"//g;s/\,//g') -P $dir 
sxiv $dir

