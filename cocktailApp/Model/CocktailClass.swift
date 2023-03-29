//
//  CocktailClass.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-02.
//

import UIKit

struct Cocktail {
    var name: String
    var type: String
    var ingredients: [String]
    var recette: String
    var imageString: String
    
    var image: UIImage? {
        return UIImage(named: imageString)
    }
    
    init(name: String, type: String, ingredients: [String], recette: String, imageString: String) {
        self.name = name
        self.type = type
        self.ingredients = ingredients
        self.recette = recette
        self.imageString = imageString
    }
    
    var readableName: String {
        var toBeChanged = name
        toBeChanged = toBeChanged.replacingOccurrences(of: ".", with: "")
        return toBeChanged.capitalized
    }
}
