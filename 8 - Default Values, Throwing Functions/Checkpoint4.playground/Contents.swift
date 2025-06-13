import Cocoa

// specifying the errors that can happen
enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    // error that could happen
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }

    var squareRoot = 0
    
    // loop from 1 to the number parameter
    for i in 1...number {
        // if i multiplied by itself equals number - that's the square root
        if i * i == number {
            squareRoot = i
        }
    }
    
    // error that could happen - no Int square root number found
    // squareRoot wasn't updated from original number so no root number found
    if squareRoot == 0 {
        throw SquareRootError.noRoot
    }

    // return Int
    return squareRoot
}

do {
    // get Int value from function as result
    let result = try squareRoot(of: 25)
    print("The square root is \(result)")
} catch SquareRootError.outOfBounds {
    print("Enter number between 1 and 10,000.")
} catch SquareRootError.noRoot {
    print("This number doesn't have a square root.")
} catch {
    print("Error.")
}

