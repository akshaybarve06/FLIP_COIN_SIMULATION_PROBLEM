#!/bin/bash -x

# @ Author : Akshay Dhananjay Barve
# @Since: 07 March 2020 / Saturday

declare -A combinations

read -p "How Many Coins You Want To Throw-" coins
read -p "Number of Times..?" times

function toss(){
	for (( index=0; index<$times; index++ ))
	do
		outcomes=""
		for (( index2=0; index2<$coins; index2++ ))
		do
			if [[ $((RANDOM%2)) -eq 1 ]]
			then
				outcomes=$outcomes"H"
			else
				outcomes=$outcomes"T"
			fi
		done
	combinations[$outcomes]=$(( ${combinations[$outcomes]} + 1 ))
	done
	findMaxOutput
}
function findMaxOutput(){
#	maxOutcomes=0
	for k in "${!combinations[@]}"
	do
		echo $k'-'${combinations["$k"]}
	done | sort -rn -k3

	for k in ${!combinations[@]}
	do
		if [[ $maxOutcomes -lt ${combinations["$k"]} ]]
		then
			maxOutcomes=${combinations["$k"]}
			maxOutput=$k
		fi
	done
	echo "Maximum Occurances are $maxOutcomes --> $maxOutput"
}
toss
