let number: Int = 21
var sumOfNumber: Int = 0

if number > 999 {
    print("Number must be lower then 1000")
}else if number < 0 {
    print("Number must be positve")
}else {
    let i: Int = number / 100
    let j: Int = (number % 100) / 10
    let k: Int = number % 10
    
    sumOfNumber = i + j + k
}

print("Sum of input number is: \(sumOfNumber)")
let range = 1...3

print(type(of: range))
