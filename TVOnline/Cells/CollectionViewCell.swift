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
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupCell() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        let views = ["image": imageView, "label": nameLabel]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[image]-3-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[label]-3-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[image][label]|", options: [], metrics: nil, views: views))
        
    }
}
