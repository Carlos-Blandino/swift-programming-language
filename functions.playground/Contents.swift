import UIKit

//:# Functions

//:## Defining and Calling Functions

//use keyword func functionName(paramaterNames: Type) -> returnType {
//(starting code block brace)
//program statements
//(ending code block brace)
//}

//the following function has multiple parameters
//when calling the function you pass the actual variables
//they are then called arguments
func addNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}
print(addNumbers(number1: 22, number2: 55))

//:### Functions Without Return Values
//function does not need (->)
//under the hood the function returns a special value
//of the void type
func greetings(person: String) {
    print("Your name is , \(person)!")
}
greetings(person: "Mike")
// Prints "Hello, Dave!"

//:### Functions with Multple Return Values
//specify a tuple as return type  -> (name: Int, name2: Int)
//return a tuple (varName, varName2)
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//You can make the return tuple optional by using (?)
//it may or may not return a tuple and need to unwrap

//func minMax(array: [Int]) -> (min: Int, max: Int)? {
//perform optional binding to unwrap

/*:
 if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
 print("min is \(bounds.min) and max is \(bounds.max)")
 }
 */

//:### Functions With an Implicit Return
//don't have to use keyword (return) if body consist of single expression

func getName(person: String) -> String {
    //no return keyword required
    "Your name is , \(person)!"
}

//:## Function Argument Labels and Parameter Names

func someFunctionName(firstArgumentLabel firstParameterName: String, secondArgumentLabel secondParameterName: String) {
    //in the function use the parameter names only to refer to the arguments
}

//:### Omitting Argument Labels
//substitute argument label with the (_) underscore
//to avoid having to type out the argument label or the parameter name
//when the argument label is not specified
func greet(_ person: String, hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet("Billy", hometown: "NY"))

//:### Default Parameter Values

//you can define a value to a parameter to give it a starting value
//and change it in code if needed or pass in a value as typically done

//place the default parameters after the parameters with out defaults

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

//:### Variadic Parameters

/*:
 use a variadic prameter (an ellypsis "..." appended to the Type of the parameter) when a varying amount of inputs of a specified type
is required
*/
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

//:### In-Out Parameters
//the "&" ampersand typically know as "addres of operator"
//assigns the address of someInt to a. That is, a and the value of someInt refer to the same memory location same goes for b and anotherInt
//inout parameters cannot have default values, and variadic paramters can not be marked as inout

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

//
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

//:## Function Types

//"(Int,Int) -> Int "defines a function type and can be
//and can used like any other type
func multiplyNumbers(firstNum: Int, secondNum: Int) -> Int {
    return firstNum * secondNum
}

var myMathOperation: (Int,Int) -> Int
myMathOperation = multiplyNumbers(firstNum:secondNum:)

print(myMathOperation(22,33))

//:### Function Types as Parameter Types

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(myMathOperation, 3, 5)

//:### Function Types as Return Types

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
//the following function returns a function of type (Int) -> Int
//the above functions match this function type
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!

//:## Nested Functions

func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
