//
//  ViewController.swift
//  ProjectSix
//
//  Created by aleksandar.aleksic on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        halfCircle.layer.cornerRadius = 0.4 * halfCircle.layer.bounds.width
        
        plusButton.layer.cornerRadius = 0.5 * plusButton.layer.bounds.width
        
        playButton.layer.cornerRadius = 0.5 * playButton.layer.bounds.width
        
        shareButton.layer.cornerRadius = 18
        
        listOfSongStack.layer.cornerRadius = 20
        thirdView.layer.cornerRadius = 20
        currentSongView.layer.cornerRadius = 20
    }

    @IBOutlet var halfCircle: UIView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var shareButton: UIButton!

    @IBOutlet var thirdView: UIView!
    @IBOutlet var currentSongView: UIView!
    
    @IBOutlet var listOfSongStack: UIStackView!
}

