//
//  ListView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-16.
//

import UIKit
import PinLayout

class AjouterView: UIView {
    

    let title : UILabel = {
        let label = SubtitleView()
        label.text = "Ajouter un ingrédient"
        return label
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let ingredientLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingrédient"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let ingredientTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Entrez un ingrédient"
        textField.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .default
        textField.returnKeyType = UIReturnKeyType.done
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = CGColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        return textField
    }()
    
    let quantiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantité"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let quantiteTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Entrez une quantité"
        textField.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .default
        textField.returnKeyType = UIReturnKeyType.done
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = CGColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        return textField
    }()
    
    let motPasseLabel: UILabel = {
        let label = UILabel()
        label.text = "Mot de passe"
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let motPasseTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Entrez un mot de passe"
        textField.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.font = UIFont(name: "Helvetica", size: 16)
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .default
        textField.returnKeyType = UIReturnKeyType.done
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = CGColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let ajouterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ajouter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.backgroundColor = UIColor(red: 249/256, green: 132/256, blue: 74/256, alpha: 1)
        button.layer.cornerRadius = 8
        
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1
        button.layer.masksToBounds = false
        return button
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
        addSubview(scrollView)
        scrollView.addSubview(title)
        scrollView.addSubview(ingredientLabel)
        scrollView.addSubview(ingredientTextField)
        scrollView.addSubview(quantiteLabel)
        scrollView.addSubview(quantiteTextField)
        scrollView.addSubview(motPasseLabel)
        scrollView.addSubview(motPasseTextField)
        scrollView.addSubview(ajouterButton)


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        performLayout()
        didPerformLayout()

    
    }
    
    private func performLayout() {
        scrollView.pin.all()
        title.pin.top().marginTop(5).horizontally(25).sizeToFit(.width)
        ingredientLabel.pin.below(of: title).marginTop(50).horizontally(25).height(25)
        ingredientTextField.pin.below(of: ingredientLabel).marginTop(10).horizontally(25).height(40)
        quantiteLabel.pin.below(of: ingredientTextField).marginTop(20).horizontally(25).height(25)
        quantiteTextField.pin.below(of: quantiteLabel).marginTop(10).horizontally(25).height(40)
        motPasseLabel.pin.below(of: quantiteTextField).marginTop(20).horizontally(25).height(25)
        motPasseTextField.pin.below(of: motPasseLabel).marginTop(10).horizontally(25).height(40)
        ajouterButton.pin.below(of: motPasseTextField).marginTop(30).horizontally(25).height(45)

    }
    
    private func didPerformLayout() {
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: motPasseTextField.frame.maxY + 25)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        autoSizeThatFits(size, layoutClosure: performLayout)
    }
}


