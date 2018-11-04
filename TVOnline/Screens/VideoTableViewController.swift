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
//        getData()
        
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
    
//    func getData() {
//        let myCompletion: (Data?, Error?) -> Void = { [weak self] data, error in
//            if let error = error {
//                print(error)
//                return
//            }
//            guard let data = data else { return }
//            let filmItems = try? JSONDecoder().decode(Welcome.self, from: data)
//            self!.items.playList = (filmItems?.results)!
//            print(self!.items.playList)
//    }
//        worker.swiftBookRequest(completion: myCompletion)
//    }
    
    
    // MARK: - TableView Delegate
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return /*infoList.count*/ 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifierTableView, for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
//        cell.playList = infoList[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(self.view.frame.size.height / 3)
        return self.view.frame.size.height / 3
    }
}
