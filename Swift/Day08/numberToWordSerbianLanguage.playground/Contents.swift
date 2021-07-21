import UIKit

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
    1_000:"Hiljadu",
    1_000_000:"Milion",
    1_000_000_000:"Milijarda"
]
// 737_737_737
let broj: Int = 999_737_737

let numberWords = convertNumberToWords(broj)
print(numberWords)

func convertNumberToWords(_ broj: Int) -> String{
    var brojSlovima: String = ""

    if broj < 100{
        brojSlovima = desetice(broj)
    }else if broj >= 100 && broj < 1_000{
        brojSlovima = stotine(broj)
    }else if broj < 1_000_000{
        let prviBroj = broj / 1000
        let drugiBroj = broj % 1000
        
        brojSlovima += wordForThousends(prviBroj)
        brojSlovima += stotine(drugiBroj)
    }else if broj < 1_000_000_000{
        let prviBroj = broj / 1_000_000
        let drugiBroj = (broj / 1_000) % 1_000
        let treciBroj = broj % 1_000

        if prviBroj == 1 {
            brojSlovima += serbianDigits[1_000_000]!
        }else if prviBroj > 1 && prviBroj < 100{
            brojSlovima += desetice(prviBroj)
            brojSlovima += "miliona"
        }else{
            brojSlovima += stotine(prviBroj)
            brojSlovima += "miliona"
        }
        
        brojSlovima += wordForThousends(drugiBroj)
        
        brojSlovima += stotine(treciBroj)
    }
    
    return brojSlovima
}

func desetice(_ broj: Int) -> String {
    if broj < 22 && broj != 0 {
        return serbianDigits[broj]!
    }else{
        let desetice = (broj / 10) * 10
        let jedinice = broj % 10
        return serbianDigits[desetice]! + "i" + serbianDigits[jedinice]!
    }
}

func stotine(_ broj: Int) -> String {
    
    if broj < 100{
        return desetice(broj)
    }else if broj == 100 || broj == 200 || broj == 300{
        return serbianDigits[broj]!
    }else if broj > 100 && broj < 300{
        return serbianDigits[(broj / 100)*100]! + desetice(broj % 100)
    }else{
        let jedinice: Int = broj / 100
        return serbianDigits[jedinice]! + serbianDigits[100]! + desetice(broj % 100)
    }
}

func wordForThousends(_ number: Int) -> String{
    var brojSlovima: String = ""
    switch number {
    case 1:
        brojSlovima += serbianDigits[1000]!
        break;
    case 2,3,4:
        brojSlovima += stotine(number)
        brojSlovima += "hiljade"
        break;
    default:
        brojSlovima += stotine(number)
        brojSlovima += "hiljada"
    }
    
    return brojSlovima
}

