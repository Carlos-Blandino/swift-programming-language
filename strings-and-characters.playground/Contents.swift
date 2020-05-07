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

//access characters in a string
for character in myMutableString {
    print(character, terminator:".")
}

//string construction from an array of characters
var bestBootCampCharacters: [Character] = ["L","a","m","b","d","a"]
var schoolString = String(bestBootCampCharacters)

print(schoolString)

//:## Concatenating Strings and Characters
var string2 = " School"

schoolString += string2

let exclamation: Character = "!"

print(schoolString + " is hard")

schoolString += " is hard"

schoolString.append(exclamation)

print(schoolString)

//to properly concatinate these you need an extra space on last line
//that way there will be a line break in code
var multiline1 = """
Monday
Tuesday

"""
var multiline2 = """
Wednesday
Thursday
Friday
"""

let resultingStr = multiline1 + multiline2

print(resultingStr)

//:## String Interpolation

let pi = 3.1415

print("\(pi) does not change")

//use extended string delimiters to show the value within the delimiters
print(#"\(pi) does not change"#)

//:## Unicode

//:### Unicode Scalar Values

//Swifts native String type is built from Unicode scalar values and
//are Unicode-compliant

//:### Extended Grapheme Clusters

//this set the stage for why we index a string with String.index type rather than
//an Integer

//each Character type represents a single "extended grapheme cluster" which in certain
//instances the characters can be combined, forming a single human-readable character
//and count as one - many combined memory spaces will be represented by the String.index representaion

//:## Counting Characters

var resultCount = mySampleDelimitedStr.count
print(resultCount)

print(schoolString.count)
schoolString += japaneseYen
print(schoolString.count)

var myWord = "resume"
//every character is a single "extended grapheme cluster"
//the last letter "e" will be combined with another single "extended grapheme cluster"
//creating a cluster of two scalars
myWord += "\u{301}"
print(myWord)
//string's character count not affected in this instance
print(myWord.count)

//:## Accessing and Modifying a String

//:### String Indices

//because of the possibility of combined cluster(memory requirements can differ), strings are
//not indexed by an integer but rather the type is a String.index
//for each position of each character in the string

//you must iterate over each Unicode scalar from the .startIndex or .endIndex of the
//string,

//startIndex and endIndex are equal when the string is empty



