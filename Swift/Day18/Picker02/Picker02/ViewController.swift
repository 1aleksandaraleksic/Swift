//
//  ViewController.swift
//  Picker02
//
//  Created by aleksandar.aleksic on 5/20/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let cars = ["Mercedes", "BMW", "Audi", "Zastava", "Toyota", "Nissan", "Reanult", "Opel"]
    let colors = ["white", "blue", "red", "purple", "yellow", "orange", "black"]

    @IBOutlet var myPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return cars.count
        }else{
            return colors.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return cars[row]
        }else{
            return colors[row]
        }
    }

}

