#!/bin/bash
echo "Welcome to SQL_beginner directory maker! powered by stonehom"
echo ""
echo "It is a script that helps you create dir's and .sql files specifically to day and number of exercises"
echo ""
read -p "What a day number is it? : " day_dir
read -p "How many exercises are today?(0 is not included) : " num_dir

for i in $(seq 0 $num_dir); do
  if [ $i -le 9 ]; then
    mkdir ex0"$i"
    if [ $day_dir -le 9 ]; then
      touch ex0"$i"/day0"$day_dir"_ex0"$i".sql
    else
      touch ex0"$i"/day"$day_dir"_ex0"$i".sql
    fi
  else
    mkdir ex"$i"
    if [ $day_dir -le 9 ]; then
      touch ex"$i"/day0"$day_dir"_ex"$i".sql
    else
      touch ex"$i"/day"$day_dir"_ex"$i".sql
    fi
  fi
done
echo ""
echo "SUCCESS!"
echo "Day"$day_dir", "$num_dir + 1" directories was created!"
