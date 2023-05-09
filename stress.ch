#!/bin/bash
g++ ./sol.cpp -o sol
g++ ./gen.cpp -o gen
g++ ./stupid.cpp -o stupid
for((; ;)); do
	./gen > ./cmake-build-debug/test.txt
	./sol < ./cmake-build-debug/test.txt > sol.out
	./stupid < ./cmake-build-debug/test.txt > stupid.out
	diff -Z sol.out stupid.out > /dev/null || break
      echo -e "\e[1;32mok\e[0m"

done
echo -e "\e[1;31mError found!\e[0m"
echo -e "\e[1;34mInput\e[0m"
cat ./cmake-build-debug/test.txt
echo -e "\e[1;34mOutput(sol.cpp)\e[0m"
cat sol.out
echo -e "\e[1;34mOutput(stupid.cpp)\e[0m"
cat stupid.out
echo

