#!/bin/bash -x

# @Discription : Flip Coin Simulation Problem
# @Author : Akshay Dhananjay Barve
# @Version : 18.04.3 lts
# @Since : 06 March 2020 / Friday

declare -A singletDict
declare -A doubletDict

singletDict=(["H"]=0 ["T"]=0)
doubletDict=(["HH"]=0 ["HT"]=0 ["TT"]=0 ["TH"]=0)

noOfFlips=10
coinOutput=O
flips=0

function headOrTail()
{
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
#		echo Heads
		coinOutput=H
	else
#		echo Tails
		coinOutput=T
	fi
#	echo $coinOutput
}

function singletCombination()
{
	for (( i=0; i<$noOfFlips; i++ ))
	do
		headOrTail
		if [[ $coinOutput == H ]]
		then
			singletDict[H]=$((${singletDict[H]}+1 ))
		else
			singletDict[T]=$((${singletDict[T]}+1 ))
		fi
	done
	headPercentage=`expr "scale=2; ${singletDict[H]} * 100 / $noOfFlips" | bc`
	tailPercentage=`expr "scale=2; ${singletDict[T]} * 100 / $noOfFlips" | bc`
}

function doubletCombination()
{
	while [[ $flips -lt $noOfFlips ]]
	do
		headOrTail
		temp1=$coinOutput
		headOrTail
		temp2=$coinOutput

		if [[ $temp1$temp2 == HH ]]
		then
			doubletDict[HH]=$((${doubletDict[HH]}+1))
		elif [[ $temp1$temp2 == HT ]]
		then
			doubletDict[HT]=$((${doubletDict[HT]}+1))
		elif [[ $temp1$temp2 == TT ]]
		then
			doubletDict[TT]=$((${doubletDict[TT]}+1))
		elif [[ $temp1$temp2 == TH ]]
   	then
      	doubletDict[TH]=$((${doubletDict[TH]}+1))
		fi
		((flips++))
	done

	HHpercentage=`expr "scale=2; ${doubletDict[HH]} * 100 / $flips" | bc`
	HTpercentage=`expr "scale=2; ${doubletDict[HT]} * 100 / $flips" | bc`
	TTpercentage=`expr "scale=2; ${doubletDict[TT]} * 100 / $flips" | bc`
	THpercentage=`expr "scale=2; ${doubletDict[TH]} * 100 / $flips" | bc`
}

#singletCombination

doubletCombination
echo ${doubletDict[@]}
echo ${!doubletDict[@]}
