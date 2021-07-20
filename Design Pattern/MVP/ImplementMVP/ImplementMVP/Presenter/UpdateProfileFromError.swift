//
//  UpdateProfileFromError.swift
//  ImplementMVP
//
//  Created by aleksandar.aleksic on 19.7.21..
//

import Foundation

enum UpdateProfileFormError: Error {
    case emptyName
    case invalidMobileNumber
    case invalidEmailAddress
    case veryYoung
    
    var localizedDescription: String {
        
        switch self {
        case .emptyName:
            return "Please, enter your name"
        case .invalidMobileNumber:
            return "Please, enter a valid mobile number"
        case .invalidEmailAddress:
            return "Please, enter a valid email address"
        case .veryYoung:
            return "Minimum age should be 18"
        }

    }
}
