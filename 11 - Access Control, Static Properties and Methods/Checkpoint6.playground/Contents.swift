import Cocoa

// Checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    // initialize the above variables
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func changeGear(upGear: Bool) {
        if upGear && currentGear < 5 {
            currentGear += 1
            print("The car is in gear \(currentGear)")
        } else if !upGear && currentGear > 1 {
            currentGear -= 1
            print("The car is in gear \(currentGear)")
        }
    }
}

var car = Car(model: "Mini", numberOfSeats: 5, currentGear: 3)
car.changeGear(upGear: true)  // The car is in gear 4
car.changeGear(upGear: true)  // The car is in gear 5
