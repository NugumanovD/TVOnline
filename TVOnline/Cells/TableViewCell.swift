//
//  TableViewCell.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/26/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let worker = NetWorker()
    var playList = [Result]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Cell.identifierCollectionView)
//        self.setupTableViewCell()
        getData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collectionViewData: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var headerNameResource: UILabel = {
        let header = UILabel()
        
        header.textColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.9465699914)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        return header
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Еще >", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.9465699914), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(more), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc func more() {
        print("I'm here")
    }
    
    func setupTableViewCell() {
        addSubview(collectionViewData)
        addSubview(headerNameResource)
        addSubview(moreButton)
        collectionViewData.backgroundColor = .clear
        collectionViewData.delegate = self
        collectionViewData.dataSource = self
        
        collectionViewData.register(CollectionViewCell.self, forCellWithReuseIdentifier: Cell.identifierCollectionView)
        
        let views = ["collection": collectionViewData, "header": headerNameResource, "moreButton": moreButton]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[header]-[moreButton]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[moreButton]-5-[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[header]-10-[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
    
    func getData() {

        let downLoadData: (Data?, Error?) -> Void = { [weak self] data, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }

            let filmItems = try? JSONDecoder().decode(TheMovieDB.self, from: data)
            self!.playList = (filmItems?.results)!
//            print(filmItems)
            
        }
        self.worker.loadData(completion: downLoadData)
    }
}


// MARK: TableViewCell Delegate

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifierCollectionView, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async {
            
            cell.nameLabel.text = self.playList[indexPath.row].title
            cell.yearLabel.text = self.playList[indexPath.row].releaseDate
            cell.configure(image: self.playList[indexPath.row].posterPath)
        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 14, left: 12, bottom: 20, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 20) / 3, height: frame.height - 20)
    }
    
}
