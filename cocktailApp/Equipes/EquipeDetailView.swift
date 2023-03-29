//
//  EquipesView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import UIKit
import MapKit
import PinLayout

class EquipeDetailView: UIView {
    
    let equipeLocation: MKMapView = {
        let map = MKMapView()
        map.mapType = .hybrid
        map.showsUserLocation = true
        return map
    }()
    
    let currentWeather: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 165/256, green: 165/256, blue: 141/256, alpha: 1)
        view.layer.cornerRadius = 8
        return view
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
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-medium", size: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    let equipeLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var scrollView: UIScrollView = {
        var view = UIScrollView()
        return view
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 22)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-regular", size: 28)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-light", size: 14)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()
    
    let titresLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = UIColor(red: 56/256, green: 44/256, blue: 32/256, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(equipeLocation)
        equipeLocation.addSubview(currentWeather)
        currentWeather.addSubview(weatherIv)
        currentWeather.addSubview(weatherTemp)
        addSubview(equipeLogo)
        addSubview(scrollView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(cityLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(titresLabel)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        performLayout()
        didPerformLayout()
    }
    

    private func performLayout() {
        equipeLocation.pin.top().left().right().height(250)
        currentWeather.pin.centerRight(10).size(CGSize(width: 100, height: 100))
        weatherIv.pin.topCenter().hCenter().size(CGSize(width: 70, height: 70))
        weatherTemp.pin.below(of: weatherIv).marginTop(-10).left().right().hCenter().sizeToFit(.width)
        equipeLogo.pin.vCenter(to: equipeLocation.edge.bottom).left(40).size(CGSize(width: 80, height: 80))
        
        scrollView.pin.below(of: equipeLocation).left().right().bottom(pin.safeArea)
        cityLabel.pin.topCenter(30).hCenter().sizeToFit(.content)
        nameLabel.pin.below(of: cityLabel).marginTop(12).left(20).right(20).hCenter().sizeToFit(.width)
        descriptionLabel.pin.below(of: nameLabel).marginTop(20).left(20).right(20).hCenter().sizeToFit(.width)
        titresLabel.pin.below(of: descriptionLabel).marginTop(20).left(20).right(20).width(of: descriptionLabel).sizeToFit(.width)
    }
    
    private func didPerformLayout() {
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: titresLabel.frame.maxY + 25)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        autoSizeThatFits(size, layoutClosure: performLayout)
    }

}
