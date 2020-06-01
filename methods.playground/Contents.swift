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


