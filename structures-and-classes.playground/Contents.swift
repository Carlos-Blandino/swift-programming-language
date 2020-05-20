import UIKit

//:# 😎Structures and Classes

//:## Comparing Structures and Classes

/*:
 Both can:
 1. Have properties
 2. Have Methods
 3. Have subscripts to provide access to their values using subscript syntax
 4. Have initializers
 5. Be extended
 6. Conform to protocols
 
 but
 
 Classes can also:
 1. Inheritance enables one class to inherit the characteristics of another.
 2. Type casting enables you to check and interpret the type of a class instance at runtime.
 3. Deinitializers enable an instance of a class to free up any resources it has assigned.
 4. Reference counting allows more than one reference to a class instance.
 
 */

//:### 😎Choosing Between Structures and Classes

/*:
 Use structures by default.

 Use classes when you need Objective-C interoperability.

 Use classes when you need to control the identity of the data you're modeling.

 Use structures along with protocols to adopt behavior by sharing implementations.
 */

//:### 😎Definition Syntax

struct Resolution {
    var width: Int
    var height: Int
}

class VideoMode {
    var resolution = Resolution(width: 10, height: 10)
    var interlaced = false
    var frameRate = 0.0
    var name: String? //automatically assigned nil
}

//:### 😎Structure and Class Instances

//Structures and classes both use initializer syntax for new instances
let someResolution = Resolution(width: 22, height: 22)
let someVideoMode = VideoMode()

//:### 😎Accessing Properties
//use the member access operator ( the dot syntax)
print("The width of someResolution is \(someResolution.width)")

//drill down into subproperties
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//assign a new value
someVideoMode.resolution.width = 1280

//:### 😎Memberwise Initializers for Structure Types

let vga = Resolution(width: 640, height: 480)

//Unlike structures, class instances don’t receive a default memberwise initializer
//you must create init in a class with properties that don't have
//default values

//:## 😎Structures and Enumerations Are Value Types

//value types pass a copy of their data
//reference type uses the memory address of the data to pass around
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// Prints "The current direction is north"
// Prints "The remembered direction is west"

//:## 😎Classes Are Refernce Types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

//:### 😎Indentity Operators

/*:
 It can sometimes be useful to find out whether two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:

 Identical to (===)
 Not identical to (!==)
 */
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
