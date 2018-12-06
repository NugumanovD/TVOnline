//
//  CollectionViewCell.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 10/27/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import UIKit

protocol VideoCollectionCellProtocol: NSObjectProtocol {
    func didPressedCell(sender: Any)
}

class VideoCollectionViewCell: UICollectionViewCell {
    
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
        label.font = label.font.withSize(16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let yearLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func configure(image: String) {
        guard let urlImage = URL(string: Resource.imageURL + image) else { return }
        let imageView: UIImageView = (self.imageView) 
        DispatchQueue.global().async {
            do {
                let data = try! Data(contentsOf: urlImage)
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
    }
    
    func setupCell() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(yearLabel)
        
        let views = ["image": imageView, "name": nameLabel, "year": yearLabel]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[image]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[name]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-3-[year]-3-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[image(180)][name][year]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
}
