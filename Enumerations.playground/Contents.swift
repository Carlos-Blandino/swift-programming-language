import UIKit
import Foundation
//:# Enumerations

//:## 😎Syntax
enum PrimaryColor {
    //enumeration cases
    case red
    case blue
    case yellow
}
//multiple cases can appear on a single line
//give enums a singular name
enum DayOfTheWeek {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

//use a dot syntax to access the enum object's enumerated case

var myColor: PrimaryColor

myColor = .blue

//:## 😎Matching Enumeration Values with a Switch Statement
//the switch statement must be exhaustive, includes all possible
//enum cases, or include a default:
switch myColor {
case .blue:
    print("blue")
case .yellow:
    print("yellow")
case .red:
    print("red")
}


//:## 😎Iterating over Enumeration Cases

//needs to comform to CaseIterable protocols

enum Sodas: CaseIterable {
    case Coke, Sprite, MtDew, Up, CactusCooler, SevenUp
}

let allSodas = Sodas.allCases.count

print(allSodas)

for soda in Sodas.allCases {
    print(soda, terminator: ", ")
}

//:## 😎Associated Values
//You can define Swift enumerations to store associated values of any given type

enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

//upc has an associated value of type (Int,Int,Int,Int) , you associate the values later
//or an associated value of type String

var productBarcode = Barcode.upc(8, 35595, 38228, 3)
//productBarcode can only hold upc or qrCode, one at a time for a given variable

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let productBarcode,let check):
    print("UPC: \(numberSystem), \(manufacturer), \(productBarcode), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

//:## 😎Raw Values

//Each raw value must be unique within its enumeration declaration.

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//:### 😎Implicitly Asigned Raw Values

enum HardestSubstances: Int {
    case Diamond = 1, Corundum, Topaz, Quartz, Orthoclase, Apatite, Flourite, Calcite, Gypsum, Talc
}
//Corundum is 2 etc...
let topazHadnessScale = HardestSubstances.Topaz.rawValue

print("Topaz is number \(topazHadnessScale) on a scale from 1 to 10 being the softest substance")

//:### 😎Initializing from a Raw Value
//returns an optional
let possibleSubstance = HardestSubstances(rawValue: 5)

print(possibleSubstance)

let positionToFind = 11
if let someSubstance = HardestSubstances(rawValue: positionToFind) {
    switch someSubstance {
    case .Diamond:
        print("Very expensive and good for cutting")
    default:
        print("hard to mine")
    }
} else {
    print("No substance is listed at position \(positionToFind)")
}

//:## 😎Recursive Enumeration

/*:
 A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.
 */
//For example, here is an enumeration that stores simple arithmetic expressions:

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//You can also write indirect before the beginning of the enumeration to enable indirection for all of the enumeration’s cases that have an associated value:

/*:
 indirect enum ArithmeticExpression {
 case number(Int)
 case addition(ArithmeticExpression, ArithmeticExpression)
 case multiplication(ArithmeticExpression, ArithmeticExpression)
 }
 */

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//A recursive function is a straightforward way to work with data that has a recursive structure. For example, here’s a function that evaluates an arithmetic expression:

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
