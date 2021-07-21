//
//  ViewController.swift
//  DinamicCreateObject3
//
//  Created by aleksandar.aleksic on 6/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var slika: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        createImage()
        createButton()
    }
    
    @objc func createImage(){
        slika = UIImageView(frame: CGRect(x: 10, y: 30, width: 50, height: 50))
        slika?.contentMode = .scaleAspectFill
        
        if let s = slika{
            view.addSubview(s)
            s.image = UIImage(named: "apple.black")
        }
    }
    
    func createButton(){
        let dugme = UIButton()
        
        dugme.frame = CGRect(x: 50, y: 300, width: 200, height: 40)
        dugme.backgroundColor = .blue
        dugme.contentMode = .center
        dugme.setTitle("Prikazi i ukloni sliku", for: .normal)
        
        dugme.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        
        self.view.addSubview(dugme)
    }
    
    @objc func changeImage(){
        if let s = slika {
            s.isHidden = !s.isHidden
        }
    }


}

// napraviti textfield u storybord upisati broj mora broj da bude koji broj treba da se iskreira

