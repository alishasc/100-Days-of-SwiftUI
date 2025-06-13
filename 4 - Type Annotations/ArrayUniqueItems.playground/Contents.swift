import Cocoa

var books = ["Fourth Wing", "Flawless", "Fourth Wing", "Beach Read"]

// Set(books) converts the array into a set
// setswon't allow duplicates so can check for UNIQUE books
var uniqueBooks = Set(books)

print("\(books.count) books in the array")
print("\(uniqueBooks.count) unique books in the array")

