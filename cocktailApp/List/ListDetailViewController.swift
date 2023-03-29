//
//  ListDetailViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-17.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    private let item: Item!
    
    var mainView: ListDetailView {
        view as! ListDetailView
    }
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = ListDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.ingredientLabel.text = item.safeIngredient
        mainView.quantite.text = item.safeQuantite
        mainView.motPasse.text = item.safePassword
        
        mainView.afficherSwitch.isOn = false
        mainView.motPasse.isHidden = !mainView.afficherSwitch.isOn
        mainView.afficherSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        mainView.motPasse.isHidden = !mainView.afficherSwitch.isOn
    }
}
