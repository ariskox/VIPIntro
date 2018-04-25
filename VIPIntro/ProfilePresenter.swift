//
//  ProfilePresenter.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

protocol ProfilePresenterProtocol {
    weak var vc: ProfileViewController? { get }
    func showUserGenderSelection(gender: Int)
}

class ProfilePresenter: ProfilePresenterProtocol {
    weak var vc: ProfileViewController?
    
    init(vc: ProfileViewController) {
        self.vc = vc
    }
    
    func showUserGenderSelection(gender: Int) {
        vc?.genderLabel.text = String(gender)
    }
}
