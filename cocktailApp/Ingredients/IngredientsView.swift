//
//  IngredientsView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-25.
//

import UIKit

class IngredientsView: UIView {
    
    let tableView = UITableView()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: bounds.width,
                                 height: bounds.height)
    }
}
