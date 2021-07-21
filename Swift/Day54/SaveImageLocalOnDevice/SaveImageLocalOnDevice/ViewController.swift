//
//  ViewController.swift
//  SaveImageLocalOnDevice
//
//  Created by aleksandar.aleksic on 9.7.21..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageToSave: UIImageView!{
        didSet {
            imageToSave.image = UIImage(named: "A1 sportback (2018)")
        }
    }
    @IBOutlet var saveImage: UIButton!{
        didSet{
            saveImage.addTarget(self, action: #selector(ViewController.save), for: .touchUpInside)
        }
    }
    @IBOutlet var savedImage: UIImageView!
    @IBOutlet var displaySavedImage: UIButton!{
        didSet{
            displaySavedImage.addTarget(self, action: #selector(ViewController.display), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @objc func save (){
        if let oneImage = imageToSave.image{
            DispatchQueue.global(qos: .background).async {
                self.storeImage(image: oneImage, for: "audi", withStorageType: .fileSystem)
            }
        }
    }
    
    @objc func display(){
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retriveImage(forKey: "audi", inStorageType: .fileSystem){
                DispatchQueue.main.async {
                    self.savedImage.image = savedImage
                }
            }
        }
    }
    
    
    func storeImage(image:UIImage, for key: String, withStorageType storageType: StorageType){
        if let pngRepresentation = image.pngData(){
            switch storageType {
            case .fileSystem:
                //Save to disk
                if let filePath = filePath(forKey: key){
                    do {
                        try pngRepresentation.write(to: filePath, options: .atomic)
                    } catch let error{
                        print("Saving file resulted in error: ", error)
                    }
                }
                break
            case .userDefaults:
                //Save to user defaults
                UserDefaults.standard.setValue(pngRepresentation, forKey: key)
                break
            default:
                break
            }
        }
    }
    
    func retriveImage(forKey key: String, inStorageType storageType: StorageType) -> UIImage?{
        switch storageType {
        case .fileSystem:
            //Retrive image from disk
            if let filePath = filePath(forKey: key),
               let fileData = FileManager.default.contents(atPath: filePath.path),
               let image = UIImage(data: fileData){
                return image
            }
        case .userDefaults:
            //Retrive image from user defaults
            if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
               let image = UIImage(data: imageData){
                return image
            }
        }
        return nil
    }

    func filePath(forKey key: String) -> URL?{
        let fileManager = FileManager.default
        
        guard let documentURL = fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return documentURL.appendingPathComponent(key + ".png")
    }

}

