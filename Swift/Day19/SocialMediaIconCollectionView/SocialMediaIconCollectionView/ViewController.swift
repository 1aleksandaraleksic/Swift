//
//  ViewController.swift
//  SocialMediaIconCollectionView
//
//  Created by aleksandar.aleksic on 5/21/21.
//

import UIKit

struct SocialMedia {
    let name: String
    let image: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let socialMediaList: [SocialMedia] = [
        SocialMedia(name: "facebook", image: UIImage(named: "facebook")!),
        SocialMedia(name: "youtube", image: UIImage(named: "youtube")!),
        SocialMedia(name: "whatsapp", image: UIImage(named: "whatsapp")!),
        SocialMedia(name: "viber", image: UIImage(named: "viber")!),
        SocialMedia(name: "vKontakte", image: UIImage(named: "vKontakte")!),
        SocialMedia(name: "instagram", image: UIImage(named: "instagram")!),
        SocialMedia(name: "bing", image: UIImage(named: "bing")!),
        SocialMedia(name: "digg", image: UIImage(named: "digg")!),
        SocialMedia(name: "line", image: UIImage(named: "line")!),
        SocialMedia(name: "behance", image: UIImage(named: "behance")!),
        SocialMedia(name: "flickr", image: UIImage(named: "flickr")!),
        SocialMedia(name: "Google +", image: UIImage(named: "google_plus")!),
        SocialMedia(name: "pinterest", image: UIImage(named: "pinterest")!)

    ]

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var largeNameLable: UILabel!
    @IBOutlet var largeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialMediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell
        
        cell?.label.text = socialMediaList[indexPath.row].name
        cell?.imageView.image = socialMediaList[indexPath.row].image
        
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        largeImageView.image = socialMediaList[indexPath.row].image
        largeNameLable.text = socialMediaList[indexPath.row].name
    }
}

