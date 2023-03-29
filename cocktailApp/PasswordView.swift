//
//  PasswordView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-01-31.
//

import UIKit

class PasswordView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private let pwordTxtField:UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Username"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
}
