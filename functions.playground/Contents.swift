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

