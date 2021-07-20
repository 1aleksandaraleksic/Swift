//
//  HobbyCV.swift
//  AboutMe
//
//  Created by aleksandar.aleksic on 5/25/21.
//

import UIKit

class HobbyCV: UIViewController, UICollectionViewDataSource {
    
    let sportArray = [
        ["Kosarka", "nba"],
        ["Americki Fudbal", "nfl"],
        ["Formula 1", "f1"],
        ["Plivanje", "swimming"],
        ["Parkur", "parkour"]
    ]
    
    let moviesArray = [
        ["Tenet", "tenet"],
        ["Inception", "inception"],
        ["Game of thrones", "gameOfThrones"],
        ["La Casa De Papel", "laCasaDePapel"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.clipsToBounds = true
    }
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var moviesCollectionView: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == myCollectionView ? sportArray.count : moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == myCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as? MyCollectionCell
            cell?.sportName.text = sportArray[indexPath.row][0]
            cell?.sportImage.image = UIImage(named: sportArray[indexPath.row][1])
            return cell!
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as? MyCollectionCell
            cell?.sportName.text = moviesArray[indexPath.row][0]
            cell?.sportImage.image = UIImage(named: moviesArray[indexPath.row][1])
            return cell!
        }
 
    }
    

}
