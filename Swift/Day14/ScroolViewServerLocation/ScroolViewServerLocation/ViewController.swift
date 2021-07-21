//
//  ViewController.swift
//  ScroolViewServerLocation
//
//  Created by aleksandar.aleksic on 5/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeABorderToView(borderView1)
        makeABorderToView(borderView2)
        makeABorderToView(borderView3)
        makeABorderToView(borderView4)
        makeABorderToView(borderView5)
        makeABorderToView(borderView6)
        makeABorderToView(borderView7)
        makeABorderToView(borderView8)
        makeABorderToView(borderView9)
        makeABorderToView(borderView10)
    }

    @IBOutlet var borderView1: UIView!
    @IBOutlet var borderView2: UIView!
    @IBOutlet var borderView3: UIView!
    @IBOutlet var borderView4: UIView!
    @IBOutlet var borderView5: UIView!
    @IBOutlet var borderView6: UIView!
    @IBOutlet var borderView7: UIView!
    @IBOutlet var borderView8: UIView!
    @IBOutlet var borderView9: UIView!
    @IBOutlet var borderView10: UIView!
    
    func makeABorderToView(_ view: UIView){
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.cyan.cgColor
        view.layer.cornerRadius = 15
    }
}

