//
//  MoustacheCell.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-06.
//

import UIKit
import PinLayout

class MoustacheCell: UICollectionViewCell {
    
    static let identifier = "MoustacheCell"
    
//    override var isSelected: Bool {
//        didSet {
//            myImageView.layer.borderWidth = isSelected ? 2 : 0
//        }
//    }
    
    var selection: Bool = false {
        didSet {
            myImageView.layer.borderWidth = selection ? 2 : 0
        }
    }
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.pin.all().width(100).height(100)
        myImageView.layer.cornerRadius = myImageView.bounds.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.layer.borderWidth = 0
        myImageView.image = nil
    }
}
