#!/bin/bash -x

# @Discription : Flip Coin Simulation Problem
# @Author : Akshay Dhananjay Barve
# @Version : 18.04.3 lts
# @Since : 06 March 2020 / Friday

declare -A singletDict
declare -A doubletDict
declare -A tripletDict

singletDict=(["H"]=0 ["T"]=0)
doubletDict=(["HH"]=0 ["HT"]=0 ["TT"]=0 ["TH"]=0)
tripletDict=(["HHH"]=0 ["HHT"]=0 ["HTT"]=0 ["HTH"]=0 ["THH"]=0 ["THT"]=0 ["TTH"]=0 ["TTT"]=0)

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
			singletDict[H]=$((${singletDict[H]}+1 ))
		else
			singletDict[T]=$((${singletDict[T]}+1 ))
		fi
		((flips++))
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
function tripletCombination()
{
	while [[ $flips -lt $noOfFlips ]]
	do
		headOrTail
		temp1=$coinOutput
		headOrTail
		temp2=$coinOutput
		headOrTail
		temp3=$coinOutput
		if [[ $temp1$temp2$temp3 == HHH ]]
		then
			tripletDict[HHH]=$((${tripletDict[HHH]}+1))
		elif [[ $temp1$temp2$temp3 == HHT ]]
		then
			tripletDict[HHT]=$((${tripletDict[HHT]}+1))
		elif [[ $temp1$temp2$temp3 == HTT ]]
		then
			tripletDict[HTT]=$((${tripletDict[HTT]}+1))
		elif [[ $temp1$temp2$temp3 == HTH ]]
		then
			tripletDict[HTH]=$((${tripletDict[HTH]}+1))
		elif [[ $temp1$temp2$temp3 == THH ]]
		then
			tripletDict[THH]=$((${tripletDict[THH]}+1))
		elif [[ $temp1$temp2$temp3 == TTH ]]
		then
			tripletDict[TTH]=$((${tripletDict[TTH]}+1))
		elif [[ $temp1$temp2$temp3 == THT ]]
		then
			tripletDict[THT]=$((${tripletDict[THT]}+1))
		elif [[ $temp1$temp2$temp3 == TTT ]]
		then
			tripletDict[TTT]=$((${tripletDict[TTT]}+1))
		fi
		((flips++))
	done
	HHHpercentage=`expr "scale=2; ${tripletDict[HHH]} * 100 / $flips" | bc`
	HHTpercentage=`expr "scale=2; ${tripletDict[HHT]} * 100 / $flips" | bc`
	HTTpercentage=`expr "scale=2; ${tripletDict[HTT]} * 100 / $flips" | bc`
	HTHpercentage=`expr "scale=2; ${tripletDict[HTH]} * 100 / $flips" | bc`
	THHpercentage=`expr "scale=2; ${tripletDict[THH]} * 100 / $flips" | bc`
	TTHpercentage=`expr "scale=2; ${tripletDict[TTH]} * 100 / $flips" | bc`
	TTTpercentage=`expr "scale=2; ${tripletDict[TTT]} * 100 / $flips" | bc`
	THTpercentage=`expr "scale=2; ${tripletDict[THT]} * 100 / $flips" | bc`

}
singletCombination
echo ${singletDict[@]}
echo ${!singletDict[@]}
flips=0

doubletCombination
echo ${doubletDict[@]}
echo ${!doubletDict[@]}
flips=0

tripletCombination
echo ${tripletDict[@]}
echo ${!tripletDict[@]}
