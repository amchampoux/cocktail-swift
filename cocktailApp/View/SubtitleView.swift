//
//  SubtitleView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-01.
//

import UIKit

class SubtitleView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        textAlignment = .center
        textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        font = UIFont(name: "Menlo-bold", size: 20)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        sizeToFit()
    }
}
