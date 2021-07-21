//
//  ViewController.swift
//  DimanicCreateObject2
//
//  Created by aleksandar.aleksic on 6/10/21.
//

import UIKit

class ViewController: UIViewController {

    let imageArray = [1 : "apple.black", 2: "apple.color", 3 : "apple.silver"]
    
    var selectedImage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func changeImage(_ sender: Any) {
        createAppleImage()
    }
    
    func createAppleImage(){

        let image = UIImage(named: imageArray[selectedImage]!)
        let imageView = UIImageView(image: image)
        
        imageView.frame = CGRect(x: 15, y: 100, width: 50, height: 50)
        
        self.view.addSubview(imageView)
        
        if selectedImage == 3{
            selectedImage = 1
        }else{
            selectedImage += 1
        }
    }

}

