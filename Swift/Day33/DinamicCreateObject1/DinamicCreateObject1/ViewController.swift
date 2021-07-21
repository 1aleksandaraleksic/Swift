//
//  ViewController.swift
//  DinamicCreateObject1
//
//  Created by aleksandar.aleksic on 6/10/21.
//

import UIKit

class ViewController: UIViewController {

    var nextYPosition:Int = 110
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createView(_ sender: Any) {
//        createView()
        createNewView()
       
    }
    
    func createView(){
        let view = UIView()
        
//        view.frame.origin.x = 50
//        view.frame.origin.y = 200
//
//        view.frame.size.width = 350
//        view.frame.size.height = 150
        view.frame = CGRect(x: 15, y: 150, width: 300, height: 150)
        
        view .backgroundColor = .red
        
        self.view.addSubview(view)
    }
    
    //klikom na dugme create View kreirati ljubicasti kvadrat dimenzije 100 x 100 na rastojanju 50 po y osi

    func createNewView(){
        let newView = UIView()
        newView.frame = CGRect(x: 20, y: nextYPosition, width: 100, height: 100)
        newView.backgroundColor = .purple
        
        nextYPosition += 110
        
        self.view.addSubview(newView)
        
    }
}

