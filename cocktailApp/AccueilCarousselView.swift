//
//  AccueilCarousselView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-27.
//

import UIKit
import PinLayout

class AccueilCarousselView: UIView {
    
    private let pageTitleMargin: CGFloat = 25

    let produitVedette: UILabel = {
        let label = SubtitleView()
        label.text = "Les spécialités"
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let placeholder: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize (width: 3, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.black.cgColor
//        buttonBg.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(produitVedette)
        addSubview(placeholder)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            produitVedette.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            produitVedette.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            produitVedette.topAnchor.constraint(equalTo: topAnchor)
        ])
        NSLayoutConstraint.activate([
            placeholder.topAnchor.constraint(equalTo: produitVedette.bottomAnchor, constant: 15),
            placeholder.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholder.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            placeholder.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let titleWidth = imageViewBG.bounds.width - 2 * pageTitleMargin
//
//        produitVedette.frame = CGRect(
//            x: pageTitleMargin,
//            y: imageViewBG.frame.height + 25,
//            width: titleWidth,
//            height: produitVedette.sizeThatFits(CGSize(width: titleWidth, height: CGFloat.infinity)).height)
//
//        placeholder.frame = CGRect(
//            x: pageTitleMargin,
//            y: produitVedette.center.y + 15 + produitVedette.frame.height,
//            width: titleWidth,
//            height: frame.height - (imageViewBG.frame.height + produitVedette.frame.height + 150)
//        )
        
//        produitVedette.pin.horizontally(pageTitleMargin).below(of: imageViewBG).marginTop(25).sizeToFit(.width)
//        placeholder.pin.horizontally(pageTitleMargin).below(of: produitVedette).marginTop(15).bottom(pin.safeArea.bottom + 10)
        
        produitVedette.pin.top().left().width(100%).pinEdges().marginHorizontal(20).sizeToFit(.width)
        placeholder.pin.below(of: produitVedette).marginTop(20).left().width(100%).pinEdges().marginHorizontal(20).bottom(pin.safeArea.bottom + 10)
    }

}
