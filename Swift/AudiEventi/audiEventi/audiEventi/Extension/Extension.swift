//
//  Extension.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 7.7.21..
//

import Foundation

extension URL{
    func withHTTPS() -> URL!{
        var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        component?.scheme = "https"
        return component?.url
    }
}

extension BurgerVC{
    
    @objc func namedActionToShow(button: BurgerButton) {

        switch button.buttonKey {
        case SideMenu.SIDE_MENU_GUEST_HOME_PAGE.rawValue:
            if isUserAuthenticated{
                showViewController(identifier: ConfigData.homePremiumViewController, driveTeritory: 0)
            }else{
                showViewController(identifier: ConfigData.homeGuestViewController, driveTeritory: 0)
            }
        case SideMenu.SIDE_MENU_GUEST_EVENT_LIST.rawValue:
            showViewController(identifier: ConfigData.eventListViewController, driveTeritory: 0)
        case SideMenu.SIDE_MENU_GUEST_COUPON_LOGIN.rawValue:
            showAlertForCoupon()
        case SideMenu.SIDE_MENU_GUEST_SETTINGS.rawValue:
            showViewController(identifier: ConfigData.settingsViewController, driveTeritory: 0)
        case SideMenu.SIDE_MENU_PREMIUM_ADE.rawValue:
            showViewController(identifier: ConfigData.driveExperienceTerritoryViewController, driveTeritory: 1)
        case SideMenu.SIDE_MENU_PREMIUM_LOCATION.rawValue:
            showViewController(identifier: ConfigData.driveExperienceTerritoryViewController, driveTeritory: 2)
        case SideMenu.SIDE_MENU_PREMIUM_EVENT_INFO.rawValue:
            showViewController(identifier: ConfigData.contactAndInfoViewController, driveTeritory: 0)
        default:
            return
        }
    }
  
}
