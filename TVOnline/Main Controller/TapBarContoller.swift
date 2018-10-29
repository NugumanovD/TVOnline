//
//  TapBarcontoller.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TapBarContoller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewController()
    }
    
    func createViewController() {
        
        let videoTableView = VideoTableViewController()
        videoTableView.tabBarItem.title = "Video"
        videoTableView.tabBarItem.image = UIImage(named: "video")
        
        let viewController = ViewController()
        viewController.tabBarItem.title = "Second"
        
        viewControllers = [videoTableView, viewController]
        
    }
    
    
}
