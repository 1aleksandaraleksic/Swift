//
//  ViewController.swift
//  DinamicCreateObject4
//
//  Created by aleksandar.aleksic on 6/10/21.
//

import UIKit

class ViewController: UIViewController {

    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }
    
    func createTextField(){
        
        textField.frame = CGRect(x: 10, y: 40, width: 250, height: 40)
        textField.backgroundColor = .gray
        self.view.addSubview(textField)
    }
    
    func createButton(){
        let dugme = UIButton()
        
        dugme.frame = CGRect(x: 10, y: 100, width: 200, height: 40)
        dugme.backgroundColor = .blue
        dugme.contentMode = .center
        dugme.setTitle("Napravi trouglove", for: .normal)
        
        dugme.addTarget(self, action: #selector(showRectangle), for: .touchUpInside)
        
        self.view.addSubview(dugme)
    }
    
    var nizTrouglova = [CGRect]()
    
    @objc func showRectangle(){

        if let number = textField.text{
            if let intNumber:Int = Int(number){
                var yCord = 100
                for _ in 0..<intNumber {
                    let view = UIView()
                    let trougao = CGRect(x: 100, y: yCord, width: 150, height: 25)
                    view.frame = trougao
                    view.backgroundColor = .yellow
                    yCord += 30
//                    nizTrouglova!.append(trougao)
                    self.view.addSubview(view)
                }
            }else {
                print("morate uneti broj")
            }
        }
        textField.text = ""
    }


}

