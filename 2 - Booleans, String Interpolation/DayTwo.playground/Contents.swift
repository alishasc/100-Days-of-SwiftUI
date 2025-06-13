import Cocoa

// how to store booleans
let goodDogs = true

let isMultiple = 150.isMultiple(of: 3)  // true

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)  // true
isAuthenticated = !isAuthenticated
print(isAuthenticated)  // now false

var gameOver = false
print(gameOver)  // false
gameOver.toggle()
print(gameOver)  // true


// how to join strings together
let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting)  // Hello, World!

var luggageCode = "1" + "2" + "3" + "4" + "5"
luggageCode += "6"
print(luggageCode)  // 123456

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

print("5 x 5 is \(5 * 5)")

