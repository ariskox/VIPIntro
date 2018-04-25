//
//  Route.swift
//  VIPIntro
//
//  Created by Aris Koxaras on 24/4/18.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import UIKit

enum Route: RouteProtocol {
    case main
    case profile(state: AppState)
    
    var viewController: UIViewController {
        switch self {
        case .main:
            return AppStoryboard.Main.initialViewController()!
        case .profile(let state):
            let vc = ProfileViewController.instantiate(fromAppStoryboard: .Main)
            
            let pres = ProfilePresenter.init(vc: vc)
            let inter = ProfileInteractor.init(presenter: pres, state: state)
            vc.interactor = inter
            
            return vc
        }
    }
    
}

protocol RouteProtocol {
    var viewController: UIViewController { get }
}

extension RouteProtocol {
    func pushFrom(_ origin: UIViewController) {
        origin.navigationController?.pushViewController(self.viewController, animated: true)
    }
}
