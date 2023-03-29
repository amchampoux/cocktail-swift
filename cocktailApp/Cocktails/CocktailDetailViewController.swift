//
//  DetailViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-04.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    private let cocktail: Cocktail
    
    private var mainView: CocktailDetailView {
        view as! CocktailDetailView
    }
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = CocktailDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ingredients.attributedText = [cocktail.ingredients]
        //ingredients.attributedText = NSAttributedString([string: cocktail.ingredients])
        
        mainView.imageViewBG.image = UIImage(named: cocktail.imageString)
        mainView.closeBtn.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        mainView.name.text = cocktail.name
        mainView.recetteLabel.text = cocktail.recette
        mainView.ingredients = cocktail.ingredients
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    @objc func didTapButton() {
        dismiss(animated: true, completion: nil)
    }
}
