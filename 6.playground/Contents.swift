import Foundation

//Реализовать структуру IOSCollection и создать в ней copy on write по типу - https://www.youtube.com/watch?v=QsoqHGgX2rE&t=594s
struct IOSCollection {
    var changelog: String
}

class Reference <T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct Case <T> {
    var ref: Reference <T>
    init(value: T) {
        self.ref = Reference(value: value)
    }
    var value: T {
        get {
            ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
                ref = Reference(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}

//Создать протокол Hotel с инициализатором который принимает roomCount, после создать class HotelAlfa добавить свойство roomCount и подписаться на этот протокол.
protocol Hotel {
    var roomCount : Int {get}
}

class HotelAlfa : Hotel {
    var rooms : Int = 0
    var roomCount: Int {
        return rooms
    }
}

//Создать protocol GameDice у него {get} свойство numberDice далее нужно расширить Int так что б когда мы напишем такую конструкцию "let diceCoub = 4 \n diceCoub.numberDice" в консоле мы увидели такую строку - "Выпало 4 на кубике".
protocol GameDice {
    var numberDice : String {get}
}
extension Int : GameDice {
    var numberDice : String {
        return("Выпало \(self) на кубике")
    }
}

let diceCoub = 4
diceCoub.numberDice

//Создать протокол с одним методом и 2 мя свойствами одно из них сделать явно optional, создать класс, подписать на протокол и реализовать только 1 обязательное свойство.
@objc protocol example {
    var text : String {get}
    @objc optional var number: Int {get}
    
    func printer()
}

class ExpampleClass : example {
    var text : String
    init (text: String) {
        self.text = text
    }
    func printer() {
        print(text)
    }
}
let exp = ExpampleClass(text: "Sample text")
exp.printer()

/* Создать 2 протокола:
 "Начинай писать код" со свойствами: время, количество кода. И функцией writeCode()
 "Заканчивай писать код" с функцией: stopCoding()
 И класс: Разработчик, у которого есть свойства - количество программистов, специализации(ios, android, web).
 Разработчику подключаем два этих протокола.
 Задача: вывести в консоль сообщения - "разработка началась. пишем код" и "работа закончена. Сдаю в тестирование".
*/

protocol StartCode {
    var time : Int {get}
    var codeStrings : Int {get}
    
    func writeCode()
}

protocol StopCode {
    func stopCoding()
}

class Programmer : StartCode, StopCode {
    var time : Int
    var codeStrings : Int
    var amount : Int
    var specialization : String
    init(time : Int, codeStrings : Int, amount : Int, specialization : String)  {
        self.time = time
        self.codeStrings = codeStrings
        self.amount = amount
        self.specialization = specialization
    }
    func writeCode() {
        print("разработка началась. пишем код")
    }
    func stopCoding() {
        print("работа закончена. Сдаю в тестирование")
    }
    
}

let Paul = Programmer(time: 60, codeStrings: 200, amount: 1, specialization: "Web")
Paul.writeCode()
Paul.stopCoding()
