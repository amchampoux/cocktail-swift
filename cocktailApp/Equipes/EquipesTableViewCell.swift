//
//  EquipesTableViewCell.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import UIKit
import MapKit
import PinLayout

class EquipesTableViewCell: UITableViewCell {
    
    
    let equipeLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Menlo-regular", size: 15)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        return label
    }()
    
    let equipeLocation: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }
    
    
    private func setupView() {
        contentView.addSubview(equipeLogo)
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(cityLabel)
        contentView.addSubview(equipeLocation)
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
        equipeLogo.image = nil
        nameLabel.text = nil
        cityLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        equipeLogo.pin.left(20).vCenter().size(CGSize(width: 40, height: 40))
        equipeLocation.pin.right(20).vCenter().size(CGSize(width: 70, height: 50))
        containerView.pin.right(of: equipeLogo).marginRight(20).marginLeft(15).top(12).bottom(5).left(of: equipeLocation)
        nameLabel.pin.topLeft().width(of: containerView).sizeToFit(.width)
        cityLabel.pin.topLeft(to: nameLabel.anchor.bottomLeft).marginTop(5).width(of: containerView).sizeToFit(.width)

    }
    
}
