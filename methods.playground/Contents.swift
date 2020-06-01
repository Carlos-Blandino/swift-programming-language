import UIKit

//:# Methods

/*:
 Methods are functions that are associated with a particular type
 */

//:## Instance Methods

/*:
 Instance methods are functions that belong to instances of a particular class, struct, or enum

 An instance method has implicit access to all other instance methods and properties of that type
 
 You have to instantiate the object whose method you want to use
 */

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

//:### The Self Property

/*:
 Every instance of a type has an implicit property called self, which refers to itself when it becomes an
 instance and is typically used for clarity between parameter names and property names
 */

//the increment method from above could have been written like this:
/*:
 func increment() {
 self.count += 1
 }
 */

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"

/*:
 Without the self prefix, Swift would assume that both uses of x referred to the method parameter called x
 */

//:### Modifying Value Types from Within Instance Methods

/*:
 Structures and enumerations are value types. By default, the properties of a value type can't
 be modified from within its instance methods
 
 Override the default by using the mutating behavior for that method
 */
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"

let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error

var myPoint1 = Point1()
myPoint1.moveBy(x: 3, y: 3)
print(myPoint1)

//:### Assigning to self Within a Mutating Method
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

var myPoint = Point2()

myPoint.moveBy(x: 3, y: 3)

print(myPoint.self)
myPoint.moveBy(x: 1, y: 1)
print(myPoint)
//This version is doing the same as the earlier version, creating
//a new structure whose x and y values are set to the target location

//Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration:
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off


//:## Type Methods
/*:
 Instance methods are methods that you call on an instance of a particular type.
 
 You can also define methods that are called on the type itself. These kinds of methods
 are called type methods
 
 You indicate type methods by writing the static keyword before the method’s func keyword
 
 Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.
 */
class SomeClass {
    static func someTypeMethod() {
        // type method implementation goes here
    }
    // this function you can override
    class func someOtherTypeMethod() {
        // implementation goes here
    }
}
SomeClass.someTypeMethod()

SomeClass.someOtherTypeMethod()

class SomeClass2: SomeClass {
//    override static func someTypeMethod(){
//        not possible to override
//    }
    override class func someOtherTypeMethod() {
        
    }
}



struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
/*:
     Because it’s not necessarily a mistake for code that calls the advance(to:) method to ignore the return value, this function is marked with the @discardableResult attribute
     */
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

/*:
 You can create an instance of the Player class for a new player, and see what happens when the player completes level one:
*/

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "highest unlocked level is now 2"

/*:
 
 If you create a second player, whom you try to move to a level that is not yet unlocked by any player in the game, the attempt to set the player’s current level fails:
*/

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// Prints "level 6 has not yet been unlocked"
