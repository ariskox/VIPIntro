//
//  ProfileInteractor.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class ProfileInteractor {
    let presenter: ProfilePresenter
    
    //Datastore
    let state: AppState
    
    init(presenter: ProfilePresenter, state: AppState) {
        self.presenter = presenter
        self.state = state
    }
    
    func processUserGenderSelection() {
        
        self.presenter.showUserGenderSelection(gender: state.gender)
    }
}
