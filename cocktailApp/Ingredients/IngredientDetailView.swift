//
//  IngredientDetail.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-25.
//

import UIKit
import PinLayout

class IngredientDetailView: UIView {

    let imageIng: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fraise")
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let ingName: UILabel = {
        let label = UILabel()
        label.text = "Boisson à la fraise"
        label.font = UIFont(name: "Menlo-regular", size: 36)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ingDesc: UILabel = {
        let label = UILabel()
        label.text = "Blabla"
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
//        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(imageIng)
        addSubview(ingName)
        addSubview(ingDesc)
    }
    
//    private func setupConstraints() {
//
//    NSLayoutConstraint.activate([
//        imageIng.centerYAnchor.constraint(equalTo:centerYAnchor, constant: -130),
//        imageIng.centerXAnchor.constraint(equalTo:centerXAnchor),
//        imageIng.widthAnchor.constraint(equalToConstant:200),
//        imageIng.heightAnchor.constraint(equalToConstant:200)
//        ])
//
//    NSLayoutConstraint.activate([
//        ingName.topAnchor.constraint(equalTo:imageIng.bottomAnchor, constant: 25),
//        ingName.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 30),
//        ingName.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -30),
//        ])
//
//    NSLayoutConstraint.activate([
//        ingDesc.topAnchor.constraint(equalTo:ingName.bottomAnchor, constant: 20),
//        ingDesc.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 30),
//        ingDesc.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -30),
//        ])
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageIng.pin.size(CGSize(width: 200, height: 200)).center().marginTop(-130)
        ingName.pin.below(of: imageIng).marginTop(25).left(30).right(30).hCenter().sizeToFit(.width)
        ingDesc.pin.below(of: ingName).marginTop(20).left(30).right(30).hCenter().sizeToFit(.width)
        
    }
}
