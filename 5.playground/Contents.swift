let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student2.age

let student3 = (nam: "Sam", ag: 23)
student3.nam


class StudentClass {
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let stClass1 = StudentClass(name: "Bob", age: 18)
stClass1.name = "Alex"
stClass1.age = 21

let stClass2 = stClass1
stClass2.age = 20
stClass2.name = "AAA"

stClass2
stClass1

struct StudentStruct {
    var name : String
    var age : Int
}

var stStruct1 = StudentStruct(name: "Sam0", age: 22)

stStruct1.name = "Sam"
stStruct1.age = 24

var stStruct2 = stStruct1
stStruct2.age = 25
stStruct2.name = "Samuel"

stStruct1
stStruct2

func addOneYear(student: StudentClass) {
    student
    student.age += 1
    student
}
func addOneYear(student: StudentStruct) {
    var student = student
    student.age += 1
    student
}
stStruct1
addOneYear(student: stStruct1)
stStruct1

stClass1
addOneYear(student: stClass1)
stClass1

var arrayStruct = [stStruct1]
arrayStruct[0]
arrayStruct[0].age = 50
arrayStruct[0]
stStruct1

var arrayClass = [stClass1]
arrayClass[0]
arrayClass[0].age = 50
arrayClass[0]
stClass1

//Создать класс родитель и 2 класса наследника.
class Parent {
    let name : String
    var age : Int
    
    init (name : String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Child {
    let name = "Pablo"
    var age = 10
    let parent = Parent(name: "Alex", age: 35)
}

//Написать программу, в которой создать класс *House* в нем несколько свойств - *width*, *height* и несколько методов - *create*(выводит произведение свойств),*destroy*(отображает что дом уничтожен)и т.п.
class House {
    var width : Int
    var height : Int
    
    func create () {
        let multiply = width * height
        print("House area - \(multiply)")
    }
    func destroy () {
        height = 0
        width = 0
        print("House destroyed")
    }
    
    init (width : Int, height : Int) {
        self.width = width
        self.height = height
    }
}


let myHouse = House(width: 10, height: 30)
myHouse.create()
myHouse.destroy()
myHouse

//Создайте класс с методами, которые сортируют массив учеников.
var array : [String] = ["Ivan", "Vladimir", "Timofey", "Anna", "Katya"]
class Methods {
    func sort1 (arr: [String]) -> [String] {
        let output = arr.sorted(by: {$0 < $1})
        return output
    }
    func sort2 (arr: [String]) -> [String] {
        let output = arr.sorted(by: {$0 > $1})
        return output
    }
}
var arr = Methods()
arr.sort1(arr: array)
arr.sort2(arr: array)

//Написать свою структуру и пояснить в комментариях - чем отличаются структуры от классов.
//Структуры передаются по значению, а классы — по ссылке
struct Sample {
    var First = "test"
    var Second = 101
    var Third = true
    var Fourth : Int
}
//Напишите простую программу, которая называет комбинации в покере.
enum suits : String {
    case Hearts = "Червы"
    case Spades = "Бубны"
    case Diamonds = "Трефы"
    case Clubs = "Пики"
}

let combinations = ["пара", "две пары", "тройка", "стрит", "флэш", "фул xayc", "Kape", "“стрит флэш", "флеш-рояль"]


func output (suit: suits, combo: String) {
    print("You have \(combo) of \(suit)")
}
let x: () = output(suit: .Clubs, combo: "пара")
