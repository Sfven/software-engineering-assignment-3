#!/bin/bash

printf "Enter your numbers below. Press enter after each entry. Enter '~' to finish entering numbers.\n"

while read inputs
do
  [ "$inputs" == "~" ] && break
  array=("${array[@]}" $inputs)
done

add() {

  local internal_array=("$@")
  local sum=0
  for i in "${internal_array[@]}" ; do
    (( sum += i ))
  done
  echo $sum

}

multiply() {

  local internal_array=("$@")
  local product=1
  for i in ${internal_array[@]} ; do
    (( product *= i ))
  done
  echo $product

}

reverse() {

  local array=("$@")
  local reversed_array=()
  local length="${#array[@]}"
  for ((i = length - 1; i >= 0; i--)); do
      reversed_array+=("${array[i]}")
  done
  echo "${reversed_array[@]}"

}

sum=$(add "${array[@]}")
echo "Total Sum: $sum"
product=$(multiply "${array[@]}")
echo "Total Product: $product"
reversed_array=($(reverse "${array[@]}"))
echo "Reversed array: ${reversed_array[@]}"
reversed_sum=$(add "${reversed_array[@]}")
echo "Total Reversed Sum: $reversed_sum"
reversed_product=$(multiply "${reversed_array[@]}")
echo "Total Reversed Product: $reversed_product"

