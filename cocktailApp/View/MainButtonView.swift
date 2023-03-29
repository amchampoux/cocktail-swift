//
//  MainButtonView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-01.
//

import UIKit

class MainButtonView: UIButton {
    
//    let ButtonBg: UIButton = {
//        let bg = UIButton()
//        bg.layer.shadowColor = UIColor.lightGray.cgColor
//        bg.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
//        bg.layer.shadowOpacity = 1
//        bg.layer.masksToBounds = false
//        bg.backgroundColor = .red
//        return bg
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        setTitleColor(UIColor.black, for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica-light", size: 20)
        backgroundColor = .white
        layer.cornerRadius = 8
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
        layer.masksToBounds = false

    }
}
