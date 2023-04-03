//let constArray : [String] = ["a", "b", "c", "d"]
//
//constArray.count
//
//var array = [String]()
//
//if array.isEmpty {
//    print("yeah")
//}
//
//array += constArray
//
//array += ["e"]
//array.append("f")
//
//var array2 = array
//
//array
//array2
//
//array2[0] = "1"
//
//array
//array2

//array[1..<4] = ["0"]

//array.insert("-", at: 3)
//array.remove(at: 3 )
//array
//
//let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]
//let test = [Int](repeating: 100, count: 3)
//
//var sum = 0
//
//for i in 0..<money.count {
//    print("i = \(i)")
//    sum += money[i]
//}
//sum
//var index = 0
//for value in money {
//    print("index = \(index) value = \(value)")
//    sum += value
//    index += 1
//}

//for (index, value) in money.enumerated() {
//    print("index = \(index) value = \(value)")
//    sum += value
//}


let numbers = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for i in numbers {
    print(i)
}

let names = ["январь", "февраль", "март", "апрель", "май", "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"]

for i in 0..<numbers.count {
    print("\(names[i]) - \(numbers[i])")
}

let array = [("январь", 31), ("февраль", 28), ("март", 31), ("апрель", 30), ("май", 31), ("июнь", 30), ("июль", 31), ("август", 31), ("сентябрь", 30), ("октябрь", 31), ("ноябрь", 30), ("декабрь", 31)]

for i in 1..<array.count {
    print("\(array[i].0) - \(array[i].1)")
}

var g = numbers.count
for i in 0..<numbers.count {
    g -= 1
    print("\(names[i]) - \(numbers[g])")
}

let bday = (8, "апрель")

