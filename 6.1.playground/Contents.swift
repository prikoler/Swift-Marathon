//Зайти в документацию открыть тему protocol и руками набрать весь код в этой главе разобраться как это работает.
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

//protocol SomeProtocol {
//    static func someTypeMethod()
//}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
//let generator = LinearCongruentialGenerator()
//print("Here's a random number: \(generator.random())")
//// Выведет "Случайное число: 0.37464991998171"
//print("And another one: \(generator.random())")
//// Выведет "Другое случайное число: 0.729023776863283"

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch теперь равен .on

//protocol SomeProtocol {
//    init(someParameter: Int)
//}

//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//        // реализация инициализатора…
//    }
//}
//protocol SomeProtocol {
//    init()
//}
//
class SomeSuperClass {
    init() {
        // реализация инициализатора…
    }
}
 
//class SomeSubClass: SomeSuperClass, SomeProtocol {
//    // "required" от соответствия протоколу SomeProtocol; "override" от суперкласса SomeSuperClass
//    required override init() {
//        // реализация инициализатора…
//    }
//}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Бросок игральной кости равен \(d6.roll())")
}
// Бросок игральной кости равен 3
// Бросок игральной кости равен 5
// Бросок игральной кости равен 4
// Бросок игральной кости равен 5
// Бросок игральной кости равен 4

protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Начали новую игру Змеи и лестницы")
        }
        print("У игральной кости \(game.dice.sides) граней")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Выкинули \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("Длительность игры \(numberOfTurns) хода")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
// Начали новую игру Змеи и лестницы
// У игральной кости 6 граней
// Выкинули 3
// Выкинули 5
// Выкинули 4
// Выкинули 5
// Длительность игры 4 хода

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "Игральная кость с \(sides) гранями"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
// Выведет "Игральная кость с 12 гранями"

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "Игра Змеи и Лестницы с полем в \(finalSquare) клеток"
    }
}
print(game.textualDescription)
// Выведет "Игра Змеи и Лестницы с полем в 25 клеток"

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)
// Prints "[A 6-sided dice, A 12-sided dice]"

struct Hamster {
    var name: String
    var textualDescription: String {
        return "Хомяка назвали \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Фруша")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)
// Выведет "Хомяка назвали Фруша"

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("Эти два вектора эквивалентны.")
}
// Выведет "Эти два вектора эквивалентны."

enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}
var levels = [SkillLevel.intermediate, SkillLevel.beginner,
              SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}
// Выведет "beginner"
// Выведет "intermediate"
// Выведет "expert(stars: 3)"
// Выведет "expert(stars: 5)"

let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}
// Игра Змеи и Лестницы с полем в 25 клеток
// Игральная кость с 12 гранями
// Хомяка назвали Фруша

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // определение протокола…
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)
// Игра Змеи и Лестницы с полем в 25 клеток:
// ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○

//protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//    // определение протокола типа class-only
//}

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("С Днем Рождения, \(celebrator.name)! Тебе уже \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Сашка", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Выведет "С Днем Рождения, Сашка! Тебе уже 21!"

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}
 
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)
// Выведет "Hello, Seattle!"

protocol HasArea {
    var area: Double { get }
}

//protocol HasArea {
//    var area: Double { get }
//}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

//let objects: [AnyObject] = [
//    Circle(radius: 2.0),
//    Country(area: 243_610),
//    Animal(legs: 4)
//]

//for object in objects {
//    if let objectWithArea = object as? HasArea {
//        print("Площадь равна \(objectWithArea.area)")
//    } else {
//        print("Что-то такое, что не имеет площади")
//    }
//}
// Площадь равна 12.5663708
// Площадь равна 243610.0
// Что-то такое, что не имеет площади

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator = LinearCongruentialGenerator()
print("Рандомное число: \(generator.random())")
// Выведет "Рандомное число: 0.37464991998171"
print("Рандомное логическое значение: \(generator.randomBool())")
// Выведет "Рандомное логическое значение: true"

extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
// Prints "true"
print(differentNumbers.allEqual())
// Prints "false"
