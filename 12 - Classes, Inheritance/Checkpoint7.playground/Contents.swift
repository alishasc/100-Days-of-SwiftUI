import Cocoa

// checkpoint 7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof")
    }
}

class Corgi: Dog {
    override func speak() {
        print("yap yap")
    }
}

class Poodle: Dog {
    override func speak() {
        print("bow wow")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("meow")
    }
}

class Persian: Cat {
    override func speak() {
        print("purr")
    }
}

class Lion: Cat {
    override func speak() {
        print("roarrr")
    }
}

let dog = Dog(legs: 4)
dog.speak()

let corgi = Corgi(legs: 4)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let cat = Cat(isTame: true, legs: 4)
cat.speak()

let persian = Persian(isTame: false, legs: 4)
persian.speak()

let lion = Lion(isTame: false, legs: 4)
lion.speak()

