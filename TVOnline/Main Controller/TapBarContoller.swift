//
//  TapBarcontoller.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TapBarContoller: UITabBarController {
    
    
    
    private var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private var viewControllerList = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityindicator()
        makeServiceCall()
        setupTabBarElement(vc: VideoTableViewController(), title: "Video", image: "video")
        setupTabBarElement(vc: TVViewController(), title: "TV", image: "tv")
        setupTabBarElement(vc: SubcribeViewController(), title: "Subcribe", image: "follower")
        setupTabBarElement(vc: MyProfileViewController(), title: "Profile", image: "profile")
        setupTabBarElement(vc: SettingsScreenController(), title: "Settings", image: "settings")
    }
    
    func setupTabBarElement(vc: UIViewController, title: String, image: String)  {
        let controller = UINavigationController(rootViewController: vc)
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)
        controller.navigationController?.viewControllers = viewControllerList
        navigationController?.navigationBar.barTintColor = .clear
        viewControllerList.append(controller)
        viewControllers = viewControllerList
   }
    private func setupActivityindicator() {
        view.addSubview(activityIndicator)
        activityIndicator.color = .yellow
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = .black
    }
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
        }
        if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
            // navigate to protected page
        } else {
            // navigate to login screen
        }
    }
    
    
}



