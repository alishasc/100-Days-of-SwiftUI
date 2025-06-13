import Cocoa

// checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
var oddLuckyNumbers = [Int]()
var reverseNumbers = [Int]()
var mappedNumbers = [String]()

func doStuff(filter: () -> Void, sort: () -> Void, map: () -> Void) {
    filter()
    sort()
    map()
}

doStuff {
    // filter:
    oddLuckyNumbers = luckyNumbers.filter { !$0.isMultiple(of: 2) }
} sort: {
    reverseNumbers = oddLuckyNumbers.sorted { $0 < $1 }
} map: {
    mappedNumbers = reverseNumbers.map { "\($0) is a lucky number" }
    // for loop to print mappedNumbers on separate lines
    for i in mappedNumbers {
        print(i)
    }
}
