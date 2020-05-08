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
