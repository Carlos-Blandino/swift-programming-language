import UIKit

//:# Subscripts

/*:
 Classes, structures  and enumerations can define a subscript = shortcuts for
 accessing the member elements of a collection, list , sequence
 
 You can set or retrieve values
 You can define multiple subscripts for a single type
 You can define subscripts with multiple input parameters
 
 */

//:## Subscript Syntax

/*:
 This syntax can only be used within a type
 subscript(index: Int) -> Int {
     get {
         // Return an appropriate subscript value here.
     }
     set(newValue) {
         // Perform a suitable setting action here.
     }
 }
 
 The type of newValue is the same as the return value of the subscript.
 A default parameter called newValue is provided to your setter if you do not provide one yourself.
 */

// This example uses a simplified declaration read-only and does not use a get keyword
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"

/*:
 You can query the threeTimesTable instance by calling its subscript, as shown in the call to threeTimesTable[6]. This requests the sixth entry in the three-times-table, which returns a value of 18, or 3 times 6.
 */

//:##  Subscript Usage

/*:
 Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence.
 
 Note: Swift’s Dictionary type implements its key-value subscripting as a subscript that takes and returns an optional type. The Dictionary type uses an optional subscript type to model the fact that not every key will have a value, and to give a way to delete a value for a key by assigning a nil value for that key.
 */
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

//:## Subscript Options


/*:
 Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return a value of any type.
 
 Like functions, subscripts can take a varying number of parameters and provide default values for their parameters, as discussed in Variadic Parameters and Default Parameter Values. However, unlike functions, subscripts can’t use in-out parameters.
 
 A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.
 */
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

//:## Type Subscripts

/*:
 You can also define subscripts that are called on the type itself. This kind of subscript is called a type subscript. You indicate a type subscript by writing the static keyword before the subscript keyword.
 */

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(Planet.init(rawValue: 2))
print(mars)
