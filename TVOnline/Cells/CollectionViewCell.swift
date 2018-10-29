//
//  CollectionViewCell.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/27/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupCell() {
        addSubview(imageView)
        
        let views = ["image": imageView]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[image]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-3-[image]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
}
