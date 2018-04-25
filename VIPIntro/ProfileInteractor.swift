//
//  ProfileInteractor.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class ProfilePresenterInteractor {
    let state: AppState
    weak var vc: ProfileViewController?

    init(state: AppState, vc: ProfileViewController) {
        self.state = state
        self.vc = vc
    }
    
    func processUserGenderSelection() {
        vc?.genderLabel.text = String(state.gender)
    }
}
