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
            let vc = ViewController.instantiate(fromAppStoryboard: .main)
            vc.interactor = InteractorPresenterA(state: AppState.fromStorage(), vc: vc)
            return vc
        case .profile(let state):
            let vc = ProfileViewController.instantiate(fromAppStoryboard: .main)
            vc.interactor = ProfilePresenterInteractor(state: state, vc: vc)
            return vc
        }
    }
    
}

protocol RouteProtocol {
    var viewController: UIViewController { get }
}

extension RouteProtocol {
    func pushFrom(_ origin: UIViewController) {
        origin.navigationController?.pushViewController(viewController, animated: true)
    }
    func inNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self.viewController)
    }
}
