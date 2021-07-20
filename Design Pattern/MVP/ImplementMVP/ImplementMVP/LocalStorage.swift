//
//  LocalStorage.swift
//  ImplementMVP
//
//  Created by aleksandar.aleksic on 19.7.21..
//

import Foundation

class LocalStorage {
    
    var user: User?
    static let `default` = LocalStorage()
    
    private init() {
        
        user = getUser()
    }
    
    // get the user from remote or from local, based on your business
    private func getUser() -> User? {

        return User(name: "Omar Tarek", mobileNumber: "01007336222", email: "dev.omartarek@gmail.com", age: 26, gender: .male)
    }
}
