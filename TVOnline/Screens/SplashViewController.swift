//
//  SplashViewController.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/16/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    private var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = .black
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
        }
    }
}
