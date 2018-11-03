//
//  TableViewCell.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/26/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var playList = [FilmsList]()
    
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
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[header][moreButton]-15-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[header][collection]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
}


// MARK: TableViewCell Delegate

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifierCollectionView, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: playList[indexPath.row].posterCinema)
        cell.nameLabel.text = playList[indexPath.row].nameCinema
        cell.yearLabel.text = playList[indexPath.row].dateCinema
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - 40) / 3, height: frame.height - 40)
    }
    
    
    
}
