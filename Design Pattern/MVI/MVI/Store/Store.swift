//
//  Store.swift
//  MVI
//
//  Created by aleksandar.aleksic on 20.7.21..
//

import Foundation
import RxSwift
import RxCocoa

//single sorce of truth
var mainStore: BehaviorRelay<State> = BehaviorRelay<State>(value: InitialState())
