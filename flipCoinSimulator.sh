#!/bin/bash -x

# @Discription : Flip Coin Simulation Problem
# @Author : Akshay Dhananjay Barve
# @Version : 18.04.3 lts
# @Since : 06 March 2020 / Friday

if [[ $((RANDOM%2)) -eq 1 ]]
then
   echo Heads
else
   echo Tails
fi
