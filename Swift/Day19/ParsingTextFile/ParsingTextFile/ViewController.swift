//
//  ViewController.swift
//  ParsingTextFile
//
//  Created by aleksandar.aleksic on 5/21/21.
//

import UIKit

struct Student {
    var ime: String
    var prezime: String
    var mesto: String
    var godinaRodjenja: Int
    var visina: Int
    var prosecnaOcena: Double
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readTextFromFile()
//        simpleParseText()
        parseToModel()
    }

    let fileName: String = "textFile"
    let fileExtension: String = "csv"
    
    var fileContent: String?
    var students:[Student] = []
    
    func readTextFromFile(){
        let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        fileContent = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        if let fileContent = self.fileContent{
            print(fileContent)
        }
    }
    
    func simpleParseText(){
        if let fileContent = self.fileContent{
            let lineByLineArray = fileContent.split(separator: "\n")
            
            print(lineByLineArray)
            for row in lineByLineArray{
                print(row)
                let lineToArray = row.split(separator: ",")
                for column in lineToArray{
                    print(column)
                }
            }
        }
    }
    
    func parseToModel(){
        
        if let fileContent = self.fileContent{
            let lineByLineArray = fileContent.split(separator: "\n")
            students = []
            
            for row in lineByLineArray{
                let lineToArray = row.split(separator: ",")
                
                let ime = String(lineToArray[0])
                let prezime = String(lineToArray[1])
                let mesto = String(lineToArray[2])
                let godinaRodjenja = Int(lineToArray[3]) ?? 0
                let visina = Int(lineToArray[4]) ?? 0
                let prosecnaOcena = Double(lineToArray[5]) ?? 0
                
                let newStudent =
                    Student(ime: ime,
                            prezime: prezime,
                            mesto: mesto,
                            godinaRodjenja: godinaRodjenja,
                            visina: visina,
                            prosecnaOcena: prosecnaOcena)
                students.append(newStudent)
            }
        }
        print(students)
    }
    
    
}

