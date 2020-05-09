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

//:## Sets
/*:
 A set stores distinct values of the same type in a collection with no defined order, so if you need to appear once and order is not important use sets
 */
 
//:### Creating and Initializing an Empty Set
var cyclingGear = Set<String>()
//:### Creating a Set with an Array Literal
var favoriteColors: Set = ["Red","Green"]
//or use the shorter form
var myHatedColors: Set<String> = ["Purple","Pink"]

//:### Accessing and Modifying a Set
cyclingGear.insert("shorts")
print(cyclingGear)

//empty out the set
cyclingGear = []
print(cyclingGear)

//check to see how many items in a set
print("I have \(favoriteColors.count) favorite colors")

print("My favorite colors are not empty because .isEmpty property returned \(favoriteColors.isEmpty)")

print("I'm going to insert \"\(favoriteColors.insert("Blue"))\" in my favorite colors")
print(favoriteColors)
//use remove() method to permanently remove item
if let color = favoriteColors.remove("Blue") {
    
    print("I'm going to remove \"\(color)\" in my favorite colors")
}
//check if something in particular is in the set
if favoriteColors.contains("Red") {
    print("That is the color most used in commercials")
}

//:### Iterating Over a Set
favoriteColors.insert("Blue")
favoriteColors.insert("Green")
favoriteColors.insert("Orange")
//this set is unordered
for color in favoriteColors {
    print(color)
}

//use sorted() method to sort over a set in a specific order

for color in favoriteColors.sorted() {
    print(color)
}

var favoriteNumbers: Set = [100, 150, 205, 10]

for num in favoriteNumbers.sorted(){
    print(num)
}

//:### Fundamental Set Operations

let myColors:Set = ["Red","Green","Blue","Orange"]
let yourColors:Set = ["Green","Orange","Purple","Yellow"]
print("My colors are: \n", myColors)
print("Your colors are: \n", yourColors)
print("My colors with your colors are: \n", myColors.union(yourColors).sorted())
print("My colors without your colors are: \n", myColors.subtracting(yourColors))
print("Colors we have in common are: \n", myColors.intersection(yourColors))
print("The colors that make us different are: \n", myColors.symmetricDifference(yourColors))

let herColors: Set = ["Red","Green","Blue","Orange"]
let hisColors: Set = ["Gold","Grey"]

if herColors == myColors {
    print("You like the same colors")
    
}
print("Do I have any colors in common with his colors? ", hisColors.isDisjoint(with: myColors))

let webColors: Set = myColors.union(yourColors)

print("Are my colors a subset of web colors? ", myColors.isSubset(of: webColors))

print("Are web colors a superset of your colors? ", webColors.isSuperset(of: yourColors))

//:## Dictionaries
//set of key/value pairs, key can not repeat "

//:### Creating an Empty Dictionary
var myInfo = [String:String]()
myInfo["name"] = "Carlos"
myInfo["lastName"] = "Blandino"

//values may or may not be there (optional value)
//need to unwrap, used nil coalescing in this example
print("My first name is \(myInfo["name"] ?? "no name")")

//empty out myInfo
myInfo = [:]

//:### Creating a Dictionary with a Dictionary Literal


//use can also use type inference
var firedEmployees = ["CEO": ["firstName": "Carlos", "lastName": "Blandino","ssn":"334-53-3532"], "Director Of Sales": ["firstName": "Mike", "lastName": "Blandino","ssn":"333-23-3522"]]

print("The company has \(firedEmployees.count) fired employees")

if firedEmployees.isEmpty {
    print("The fire employee list is empty")
    
} else {
    print("The list is not empty")
}
firedEmployees["Vice President"] = ["firstName": "Jake", "lastName": "Sullivan","ssn":"555-23-3522"]
print("The company has \(firedEmployees.count) fired employees")

//you can use the subscript to change current info
//or use updateValue() method to set or update

if let oldValue = firedEmployees.updateValue(["firstName": "Nick","lastName": "Malone", "ssn": "333-44-6677"], forKey: "CEO"){
    print(oldValue)
    print(firedEmployees)
} else {
    print("no employee")
}

//you can assign a nil to a value of a key or use .removeValue() method
//remember a key may or may not have a value, need to unwrap

if let removedValue = firedEmployees.removeValue(forKey: "Vice President") {
    print("\(removedValue) was removed")
} else {
    print("That position does not have a value")
}

//:### Iterating Over a Dictionary

for (key,value) in firedEmployees {
    print("\(key)  \(value)")
}

for key in firedEmployees.keys {
    print("key is ", key)
}
for value in firedEmployees.values {
    print("value is ", value)
}

//deconstruct key or values into an array

let positionArray = [String](firedEmployees.keys)
print(positionArray)

let employeeArray = [[String:String]](firedEmployees.values)
print(employeeArray)
