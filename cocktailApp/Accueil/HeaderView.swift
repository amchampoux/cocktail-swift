//
//  HeaderView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-03.
//

import UIKit

class HeaderView2: UICollectionReusableView {

    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Les cocktails de Ricardo"
        //label.backgroundColor = UIColor.white
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Menlo-regular", size: 22.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.lineBreakMode = .byCharWrapping //Wrap the charactor of label
        label.sizeToFit()
        return label
        
    }()
        
    var title: String! {
        didSet {
            label.text = title
        }
    }
}
