import Cocoa

// protocols
protocol Vehicle {
    // properties
    var name: String { get }
    var currentPassengers: Int { get set }
    // methods
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Car: protocol
struct Car: Vehicle {
    // properties from protocol
    let name = "Car"
    var currentPassengers = 1
    
    // methods from protocol
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    // not from protocol but extra functionality just for Car
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    // properties from protocol
    let name = "Bicycle"
    var currentPassengers = 1
    
    // methods from protocol
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    // calling methods implemented in the struct
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km.")
    }
}

let car = Car()
commute(distance: 100, using: car)  // I'm driving 100km.
car.openSunroof()  // It's a nice day!

print()

let bike = Bicycle()
commute(distance: 50, using: bike)  // I'm cycling 50km.

print()

getTravelEstimates(using: [car, bike], distance: 150)
/*  Car: 3 hours to travel 150 km.
    Bicycle: 15 hours to travel 150 km. */
