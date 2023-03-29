//
//  EquipeDetailViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import UIKit
import MapKit

class EquipeDetailViewController: UIViewController {
    
    private let club: Club!
    private let stadium: Stadium!
    
    init(club: Club, stadium: Stadium) {
        self.club = club
        self.stadium = stadium
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var mainView: EquipeDetailView {
        view as! EquipeDetailView
    }
    
    override func loadView() {
        self.view = EquipeDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titresLabel.text = convertArrayIntToText(club.franceChampion, "nationaux")
        mainView.nameLabel.text = club.name
        mainView.equipeLogo.image = UIImage(named: club.nickname)
        mainView.cityLabel.text = club.city
        mainView.descriptionLabel.text = club.desc
        let coords = CLLocationCoordinate2D(latitude: club.stadium.lat, longitude: club.stadium.lon)
        mainView.equipeLocation.setRegion(MKCoordinateRegion(center: coords, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        
        fetchWeatherForecast()
    }
    
    func convertArrayIntToText(_ array: [Int], _ extra: String) -> String {
        var str = "Nombre de titres \(extra) \(array.count)"
        array.forEach { i in
            if i == array[0] {
                str += ": \(i)"
            } else {
                str += ", \(i)"
            }
        }
        return str
    }
    
    private func fetchWeatherForecast() {
        let coords = CLLocationCoordinate2D(latitude: club.stadium.lat, longitude: club.stadium.lon)
        var str = "?lat="
        str += String(describing: coords.latitude)
        str += "&lon="
        str += String(describing: coords.longitude)
        APIHelper.shared.parseWeather(coords: str) { forecasts in
            DispatchQueue.main.async {
                self.didFetchWeatherForecast(forecasts)
            }
        }
    }

    private func didFetchWeatherForecast(_ forecasts: [Forecast]) {
        mainView.weatherIv.image = nil
        mainView.weatherTemp.text = ""

        if let first = forecasts.first {
            imageDownloader().download(first.weather.first!.icon) { d in
                DispatchQueue.main.async {
                    if let data = d {
                        self.mainView.weatherIv.image = UIImage(data: data)
                    }
                }
            }
            mainView.weatherTemp.text = "\(Int(first.main.temp))°C"
        }
    }
}
