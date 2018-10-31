//
//  VideoTableViewController.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import UIKit

enum Cell {
    static let identifierTableView = "tableView"
    static let identifierCollectionView = "collectionView"
}

class VideoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Cell.identifierTableView)
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//
//        return "tableView"
//    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifierTableView, for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
       
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}