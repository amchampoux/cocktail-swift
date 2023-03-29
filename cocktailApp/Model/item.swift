//
//  item.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-20.
//

import Foundation

class Item {
    
    var ingredient: String?
    var quantite: String?
    var password: String?
    
    private let _ingredientKey = "ingredient"
    private let _quantite = "quantite"
    private let _password = "password"
    
    var safeIngredient: String {
        return ingredient ?? ""
    }
    
    var safeQuantite: String {
        return quantite ?? ""
    }
    
    var safePassword: String {
        return password ?? ""
    }
    
    init(ingredient: String, quantite: String, password: String) {
        self.ingredient = ingredient
        self.quantite = quantite
        self.password = password
    }
    
    init(dict: [String: String]) {
        self.ingredient = dict[_ingredientKey]
        self.quantite = dict[_quantite]
        self.password = dict[_password]
    }
    
    func toDict() -> [String: String] {
        var dict: [String: String] = [:]
        if self.ingredient != nil {
            dict[_ingredientKey] = self.ingredient!
        }
        if self.quantite != nil {
            dict[_quantite] = self.quantite!
        }
        if self.password != nil {
            dict[_password] = self.password!
        }
        return dict
    }
}
