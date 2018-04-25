//
//  ProfilePresenter.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class ProfilePresenter {
    weak var vc: ProfileViewController?
    
    init(vc: ProfileViewController) {
        self.vc = vc
    }
    
    func showUserGenderSelection(gender: Int) {
        
        vc?.genderLabel.text = String(gender)
    }
}
