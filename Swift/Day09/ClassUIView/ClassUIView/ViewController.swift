//
//  ViewController.swift
//  ClassUIView
//
//  Created by aleksandar.aleksic on 5/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
//
//        let blueView:UIView = UIView(frame:  rect)
//
//        blueView.backgroundColor = .blue
//        self.view.addSubview(blueView)
//
//        let redView = UIView(frame: CGRect(x: 10, y: 90, width: 150, height: 75))
//
//        redView.backgroundColor = .red
//
//        redView.layer.cornerRadius = 20
//
//        redView.layer.borderWidth = 3
//        redView.layer.borderColor = UIColor.blue.cgColor
//
//        self.view.addSubview(redView)
        
        //U desing time napraviti 3 view-a.
        // 1. da bude zut i da zauzima celu provrsinu ekrana
        // 2. da bude narandzast i da se nalazi proizvoljno, sa zaobljenim ivicama plave boje
        // 3. da se nalazi u zutom i da sa constraintsima: 20l, 20r, 50t, 50b
    
        narandzasti.layer.cornerRadius = 50
    }
    
    @IBOutlet var zuti: UIView!
    @IBOutlet var narandzasti: UIView!
    @IBOutlet var crveni: UIView!
    

}

