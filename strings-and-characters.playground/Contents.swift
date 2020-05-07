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

var myGemanPhrase = "Ich gehe nach hause"
//look at the index output from the following
//see why we can't use the typical Integer index
print(myGemanPhrase.startIndex)

print(myGemanPhrase.endIndex)

print(myGemanPhrase.index(before: myGemanPhrase.endIndex))

print(myGemanPhrase.index(after: myGemanPhrase.startIndex))

//lets see what those values are

print(myGemanPhrase[myGemanPhrase.startIndex])

//print(myGemanPhrase[myGemanPhrase.endIndex]) out of bounds error

print(myGemanPhrase[myGemanPhrase.index(before: myGemanPhrase.endIndex)])

print(myGemanPhrase[myGemanPhrase.index(after: myGemanPhrase.startIndex)])

let specificIndex = myGemanPhrase.index(myGemanPhrase.startIndex, offsetBy: 5)
var newString = "hellos"
print(newString[specificIndex])
//the specificIndex maps out to the 5 location on both but there is a difference
//"e" in my word is missing the combining acute accent
print(myWord[specificIndex])

let specificIndex2 = myWord.index(myWord.startIndex, offsetBy: 5)
print(myWord[specificIndex2])

//insert at the beginning and make the word read in reverse
var reverseResult: String = ""
for index in myWord.indices {
    reverseResult.insert(myWord[index], at: reverseResult.index(reverseResult.startIndex, offsetBy: 0))
}
print(reverseResult, " is nice")
reverseResult = " good night"

print(myWord)
myWord.insert(contentsOf: reverseResult, at: myWord.endIndex)

print(myWord)

reverseResult.append(" and good morning")
print(reverseResult)

//remove at
myWord.remove(at: myWord.index(myWord.startIndex, offsetBy: 5))

print(myWord)

//create a index range
let range = myWord.startIndex..<myWord.index(myWord.startIndex, offsetBy: 6)

//use .removeSubrange() method
myWord.removeSubrange(range)

print(myWord)

//:## Substrings

//substrings obtained by subscripting, or method like prefix, need to be cast to a
//String for long term storage and are for temporary use
print(myWord[range])

let strMessage = "The night is young"
let index = strMessage.firstIndex(of: " ") ?? strMessage.endIndex
let firstWordInStr = strMessage[..<index]
print(firstWordInStr)
//or
let strSlice = strMessage[strMessage.startIndex..<strMessage.index(strMessage.startIndex, offsetBy: 4)]
print(strSlice)

//converting the substring to string
let permanentFirstWord = String(firstWordInStr)

//substring is a range of the base string and reuses the memrory space of the parent


//:## Comparing Strings

//:### String and Character Equality

//use == and !=
let compareStr1 = "Hello everyone"
let compareStr2 = "Hello everyone"

//need to have the same linguistic meaning and appearance
if compareStr1 == compareStr2 {
    print("These are equal strings")
    
}

//:## Prefix and Suffix Equality

//use the hasPrefix() and hasSuffix() methods to check if string contains passed in
//string argument

let phoneNum = ["909-355-4353","909-399-5555","909-888-5555"]

var countResult = 0
var countResult2 = 0
for num in phoneNum{
    if num.hasPrefix("909") {
        countResult += 1
    }
}
print("There are \(countResult) 909 numbers")
for num in phoneNum{
    if num.hasSuffix("5555") {
        countResult2 += 1
    }
}
print("There are \(countResult2) 5555 numbers")
