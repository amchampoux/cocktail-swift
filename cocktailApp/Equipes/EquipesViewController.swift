//
//  ViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import UIKit
import MapKit
import CoreLocation

class EquipesViewController: UIViewController {
    
    var lastKnownCoords: CLLocation?
    var forecasts: [Forecast] = []
    var manager: CLLocationManager = CLLocationManager()
    var allClubbs = [Club]()
    var allStadiums = [Stadium]()
    var mainView: EquipesView {
        return self.view as! EquipesView
    }
    
    override func loadView() {
        self.view = EquipesView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()

        let mapButton = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(self.didTapMap(_:)))
        self.navigationItem.rightBarButtonItem = mapButton
        mapButton.tintColor = UIColor.systemRed
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(EquipesTableViewCell.self, forCellReuseIdentifier: EquipesTableViewCell.teamReuseIdentifier)
        
        
    }
    
    func setupTemp() {
        mainView.weatherIv.image = nil
        mainView.weatherTemp.text = ""
        mainView.weatherDesc.text = ""
        mainView.cityLabel.text = ""
        if let first = forecasts.first {
            imageDownloader().download(first.weather.first!.icon) { d in
                DispatchQueue.main.async {
                    if let data = d {
                        self.mainView.weatherIv.image = UIImage(data: data)
                    }
                }
            }
            mainView.weatherDesc.text = first.weather.first!.description
            mainView.weatherTemp.text = "\(Int(first.main.temp))°C"
            mainView.cityLabel.text = first.name
        }
    }

    
    @objc private func didTapMap(_ sender:UIBarButtonItem!) {
        let vc = MapViewController()
        show(vc, sender: self)
        
    }
}

extension EquipesViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datas.get.allClubs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EquipesTableViewCell.listReuseIdentifier, for: indexPath) as! EquipesTableViewCell
        cell.equipeLogo.image = UIImage(named: Datas.get.allClubs[indexPath.row].nickname)
        cell.nameLabel.text = Datas.get.allClubs[indexPath.row].name
        cell.cityLabel.text = Datas.get.allClubs[indexPath.row].city
        
        let coords = CLLocationCoordinate2D(latitude: Datas.get.allStadiums[indexPath.row].lat, longitude: Datas.get.allStadiums[indexPath.row].lat)
        cell.equipeLocation.setRegion(MKCoordinateRegion(center: coords, span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)), animated: true)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EquipeDetailViewController(club: Datas.get.allClubs[indexPath.item], stadium: Datas.get.allStadiums[indexPath.item])
        show(vc, sender: self)
    }
    

}

extension UITableViewCell {
    static var teamReuseIdentifier: String {
        return String(describing: self)
    }
}

extension EquipesViewController: CLLocationManagerDelegate {

    func setupLocation() {
        manager.delegate = self
        startUpdatingLocationIfAuthorized()
    }
    
    private func startUpdatingLocationIfAuthorized() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        } else if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        startUpdatingLocationIfAuthorized()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        manager.stopUpdatingLocation()
        guard let loc = locations.first else { return }
        if let lastKnownCoords = lastKnownCoords, lastKnownCoords.distance(from: loc) < CLLocationDistance(1000) {
            return
        }
        
        self.lastKnownCoords = loc
        let coords = loc.coordinate
        var str = "?lat="
        str += String(describing: coords.latitude)
        str += "&lon="
        str += String(describing: coords.longitude)
        APIHelper.shared.parseWeather(coords: str) { forecast in
            DispatchQueue.main.async {
                self.forecasts = forecast
                self.setupTemp()
            }
        }
    }
    
}
