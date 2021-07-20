//
//  DriveExperienceTerritoryVC.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 13.7.21..
//

import UIKit

class DriveExperienceTerritoryVC: AudiEventVC {

    @IBOutlet var titleCategory: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var litleDescription: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var mainDescription: UITextView!
    @IBOutlet var sliderImage: UIImageView!
    
    var arrayImagesForSlider: [UIImage] = []
    var currentSliderImages: Int = 0
    var sizeOfImagesForSlider: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareNavigationBar()
        
        if experienceOrTerritoryToShow == 1{
            setDriveExperienceData()
        }else if experienceOrTerritoryToShow == 2{
            setTerritoryData()
        }
        
    }
    
    @IBAction func showPrevisionImage(_ sender: Any) {
        if currentSliderImages > 0{
            currentSliderImages -= 1
        } else {
            currentSliderImages = sizeOfImagesForSlider
        }
        sliderImage.image = arrayImagesForSlider[currentSliderImages]
    }
    
    @IBAction func showNextImage(_ sender: Any) {
        if currentSliderImages < sizeOfImagesForSlider{
            currentSliderImages += 1
        } else {
            currentSliderImages = 0
        }
        sliderImage.image = arrayImagesForSlider[currentSliderImages]
    }
    
    
    //MARK: Preparing Data to show
    func setDriveExperienceData(){
        let driveExperience = FetchedData.driveExperience
        sizeOfImagesForSlider = (driveExperience?.sliderImage.count)! - 1
        
        titleCategory.text = "Audi Driving Experience"
        mainTitle.text = driveExperience?.titleAde
        subtitle.text = driveExperience?.subtitleAde
        mainDescription.text = driveExperience?.description
        
        if let urlString = driveExperience?.imageAde.href, let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url){ (data,response,error) in
                if let data = data{
                    DispatchQueue.main.async {
                        self.mainImage.image = UIImage(data: data)
                    }
                }

            }.resume()
        }

        if let arrayOfImages = FetchedData.driveExperience?.sliderImage.count{
            for i in 0...arrayOfImages - 1{
                if let urlString = FetchedData.driveExperience?.sliderImage[i].href, let url = URL(string: urlString){
                    URLSession.shared.dataTask(with: url){ (data,response,error) in
                        if let data = data{
                            DispatchQueue.main.async {
                                if i == 0{
                                    self.sliderImage.image = UIImage(data: data)
                                }
                                self.arrayImagesForSlider.append(UIImage(data: data)!)
                            }
                        }

                    }.resume()
                }
            }
        }
        
    }
    
    func setTerritoryData(){
        let placesAndTerritory = FetchedData.placesAndTerritory
        sizeOfImagesForSlider = (placesAndTerritory?.placesSlider.count)! - 1
        
        titleCategory.text = "Luoghi e Territorio"
        mainTitle.text = placesAndTerritory?.title
        litleDescription.text = placesAndTerritory?.placeTitle
        subtitle.text = placesAndTerritory?.placeSubtitle
        mainDescription.text = placesAndTerritory?.description
        
        if let urlString = placesAndTerritory?.imagePlace.href, let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url){ (data,response,error) in
                if let data = data{
                    DispatchQueue.main.async {
                        self.mainImage.image = UIImage(data: data)
                    }
                }

            }.resume()
        }
        
        if let arrayOfImages = FetchedData.placesAndTerritory?.placesSlider.count{
            for i in 0...arrayOfImages - 1{
                if let urlString = FetchedData.placesAndTerritory?.placesSlider[i].href, let url = URL(string: urlString){
                    URLSession.shared.dataTask(with: url){ (data,response,error) in
                        if let data = data{
                            DispatchQueue.main.async {
                                if i == 0{
                                    self.sliderImage.image = UIImage(data: data)
                                }
                                self.arrayImagesForSlider.append(UIImage(data: data)!)
                            }
                        }

                    }.resume()
                }
            }
        }
    }


}
