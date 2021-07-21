

func saberiDvaBroja(prvi: Int, drugi: Int) -> Int{
    let c = prvi + drugi
    return c
}

print(saberiDvaBroja(prvi: 3, drugi: 6))

func saberiDvaBroja(prvi: Double, drugi: Double) -> Double{
    return prvi + drugi
}

func kvadratBroja(_ x: Int) -> Int{
    return x * x
}

let r3 = kvadratBroja(12)

func pozdravnaPoruka(kome osoba: String) -> String{
    return "Pozdrav za osobu po imenu: \(osoba)"
}

let p1 = pozdravnaPoruka(kome: "MArko")

func sayHelloWorld() -> String{
    return "hello, world"
}

func odstampajNesto(){
    print("Ovo je nesto")
}

let o1 = ("John", 45)
let o2 = o1

print(o1.0, o1.1)

func ceoDeoIOstatak(broj: Double) -> (Int, Double){
    let ceoDeo = Int(broj)
    let ostatak = broj - Double(ceoDeo)
    
    return (ceoDeo, ostatak)
}

let f4 = ceoDeoIOstatak(broj: 123.764)
print(f4.0, f4.1)

func mnozenje(prvi: Int, drugi: Int = 2) -> Int{
   return prvi * drugi
}

let r4 = mnozenje(prvi: 3, drugi: 5)
let r6 = mnozenje(prvi: 5)

func swapTwoInits(_ a: inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107

swapTwoInits(&someInt, &anotherInt)
