//
//  EquipesView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-11.
//

import UIKit
import PinLayout

class EquipesView: UIView {
    
    var forecast: Forecast!
    
    let currentWeather: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 165/256, green: 165/256, blue: 141/256, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Griffintown"
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-regular", size: 22)
        label.textColor = UIColor.white
        return label
    }()
    
    let weatherIv: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "sun")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let weatherTemp: UILabel = {
        let label = UILabel()
        label.text = "17 °C"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-medium", size: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    let weatherDesc: UILabel = {
        let label = UILabel()
        label.text = "Nuageux"
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-light", size: 13)
        label.textColor = UIColor.white
        return label
    }()

    let tableView = UITableView()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(currentWeather)
        currentWeather.addSubview(cityLabel)
        currentWeather.addSubview(weatherIv)
        currentWeather.addSubview(weatherTemp)
        currentWeather.addSubview(weatherDesc)
        addSubview(tableView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        currentWeather.pin.top(pin.safeArea).left(20).right(20).hCenter().height(200)
        cityLabel.pin.topCenter(30).left(10).right(10).width(of: currentWeather).sizeToFit(.width)
        weatherIv.pin.below(of: cityLabel).hCenter().size(CGSize(width: 90, height: 90))
        weatherTemp.pin.right(of: weatherIv, aligned: .center).left(30).right().sizeToFit(.width)
        weatherDesc.pin.below(of: weatherIv).left().right().hCenter().sizeToFit(.width)
        tableView.pin.below(of: currentWeather).marginTop(15).left().right().bottom(pin.safeArea)
    }
}

