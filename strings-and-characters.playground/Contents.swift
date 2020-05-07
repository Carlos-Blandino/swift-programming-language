import UIKit

//:# Strings and Characters

//:## String Literals

let myString = "Some nice message"

print(myString)

//:### Multiline String Literals
// added line feed before and after the
// added space infront of string
let specialQuote = """

If you need a string that spans several  line,
use a multiline string literal --
    "a sequence of character surrounded by three
quotation marks."

"""
print(specialQuote)

//:### Special Characters in String Literals

let japaneseYen = "\u{00A5}" //Unicode scalar U+00A5
let myFavoriteEmoji = "✅"

print(myFavoriteEmoji + " " + japaneseYen)

//:### Extended String Delimiters

//to revoke the affect of special characters in a string
//because you might want to print them then use # at the ends
//and insert the # within where you need the use of the affect

var mySampleDelimitedStr = #"""
For example, if your string is "Line 1\nLine 2" and you
want to break
the line, you can use #"Line 1\#n Line 2"# instead. Similarly,
"""#

print(mySampleDelimitedStr)

//:## Initializing an Empty String

var myEmptyStr = ""
var myOtherStrLiteral = String() //used initializer syntax

//checking for empty string use .isEmpty property
if myEmptyStr.isEmpty {
    print("Empty")
}

//:## String Mutability

//use keyword var for mutability
var myMutableString = "Carlos"
myMutableString += "Blandino"

print(myMutableString)
//use keyword let for constant (immutable)
let dodgersHomeCity = "Los Angeles"

//:## Strings Are Value Types
//modifying copies will not affect the original variable's value

//:## Working with Characters




