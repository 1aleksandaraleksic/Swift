//
//  FetchedData.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 5.7.21..
//

import Foundation

class FetchedData{
    
    static var elementsNameList: Dictionary<String, String>? = Dictionary()
    static var sideElementsPremium: [Int : [String]]? = [:]
    static var sideElementsGuest: [Int : [String]]? = [:]
    
    static var publicEventiList: [PublicEvent]? = []
    static var premiumEventiList: [PremiumEvent]? = []
    static var foodExperienceList: [FoodExperience]? = []
    static var placesAndTerritory: PlacesAndTerritory?
    static var contactAndInfoList: [ContactAndInfo]? = []
    static var driveExperience: AudiDriveExperience?
    static var notificationsList: [Notifications]? = []
    static var surveyList: [Question]? = []
    
    static func fetchElementsNameList(){
        DataPreparation.fetchLangs(url: DataPreparation.url) { (result) in
            guard let result = result else { return }

            var elementGuestCount = 0
            var elementPremiumCount = 0
            
            for item in Mirror(reflecting: result).children{
                
                let label: String = item.label!.description
                let value: String = item.value as! String
                
                if label.range(of:"SIDE_MENU_GUEST") != nil {
                    FetchedData.sideElementsGuest?[elementGuestCount] = [label, value]
                    FetchedData.sideElementsPremium?[elementPremiumCount] = [label, value]
                    elementGuestCount += 1
                    elementPremiumCount += 1
                }else if label.range(of: "SIDE_MENU_PREMIUM") != nil{
                    FetchedData.sideElementsPremium?[elementPremiumCount] = [label, value]
                    elementPremiumCount += 1
                }else{
                    FetchedData.elementsNameList?[label] = value
                }
            }
                        
        }
    }
    
}
