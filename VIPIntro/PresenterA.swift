//
//  PresenterA.swift
//  VIPIntro
//
//  Created by Giorgos Fragkiadakis on 24/04/2018.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class InteractorPresenterA {
    weak var vc: ViewController?
    var state: AppState

    required init(state: AppState = AppState(), vc: ViewController) {
        self.vc = vc
        self.state = state
    }
    
    func showPreselectedGender(value: Int) {
        vc?.setSelectedIndex(value)
    }

    func doSomethingOnSegmentChange(newValue: Int)  {
        state.gender = newValue
        state.savetoStorage()
        
        vc?.startLoader()
        // Do something for 1 second
        let t = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: t) {
            self.vc?.stopLoader()
            self.vc?.view.backgroundColor = (newValue==0) ? .green : .red
            self.vc?.gotoProfile()
        }
    }
    
    func refreshView() {
        showPreselectedGender(value: state.gender)
    }
}
