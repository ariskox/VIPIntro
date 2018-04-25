//
//  ProfileViewController.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var genderLabel: UILabel!

    var interactor: ProfilePresenterInteractor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        interactor.processUserGenderSelection()
    }

}
