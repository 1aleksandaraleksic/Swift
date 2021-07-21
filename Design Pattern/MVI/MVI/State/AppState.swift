//
//  AppState.swift
//  MVI
//
//  Created by aleksandar.aleksic on 20.7.21..
//

import Foundation
import RxSwift
import RxCocoa

protocol State {
    var person : [Person] {get}
    var currentIndex: Int {get}
}

struct InitialState: State {
    var person = [Person(name: "James"), Person(name: "Ahmed")]
    var currentIndex = 0
}

// this model represents a state at any given time
struct AppState: State {
    var person : [Person] = []
    var currentIndex = 0
}
