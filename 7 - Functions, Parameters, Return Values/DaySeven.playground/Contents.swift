import Cocoa

// functions
func showWelcome() {
    print("Welcome to my app!")
}
showWelcome()

//func printTimesTables(number: Int, end: Int) {
//    for i in 1...end {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//printTimesTables(number: 5, end: 20)

func buyCar(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        print("no")
    }
}
buyCar(price: 10_000)  // This seems cheap.

print()


// return values from functions
func rollDice() -> Int {
    Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func checkStrings(firstWord: String, secondWord: String) -> Bool {
    let firstWord = firstWord.sorted()
    let secondWord = secondWord.sorted()

    return firstWord == secondWord
    // OR
//    return firstWord.sorted() == secondWord.sorted()
}
print(checkStrings(firstWord: "abc", secondWord: "cab"))  // true


func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)


func addInt(int1: Int, int2: Int) -> Int {
    int1 + int2
}
print(addInt(int1: 3, int2: 4))

print()


// return multiple values from function
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
    // OR
//    ("Taylor", "Swift")
}

let (firstName, _) = getUser()
print("Name: \(firstName)")
// OR
//let user = getUser()
//print("Name: \(user.firstName) \(user.lastName)")


func getUserAgain() -> (String, String) {
    ("Taylor", "Swift")
}

let user2 = getUserAgain()
print("Name: \(user2.0) \(user2.1)")

print()


// customize parameter labels
func rollDice(sides: Int, count: Int) -> [Int] {
    // starts with empty array
    var rolls = [Int]()
    
    // roll as many dice as specified in count
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        // add each result to the array
        rolls.append(roll)
    }
    
    // return the array
    return rolls
}
print(rollDice(sides: 6, count: 4))


let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))  // true


func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
print(isUppercase(string: string))  // true

// SAME AS!
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string2 = "HELLO, WORLD"
print(isUppercase(string2))  // true


func printTimesTables(for number: Int) {
    for i in 1...12  {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)

