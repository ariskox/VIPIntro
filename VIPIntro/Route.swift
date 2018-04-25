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
            let presenter = PresenterA(vc: vc)
            vc.interactor = InteractorA(presenter: presenter, state: AppState.fromStorage())
            return vc
        case .profile(let state):
            let vc = ProfileViewController.instantiate(fromAppStoryboard: .main)
            let presenter = ProfilePresenter(vc: vc)
            vc.interactor = ProfileInteractor(presenter: presenter, state: state)
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
    
    var inNavigationController: UINavigationController {
        return UINavigationController(rootViewController: self.viewController)
    }
}
