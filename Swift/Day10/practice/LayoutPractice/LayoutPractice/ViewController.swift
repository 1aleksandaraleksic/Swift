//
//  ViewController.swift
//  LayoutPractice
//
//  Created by aleksandar.aleksic on 5/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    var images: [UIImage] = []
    
    var counter: Int = 0
    var goUp: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "nature.jpg")!)
        images.append(UIImage(named: "Apple-logo.png")!)
        images.append(UIImage(named: "NY.jpg")!)
        images.append(UIImage(named: "road.jpg")!)
        
    }

    @IBOutlet var imageVIew: UIImageView!
    
    @IBAction func swapImage(_ sender: Any) {
        if goUp{
            counter += 1
            if counter == images.count-1 {
                goUp = false
            }
        }else{
            counter -= 1
            if counter == 0{
                goUp = true
            }
        }
        imageVIew.image = images[counter]
    }
    
    @IBAction func fullScreen(_ sender: Any) {
        let fullScreen = UIImageView(frame: view.bounds)
        fullScreen.tag = 5
        fullScreen.image = images[counter]
           view.addSubview(fullScreen)
        
        
        fullScreen.addSubview(createButton())
    }
    
    func createButton() -> UIButton{
        print("kreiranje dugmeta")
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: 40, height: 40))
        button.backgroundColor = .red
        button. = UIButton.ButtonType.close
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.tag = 1
        button.isEnabled = true
        return button
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("metodaaaa")
           let btnsendtag: UIButton = sender
           if btnsendtag.tag == 1 {

               dismiss(animated: false, completion: nil)
           }
       }
    
}

