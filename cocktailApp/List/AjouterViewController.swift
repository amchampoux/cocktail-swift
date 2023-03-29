//
//  AjouterViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-16.
//

import UIKit

class AjouterViewController: UIViewController {
    
    var mainView: AjouterView {
        view as! AjouterView
    }
    
    override func loadView() {
        self.view = AjouterView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.ingredientTextField.delegate = self
        mainView.quantiteTextField.delegate = self
        mainView.motPasseTextField.delegate = self
        mainView.ajouterButton.addTarget(self, action: #selector(ajouterButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func ajouterButtonPressed(){
        mainView.endEditing(true)
        let newItem = Item(ingredient: mainView.ingredientTextField.text!,
                           quantite: mainView.quantiteTextField.text!,
                           password: mainView.motPasseTextField.text!
                           )
        Helper.share.add(newItem)
        self.navigationController?.popViewController(animated: true)
    }
}

extension AjouterViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
