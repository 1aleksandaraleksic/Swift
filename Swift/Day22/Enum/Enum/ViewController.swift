//
//  ViewController.swift
//  Enum
//
//  Created by aleksandar.aleksic on 5/26/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {

    var topTenMovies:[Movie] = []
    var commingSoonMovies: [[String]] = []

    @IBOutlet var imagePickerShow: UIImageView!
    @IBOutlet var moviePicker: UIPickerView!
    @IBOutlet var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        covertDataToModelMovie(fileName: "topTenMovies", fileExtension: "csv")
        convertDataToArray(fileName: "commingSoonMovies", fileExtension: "csv")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imagePickerShow.image = UIImage(named: commingSoonMovies[0][1])
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return commingSoonMovies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return commingSoonMovies[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imagePickerShow.image = UIImage(named: commingSoonMovies[row][1])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topTenMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coomingSoonMovieCell", for: indexPath)
        cell.textLabel?.text = topTenMovies[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "System", size: 21)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieFromTopTen"{
            let controller = segue.destination as! MovieViewController
            controller.movie = topTenMovies[self.movieTableView.indexPathForSelectedRow!.row]
        }
    }
    
    
    
    func convertDataToArray(fileName: String, fileExtension: String){
        if let path = Bundle.main.path(forResource: fileName, ofType: fileExtension){
            if let fileContent = try? String(contentsOfFile: path, encoding: String.Encoding.utf8){
                let lineByLineArray = fileContent.split(separator: "\n")
                
                
                for row in lineByLineArray{
                    let wordToArray = row.split(separator: ",")
                    commingSoonMovies.append([String(wordToArray[0]), String(wordToArray[1]) ])
                }
            }
        }
    }
    

    func covertDataToModelMovie(fileName: String, fileExtension:String){
        if let path = Bundle.main.path(forResource: fileName, ofType: fileExtension){
            if let fileContent = try? String(contentsOfFile: path, encoding: String.Encoding.utf8){
                let lineByLineArray = fileContent.split(separator: "\n")
                
                for row in lineByLineArray{
                    
                    let lineToArray = row.split(separator: ",")
                    
                    let title = String(lineToArray[0])
                    let year = Int(lineToArray[1])!
                    let rated = Double(lineToArray[2])!
                    let runTime = String(lineToArray[3])
                    let genre = findGenre(String(lineToArray[4]))
                    let director = String(lineToArray[5])
                    let writer = String(lineToArray[6])
                    let language = findLanguage(String(lineToArray[7]))
                    let country = findCountry(String(lineToArray[8]))
                    let productionHouse = findProductionHouse(String(lineToArray[9]))
                    let mainActor = String(lineToArray[10])
                    let posterImage = String(lineToArray[11])

                    let newMovie:Movie =
                        Movie(title: title,
                              year: year,
                              rated: rated,
                              runTime: runTime,
                              genre: genre,
                              director: director,
                              writer: writer,
                              language: language,
                              country: country,
                              productionHouse: productionHouse,
                              mainActor: mainActor,
                              image: posterImage)
                    
                    topTenMovies.append(newMovie)
                }
            }
        }
        
    }

}

