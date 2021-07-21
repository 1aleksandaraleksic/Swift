//
//  ViewController.swift
//  ReadDataFromFileToList
//
//  Created by aleksandar.aleksic on 5/24/21.
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


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var studentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readTextFromFile()
        parseDataToModel()
    }
    
    var students: [Student] = []
    let fileName: String = "dataText"
    let fileExtension: String = "csv"
    
    var fileContent: String?
    
    func readTextFromFile(){
        let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        fileContent = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        if let fileExist = self.fileContent{
            print("podaci uspeno prepisani", fileExist)
        }
    }
    
    func parseDataToModel(){
        
        if let fileContentExist = self.fileContent{
            let lineByLineArray = fileContentExist.split(separator: "\n")

            for row in lineByLineArray{
                let lineToArray = row.split(separator: ",")
                print(lineToArray)
                let name = String(lineToArray[0])
                let lastname = String(lineToArray[1])
                let city = String(lineToArray[2])
                let dateOfBirth = Int(lineToArray[3]) ?? 0
                let height = Int(lineToArray[4]) ?? 0
                let averageMark = Double(lineToArray[5]) ?? 0.00
                
                let newStudent =
                    Student(ime: name,
                            prezime: lastname,
                            mesto: city,
                            godinaRodjenja: dateOfBirth,
                            visina: height,
                            prosecnaOcena: averageMark)
                students.append(newStudent)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentsTableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as? StudentTableViewCell
        
        cell?.nameLabel.text = students[indexPath.row].ime
        cell?.surnameLabel.text = students[indexPath.row].prezime
        cell?.cityLabel.text = students[indexPath.row].mesto
        cell?.dateLabel.text = String(students[indexPath.row].godinaRodjenja)
        cell?.heightLabel.text = String(students[indexPath.row].visina)
        cell?.averageMarkLabel.text = String(students[indexPath.row].prosecnaOcena)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

