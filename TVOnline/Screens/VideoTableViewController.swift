//
//  VideoTableViewController.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/25/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import UIKit

class VideoTableViewController: UITableViewController {
    var items = TableViewCell()
    let worker = NetWorker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Cell.identifierTableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .clear
        self.navigationItem.title = "Видео"
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(find))
        
        searchItem.tintColor = UIColor(cgColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.9465699914))
        
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    @objc func find() {
        print("Find")
    }
    
    
    // MARK: - TableView Delegate
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifierTableView, for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
        
        switch indexPath.row {
        case 0:
            cell.headerNameResource.text = "IVI"
        case 1:
            cell.headerNameResource.text = "MEGOGO"
        case 3:
            cell.headerNameResource.text = "AMEDI"
        default:
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 3
    }
}
