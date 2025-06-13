import Cocoa

// classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

print()

// inheritance
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()  // I'm writing code for 8 hours.
joseph.work()  // I'm going to meetings for 10 hours.

let novall = Developer(hours: 8)
novall.printSummary()  // calls overriding function
// I'm a developer who will sometimes work 8 hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.

print()


// add initializers for classes
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isConvertible: false, isElectric: true)

print()

class Shape {
    var sides: Int
    init(sides: Int) {
        self.sides = sides
    }
}

class Rectangle: Shape {
    var color: String
    init(color: String) {
        self.color = color
        super.init(sides: 4)
    }
}


// how to copy classes
class User {
    var username = "Anonymous"
    
    // Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1  // copies user1
print(user2.username)  // Anonymous
user2.username = "Taylor"
print(user1.username)  // Taylor
print(user2.username)  // Taylor

print()

class Hospital {
    var onCallStaff = [String]()
}
var londonCentral = Hospital()
var londonWest = londonCentral
londonCentral.onCallStaff.append("Dr Harlan")
londonWest.onCallStaff.append("Dr Haskins")
print(londonCentral.onCallStaff.count)  // 2
print(londonWest.onCallStaff.count)  // 2

print()


// deinitializer
class Person {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [Person]()

for i in 1...3 {
    let user = Person(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

print()


// how to work with variables inside classes
class Human {
    var name = "Paul"
}
var human = Human()
human.name = "Taylor"
print(human.name)  // Taylor

human = Human()
print(human.name)  // Paul

print()


