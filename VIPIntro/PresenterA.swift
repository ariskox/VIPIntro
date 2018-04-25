//
//  PresenterA.swift
//  VIPIntro
//
//  Created by Giorgos Fragkiadakis on 24/04/2018.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class PresenterA {
    weak var vc: ViewController?
    
    required init(vc: ViewController) {
        self.vc = vc
    }
    
    func didSomethingOnSegmentChange(value: Int) {
        print("lala = \(value)")
        vc?.view.backgroundColor = (value==0) ? .green : .red
        vc?.gotoProfile()
    }
    
    func startLoader() {
        vc?.startLoader()
    }
    
    func stopLoader() {
        vc?.stopLoader()
    }

    func showPreselectedGender(value: Int) {
        vc?.segmentControll.selectedSegmentIndex = value
    }
}
