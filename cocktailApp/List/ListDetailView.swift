//
//  ListDetailView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-17.
//

import UIKit

class ListDetailView: UIView {

    
    let ingredientLabel: UILabel = {
        let label = SubtitleView()
        label.text = "Ingrédient"
        return label
    }()
    
    let quantiteStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 20
        return stack
    }()
    
    
    let quantiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantité:"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let quantite: UILabel = {
        let label = UILabel()
        label.text = "Réponse"
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let motPasseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 20
        return stack
    }()
    
    
    let motPasseLabel: UILabel = {
        let label = UILabel()
        label.text = "Mot de passe:"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let motPasse: UILabel = {
        let label = UILabel()
        label.text = "Réponse"
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let afficherStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 20
        return stack
    }()
    
    let afficherMotPasseLabel: UILabel = {
        let label = UILabel()
        label.text = "Afficher le mot de passe"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let afficherSwitch: UISwitch = {
        let switchMP = UISwitch()
        return switchMP
    }()
    
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 0.5)
        addSubview(ingredientLabel)
        addSubview(quantiteStackView)
        quantiteStackView.addArrangedSubview(quantiteLabel)
        quantiteStackView.addArrangedSubview(quantite)
        addSubview(motPasseStackView)
        motPasseStackView.addArrangedSubview(motPasseLabel)
        motPasseStackView.addArrangedSubview(motPasse)
        addSubview(afficherStackView)
        afficherStackView.addArrangedSubview(afficherMotPasseLabel)
        afficherStackView.addArrangedSubview(afficherSwitch)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        ingredientLabel.pin.top(pin.safeArea).marginTop(40).horizontally(25).sizeToFit(.width)
        quantiteStackView.pin.below(of: ingredientLabel).marginTop(50).horizontally(25).height(25)
        motPasseStackView.pin.below(of: quantiteStackView).marginTop(30).horizontally(25).height(25)
        afficherStackView.pin.below(of: motPasseStackView).marginTop(30).horizontally(25).height(30)
    }
}


