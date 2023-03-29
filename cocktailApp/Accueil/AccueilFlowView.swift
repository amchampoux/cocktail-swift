//
//  AccueilViewFlowLayout.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-03.
//

import UIKit
import PinLayout


class AccueilFlowView: UIView {
    
    var myCocktails = [Cocktail]()
    
    lazy var cocktailCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return collectionView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let recettesVedette: UILabel = {
        let label = SubtitleView()
        label.text = "Dernières recettes"
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Toutes les recettes", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-bold", size: 16)
        
        let attributedString = NSAttributedString(string:
        NSLocalizedString("Toutes les recettes", comment: ""), attributes:[
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
        setupCollectionView()
        addSubview(contentView)
        contentView.addSubview(recettesVedette)
        contentView.addSubview(cocktailCollectionView)
        contentView.addSubview(viewAllButton)
    }
    
    func setupCollectionView() {
        
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: 100, height: 150)
        flow.minimumLineSpacing = 20
        flow.minimumInteritemSpacing = 15
        flow.scrollDirection = .horizontal
        cocktailCollectionView.collectionViewLayout = flow
        
//        addSubview(cocktailCollectionView)
//        cocktailCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        cocktailCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        cocktailCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        cocktailCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
//        cocktailCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin.all().margin(10)
        recettesVedette.pin.topCenter().margin(30).width(100%).sizeToFit(.width)
        cocktailCollectionView.pin.below(of: recettesVedette).margin(15).width(100%).marginHorizontal(10).height(150)
        viewAllButton.pin.below(of: cocktailCollectionView).right(10).sizeToFit(.content)
    }
}

extension AccueilFlowView: UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Datas.get.myCocktails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCell.identifier, for: indexPath) as! CocktailCell
        
        cell.myImageView.image = UIImage(named: Datas.get.myCocktails[indexPath.row].imageString)
        cell.myLabel.text = Datas.get.myCocktails[indexPath.row].name
        return cell
    }
}
