import Cocoa

// providing default values for parameters
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)

print()

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)  // 4
// keepingCapacity default parameter = false
characters.removeAll(keepingCapacity: true)
print(characters.count)  // 0
print()


// handling errors in functions
enum PasswordError: Error {
    case short, obvious
}

// throws -> means function is able to throw errors
func checkPassword(_ password: String) throws -> String {
    // specify errors that may happen
    if password.count < 5 {
        // to throw an error. will exit function without returning a string
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    // if no errors, then carry on like normal below
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my lugagge!")
} catch {
    print("There was an error.")
}
