//Написать сортировку массива с помощью замыкания, сначала в одну сторону, затем в другую.Вывести всё в консоль.
let numbers = [5, 4, 11, 8, 25, 9]

let firstSort = numbers.sorted {$0 > $1}
let secondSort = numbers.sorted {$0 < $1}

print(firstSort)
print(secondSort)

//Создать метод который запрашивает имена друзей, после этого имена положить в массив. Массив отсортировать по количеству букв в имени.
var names = [String]()

func nameOut (name: String) {
    names.append(name)
    let friends = names.sorted(by: {$0.count < $1.count})
    print(friends)
}

nameOut(name: "Mark")
nameOut(name: "Yo")

//Написать функцию которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами.
let dict: [Int: String] = [0: "A", 1: "B", 2: "C"]

func dictOut (key: Int) {
    print("\(key): \(dict[key]!)")
}

dictOut(key: 2)
dictOut(key: 0)

//Написать функцию, которая принимает пустые массивы(один строковый, второй - числовой) и проверяет их: если пустой - то добавить значения и вывести в консоль.
var numArr = [Int]()
var strArr = [String]()

func arrOut (num: inout [Int], str: inout [String]) {
    if num.isEmpty {
        num.append(10)
    }
    if str.isEmpty {
        str.append("Hi")
    }
    for i in num {
        print(i)
    }
    for i in str {
        print(i)
    }
}

arrOut(num: &numArr, str: &strArr)
