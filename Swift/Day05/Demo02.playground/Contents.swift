let niz: [Int] = [1,2,3,4,5,6,7,8,9]

func saberiNeparne(niz: [Int]) -> Int{
    var total: Int = 0
    
    for i in niz{
        if i % 2 == 1{
            total += i
        }
    }
    
    return total
}

let a = saberiNeparne(niz: niz)

print("zbir neparnih brojeva je: \(a)")


