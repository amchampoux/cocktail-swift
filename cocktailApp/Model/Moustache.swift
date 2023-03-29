//
//  Moustache.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-06.
//

import UIKit

struct Moustache {
    var name: String
    var desc: String
 
    var title: String {
        return "La moustache de style \(name)"
    }
 
    var image: UIImage? {
        return UIImage(named: name)
    }
}
