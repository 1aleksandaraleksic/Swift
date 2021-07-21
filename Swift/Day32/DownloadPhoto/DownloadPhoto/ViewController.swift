//
//  ViewController.swift
//  DownloadPhoto
//
//  Created by aleksandar.aleksic on 6/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func show(_ sender: Any) {
        
        prepareImage()
    }
    
    func prepareImage(){
        if let url = URL(string: textField.text!){
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            } .resume()
        }
    }
    
}

