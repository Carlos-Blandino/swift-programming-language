//:# Basic Operators

//operators detect and disallow value overflow
//Swift reports an error rather than having the value
//wrap around, but there are some advanced operators that
//allow you to overflow values

//:## Terminology

//Unary - !b (before the operand) = unary prefix
//Unary - c! (after the operand) = unary postfix
//Binary - 2 + 2 (between 2 operands)
//Ternary - a ? b : c (uses 3 operands)

//:## Assignment Operator

let myString = "Hello"
var mySecondString = "World"

mySecondString = myString
print("myString was assigned to mySecondString and now mySecondString holds \"\(mySecondString)\" in memroy")

//deconstruct a tuple with the assignment operator
let (a,b) = (10,20)
print("a is now \(a) and b is \(b)")

//Swift does not allow assignemts in a boolean context

/*:
 if a = b {
 
 }

 */
//:## Arithmetic Operators

print(1 + 2)
print(2 - 1)
print(2 * 2)
print(2 / 1)
//2 integers results in a integer with remainder cut off
print(1 / 2)

//the addition operatro is overloaded and can be also used
//to concatinate strings

print("Hellow" + " " + "World")

//:### Remainder Operator

print("The remainder of 10 / 3 is \(10 % 3)")

//(3 x 3) + 1 = 10

//:### Unary Minus Operator

let myNumber = 2
let myNegativeNumber = -myNumber
print(myNegativeNumber)
let myConvertedNegativeNumber = -myNegativeNumber
print(myConvertedNegativeNumber)

//:### Unary Plus Operator


let alsoMyNegativeNum = +myNegativeNumber
print(alsoMyNegativeNum)
print(-2 - 2 )
//plus operator doesn't do much but good for clarity of code
print(-2 - +2)

//:## Compound Assignment Operators

//compound assignment operators don't return a value
//such as var count2 = count += 1
var count = 0
count += 1

print("count got incremented by \(count)")

//:## Comparison Operators

print(1 == 1)
print(2 != 1)
print(5 > 5)
print(3 < 4)
print(50 >= 49)
print(50 <= 49)

//comparison operators are used in conditional statements
if 2 < 5 { print("2 is less than 5") }

//comparison operators are used in comparing tuples
//associativity is from left to right
//if compares first element are equal if so it check the second
print((2,"people") < (2, "peoples"))
print((2,"people") < (2, "people"))
print((1,"people") < (2, "peoples"))

/*:
 Swift standard Library includes tuple comparison operators for
 tuples with fewer than seven elements. For <=seven elements, you must
 implement the comparison operators yourself
 */

//:## Ternary Conditional Operator

//this operator is a shortcut for evaluating one of
//two expressions based on whether question is true or false
//such as in an if else statement

/*:
 if question {
    statement 1
 } else {
    statement 2
 }
 */
let imHungry = true

let myMeal = imHungry ? "Hamburger, fries and chocolate shake" : "water"
print("I am having \(myMeal)")

//:## Nil-Coalescing Operator

/*:
 (a ?? b)  is used for unwrapping a, if nil then choose option b which needs to be of the
 same type that is stored in a, thus you don't need to use a ternary */

var password: String? //defaults to nil if set to var

let user = password ?? "Guest"

print("The user that is logged in is \(user)")

//:## Range Operators

//:### Closed Range Operator (a...b)
for index in 1...12 {
    print("2 x \(index) = \(index * 2)")
}
//:### Half-Open Range Operator (a..<b)
//used in particular with zero-based lists like arrays
//contiains its first value but not its second value

let animals = ["Dog","Cat","Horse","Cow","Mouse"]
let arrayCount = animals.count

for index in 0..<arrayCount {
    print("Animal \(index + 1) is a \(animals[index])")
}
//:### One-Sided Ranges

for animal in animals[...3] {
    print(animal)
}
for animal in animals[2...]{
    print(animal)
}
for animal in animals[..<2] {
    print(animal)
}
let range1 = ...5
let range2 = ..<5
let range3 = 0...5

print(range1.contains(5))
print(range1.contains(-4))
print(range1.contains(6))
print(range2.contains(5))
print(range3.contains(5))
print(range3.contains(0))

for index in 0... {
    print(index)
    if index == 10{
        break
    }
}

//:## Logical Operators

/*:
 Logical NOT (!a)
 Logical AND (a && b)
 Logical OR (a || b)
 */

//:### Logical NOT Operator (inverts a Boolean value)

let continueIn = false
if !continueIn {
    print("You are not permitted inside, please try later")
}
// if not continue in , we are looking for a false to continue
//to the first if statement

//:### Logical AND Operator (both values must me true)

/*:
 (a && b) both values must be true, if the first is false the evaluation short-circuits, stops evaluating and the final condition is false
 */
let enteredFirstPassword = true
let enteredSecondPassword = false

if enteredFirstPassword && enteredSecondPassword {
    print("You are at Home screen")
} else {
    print("Try use all entry parameters")
}

//:### Logical OR Operator (only one value must be true)

/*:
 (a || b) this also perfoms a short-circuit evaluation like the Logical && operator
 */


if enteredFirstPassword || enteredSecondPassword {
    print("You are at Home screen")
} else {
    print("Try use all entry parameters")
}

//:### Combining Logical Operators

let age = 19
let country = "USA"
let parentalConsent = true

if age >= 18 && country == "USA" || age < 18 && age  > 15 && parentalConsent {
    print("You are free to enlist in the US Army")
} else {
    print("You are too young")
}
//use parenthese to make intent explicit
