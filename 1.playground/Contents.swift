print("Int mininmum = \(Int.min)")
print("Int maximum = \(Int.max)")

print("Double mininmum = \(Double.leastNormalMagnitude)")
print("Double maximum = \(Double.greatestFiniteMagnitude)")

print("Float mininmum = \(Float.leastNormalMagnitude)")
print("Float maximum = \(Float.greatestFiniteMagnitude)")

let a = 5
let b : Float = 6.23
let c = 7.45

let sumInt = a + Int(b) + Int(c)
let sumFloat = Float(a) + b + Float(c)
let sumDouble = Double(a) + Double(b) + c

if Double(sumInt) < sumDouble {
    print("true")
} else {
    print("wtf")
}
