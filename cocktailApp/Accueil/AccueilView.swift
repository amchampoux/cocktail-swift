//
//  Accueil.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-14.
//

import UIKit
import PinLayout

class AccueilView: UIView {
    
    private let pageTitleMargin: CGFloat = 25
    
    let accueilHero = AccueilHeroView()
    let accueilCaroussel = AccueilFlowView()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
//        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(accueilHero)
        addSubview(accueilCaroussel)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            accueilHero.topAnchor.constraint(equalTo: topAnchor),
            accueilHero.leadingAnchor.constraint(equalTo: leadingAnchor),
            accueilHero.trailingAnchor.constraint(equalTo: trailingAnchor),
            accueilHero.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        NSLayoutConstraint.activate([
            accueilCaroussel.topAnchor.constraint(equalTo: accueilHero.bottomAnchor, constant: 25),
            accueilCaroussel.leadingAnchor.constraint(equalTo: leadingAnchor),
            accueilCaroussel.trailingAnchor.constraint(equalTo: trailingAnchor),
            accueilCaroussel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        accueilHero.pin.all().height(56%)
        accueilCaroussel.pin.below(of: accueilHero).marginTop(10).left().right().bottom(pin.safeArea)
    
    }
}


 
