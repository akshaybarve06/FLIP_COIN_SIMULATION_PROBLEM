#!/bin/bash -x

# @Discription : Flip Coin Simulation Problem
# @Author : Akshay Dhananjay Barve
# @Version : 18.04.3 lts
# @Since : 06 March 2020 / Friday

declare -A combinations

combinations=(["H"]=0 ["T"]=0 ["HH"]=0 ["HT"]=0 ["TT"]=0 ["TH"]=0 )

noOfFlips=30
coinOutput=O
flips=0

function headOrTail()
{
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		coinOutput=H
	else
		coinOutput=T
	fi
}

function singletCombination()
{
	while [[ $flips -lt $noOfFlips ]]
	do
		headOrTail
		if [[ $coinOutput == H ]]
		then
			combinations[H]=$((${combinations[H]}+1 ))
		else
			combinations[T]=$((${combinations[T]}+1 ))
		fi
		((flips++))
	done
	headPercentage=`expr "scale=2; ${combinations[H]} * 100 / $noOfFlips" | bc`
	tailPercentage=`expr "scale=2; ${combinations[T]} * 100 / $noOfFlips" | bc`

flips=0
}

function doubletCombination()
{
	while [[ $flips -lt $noOfFlips ]]
	do
		headOrTail
		output1=$coinOutput
		headOrTail
		output2=$coinOutput
		if [[ $output1$output2 == HH ]]
		then
			combinations[HH]=$((${combinations[HH]}+1))
		elif [[ $output1$output2 == HT ]]
		then
			combinations[HT]=$((${combinations[HT]}+1))
		elif [[ $output1$output2 == TT ]]
		then
			combinations[TT]=$((${combinations[TT]}+1))
		elif [[ $output1$output2 == TH ]]
   	then
      	combinations[TH]=$((${combinations[TH]}+1))
		fi
		((flips++))
	done
	HHpercentage=`expr "scale=2; ${combinations[HH]} * 100 / $flips" | bc`
	HTpercentage=`expr "scale=2; ${combinations[HT]} * 100 / $flips" | bc`
	TTpercentage=`expr "scale=2; ${combinations[TT]} * 100 / $flips" | bc`
	THpercentage=`expr "scale=2; ${combinations[TH]} * 100 / $flips" | bc`

flips=0
}

	singletCombination
	echo H T
	echo ${combinations["H"]} ${combinations["T"]}

	doubletCombination
	echo HH HT TH TT
	echo ${combinations["HH"]} ${combinations["HT"]} ${combinations["TH"]} ${combinations["TT"]}
