import UIKit

var recnik1 = [String:String]()
var recnik2: [String: Int] = [:]
var recnik3: Dictionary<Int, String> = [:]

var valute = ["EUR":"Euro", "RSD":"Dinar","USD":"Dolar"]

valute.count

print(valute["RSD"]!)
//print(valute["CAD"])

let v1 = valute["USD"]

for i in valute.keys {
    print(i)
}

for j in valute.values{
    print(j)
}

var responseMessages = [200:"OK", 403:"Acess forbidden", 404:"File not found", 500:"Internal server error"]

let httpResponseCode = [200, 403, 301, 500]

for code in httpResponseCode {
    if let message = responseMessages[code]{
        print("Response \(code) : \(message)")
    }else{
        print("Unkonwn response \(code)")
    }
}

responseMessages[301] = "Moved permanently"

//  1. Data je celobrojna vrednost veca ili jednaka od 0 a manja ili jednaka od 9. Ispisati recima tu cifru

var numberWordDigit = [0:"Nula",1:"Jedan", 2:"Dva", 3:"Tri", 4:"Cetri", 5:"Pet", 6:"Sest", 7:"Sedam", 8:"Osam", 9:"Devet"]

var number = 8

print(numberWordDigit[number]!)

// 2. Data je celobrojana vrednost >=0 a <= 100, Ispisati recima tu cifru
var numberWithWordDigit = [
    0:"Nula",
    1:"Jedan",
    2:"Dva",
    3:"Tri",
    4:"Cetri",
    5:"Pet",
    6:"Sest",
    7:"Sedam",
    8:"Osam",
    9:"Devet",
    10:"Deset",
    11:"Jedanest",
    12:"Dvanest",
    13:"Trinest",
    14:"Cetrnest",
    15:"Petnest",
    16:"Sesnet",
    17:"Sedamnest",
    18:"Osamnest",
    19:"Devenest",
    20:"Dvadeset",
    30:"Trideset",
    40:"Cetrdeset",
    50:"Pedeset",
    60:"Sezdeset",
    70:"Sedamdeset",
    80:"Osamdeset",
    90:"Devedeset"
]

//var num = 96
//
//let desetice = (num / 10) * 10
//let jedinice = num % 10
//
//if num < 20{
//    print("\(numberWithWordDigit[num]!)")
//}else{
//    print("\(numberWithWordDigit[desetice]!)i" + "\(numberWithWordDigit[jedinice]!)")
//}

var serbianDigits = [
    0:"Nula",
    1:"Jedan",
    2:"Dva",
    3:"Tri",
    4:"Cetri",
    5:"Pet",
    6:"Sest",
    7:"Sedam",
    8:"Osam",
    9:"Devet",
    10:"Deset",
    11:"Jedanest",
    12:"Dvanest",
    13:"Trinest",
    14:"Cetrnest",
    15:"Petnest",
    16:"Sesnet",
    17:"Sedamnest",
    18:"Osamnest",
    19:"Devenest",
    20:"Dvadeset",
    30:"Trideset",
    40:"Cetrdeset",
    50:"Pedeset",
    60:"Sezdeset",
    70:"Sedamdeset",
    80:"Osamdeset",
    90:"Devedeset",
    100:"Sto",
    200:"Dvesta",
    300:"Trista",
    1_000:"Hiljada",
    1_000_000:"Milion",
    1_000_000_000:"Milijarda"
]
//do 20.000 hiljada radi
let broj = 119
print(broj / 1000)

print(broj % 100)

let hiljade = broj / 1000
var stotine = 0
if ((broj % 1000) / 100) * 100 < 301 {
    stotine = ((broj % 1000) / 100) * 100
}else{
    stotine = (broj % 1000) / 100
}
let desetice = ((broj % 100) / 10) * 10
let jedinice = broj % 10

let hiljadeSlovima = serbianDigits[hiljade]
let stotineSlovima = serbianDigits[stotine]
let deseticeSlovima = serbianDigits[desetice]
let jediniceSlovima = serbianDigits[jedinice]

var ceoBrojSlovima: String = ""

if hiljade > 0 && broj % 1000 != 0{
    if broj >= 1000 && broj <= 1999{
        ceoBrojSlovima += "hiljadu"
    }else if broj < 20_000{
        if hiljade == 2 {
            ceoBrojSlovima += "dve"
        }else{
            ceoBrojSlovima += hiljadeSlovima!
        }
        ceoBrojSlovima += "hiljade"
    }else{
        
    }
}

if stotine > 0 {
    if stotine >= 300 || stotine >= 3 && stotine < 10{
        ceoBrojSlovima += stotineSlovima!
        ceoBrojSlovima += serbianDigits[100]!
    }else{
        ceoBrojSlovima += stotineSlovima!
    }
}

if desetice < 100 && desetice >= 20 && broj != 0{
    ceoBrojSlovima += deseticeSlovima!
    if broj % 10 != 0 {ceoBrojSlovima += "i"}
}

if jedinice < 20 && jedinice != 0 {
    ceoBrojSlovima += serbianDigits[broj % 10]!
}

print(ceoBrojSlovima)

//if broj < 20{
//    print("\(serbianDigits[broj]!)")
//}else if broj < 100 && broj > 20{
//    print("\(desetice!)i\(jedinice!)")
//} else if broj < 1_000 && broj > 99{
//    if broj / 100 > 3{
//        print("\(stotine!)\(serbianDigits[100]!)\(desetice!)i\(jedinice!)")
//    }else{
//        print("\(serbianDigits[(broj/100)*100]!)\(desetice!)i\(jedinice!)")
//    }
//}else if broj < 1_000_000 && broj >= 999{
//    if broj == 1000 { print("hiljadu")}
//        print("\(hiljade!)hiljada\(serbianDigits[100]!)\(desetice!)i\(jedinice!)")
//    }else{
//        print("")
//    }
//}
