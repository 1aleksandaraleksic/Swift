//
//  Config.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 2.7.21..
//

import Foundation

public struct ConfigData {
    
    static let segueHomeGuestVC = "homeGuest"
    static let segueHomePremiumVC = "homePremium"
    
    static let burgerMenuCell = "burgerMenuCell"
    static let notificationCell = "notificationCell"
    static let driveExperienceTerritoryCell = "driveExperienceTerritoryCell"
    
    static let homeGuestViewController = "HomeGuestVC"
    static let homePremiumViewController = "HomePremiumVC"
    static let burgerViewController = "BurgerVC"
    static let eventListViewController = "EventListVC"
    static let settingsViewController = "SettingsVC"
    static let notificationViewController = "NotificationVC"
    static let driveExperienceTerritoryViewController = "DriveExperienceTerritoryVC"
    static let contactAndInfoViewController = "ContactAndInfoVC"

}

enum SideMenu: String {
    case SIDE_MENU_GUEST_COUPON_LOGIN
    case SIDE_MENU_GUEST_EVENT_LIST
    case SIDE_MENU_GUEST_HOME_PAGE
    case SIDE_MENU_GUEST_SETTINGS
    case SIDE_MENU_PREMIUM_ADE
    case SIDE_MENU_PREMIUM_EVENT_DETAIL
    case SIDE_MENU_PREMIUM_EVENT_INFO
    case SIDE_MENU_PREMIUM_FOOD_EXPERIENCE
    case SIDE_MENU_PREMIUM_LOCATION
    case SIDE_MENU_PREMIUM_SURVEY
}

