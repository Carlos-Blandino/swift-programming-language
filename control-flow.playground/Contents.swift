
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

//:### Interval Matching

let characters = "a"
switch characters {
case "a"..."z":
    print("You choose a lower case letter")
case "A"..."Z":
    print("You choose a upper case letter")
default:
    print("You did not choose a letter")
}

//:### Tuples
//Use an (_) underscore as a wild card in a tuple when used to test
//multiple values in a switch statement

let somePoint = (2, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is the origin")
case (_, 0):
    print("\(somePoint) along the x-axis")
case (0, _):
    print("\(somePoint) along the y-axis")
case (-3...3, -3...3):
    print("\(somePoint) is inside the the 3 x 3 box")
default:
    print("\(somePoint) is outside of the 3 x 3 box")
}

//:### Value Binding

//instead of using an (_) an underscore, which basically its
//saying unmaned variable goes in here, you can declare a var/let
//variable to allow usage within the case statement

let anotherPoint = (2, 1)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//use cane use a (where) clause for extra checks
//checking the points of diagnal lines in cartesian
//coordinate system

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//:### Compound Cases

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//:### Compound Cases w/ Value Binding

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//:## Control Transfer Statements

//:## Continue
//stops the current iteration and tells it to start
//on the next iteration
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

//:## Break in Loops and Switch statements
//Terminates the switch or loop statements execution
//and continues on to the next statement after the closing
//brace

//:## Fallthrough
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


//:### Labeled Statements

//to clarify the application of a control transfer statement
//use labels on the loops and conditional statements
    var x = 5
    var y = 0
 nameOfLoop: while x>y {
    y += 1
    switch y {
    case 1:
        print(y)
    case 2:
        print(y)
    case 3:
        print("printing \(y) before iterating over again")
        continue nameOfLoop
    case 4:
        break nameOfLoop
    default:
        break
    }
    print("end of switch")
   }
print("end of while")

//:### Return - Early Exit

//guard statement used for optional binding

