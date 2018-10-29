//
//  TableViewCell.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/26/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var imageArray = ["1","2","3","4","5","6"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Cell.identifierCollectionView)
        self.setupTableViewCell()
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
    
    func setupTableViewCell() {
        addSubview(collectionViewData)
        
        collectionViewData.backgroundColor = .clear
        collectionViewData.delegate = self
        collectionViewData.dataSource = self
        
        collectionViewData.register(CollectionViewCell.self, forCellWithReuseIdentifier: Cell.identifierCollectionView)
        
        
        let views = ["collection": collectionViewData]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifierCollectionView, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 40) / 3, height: frame.height - 40)
    }
    
}
