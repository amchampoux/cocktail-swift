//
//  IngredientDetailController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-25.
//

import UIKit

class IngredientDetailViewController: UIViewController {
    
    private let ingredient: Ingredients
    
    init(ingredient: Ingredients) {
        self.ingredient = ingredient
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = IngredientDetailView()
        view.ingName.text = ingredient.name
        view.ingDesc.text = ingredient.desc
        view.imageIng.image = UIImage(named: ingredient.imageString)
        self.view = view
    }

}
