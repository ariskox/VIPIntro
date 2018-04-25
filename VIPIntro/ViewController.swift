//
//  ViewController.swift
//  VIPIntro
//
//  Created by Giorgos Fragkiadakis on 24/04/2018.
//  Copyright © 2018 Giorgos Fragkiadakis. All rights reserved.
//

import UIKit

protocol VCWithLoaderProtocol {
    var activityIndicator: UIActivityIndicatorView! { get }

    func startLoader()
    func stopLoader()
}

extension VCWithLoaderProtocol {
    func startLoader() {
        activityIndicator.startAnimating()
    }
    
    func stopLoader() {
        activityIndicator.stopAnimating()
    }
}

class ViewController: UIViewController, VCWithLoaderProtocol {
    var interactor: InteractorAProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.interactor.refreshView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gotoProfile() {
        Route.profile(state: interactor.state).pushFrom(self)
    }
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBAction func segmentChanged(_ sender: Any) {
        self.interactor.doSomethingOnSegmentChange(newValue: self.segmentControll.selectedSegmentIndex)
    }
}

