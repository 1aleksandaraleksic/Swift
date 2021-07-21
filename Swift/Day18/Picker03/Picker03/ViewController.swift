//
//  ViewController.swift
//  Picker03
//
//  Created by aleksandar.aleksic on 5/20/21.
//

import UIKit

struct Country {
  
    var name: String
    var cities: [String]
    
    init(name: String) {
        self.name = name
        self.cities = []
    }
    
    init(name: String, cities: [String]) {
        self.name = name
        self.cities = cities
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var countries = [
        Country(name: "Serbia",
                cities: ["Belgrade", "Nis", "Novi Sad", "Kraljevo", "Subotica", "Kragujevac", "Zrenjanin", "Vrsac"]),
        Country(name: "Germany",
                cities: ["Keln", "Berlin", "Cologne", "Frankfurt", "Stuttgart", "Leipzig", "Munich", "Hamburg", "Dusseldorf"]),
        Country(name: "France",
                cities: ["Paris", "Lion", "Marseille", "Toulouse", "Lille", "Bordeaux", "Nantes", "Strasbourg", "Rennes", "Saint Etienne", "Nancy", "Montpellier"]),
        Country(name: "Greece",
                cities: ["Athens", "Thessaloniki", "Patrai", "Piraeus", "Larissa", "Peristeri", "Heraklion", "Kallithea", "Acharnes", "Kalamari"]),
        Country(name: "Spain",
                cities: ["Barcelona", "Madrid", "Valencia", "Malaga", "Sevilla", "Bilbao", "Toledo", "San Sebastian", "Granada", "Las Palmas", "Zaragoza", "Vigo"]),
        Country(name: "USA",
                cities: ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "Austin", "Jacksonville", "Charlotte", "Orlando", "San Francisco"]),
        Country(name: "Portugal",
                cities: ["Lisabon", "Porto", "Vila Nova de Gaia", "Braga", "Coimbra", "Almada", "Setubal", "Barreiro", "Aveiro", "Rio Tinto"]),
        Country(name: "Italy",
                cities: ["Rome", "Milan", "Naples", "Turin", "Palermo", "Genoa", "Bologna", "Florence", "Bari", "Catania", "Verona", "Venice", "Parma"]),
        Country(name: "Russia",
                cities: ["Moscow", "Saint Petersburg", "Novosibirsk", "Yekaterinburg", "Kazan", "Nizhny Novogorod", "Samara", "Omsk", "Volgograd", "Ufa"])
    ]
    
    var selectedRow: Int = 0
    
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var countryName: UITextField!
    @IBOutlet var cityName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preselectedCountryAndCity()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return countries.count
        }else{
            if selectedRow < countries.count{
                return countries[selectedRow].cities.count
            }
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return countries[row].name
        }else{
            return countries[selectedRow].cities[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row -> ", row)
        if component == 0{
            selectedRow = row
            countryName.text = countries[row].name
            cityName.text = countries[selectedRow].cities[0]
        }else{
            cityName.text = countries[selectedRow].cities[row]
        }
        myPicker.reloadComponent(1)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        for country in countries{
            if country.name == countryName.text{
//                countries.contains(where: <#T##(Country) throws -> Bool#>)
            }
        }
    }
    
    @IBAction func addCountry(_ sender: Any) {
        if countries.contains(where: {$0.name == countryName.text!}){
         showAlert("Country already exist!")
        }else{
            if let name = countryName.text {
                countries.append(Country(name: name))
                myPicker.reloadComponent(0)
            }
        }
        
    }
    
    @IBAction func deleteCountry(_ sender: Any) {
        if let nameCountry = countryName.text {
            if countries.contains(where: {$0.name == countryName.text!}){
                countries.removeAll(where: {$0.name == nameCountry})
                setEmptyForCountryAndCity()
                myPicker.reloadAllComponents()
            }else{
                showAlert("Country doesn't exist, you can't delete")
            }
        }else{
            showAlert("Must provide a name of Country to be deleted")
        }
    }
    
    @IBAction func addCity(_ sender: Any) {
        if let nameCity = cityName.text{
            let firstChar = nameCity.prefix(1)
            let newName = nameCity.replacingCharacters(in: ...nameCity.startIndex, with: firstChar.uppercased())
            
            if countries[selectedRow].cities.contains(where: {$0 == newName}){
                showAlert("City already exist")
            }else{
                countries[selectedRow].cities.append(newName)
                myPicker.reloadComponent(1)
            }
        }
    }
    
    @IBAction func deleteCity(_ sender: Any) {
        if let nameCity = cityName.text{
            if countries[selectedRow].cities.contains(where: {$0 == nameCity}){
                countries[selectedRow].cities.removeAll(where: {$0 == nameCity})
                myPicker.reloadComponent(1)
                setEmptyForCountryAndCity()
            }else{
                showAlert("City doesn't exist, you can't delete")
            }
        }else{
            showAlert("Must provide a name of City to be deleted")
        }
    }
    
    func preselectedCountryAndCity(){
        countryName.text = countries[selectedRow].name
        cityName.text = countries[selectedRow].cities[0]
    }
    
    func setEmptyForCountryAndCity(){
        countryName.text = ""
        cityName.text = ""
    }
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}

