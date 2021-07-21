import Foundation

let niz: [Int] = [1,2,3,4,5,6,7]
let niz2: Array<Int> = [1,2,3,4,5,6]

print(niz.isEmpty)

var niz3 = [1,2,3]
print(niz3.isEmpty)

niz3 = [] //isprazni niz

print(niz3.isEmpty)

var niz4: [Int] = []
niz4.append(101)
niz4 += [8,7,2]

var sum = 0

for b in niz2 {
    sum += b
}

print("Suma: \(sum)")

sum = 0

for i in 0..<niz2.count{
        sum += niz2[i]
}

print("Suma: \(sum)")

let s = "Ovo je nekakav string"

for c in s{
    print(c)
}
