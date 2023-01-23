#!/bin/sh

rm -rf public/*
hugo
cd public
git add --all
git commit -m "Published $(date)"
git push origin gh-pages
cd ..