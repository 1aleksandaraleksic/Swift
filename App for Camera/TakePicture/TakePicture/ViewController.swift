//
//  ViewController.swift
//  TakePicture
//
//  Created by aleksandar.aleksic on 15.7.21..
//

import UIKit

class ViewController: UIViewController {

    let picker = UIImagePickerController()
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var buttonTakePicture: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        startCamera()
    }
    
    func startCamera(){
        picker.sourceType = .camera
//        picker.delegate.self
        present(picker, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        imageView.image = image
    }
    
}

