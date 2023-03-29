//
//  AjouterUIBarButtonItem.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-16.
//

import UIKit

class AjouterUIBarButtonItem : UIBarButtonItem {
    
    public convenience init(title: String?, style: UIBarButtonItem.Style, target: Any?, action: Selector?) {
        self.title = title
        self.style = style
        self.target = target as AnyObject?
        self.action = action
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        
    }
}




