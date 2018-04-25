//
//  ProfileInteractor.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

protocol ProfileInteractorProtocol {
    var presenter: ProfilePresenterProtocol { get }
    var state: AppState { get }
    func processUserGenderSelection()
}

class ProfileInteractor: ProfileInteractorProtocol {
    let presenter: ProfilePresenterProtocol
    
    //Datastore
    let state: AppState
    
    init(presenter: ProfilePresenterProtocol, state: AppState) {
        self.presenter = presenter
        self.state = state
    }
    
    func processUserGenderSelection() {
        self.presenter.showUserGenderSelection(gender: state.gender)
    }
}
