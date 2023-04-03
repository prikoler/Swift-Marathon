//Создайте по 1-2 enum разных типов.
enum test: Int {
    case Number
    case Square
}

enum Colors {
    case Red(amount: Int)
    case Blue(amount: Int)
    case Green(amount: Int)
}

//Создайте несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст,ФИО, стаж.
enum Form {
    case fullName
    case Gender
    case Age
    case Experience
}

let man = Form.Age

switch man {
case .fullName:
    print("My name is Alex Sorokov")
case .Gender:
    print("Male")
case .Age:
    print("I'm 27")
case .Experience:
    print("I'm senior programmer")
}
 //Создать enum со всеми цветами радуги. Создать функцию, которая содержит названия разных предметов или объектов. Пример результата в консоли "apple green", "sun red" и т.д.
enum Rainbow {
    case Red
    case Orange
    case Yellow
    case Green
    case Blue
    case darkBlue
    case Violet
}

let objects = ["apple", "sun", "house", "car", "moon", "chair", "sofa"]
func phrase (words: Rainbow) {
    switch words {
    case .Red:
        print("Red \(objects[0])")
    case .Orange:
        print("Orange \(objects[1])")
    case .Yellow:
        print("Yellow \(objects[2])")
    case .Green:
        print("Green \(objects[3])")
    case .Blue:
        print("Blue \(objects[4])")
    case .darkBlue:
        print("darkBlue \(objects[5])")
    case .Violet:
        print("Violet \(objects[6])")
    }
}

phrase(words: .Orange)
phrase(words: .Green)

//Создать функцию, которая выставляет оценки ученикам в школе.
enum Grades {
    case two, three, four, five
}
var students = ["Alex", "George", "Chris", "Elezebeth", "Paul"]

func eval (grd: Grades){
    switch grd {
    case .two:
        let index = Int.random(in: 0..<students.count)
        print("\(students[index]) - 2")
        students.remove(at: index)
    case .three:
        let index = Int.random(in: 0..<students.count)
        print("\(students[index]) - 3")
        students.remove(at: index)
    case .four:
        let index = Int.random(in: 0..<students.count)
        print("\(students[index]) - 4")
        students.remove(at: index)
    case .five:
        let index = Int.random(in: 0..<students.count)
        print("\(students[index]) - 5")
        students.remove(at: index)
    }
}

eval(grd: .four)
eval(grd: .five)

//Создать программу, которая "рассказывает" - какие автомобили стоят в гараже.
enum Cars : String {
    case Toyota = "Toyota Land Cruiser"
    case Volkswagen = "Volkswagen Polo"
    case Lamborghini = "Lamborghini Diablo"
    static let all = [Toyota, Volkswagen, Lamborghini]
}

for car in Cars.all {
    print("You have \(car.rawValue) in garage")
}
