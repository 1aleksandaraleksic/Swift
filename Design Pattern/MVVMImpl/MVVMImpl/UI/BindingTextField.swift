//
//  BindingTextField.swift
//  ImplementMVP
//
//  Created by aleksandar.aleksic on 19.7.21..
//

import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> () = { _ in }
    
    func subscribe(callback: @escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
    
}

class BindingSegmentedControl: UISegmentedControl {
    
    var selectionChanged: (Int) -> () = { _ in }
    
    func subscribe(callback: @escaping (Int) -> ()) {
        
        self.selectionChanged = callback
        self.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
    }
    
    @objc func selectionDidChange() {

        self.selectionChanged(self.selectedSegmentIndex)
    }
    
}
