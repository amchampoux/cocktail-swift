//
//  DetailCocktails.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-11.
//

import UIKit
import PinLayout

class CocktailDetailView: UIView {
    
    let imageViewBG: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var scrollView: UIScrollView = {
        var view = UIScrollView()
        view.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var secondCardView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var name: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Menlo-Regular", size: 28)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var divider: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let icon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shaker_w")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var ingredients: [String] = [] {
        didSet {
            updateIngredients()
        }
    }

    let ingredientsLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let secondDivider : UIView = {
        let divider = UIView()
        divider.backgroundColor = .white
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()

    let recetteLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
   init() {
       super.init(frame: CGRect.zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        addSubview(imageViewBG)
        addSubview(scrollView)
        addSubview(closeBtn)
        scrollView.addSubview(contentView)
        contentView.addSubview(secondCardView)
        secondCardView.addSubview(name)
        secondCardView.addSubview(divider)
        secondCardView.addSubview(iconView)
        iconView.addSubview(icon)
        secondCardView.addSubview(ingredientsLabel)
        secondCardView.addSubview(secondDivider)
        secondCardView.addSubview(recetteLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewBG.topAnchor.constraint(equalTo: topAnchor),
            imageViewBG.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewBG.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageViewBG.heightAnchor.constraint(equalTo: imageViewBG.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: imageViewBG.topAnchor, constant: 20),
            closeBtn.rightAnchor.constraint(equalTo: imageViewBG.rightAnchor, constant: -20),
            closeBtn.heightAnchor.constraint(equalToConstant:35),
            closeBtn.widthAnchor.constraint(equalToConstant:35)
        ])
        
        NSLayoutConstraint.activate([
            secondCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            secondCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            secondCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            secondCardView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: name.bottomAnchor, constant:40),
            divider.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 25),
            divider.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -25),
            divider.heightAnchor.constraint(equalToConstant:1)
        ])
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: divider.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: divider.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant:70),
            iconView.widthAnchor.constraint(equalToConstant:70)
        ])
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant:60),
            icon.widthAnchor.constraint(equalToConstant:60)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant:10),
            ingredientsLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 25),
            ingredientsLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            secondDivider.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant:25),
            secondDivider.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 25),
            secondDivider.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -25),
            secondDivider.heightAnchor.constraint(equalToConstant:1)
        ])
        
        NSLayoutConstraint.activate([
            recetteLabel.topAnchor.constraint(equalTo: secondDivider.bottomAnchor, constant: 25),
            recetteLabel.leftAnchor.constraint(equalTo: secondCardView.leftAnchor, constant: 25),
            recetteLabel.rightAnchor.constraint(equalTo: secondCardView.rightAnchor, constant: -25),
            recetteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: imageViewBG.bottomAnchor, constant: -25),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
  
//        imageViewBG.frame = CGRect(x: 0,
//                                   y: 0,
//                                   width: bounds.width,
//                                   height: bounds.height/2)
        
//        closeBtn.frame = CGRect(x: self.frame.width-50,
//                                y: 15,
//                                width: 35,
//                                height: 35)
        

//        secondCardView.frame = CGRect(x: 15,
//                                      y: 15,
//                                      width: frame.width-30,
//                                      height: frame.height-30)
//        name.frame = CGRect(x: 0,
//                            y: 20,
//                            width: frame.width-30,
//                            height: 45)
//    }
    
    private func updateIngredients() {
        let bullet = "•  "
//        var strings = [String]()
//        strings.append("1oz crème irlandaise")
//        strings.append("1/2oz de liqueur d'agrumes")
//        strings.append("2oz de lait")
//        strings.append("Glaces")
//        strings = strings.map { return bullet + $0 }
        
        let strings = ingredients.map { bullet + $0 }

        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont(name: "Helvetica", size: 16)
        attributes[.foregroundColor] = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle

        let string = strings.joined(separator: "\n\n")
        ingredientsLabel.attributedText = NSAttributedString(string: string, attributes: attributes)
    }
        
}




   
    


