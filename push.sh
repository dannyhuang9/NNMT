#!/bin/bash

# push onto git

git add .
git commit -m "Pushing new outputs"
git remote rm origin
git remote add origin git@github.com:dannyhuang9/NNMT.git
git push origin master


