
import UIKit

//:# Control Flow

//:## For-In Loops

// Iterating an array
let numbersArray = [1,44,55,11,20,100,53]

for num in numbersArray {
    print(num, terminator: ", ")
}

// Iterate over a dictionary
let cartoonCharaterAge = ["Mickey Mouse": 55, "Mini Mouse": 19,"Bugs Bunny": 64, "Daffy Duck": 80]

for (character, age) in cartoonCharaterAge {
    print("\(character) is \(age) years old")
}

// Numeric ranges
for number in 1...25 {
    print(number, terminator: ",")
}

// You can ignore the values of sequence
let base = 2
let power = 8
var result = 1

for _ in 1...power {
    result *= base
}
print("\n")
print("\(base) to the power of \(power) is \(result)")
print("\n")
// Using a half open range
let degrees = 45
for degree in 0..<degrees {
    print(degree, terminator: ",")
    
}
print("\n")
// Using stride(from:to:by:)

let degreeInterval = 5
for degree in stride(from: 0, to: degrees, by: degreeInterval) {
    print(degree, terminator: ",")
    
}

//:## While Loops

//Loops until a condition becomes false
//while evaluates at the beginning of each iteration
//repeat-while evaluates at the end of the iteration
print("\n")
var countDown = 10

while countDown > 0 {
    countDown -= 1
    print("\(countDown) seconds remaing")
   
    if countDown == 0 {
        print("Blast Off")
        
    }
    
}
countDown = 10
repeat {
    countDown -= 1
    print("\(countDown) seconds remaing")
    
     
    if countDown == 0 {
        print("Blast Off")
    }
    
} while countDown > 0

//:## Conditional Statements

//:### If

var choosenColor = "red"
if choosenColor == "red" {
    print(choosenColor)
}


choosenColor = "blue"
if choosenColor == "red" {
    print(choosenColor)
} else {
    print("The choosen color is not red")
}

choosenColor = "blue"
if choosenColor == "red" {
    //print("The choosen color is \(choosenColor)")
} else if choosenColor == "blue" {
    //print("The choosen color is \(choosenColor)")
} else {
    print("The choosen color is not an available option")
}

//:### Switch
//Typically a switch statement would fallthrough and would require
//a break statement but in swift we need to use a fallthrough
//control tarnsfer statement to explicity make it fallthrough
switch choosenColor{
case "red":
    //print("The choosen color is \(choosenColor)")
    fallthrough
case "blue":
    //print("The choosen color is \(choosenColor)")
    fallthrough
case "yellow":
    print("The choosen color is \(choosenColor)")
    print("You have choosen one of the primary colors")
default:
    print("The choosen color is not a primary color")
}

