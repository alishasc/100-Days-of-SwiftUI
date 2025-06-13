import Cocoa

// structs
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
print(red.title)  // Red
red.printSummary()  // Red (2012) by Taylor Swift


print()


struct Employee {
    let name: String
    // changing this default variable
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
/* I'm going on vacation!
Days remaining: 9 */
print(archer.vacationRemaining)  // 9

//var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
// SAME AS
//var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

let kane = Employee(name: "Lana Kane")
print(kane.vacationRemaining)  // 14


print()


// computed properties
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            // newValue = 5 passed to it below
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)  // 9


print()


// how to take action when a property changes
struct Game {
    // computed property
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10  // 10
game.score -= 3  // 7
game.score += 1  // 8


print()


struct App {
    var contacts = [String]() {
        // prints BEFORE the value is changed
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        // prints AFTER the value is changed
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
//app.contacts.append("Adrian E")
app.contacts.append("Allen W")
//app.contacts.append("Ish S")


print()


struct FishTank {
    var capacity: Int
    var fishCount: Int {
        didSet {
            if fishCount > capacity {
                print("You have too may fish!")
            }
        }
    }
}

var fish = FishTank(capacity: 100, fishCount: 80)
fish.fishCount += 20
fish.fishCount += 10  // You have too may fish!


print()


struct Dog {
    var age = 0 {
        didSet {
            let dogAge = age * 7
            print("I'm now \(dogAge) in dog years.")
        }
    }
}
var dog = Dog()
dog.age = 23


print()


// how to create custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
let player = Player(name: "Megan R")
print(player.number)
