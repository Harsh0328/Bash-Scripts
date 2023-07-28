#!/bin/bash

circle_area() {
    radius=$1
    area=$(echo "scale=2; 3.14159 * $radius * $radius" | bc)
    echo "Area of the circle: $area"
}

circle_circumference() {
    radius=$1
    circumference=$(echo "scale=2; 2 * 3.14159 * $radius" | bc)
    echo "Circumference of the circle: $circumference"
}

square_area() {
    side=$1
    area=$(echo "$side * $side" | bc)
    echo "Area of the square: $area"
}

square_perimeter() {
    side=$1
    perimeter=$(echo "4 * $side" | bc)
    echo "Perimeter of the square: $perimeter"
}

rectangle_area() {
    length=$1
    breadth=$2
    area=$(echo "$length * $breadth" | bc)
    echo "Area of the rectangle: $area"
}

rectangle_perimeter() {
    length=$1
    breadth=$2
    perimeter=$(echo "2 * ($length + $breadth)" | bc)
    echo "Perimeter of the rectangle: $perimeter"
}

triangle_area() {
    base=$1
    height=$2
    area=$(echo "scale=2; ($base * $height) / 2" | bc)
    echo "Area of the triangle: $area"
}

triangle_perimeter() {
    side1=$1
    side2=$2
    side3=$3
    perimeter=$(echo "$side1 + $side2 + $side3" | bc)
    echo "Perimeter of the triangle: $perimeter"
}

while true
do
    echo ""
    echo "1. Circle"
    echo "2. Square"
    echo "3. Rectangle"
    echo "4. Triangle"
    echo "0. Exit"

    read -p "Enter your choice: " choice

    if [ $choice -eq 1 ]
    then
        while true
        do
            echo ""
            echo "1. Area"
            echo "2. Circumference"
            echo "0. Go Back"

            read -p "Enter Choice: " choice2

            if [ $choice2 -eq 1 ]
            then
                read -p "Enter the radius of the circle: " radius
                circle_area $radius

            elif [ $choice2 -eq 2 ]
            then
                read -p "Enter the radius of the circle: " radius
                circle_circumference $radius

            elif [ $choice2 -eq 0 ]
            then
                break
            else
                echo "Invalid Choice"
                continue
            fi
        done

    elif [ $choice -eq 2 ]
    then
        while true
        do
            echo ""
            echo "1. Area"
            echo "2. Perimeter"
            echo "0. Go Back"

            read -p "Enter Choice: " choice2

            if [ $choice2 -eq 1 ]
            then
                read -p "Enter the Length of side: " side
                square_area $side

            elif [ $choice2 -eq 2 ]
            then
                read -p "Enter the Length of side: " side
                square_perimeter $side

            elif [ $choice2 -eq 0 ]
            then
                break
            else
                echo "Invalid Choice"
                continue

            fi
        done

    elif [ $choice -eq 3 ]
    then
        while true
        do
            echo ""
            echo "1. Area"
            echo "2. Perimeter"
            echo "0. Go Back"

            read -p "Enter Choice: " choice2

            if [ $choice2 -eq 1 ]
            then
                read -p "Enter the LENGTH of Rectangle: " length
                read -p "Enter the BREADTH of Rectangle: " breadth
                rectangle_area $length $breadth

            elif [ $choice2 -eq 2 ]
            then
                read -p "Enter the LENGTH of Rectangle: " length
                read -p "Enter the BREADTH of Rectangle: " breadth
                rectangle_perimeter $length $breadth

            elif [ $choice2 -eq 0 ]
            then
                break
            else
                echo "Invalid Choice"
                continue
            fi
        done

    elif [ $choice -eq 4 ]
    then
        while true
        do
            echo ""
            echo "1. Area"
            echo "2. Perimeter"
            echo "0. Go Back"

            read -p "Enter Choice: " choice2

            if [ $choice2 -eq 1 ]
            then
                read -p "Enter the BASE of Triangle: " base
                read -p "Enter the HEIGHT of Triangle: " height
                triangle_area $base $height

            elif [ $choice2 -eq 2 ]
            then
                read -p "Enter the SIDE1 of Triangle: " side1
                read -p "Enter the SIDE2 of Triangle: " side2
                read -p "Enter the SIDE3 of Triangle: " side3
                triangle_perimeter $side1 $side2 $side3

            elif [ $choice2 -eq 0 ]
            then
                break
            else
                echo "Invalid Choice"
                continue
            fi
        done

    elif [ $choice -eq 0 ]
    then
        break
    else
        echo "Invalid Choice"
        continue
    fi
done

echo "Thanks for using GEOMETRY CALCULATOR"
