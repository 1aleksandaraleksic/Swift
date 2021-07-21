//
//  ViewController.swift
//  SpacePhoto
//
//  Created by aleksandar.aleksic on 6/8/21.
//

import UIKit

class ViewController: UIViewController {

    let photoInfoController = PhotoInfoController()
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var copyrightLavel: UILabel!
    @IBOutlet var descriptionL: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionL.text = ""
        copyrightLavel.text = ""
        navigationItem.title = "welcome"
        
        photoInfoController.fetchPhotoInfo{(photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
            
        }
    }

    
    func updateUI(with photoInfo: PhotoInfo){
//        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
//            guard let data = data,
//                  let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                self.descriptionL.text = photoInfo.description
//                self.navigationItem.title = photoInfo.title
//                self.image.image = image
//
//                if let copyRight = photoInfo.copyright{
//                    self.copyrightLavel.text = "copyright: \(copyRight)"
//                }else{
//                    self.copyrightLavel.isHidden = true
//                }
//            }
//        }
//        task.resume()
        
        guard  let url = photoInfo.url.withHTTPS() else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                              let image = UIImage(data: data) else { return }
                        DispatchQueue.main.async {
                            self.descriptionL.text = photoInfo.description
                            self.navigationItem.title = photoInfo.title
                            self.image.image = image
            
                            if let copyRight = photoInfo.copyright{
                                self.copyrightLavel.text = "copyright: \(copyRight)"
                            }else{
                                self.copyrightLavel.isHidden = true
                            }
                        }
                    }
                    task.resume()
    }
   

}

