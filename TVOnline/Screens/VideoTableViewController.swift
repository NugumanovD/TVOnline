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
    private var refresh: UIRefreshControl!
    
    let worker = NetWorker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: Cell.identifierTableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        setupNavigationBar()
        
    }
    
    func randomNumberForPage() -> Int{
        let number = Int.random(in: 1 ..< 900)
        return number
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .clear
        self.navigationItem.title = "Видео"
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(find))
        searchItem.tintColor = UIColor(cgColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.9465699914))
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }
    
    @objc func find() {
        print("Find")
    }
    
    
    // MARK: - TableView Delegate
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifierTableView, for: indexPath) as! VideoTableViewCell
        cell.backgroundColor = .clear
        cell.setupTableViewCell()
        DispatchQueue.main.async {
            
            switch indexPath.row {
                
            case 0:
                cell.headerNameResource.text = "IVI"
                cell.getData(number: self.randomNumberForPage())
            case 1:
                cell.headerNameResource.text = "MEGOGO"
                cell.getData(number: self.randomNumberForPage())
            case 2:
                cell.headerNameResource.text = "AMEDIATEKA"
                cell.getData(number: self.randomNumberForPage())
            default:
                break
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
}
