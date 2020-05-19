import UIKit

//:# 😎Closures

/*:
 Closures are self-contained blocks of code that can be shared through out your code
 and have access to the variables  from its parent closure
 
 Global functions are closures that have a name and do not capture any values.
 Nested functions are closures that have a name and can capture values from their enclosing function.
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 */

//:## 😎Closure Expressions

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//closure - global closure (a typical function)
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reverseNames = names.sorted(by: backward(_:_:))

//:### 😎Closure Expression Syntax
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


//:### 😎Inferring Type From Context
var reversedNames2 = names.sorted(by: { s1, s2 in return s1 > s2 } )

//:### Implicit Returns from Single-Expression Closures
//single-expression closures can omit the return keyword
var reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//:### 😎Shorthand Argument Names

//swift automatically provides shorthand argument names to inline closures
reversedNames = names.sorted(by: { $0 > $1 } )

//:### 😎Operator Methods

reversedNames = names.sorted(by: >)

//:## 😎Trailing Closures

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

//:## 😎Capturing Values and Making Them Persistent (nested closures)

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
 A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function. (lexical scope)
 
 It does this by capturing a reference to runningTotal and amount from the surrounding function and using them within its own function body. Capturing by reference ensures that runningTotal and amount do not disappear when the call to makeIncrementer ends, and also ensures that runningTotal is available the next time the incrementer function is called.
*/
let incrementByTwo = makeIncrementer(forIncrement: 2)
print(incrementByTwo())
print(incrementByTwo())

//:## 😎Closures Are Reference Types

let alsoIncrementByTen = incrementByTwo
alsoIncrementByTen()
// returns a value of 6

incrementByTwo()
// returns a value of 8


//:## 😎Escaping Closures

/*:
 A closure is said to escape a function when the closure is passed as an argument
 to the function, but is called after the function returns. Need to write @escaping before
 the prameter type
 
 used in comletion handler
 
 its executed in the future, outliving the function that it was created in
 
 used in  asynchronous programming
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
//escaping closure needs to refer to self explicitly

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

//:## 😎Autoclosures

/*:
 An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.
 */

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

//You get the same behavior of delayed evaluation when you pass a closure as an argument to a function.

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

//an autoclosure by marking its parameter’s type with the @autoclosure attribute. - argument is automatically converted to a closure

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"

//If you want an autoclosure that is allowed to escape, use both the @autoclosure and @escaping attributes.
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"


//:# 😎Extra

//:### 😎Retrun Closure Indirectly

var multiplyWithClosures = { (number1: Int, number2: Int) in
    return number1 * number2
}

func returnTheClosure() -> (Int,Int) -> Int {
    return multiplyWithClosures
}
//calling the above function will return the function signature and can't pass
//parameters until you assign it to another variable, then it sees the returned
//function that needs parameters
let myReturnedClosure = returnTheClosure()
myReturnedClosure(5,5)

//:### 😎Return Closure Directly

func returnMyClosureDirectly() -> (Int,Int) -> Int {
    return {(num1, num2) -> Int in
        //remember one expresion doen't need a return, its inferred (now arrow needed)
        //(no type needed)
        //swift automatically provides shorthand argument names to inline closures
        //(no parameter names needed)(no parenthesis needed)
        //see function below
        //swift automatically infers the type of the incoming arguments
        //swift automatically infers the return type
        return num1 * num2
    }
}

//
//: Or
/*:
 func returnMyClosureDirectly() -> (Int,Int) -> Int {
 return {$0 * $1}
 }
 */

