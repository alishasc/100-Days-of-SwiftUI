import Cocoa

// arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])  // John
print(numbers[1])  // 8
print(temperatures[2])  // 26.4

beatles.append("Allen")
beatles.append("Novall")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])  // 80

//var albums = [String]()
//albums.append("Folklore")
// OR...
var albums = ["Folklore"]
albums.append("Fearless")
albums.append("Red")
print(albums[1])  // Fearless
print(albums.count)  // 3

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)  // 4
characters.remove(at: 2)
print(characters.count)  // 3
characters.removeAll()
print(characters.count)  // 0

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))  // false

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())  // ["Budapest", "London", "Rome", "Tokyo"]

let numbersSorted = [5, 70, 100, 34, 26, 85]
print(numbersSorted.sorted())  // [5, 26, 34, 70, 85, 100]

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

print("hello".sorted())


// dictionaries
let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
print(heights["Yao Ming", default: 0])

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Batman"] = "Penguin"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies)  // ["Batman": "Penguin", "Superman": "Lex Luthor"]
print(archEnemies.count)  // 2

archEnemies.removeAll()
print(archEnemies)  // [:]


// sets
var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")
print(people)


// enums
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// or
//enum Weekday {
//    case monday, tuesday, wednesday, thursday, friday
//}

var day = Weekday.monday
print(day)  // monday
day = Weekday.friday
print(day)  // friday
day = .wednesday
print(day)  // wednesday

print()

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]
print(dickens)  // Unknown
//print(books["Austen"])  // Optional("Pride and Prejudice")

print()

var cats = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

print()

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

print()

//var hours = 0
//var goal = 10
//repeat {
//    hours += 1
//    if hours > 4 {
//        goal -= 1
//        continue
//    }
//    print("I've studied for \(hours) hours")
//} while hours < goal
            
            
let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
var position = 0
while position <= 7 {
    let value = fibonacci[position]
    position += 1
    if value < 2 {
        continue
    }
    print("Fibonacci number \(position) is \(value)")
}

print()

for i in 1...100 {
    if 100.isMultiple(of: i) {
        print("100 divides evenly into \(i)")
    } else {
        continue
    }
}
