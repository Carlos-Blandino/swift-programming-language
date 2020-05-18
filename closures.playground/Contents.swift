import UIKit

//:# Closures

/*:
 Closures are self-contained blocks of code that can be shared through out your code
 and have access to the variables  from its parent closure
 
 Global functions are closures that have a name and do not capture any values.
 Nested functions are closures that have a name and can capture values from their enclosing function.
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 */

//:## Closure Expressions

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reverseNames = names.sorted(by: backward(_:_:))

//:### Closure Expression Syntax
//parameters can not have default values
//variadic, inout, and tuples are okay
/*:
 { (parameters) -> return type in
     statements
 }
 */
//inline closure expression
reverseNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//:### Inferring Type From Context
var reversedNames2 = names.sorted(by: { s1, s2 in return s1 > s2 } )

//:### Implicit Returns from Single-Expression Closures
//single-expression closures can omit the return keyword
var reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//:### Shorthand Argument Names

//swift automatically provides shorthand argument names to inline closures
reversedNames = names.sorted(by: { $0 > $1 } )

//:### Operator Methods

reversedNames = names.sorted(by: >)

//:## Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
reversedNames = names.sorted() { $0 > $1 }
//if a closure expression is provided as the only argument and you use it as trailing closure then you don't need the parentheses

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

//:## Capturing Values and Making Them Persistent

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        //this is the actual function that will run when the parent
        //function has been passed with its initial parameter value
        //and invoked by its new identifier
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
/*:
 A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.
 
 It does this by capturing a reference to runningTotal and amount from the surrounding function and using them within its own function body. Capturing by reference ensures that runningTotal and amount do not disappear when the call to makeIncrementer ends, and also ensures that runningTotal is available the next time the incrementer function is called.
*/
let incrementByTwo = makeIncrementer(forIncrement: 2)
print(incrementByTwo())
print(incrementByTwo())

//:## Closures Are Reference Types

let alsoIncrementByTen = incrementByTwo
alsoIncrementByTen()
// returns a value of 6

incrementByTwo()
// returns a value of 8


