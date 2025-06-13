import Cocoa

// if conditions
let score = 85
if score > 80 {
    print("Great job!")
}


let speed = 88
let percentage = 85

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

// doesn't print as false
if percentage < 85 {
    print("Sorry, you failed the test.")
}


let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

// this one is true!
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


var numbers = [1, 2, 3]
// add a fourth number
numbers.append(4)

// if there's over 3 items in the array...
if numbers.count > 3 {
    // remove the oldest/first number
    numbers.remove(at: 0)
}
print(numbers)  // [2, 3, 4]


let country = "Canada"
if country == "Australia" {
    print("G'day!")
}
// false so doesn't print

let name = "Taylor Swift"
if name != "Anonymous" {
    print("Welcome, \(name)")
}
// true so does print!


var username = "taylorswift13"
// if username is an empty string...

//if username == "" {
//    // make username equal to "Anonymous" as default
//    username = "Anonymous"
//}

//if username.count == 0 {
//    username = "Anonymous"
//}

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")
// Welcome, taylorswift13


enum Sizes: Comparable {
    case small, medium, large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)  // true


// if else statements
let age = 16
if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}


let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if b is true")
} else {
    print("Code to run if both a and b are false")
}


let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day!")
}


let userAge = 14
let hasParentalConsent = true
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


// switch statement
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}
// Who are you?


let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


// ternary conditional operator
let age2 = 18
let canVote = age2 >= 18 ? "Yes" : "No"
print(canVote)  // yes

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")
// It's after noon

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)
// 3 people


enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

