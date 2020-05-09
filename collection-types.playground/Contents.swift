import UIKit

//:# Collection Types

//:## Mutability of Collections

/*:
 It is good practice to create immutable collections in all cases wher the collection
 does not need to change. Doing so will enable the Swift compiler to optimize the
 performance*/

//assign an array to a var makes it mutable
//arrays type can not be changed once it is declared

//:## Arrays

//arrays store values of the same type in an ordered list, and values can repeat

//:### Array Type Shorthand Syntax

//write the type of array in 2 ways: Array<ElementType> or [ElementType]

var myNumbers = [Int]()//declaring an empty array of type Integer with shorthandform initializer
var myOtherNumbers = Array<Int>() //the other way array initializer

//:### Creating an Array with a Default Value

var myNumbersInitWithThree = Array(repeating: 4, count: 5)
for num in myNumbersInitWithThree {
    print("\(num) appears 5 time")
}

//:### Creating an Array by Adding Two Arrays Together

var myOtherArray = Array(repeating: 3, count: 2)

var myCombinedArray = myNumbersInitWithThree + myOtherArray

print(myCombinedArray)

//:### Creating an Array with an Array Literal

var thingsToDo = ["brush your teeth","eat lunch","water the lawn"]

var otherThings: [String] = ["car","clothes","food","work"]

//:### Accessing and Modifying an Array

//find the array length with .count property
print("Thins to do has \(thingsToDo.count) items")

//check if the array is empty with .isEmpty property
if thingsToDo.isEmpty {
    print("This list is empty")
} else {
    print("This list is not empty")
}

//add items to the end of an array
thingsToDo.append("go to the gym")
print(thingsToDo)

//or

thingsToDo += ["sleep in"] //as though you are adding another array
print(thingsToDo)

//use subscript syntax to access elements within the array and replace
print("\"\(thingsToDo[0])\" is the first element in the array")

//you can't add to a non existent index in the array

//use subscript syntax and a range to change values even if not a one for one exchange
print(thingsToDo)
thingsToDo[...2] = ["clean the toilet"]
print(thingsToDo)

//you can use .insert() method to insert elements within the array
thingsToDo.insert("first wash the sink", at: 0)
print(thingsToDo)

//you remove an element from an array with .remove() and returns the item
let removedItem = thingsToDo.remove(at: thingsToDo.count - 1)
print("removed \"\(removedItem)\" and now my list shows \(thingsToDo)")

//you can pop the last element with .removeLast() method as well as get a return
var theThingIdontLike = thingsToDo.removeLast()
print("I don't like to \(theThingIdontLike) so the list is now \(thingsToDo)")

//:### Iterating Over an Array

for activity in thingsToDo {
    print(activity)
}

//to access the index you need to use the .enumerated() method


var otherNumbers = Array(repeating: 0.0, count: 5)
for (index,num) in otherNumbers.enumerated() {
    print("\(num) appears \(index) time")
}

