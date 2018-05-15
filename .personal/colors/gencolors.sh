#!/bin/bash

for i in {5..9} {A..B};
do
  for j in {5..9} {A..B};
  do
    for k in {5..9} {A..B};
    do
      echo "#$i$i$j$j$k$k"
    done
  done
done
