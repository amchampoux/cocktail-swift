//
//  ListTableViewCell.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-17.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    static let identifier = "listCell"

    let ingLabel: UILabel = {
        let label = UILabel()
        label.text = "Boisson à la fraise"
        label.font = UIFont(name: "Menlo-regular", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }

    private func setupView() {
        contentView.addSubview(ingLabel)
    }


    override func prepareForReuse() {
        super.prepareForReuse()
        ingLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    
        ingLabel.pin.all().marginLeft(30)

    }
}
