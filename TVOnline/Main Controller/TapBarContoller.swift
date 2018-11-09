//
//  TapBarcontoller.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TapBarContoller: UITabBarController {
    
    private var viewControllerList = [UIViewController]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarElement(vc: TVViewController(), title: "TV", image: "tv")
        setupTabBarElement(vc: VideoTableViewController(), title: "Video", image: "video")
        setupTabBarElement(vc: SubcribeViewController(), title: "Subcribe", image: "follower")
        setupTabBarElement(vc: MyProfileViewController(), title: "Profile", image: "profile")
        setupTabBarElement(vc: SettingsScreenController(), title: "Settings", image: "settings")
        
        
    }
    
    func setupTabBarElement(vc: UIViewController, title: String, image: String)  {
        let controller = UINavigationController(rootViewController: vc)
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)
        
        navigationController?.navigationBar.barTintColor = .clear
        viewControllerList.append(controller)
        viewControllers = viewControllerList
    }
    
    
}


