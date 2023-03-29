//
//  AccueilHeroView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-27.
//

import UIKit
import PinLayout

class AccueilHeroView: UIView {
    
    private let pageTitleMargin: CGFloat = 25

    let imageViewBG: UIImageView = {
        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "home_bg2")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let containerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .purple
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Les cocktails de Ricardo"
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Menlo-regular", size: 40)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let decouvrirButton: UIButton = {
        let button = MainButtonView()
        button.setTitle("Découvrir la carte", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let voirIngredientsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Voir les ingrédients", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-bold", size: 16)
        
        let attributedString = NSAttributedString(string:
        NSLocalizedString("Voir les ingrédients", comment: ""), attributes:[
            NSAttributedString.Key.underlineStyle:1.0
        ])
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()

//        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageViewBG)
        addSubview(containerView)
        containerView.addSubview(pageTitle)
        containerView.addSubview(decouvrirButton)
        containerView.addSubview(voirIngredientsButton)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewBG.topAnchor.constraint(equalTo: topAnchor),
            imageViewBG.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewBG.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewBG.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: imageViewBG.topAnchor,constant: 20),
            containerView.bottomAnchor.constraint(equalTo: imageViewBG.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: imageViewBG.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: imageViewBG.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            pageTitle.centerYAnchor.constraint(lessThanOrEqualTo: centerYAnchor),
            pageTitle.centerXAnchor.constraint(lessThanOrEqualTo: centerXAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pageTitle.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
        ])
        NSLayoutConstraint.activate([
           decouvrirButton.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 30),
           decouvrirButton.centerXAnchor.constraint(equalTo: centerXAnchor),
           decouvrirButton.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor),
           decouvrirButton.heightAnchor.constraint(equalToConstant: 55),
           decouvrirButton.widthAnchor.constraint(equalToConstant: 235)
        ])
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        imageViewBG.frame = CGRect(
//            x: 0,
//            y: 0,
//            width: bounds.width,
//            height: bounds.height * 0.5
//        )
//
//        let titleWidth = imageViewBG.bounds.width - 2 * pageTitleMargin
//
//        pageTitle.frame = CGRect(
//            x: pageTitleMargin,
//            y: imageViewBG.center.y - 90,
//            width: titleWidth,
//            height: pageTitle.sizeThatFits(CGSize(width: titleWidth, height: CGFloat.infinity)).height
//        )
//
//        button.frame = CGRect(
//            x: imageViewBG.bounds.width/2 - 235/2,
//            y: pageTitle.frame.maxY + 30,
//            width: 235,
//            height: 55
//        )
        
// Pin Layout
        
        imageViewBG.pin.all()
        containerView.pin.left().right().marginHorizontal(20).vCenter().height(100%)
        pageTitle.pin.horizontally(pin.readableMargins).vCenter().sizeToFit(.width)
        decouvrirButton.pin.below(of: pageTitle).margin(20).hCenter().size(CGSize(width: 235, height: 55))
        voirIngredientsButton.pin.below(of: decouvrirButton).margin(20).hCenter().sizeToFit(.content)
    }
    
//    @objc func didTapButton() {
//        let vc = CocktailViewController()
//        show(vc, sender: self)
//    //        navigationController?.pushViewController(vc, animated: true)
//    }


}


