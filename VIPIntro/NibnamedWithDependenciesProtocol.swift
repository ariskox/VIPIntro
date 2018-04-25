//
//  NibDependableViewProtocol.swift
//  WBLab
//
//  Created by George Fragiadakis on 06/09/2017.
//  Copyright © 2017 Fanis Giachos. All rights reserved.
//

import UIKit

// MARK: Logic
protocol NibnamedWithDependenciesProtocol {
    
    associatedtype Dependencies
    init(_ coder: NSCoder?, depedencies: Dependencies?)
    func configure(dependencies: Dependencies?)
    @discardableResult func loadFromNib(in containerView:UIView) -> UIView?
}

extension NibnamedWithDependenciesProtocol {
    
	
    func loadFromNib(in containerView:UIView) -> UIView? {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? UIView {
            
            containerView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            containerView.topAnchor.constraint(equalTo: view.topAnchor)
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor)
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor)
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
//            containerView.addConstraints(AFSELayoutConstraintsHelper.leadingTrailingTopBottomConstraints(forViewA: view, toViewB: containerView, withLeadingOffset: 0.0, trailingOffset: 0.0, topOffset: 0.0, bottomOffset: 0.0))
            return view
        }
        
        return nil
    }
}
