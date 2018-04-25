//
//  AppState.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import Foundation

class AppState: Codable {
    var gender: Int = 0
}

extension AppState {
    
    func savetoStorage() {
        UserDefaults.standard.set(gender, forKey: "gender")
        UserDefaults.standard.synchronize()
    }

    class func fromStorage() -> AppState {
        let st = AppState()
        st.gender = UserDefaults.standard.integer(forKey: "gender") 
        
        return st
    }
}
