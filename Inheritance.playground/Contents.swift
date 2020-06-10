import UIKit

//:# Inheritance

/*:
 A class can inherit from another class. The subclass is the class that inheriting from another
 also known as a superclass.
 
 The subclass has access and can override the superclass properties, methods, subscripts, giving
 them new behavior.
 
 Classes can also add property observers to inherited properties in order to be notified of value changes.
 
 Property observers can be added to any property ( stored or computed)
 */

//:## Defining a Base Class

/*:
 Any class that does not inherit from another class is known as a base class.
 
 */
// Base class Vehicle
// Method makeNoise
// Stored property currentSpeed
// read-only computed property description uses currentSpeed property value
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

// Create a new instance of Vehicle with initializer syntax
let someVehicle = Vehicle()

// Access someVehicle description property
print("Vehicle: \(someVehicle.description)")

//:## Subclassing

/*:
 The act of basing a new class on an existing class
 
 */
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour

//Subclasses can themselves be subclassed. The next example creates a subclass of
//Bicycle for a two-seater bicycle known as a “tandem”:
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour

//:## Overriding

/*:
 A subclass can provide its own custom implementation of a super class isntance method, type
 method, instance property, type property, or subscript.
 
Need to use the word override keyword. The keyword propts the compiler to check that the superclass or one
 its parent has a declaration that matches the one you provide for the override
 */

//:### Accessing Superclass Methods, Properties, and Subscripts

/*:
 It is sometimes useful to use the superclass implementation as part of your override
 
 Need to use super prefix:
 
 Overridden method: super.someMethod()
 
 Overridden property super.someProperty
 
 Overridden subscript: super[someIndex]
 */

//:### Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
// Prints "Choo Choo"

//:### Overriding Properties

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

/*:
 You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You cannot, however, present an inherited read-write property as a read-only property.
 
 NOTE

 If you provide a setter as part of a property override, you must also provide a getter for that override. If you don’t want to modify the inherited property’s value within the overriding getter, you can simply pass through the inherited value by returning super.someProperty from the getter, where someProperty is the name of the property you are overriding.
 */

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

//:### Overriding Property Observers


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}


let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4


//:## Preventing Overrides

//use the modifier final before the method, property, or  subscript
//introducer keyword
//(such as final var, final func, final class func, and final subscript).
//or (final class) for an entire class
