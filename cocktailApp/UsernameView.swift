//
//  UsernameView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-01-31.
//

import UIKit

class UsernameView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let unameTxtField:UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "Username"
        txtField.borderStyle = .roundedRect
        return txtField
    }()
    


}
