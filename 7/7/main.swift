/*Описать несколько структур – любой легковой автомобиль и любой грузовик.
Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли
двигатель, открыты ли окна, заполненный объем багажника.
Описать перечисление с возможными действиями с автомобилем: запустить/заглушить
двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного
объема.
Добавить в структуры метод с одним аргументом типа перечисления, который будет менять
свойства структуры в зависимости от действия.
Инициализировать несколько экземпляров структур. Применить к ним различные действия.*/

enum carActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case submergeCargo
    case unloadCargo
}

struct Cars {
    var brand : String
    var year : Int
    var capacity : Int
    var engineStart : Bool
    var openWindows : Bool
    var capacityFull : Bool
    
    init (
        brand : String,
        year : Int,
        capacity : Int,
        engineStart : Bool,
        openWindows : Bool,
        capacityFull : Bool
    ) {
        self.brand = brand
        self.year = year
        self.capacity = capacity
        self.engineStart = engineStart
        self.openWindows = openWindows
        self.capacityFull = capacityFull
    }
    
    mutating func action (actions: carActions) -> String {
        switch actions {
        case .startEngine:
            engineStart = true
            return("\(brand) engine running")
        case .stopEngine:
            engineStart = false
            return("\(brand) engine stopped")
        case .openWindows:
            openWindows = true
            return("\(brand) windows open")
        case .closeWindows:
            openWindows = false
            return("\(brand) windows closed")
        case .submergeCargo:
            capacityFull = true
            return("\(brand) trunk loaded")
        case .unloadCargo:
            capacityFull = false
            return("\(brand) trunk unloading")
        }
    }
}

struct Truck {
    var brand : String
    var year : Int
    var capacity : Int
    var engineStart : Bool
    var openWindows : Bool
    var capacityFull : Bool
    
    init (
        brand : String,
        year : Int,
        capacity : Int,
        engineStart : Bool,
        openWindows : Bool,
        capacityFull : Bool
    ) {
        self.brand = brand
        self.year = year
        self.capacity = capacity
        self.engineStart = engineStart
        self.openWindows = openWindows
        self.capacityFull = capacityFull
    }
    
    mutating func action (actions: carActions) -> String {
        switch actions {
        case .startEngine:
            engineStart = true
            return("\(brand) engine running")
        case .stopEngine:
            engineStart = false
            return("\(brand) engine stopped")
        case .openWindows:
            openWindows = true
            return("\(brand) windows open")
        case .closeWindows:
            openWindows = false
            return("\(brand) windows closed")
        case .submergeCargo:
            capacityFull = true
            return("\(brand) trunk loaded")
        case .unloadCargo:
            capacityFull = false
            return("\(brand) trunk unloading")
        }
    }
}

var auto1 = Cars(brand: "Nissan", year: 2015, capacity: 430, engineStart: false, openWindows: false, capacityFull: false)
var auto2 = Truck(brand: "MAN", year: 2010, capacity: 90000, engineStart: false, openWindows: false, capacityFull: true)
print(auto1.action(actions: .startEngine))
print(auto1.action(actions: .submergeCargo))
print(auto2.action(actions: .startEngine))
print(auto2.action(actions: .unloadCargo))


/*Положить объекты структур в словарь как ключи! а их названия как строки например
var dict = [structCar: "structCar"]*/
var dict = [String : String]()
dict["auto1"] = auto1.brand
dict["auto2"] = auto1.brand

//Набрать код который на белом скрине понять в чем там проблема и решить эту проблему
class Car {
    weak var driver: Man?

    deinit {//выведем в консоль сообщение о том, что объект удален
        print("Машина удалена из памяти")
    }
}
class Man {
    var myCar: Car?

    deinit {//выведем в консоль сообщение о том, что объект удален
        print("Мужчина удален из памяти")
    }
}
//объявим переменные, как опциональные, чтобы иметь возможность присвоить им nil
var car: Car? = Car()
var man: Man? = Man()

//Машина теперь имеет ссылку на мужчину
car?.driver = man

//а мужчина на машину
man?.myCar = car

//присвоим nil переменным, удалим эти ссылки
car = nil
man = nil

//мы больше не может никак обратиться к нашим объектам, но они продолжат существовать в памяти

/*У нас есть класс мужчины и его паспорта. Мужчина может родиться и не иметь паспорта, но паспорт выдается конкретному мужчине и
 не может выдаваться без указания владельца. Чтобы разрешить эту проблему, ссылку на паспорт у мужчины сделаем обычной
 опциональной, а ссылку на владельца у паспорта – константой. Также добавим паспорту конструктор, чтобы сразу определить его
 владельца. Таким образом, человек сможет существовать без паспорта, сможет его поменять или выкинуть, но паспорт может быть
 создан только с конкретным владельцем и никогда не может его сменить. Повторить все что на черном скрине и решить проблему
 соблюдая все правила!*/

class Men {
    var pasport: Passport? //по заданию weak или unowned сюда запрещено ставить
    
    deinit {
        // выведем в консоль сообщение о том, что объект удален
        print("Мужчина удален из памяти")
    }
}

class Passport {
   unowned let men: Men

    init(men: Men) {
        self.men = men
    }
        deinit {
            // выведем в консоль сообщение о том, что объект удален
            print("Паспорт удален из памяти")
        }
    }

var men: Men? = Men()
var passport: Passport? = Passport(men: men!)

men?.pasport = passport

passport = nil // объект ещё не удален, его удерживает мужчина
men = nil // Теперь удалены оба объекта
