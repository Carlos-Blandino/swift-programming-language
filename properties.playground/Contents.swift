import UIKit

//:# Properties

/*:
 classes have stored properties, and computed properties
 structs have stored properties and computerd properties
 enumerators have computed properties
 
 computed properties calculate
 
 property observers monitor changes in a property's value, and you make custom actions to respond
 property observers can be added to the stored property
 
 property wrapper for reusing code in the getter and setter of multiple properties
 
 */

//:## Stored Properties
/*:
 It is a constant or variable that is stored as part of an instance of a particular class or struct
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

//:### Stored Properties of Constant Structure Instances

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
//    ---> rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
// don't forget struct are a value type

//:### Lazy Stored Properties

/*:
 The initial  value is not calculated until the first time it is used
 Only use with var
 
 */
