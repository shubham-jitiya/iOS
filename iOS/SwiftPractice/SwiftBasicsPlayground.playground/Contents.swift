import Foundation

//1. Print Hello World in swift Play Ground
print("Hello, world")

//2. Create variables of different types and print it
let marks = 55, studentName = "Shubham Jitiya", total: Float = 75.123456, grandTotal = 574.12345678912345, isAdmin = true
let uInt8Max = UInt8.max, uInt32Max = UInt32.max, uInt64Max = UInt64.max
print("Type Double: \(grandTotal)")
print("Type Boolean: \(isAdmin)")
print("Type String: \(studentName)")
print("\nName: \(studentName) | Marks: \(marks) | Total: \(total) | Grand Total: \(grandTotal)")
print("\nuInt8Max: \(uInt8Max) of type: \(type(of: uInt8Max))")
print("uInt32Max: \(uInt32Max) of type: \(type(of: uInt32Max))")
print("uInt64Max: \(uInt64Max) of type: \(type(of: uInt64Max))")

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in  octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
let hexaDecimal = 0x1p1, exponentDecimal = 1e1
print("\n---- Number literals ----")
print("Decimal number: \(decimalInteger)")
print("Binary number: \(binaryInteger)")
print("Octal number: \(octalInteger)")
print("Hexadecimal number: \(hexadecimalInteger)")
print("Hexa - \(hexaDecimal) | Exponent \(exponentDecimal)")

//3. Create one integer and perform addition with 5 to that and print values
let grades = 50
let sum = grades + 5
print("\nSummation with integer = \(sum)")

//Calculate interest
let principalAmount = 1001
let rateOfInterest = 15
let numberOfYears = 8
let simpleInterest = Double(principalAmount * rateOfInterest * numberOfYears) / 100
print("\nInterest = \(simpleInterest)")

/*
 Topic: Operators
 Create example for String concate using operators
*/
let firstName = "Jitiya", lastName = "Shubham"
let fullName = firstName + " " + lastName
print("\nConcate string: \(fullName)")

//Create one example for show usage of operator's addition, multiplication, division for integers and floats
let valueFirst = 5, valueSecond: Float = 10.5
let addition = Float(valueFirst) + valueSecond
let multiplication = Float(valueFirst) * valueSecond
let division = valueSecond / Float(valueFirst)
print("Addition = \(addition)")
print("Multiplication = \(multiplication)")
print("Division = \(division)")

//What is ternary operator and show example of usage
let user = isAdmin ? "Admin logged in" : "Not admin"
print("Ternary operator: \(user)")
