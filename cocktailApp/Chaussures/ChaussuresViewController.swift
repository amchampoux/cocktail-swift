//
//  ThirdViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-01.
//

import UIKit

class ChaussuresViewController: UIViewController {
    
    private let pickerViewHeight: CGFloat = 100
    private let numberOfVisibleRows: CGFloat = 3

    
    override func loadView() {
        let view = ChaussuresView()
        view.nameTextField.delegate = self
        view.colorPicker.delegate = self
        view.colorPicker.dataSource = self
        self.view = view
    }
    
}
   
extension ChaussuresViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    
extension ChaussuresViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerElements: [String] {
        return ["Blanc", "Noir", "Rouge", "Bleu", "Vert"]
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight / numberOfVisibleRows
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
                if let v = view {
                    label = v as! UILabel
                }
                label.font = UIFont (name: "Helvetica", size: 18)
                label.text = pickerElements[row]
                label.textAlignment = .center
                return label
    }
    
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        getImage() -----> Pourquoiiiiiiiii
    }
    
    
        
}





