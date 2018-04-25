//
//  ViewController.swift
//  VIPIntro
//
//  Created by Giorgos Fragkiadakis on 24/04/2018.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import UIKit

protocol VCWithLoaderProtocol {
    
    func startLoader()
    func stopLoader()
}

class ViewController: UIViewController, VCWithLoaderProtocol {
    func startLoader() {
        self.activityIndicator.startAnimating()
    }
    
    func stopLoader() {
        self.activityIndicator.stopAnimating()
    }

    private var interactor: InteractorA?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Setup here for now
        let presenter = PresenterB(vc: self)
        self.interactor = InteractorA(presenter: presenter, state: AppState.fromStorage())

        self.interactor?.refreshView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gotoProfile() {
        Route.profile(state: interactor!.state).pushFrom(self)
    }
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    @IBAction func segmentChanged(_ sender: Any) {
        
        self.interactor?.doSomethingOnSegmentChange(newValue: self.segmentControll.selectedSegmentIndex)
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

}

