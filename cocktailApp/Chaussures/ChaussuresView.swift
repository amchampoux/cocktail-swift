//
//  Chaussures.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-02-21.
//

import UIKit

class ChaussuresView: UIView {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Entrez votre nom"
        textField.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.font = UIFont(name: "Helvetica", size: 18)
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .default
        textField.returnKeyType = UIReturnKeyType.done
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = CGColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let styleSegmented: UISegmentedControl = {
        let items = ["Ville", "Running", "Basket"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 18)!], for: UIControl.State.normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Helvetica-bold", size: 18)!], for: UIControl.State.selected)
        return segmentedControl
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/256, green: 215/256, blue: 186/256, alpha: 0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let categorieTitle: UILabel = {
        let label = UILabel()
        label.text = "Catégorie"
        label.font = UIFont(name: "Helvetica-bold", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categorieLabel: UILabel = {
        let label = UILabel()
        label.text = "Homme"
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categorieSwitch: UISwitch = {
        let switchCat = UISwitch()
        switchCat.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchCat.setOn(true, animated: false)
        switchCat.translatesAutoresizingMaskIntoConstraints = false
        return switchCat
    }()
    
    let switchStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let sizeTitle: UILabel = {
        let label = UILabel()
        label.text = "Pointure"
        label.font = UIFont(name: "Helvetica-bold", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "36"
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sizeStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.value = 42
        stepper.minimumValue = 36
        stepper.maximumValue = 46
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        return stepper
    }()
    
    let stepperStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let colorTitle: UILabel = {
        let label = UILabel()
        label.text = "Couleur"
        label.font = UIFont(name: "Helvetica-bold", size: 18)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let colorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let shoesImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
        setupConstraints()
        updateCategorieLabel()
        updateSizeLabel()
        getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(nameTextField)
        addSubview(styleSegmented)
        addSubview(backgroundView)
        addSubview(categorieTitle)
        addSubview(categorieLabel)
        addSubview(categorieSwitch)
        backgroundView.addSubview(switchStack)
        switchStack.addArrangedSubview(categorieTitle)
        switchStack.addArrangedSubview(categorieLabel)
        switchStack.addArrangedSubview(categorieSwitch)
        addSubview(sizeTitle)
        addSubview(sizeLabel)
        addSubview(sizeStepper)
        backgroundView.addSubview(stepperStack)
        stepperStack.addArrangedSubview(sizeTitle)
        stepperStack.addArrangedSubview(sizeLabel)
        stepperStack.addArrangedSubview(sizeStepper)
        addSubview(colorStack)
        addSubview(colorTitle)
        addSubview(colorPicker)
        colorStack.addArrangedSubview(colorTitle)
        colorStack.addArrangedSubview(colorPicker)
        addSubview(shoesImage)
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            styleSegmented.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            styleSegmented.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            styleSegmented.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            styleSegmented.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: styleSegmented.bottomAnchor, constant: 25),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            backgroundView.bottomAnchor.constraint(equalTo: colorStack.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            switchStack.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            switchStack.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            switchStack.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stepperStack.topAnchor.constraint(equalTo: switchStack.bottomAnchor, constant: 25),
            stepperStack.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            stepperStack.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            colorStack.topAnchor.constraint(equalTo: stepperStack.bottomAnchor, constant: 20),
            colorStack.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            colorStack.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            colorStack.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            shoesImage.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 25),
            shoesImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            shoesImage.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            shoesImage.heightAnchor.constraint(equalToConstant: 215)
        ])
    }
    
    func getImage(){
        let imageString = getGender() + "_" + getType() + "_" + getColor()
        shoesImage.image = UIImage(named: imageString)
    }
    
    func getGender() -> String {
        return categorieSwitch.isOn ? "boy" : "girl"
    }
    
    func getType() -> String {
        switch styleSegmented.selectedSegmentIndex {
        case 0: return "city"
        case 1: return "running"
        default: return "basket"
        }
    }
    
    func getColor() -> String {
        let index = colorPicker.selectedRow(inComponent: 0)
        switch index {
        case 0: return "white"
        case 1: return "black"
        case 2: return "red"
        case 3: return "blue"
        default: return "green"
        }
    }
    
    func updateCategorieLabel(){
        let str = categorieSwitch.isOn ? "Homme" : "Femme"
        categorieLabel.text = str
    }
    
    func updateSizeLabel() {
        let sizeString = "\(sizeStepper.value)"
        sizeLabel.text = sizeString
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        getImage()
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        updateCategorieLabel()
        getImage()
    }
    
    @objc func stepperValueChanged(_ stepper: UIStepper) {
        updateSizeLabel()
        getImage()
        
    }
    
}
