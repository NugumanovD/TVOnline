//
//  TapBarcontoller.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//


import UIKit

class TapBarContoller: UITabBarController {
    
    var viewControllerList = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarElement(vc: TVViewController(), title: "TV", image: "tv")
        setupTabBarElement(vc: VideoTableViewController(), title: "Video", image: "video")
        setupTabBarElement(vc: SubcribeViewController(), title: "Subcribe", image: "follower")
        setupTabBarElement(vc: MyProfileViewController(), title: "Profile", image: "profile")
        setupTabBarElement(vc: SettingsScreenController(), title: "Settings", image: "settings")
    }
    
    func setupTabBarElement(vc: UIViewController, title: String, image: String)  {
        let controller = vc
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)
        
        controller.view.backgroundColor = .black
        viewControllerList.append(controller)
        viewControllers = (viewControllerList as! [UIViewController])
    }
    
    
    
    
    override func viewWillLayoutSubviews() {
        
        //        var tabFrame = tabBar.frame
        //        tabFrame.size.height = 80
        //        tabFrame.origin.y = self.view.frame.size.height - 90
        //        tabBar.frame = tabFrame
    }
    
    
}


