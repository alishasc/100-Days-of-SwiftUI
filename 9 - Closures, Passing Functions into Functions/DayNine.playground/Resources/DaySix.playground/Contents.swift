import Cocoa

// for loops
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...10 {
    print("5 x \(i) is \(5 * i)")
}
// 5 x 1 is 5
// 5 x 2 is 10
// 5 x 3 is 15 ...

// nested for loop
for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    
    print()
}

// including last number
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

// up to last number
for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

let names = ["Sterling", "Cyril", "Lana"]
for _ in names {
    print("[CENSORED is a secret agent!")
}

let people = ["Piper", "Alex", "Suzanne", "Gloria"]
print(people[0])  // Piper
print(people[1...3])  // ["Alex", "Suzanne", "Gloria"]
print(people[1...])  // ["Alex", "Suzanne", "Gloria"]

print()


// while loops
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")

let id = Int.random(in: 1...1000)
print(id)

let amount = Double.random(in: 0...1)
print(amount)


// to store the roll
var roll = 0

// carries on looping until we reach 20
while roll != 20 {
    // roll dice and print result
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
// prints when 20 is rolled - loop has ended
print("Critical hit!")


var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat. \(cats)")
    if cats == 4 {
        print("Enough cats! \(cats)")
        cats = 10
    }
}

var itemsSold: Int = 0
while itemsSold < 5000 {
    itemsSold += 100
    if itemsSold.isMultiple(of: 10000) {
        print("\(itemsSold) items sold - a big milestone!")
    }
}

print()


// break and continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}

print()

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


// labelled statement
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

// outerLoop = labelled statement
// used to easily break out of all loops at once
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            
            if attempt == secretCombination {
                print("The combination is \(attempt)")
                break outerLoop
            }
        }
    }
}

