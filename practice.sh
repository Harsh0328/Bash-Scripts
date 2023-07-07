function addition() {

    ans=$(($1+$2))
    echo $ans
}

    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

addition $num1 $num2