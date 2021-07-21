//
//  Reducer.swift
//  MVI
//
//  Created by aleksandar.aleksic on 20.7.21..
//

import Foundation
import RxSwift
import RxCocoa

struct Reducer {
    // the reducer usually returns the AppState
    func getNext(store: BehaviorRelay<State>) -> AppState {
        let currentState = store.value
        return AppState(
            person: currentState.person,
            currentIndex: (currentState.currentIndex + 1) % currentState.person.count)
    }
}
