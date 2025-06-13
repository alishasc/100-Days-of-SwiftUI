import Cocoa

// how to store strings
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let result = "🍕 Pizza! 🍕"
print(result)

let quote = "Then he tapped a sign saying \"Believe\" and walked away"
print(quote)

let character = "Daphne"
let nameLength = character.count
print(nameLength)  // 6
print(character.uppercased())  // DAPHNE

let movie = """
A day in
the life of an
Apple engineer
"""
print(movie)
print(movie.hasPrefix("A day"))  // true


// how to store whole numbers
let million = 100_000_000
print(million)

let score = 10
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter += 5
print(counter)
counter -= 10
print(counter)
counter *= 2
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
// same as...
print(120.isMultiple(of: 3))


// how to store decimal numbers
let decimal = 0.1 + 0.2
print(decimal)  // 0.30000000000000004

let a = 1
let b = 2.0
let c = a + Int(b)
// let c = Double(a) = b
print(c)  // 3

var rating = 5.0
rating *= 2
print(rating)  // 10.0
