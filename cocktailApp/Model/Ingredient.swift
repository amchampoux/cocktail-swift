//
//  Ingredient.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-23.
//

import UIKit

class Ingredients {

    var name: String
    var desc: String
    var imageString: String
    
    var image: UIImage? {
        return UIImage(named: imageString)
    }
    
    init(name: String, desc: String, imageString: String) {
        self.name = name
        self.desc = desc
        self.imageString = imageString
    }
    
}
