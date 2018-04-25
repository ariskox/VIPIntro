//
//  InteractorA.swift
//  VIPIntro
//
//  Created by Giorgos Fragkiadakis on 24/04/2018.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

protocol CommonInteractorForCaseAProtocol {
    
}

class InteractorA {
    private let presenter: PresenterB
    var state: AppState
    
    init(presenter: PresenterB, state: AppState = AppState()) {
        self.presenter = presenter
        self.state = state
    }
    
    func doSomethingOnSegmentChange(newValue: Int)  {
        state.gender = newValue
        state.savetoStorage()
        
        presenter.startLoader()
        // Do something for 1 second
        let t = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: t) {
            self.presenter.stopLoader()
            self.presenter.didSomethingOnSegmentChange(value: newValue)
        }
    }
    
    func refreshView() {
        presenter.showPreselectedGender(value: state.gender)
    }
}
