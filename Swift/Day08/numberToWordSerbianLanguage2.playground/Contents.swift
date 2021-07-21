import UIKit

var serbianDigits = [
    0:"nula",
    1:"jedan",
    2:"dva",
    3:"tri",
    4:"cetri",
    5:"pet",
    6:"sest",
    7:"sedam",
    8:"osam",
    9:"devet",
    10:"deset",
    11:"jedanest",
    12:"dvanest",
    13:"trinest",
    14:"cetrnest",
    15:"petnest",
    16:"sesnest",
    17:"sedamnest",
    18:"osamnest",
    19:"devenest",
    20:"dvadeset",
    30:"trideset",
    40:"cetrdeset",
    50:"pedeset",
    60:"sezdeset",
    70:"sedamdeset",
    80:"osamdeset",
    90:"devedeset",
    100:"sto",
    200:"dvesta",
    300:"trista",
    1_000:"hiljadu",
    1_000_000:"milion",
    1_000_000_000:"milijarda"
]

let broj: Int = 1_201_234

let numberWords = convertNumberToWords(broj)
print(numberWords)

func convertNumberToWords(_ number: Int) -> String{
    var digitsToWord: String = ""
    let arrayOfNumber: [Int] = covertNumberToArrayByHundreds(number)
    
    let firstHundred = arrayOfNumber[0]
    let secondHundred = arrayOfNumber[1]
    let thirdHundred = arrayOfNumber[2]
    let fourthHundred = arrayOfNumber[3]
    
    if number < 1_000{
        digitsToWord = convertHundreds(number)
    }else if number < 1_000_000{
        digitsToWord.append(wordWithThousends(firstHundred))
        if secondHundred != 0 {digitsToWord.append(convertHundreds(secondHundred))}
    }else if number < 1_000_000_000{
        digitsToWord.append(wordWithMilion([firstHundred,secondHundred, thirdHundred]))
    }else if number < 1_000_000_000_000{
        digitsToWord.append(wordWithTrilion([firstHundred,secondHundred, thirdHundred, fourthHundred]))
    }
    
    return digitsToWord
}

func convertHundreds(_ number: Int) -> String {
    
    let preperdNumber: Int = number / 100
    let preperdNumberModule: Int = number % 100
    
    var digitsByWords: String = ""
    
    if number == 100 || number == 200 || number == 300{
        digitsByWords +=  serbianDigits[number]!
    }else if number > 100 && number < 300{
        digitsByWords +=  serbianDigits[preperdNumber * 100]!
    }else if number > 300{
        digitsByWords +=  serbianDigits[preperdNumber]! + serbianDigits[100]!
    }
        
    if preperdNumberModule < 22 && preperdNumberModule != 0 {
        digitsByWords +=  serbianDigits[preperdNumberModule]!
    }else {
        let tens = (preperdNumberModule / 10) * 10
        let units = preperdNumberModule % 10
        
        digitsByWords +=  serbianDigits[tens]!
        if units != 0 {digitsByWords += "i" + serbianDigits[units]!}
    }
    
    return digitsByWords
}

func wordWithTrilion(_ number: [Int]) -> String {
    var digitsToWord: String = ""
    let firstHundred = number[0]
    let secondHundred = number[1]
    let thirdHundred = number[2]
    let fourthHundred = number[3]
    
    if firstHundred != 1 { digitsToWord.append(convertHundreds(firstHundred)) }
    else { digitsToWord.append("jedna")}
    digitsToWord.append(serbianDigits[1_000_000_000]!)
    if secondHundred != 0{
        if  2...4 ~= firstHundred {
            digitsToWord.remove(at: digitsToWord.lastIndex(of: "a")!)
            digitsToWord.append("e")
        }else{
            digitsToWord.remove(at: digitsToWord.lastIndex(of: "a")!)
            digitsToWord.append("i")
        }
        digitsToWord.append(wordWithMilion([secondHundred,thirdHundred, fourthHundred]))
    }
    return digitsToWord
}

func wordWithMilion(_ number: [Int]) -> String {
    var digitsToWord: String = ""
    let firstHundred = number[0]
    let secondHundred = number[1]
    let thirdHundred = number[2]
    
    if firstHundred != 1 { digitsToWord.append(convertHundreds(firstHundred)) }
    digitsToWord.append(serbianDigits[1_000_000]!)
    if secondHundred != 0{
        if firstHundred != 1 { digitsToWord.append("a") }
        digitsToWord.append(wordWithThousends(secondHundred))
    }
    if thirdHundred != 0{
        digitsToWord.append(convertHundreds(thirdHundred))
    }
    return digitsToWord
}

func wordWithThousends(_ number: Int) -> String{
    var digitsByWords: String = ""
    
    if number == 1 {
        digitsByWords.append(serbianDigits[1000]!)
    }else{
        digitsByWords.append(convertHundreds(number))
        if 2...4 ~= number{
            digitsByWords.append("hiljade")
        }else{
            digitsByWords.append("hiljada")
        }
    }
 
    return digitsByWords
}

func covertNumberToArrayByHundreds(_ number:Int) -> [Int]{
    var firstHundred = 0
    var secondHundred = 0
    var thirdHundred = 0
    var fourthHundred = 0
    
    if number < 1_000_000{
        firstHundred = number / 1_000
        secondHundred = number % 1_000
    } else if number < 1_000_000_000{
        firstHundred = number / 1_000_000
        secondHundred = (number / 1_000) % 1_000
        thirdHundred = number % 1_000
    } else if number < 1_000_000_000_000{
        firstHundred = number / 1_000_000_000
        secondHundred = (number / 1_000_000) % 1_000
        thirdHundred = (number / 1_000) % 1_000
        fourthHundred = number % 1_000
    }
    
    return [firstHundred, secondHundred, thirdHundred, fourthHundred]
}
