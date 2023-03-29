//
//  CellIngredient.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-23.
//

import UIKit
import PinLayout

class IngredientCell: UITableViewCell {
    
    static let identifier = "ingCell"

    let containerView: UIView = {
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

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
        label.font = UIFont(name: "Menlo-regular", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ingDesc: UILabel = {
        let label = UILabel()
        label.text = "Blabla"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
//        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }

    private func setupView() {

        contentView.addSubview(imageIng)
        contentView.addSubview(containerView)
        containerView.addSubview(ingName)
        containerView.addSubview(ingDesc)
    }
    
//    private func setupConstraints() {
//
//        NSLayoutConstraint.activate([
//            imageIng.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
//            imageIng.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:10),
//            imageIng.widthAnchor.constraint(equalToConstant:50),
//            imageIng.heightAnchor.constraint(equalToConstant:50)
//            ])
//
//        NSLayoutConstraint.activate([
//            containerView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
//            containerView.leadingAnchor.constraint(equalTo:imageIng.trailingAnchor, constant:15),
//            containerView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant:-10),
//            containerView.heightAnchor.constraint(equalToConstant:60)
//            ])
//
//        NSLayoutConstraint.activate([
//            ingName.topAnchor.constraint(equalTo:containerView.topAnchor),
//            ingName.leadingAnchor.constraint(equalTo:containerView.leadingAnchor),
//            ingName.trailingAnchor.constraint(equalTo:containerView.trailingAnchor),
//            ])
//
//        NSLayoutConstraint.activate([
//            ingDesc.topAnchor.constraint(equalTo:ingName.bottomAnchor, constant: 7),
//            ingDesc.leadingAnchor.constraint(equalTo:containerView.leadingAnchor),
//            ingDesc.trailingAnchor.constraint(equalTo:containerView.trailingAnchor),
//            ])
//    }

    override func prepareForReuse() {
        super.prepareForReuse()
        ingName.text = nil
        imageIng.image = nil
        ingDesc.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    
        imageIng.pin.size(CGSize(width: 50, height: 50)).centerLeft(15)
        containerView.pin.right(of: imageIng).margin(15).top(5).bottom(5).right(10)
        ingName.pin.topLeft().width(of: containerView).sizeToFit(.width)
        ingDesc.pin.topLeft(to: ingName.anchor.bottomLeft).marginTop(5).width(of: containerView).sizeToFit(.width)
    }
}
