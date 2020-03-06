#!/bin/bash -x

# @Discription : Flip Coin Simulation Problem
# @Author : Akshay Dhananjay Barve
# @Version : 18.04.3 lts
# @Since : 06 March 2020 / Friday

declare -A singletDict
singletDict=(["Heads"]=0 ["Tails"]=0)
headCount=0
tailCount=0
noOfFlips=10

function headOrTail()
{
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		echo Heads
		coinOutput="Heads"
	else
		echo Tails
		coinOutput="Tails"
	fi
}

function singletCombination()
{
	for (( i=0; i<$noOfFlips; i++ ))
	do
		headOrTail
		if [[ $coinOutput == Heads ]]
		then
			singletDict[Heads]=$((${singletDict[Heads]}+1 ))
			((headCount++))
		else
			singletDict[Tails]=$((${singletDict[Tails]}+1 ))
			((tailCount++))
		fi
	done
	headPercentage=`expr "scale=2; $headCount * 100 / $noOfFlips" | bc`
	tailPercentage=`expr "scale=2; $tailCount * 100 / $noOfFlips" | bc`
}
singletCombination
