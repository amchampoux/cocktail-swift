//
//  CocktailCell.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-02.
//

import UIKit

class CocktailCell: UICollectionViewCell {
    
    static let identifier = "CocktailCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Helvetica-light", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
  
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                               width: contentView.frame.size.width-10,
                               height: 50)
        myImageView.frame = CGRect(x: 0,
                                   y: 5,
                                   width: 100,
                                   height: 100)
        
        myImageView.layer.cornerRadius = myImageView.bounds.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
    }
}
