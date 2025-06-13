import Cocoa

// closures
func greetUser() {
    print("Hi there!")
}
greetUser()  // Hi there!

var greetCopy = greetUser
greetCopy()  // Hi there!

// type annotation for greetCopy
var greetCopy2: () -> Void = greetUser

print()

let sayHello = {
    print("Hi again!")
}
sayHello()  // Hi again!

print()

let sayhelloAgain = { (name: String) -> String in
    return "Hi \(name)!"
}
print(sayhelloAgain("Taylor"))

print()

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

print()

//
//let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//
//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    
//    // if neither name is Suzanne
//    // does a normal alphabetical sort
//    return name1 < name2
//}
//
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

// ANOTHER WAY TO DO IT!
// combining both closure methods

//let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})
//
//print(captainFirstTeam2)



// trailing closures and shorthand syntax
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam  = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

print(captainFirstTeam)


let captainFirstTeam2  = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam2)

print()

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)
// ["Tiffany", "Tasha", "Suzanne", "Piper", "Gloria"]

print()

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)
// ["Tiffany", "Tasha"]

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
// ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"]

print()


// accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 5) {
    Int.random(in: 1...20)
}
print(rolls)
// [14, 18, 17, 9, 6]

func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 5, using: generateNumber)
print(newRolls)
// [18, 12, 18, 15, 10]

print()


// a function that accepts three function parameters
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


print()


var goOnBike = {
    print("I'll take my bicycle.")
}
func race(using vehicleType: () -> Void) {
    print("Let's race!")
    vehicleType()
}
race(using: goOnBike)


print()


func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}


print()


func performCalculation(a: Int, b: Int, calculation: (Int, Int) -> Int) {
    let result = calculation(a, b)
    print("Result: \(result)")
}
performCalculation(a: 5, b: 3) { (x, y) in
    return x + y
}


print()


func performAction(action: () -> Void) {
    action()
}
//performAction(action: {
//    print("Action performed.")
//})
performAction {
    print("Action performed.")
}


print()


func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}
holdClass(name: "Philosophy 101") {
    print("All we are is dust in the wind, dude.")
}


print()

