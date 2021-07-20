//
//  ViewController.swift
//  MVI
//
//  Created by aleksandar.aleksic on 20.7.21..
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var displayPerson: UIButton!

    private var intent:VCIntent?
    private let disposeBag = DisposeBag()
        
    public func update(with person: Event<State>) {
        if let element = person.element {
            personLabel.text = (element.person[element.currentIndex].name)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // this is an alternative to the initial state
        // mainStore.accept(AppState(person: [Person(name: "1"), Person(name: "2")], currentIndex: 0))            
        // setup the intent
        intent = VCIntent()
        intent?.bind(to: self)
        bindButton()
        
    }
        
    func bindButton() {
        displayPerson.rx.tap.bind {
            self.intent?.onNext()
        }.disposed(by: disposeBag)
    }

}

