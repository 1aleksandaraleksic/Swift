//
//  ViewController.swift
//  Picker01
//
//  Created by aleksandar.aleksic on 5/20/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let countries = ["Serbia", "USA","UK", "China","Japan", "Canada", "Germany", "Spain", "Grecee", "Portugal", "Mexico"]
    
    @IBOutlet var pickerCountries: UIPickerView!
    @IBOutlet var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = countries[0]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text.text = countries[row]
    }

}

