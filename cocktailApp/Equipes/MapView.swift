//
//  MapView.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import Foundation
import PinLayout
import MapKit

class MapView: UIView {

    let equipesMapView: MKMapView = {
        let map = MKMapView()
        let coords = CLLocationCoordinate2D(latitude: 46.64658014525647, longitude: 2.59177286720657)
        map.setRegion(MKCoordinateRegion(center: coords, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 5)), animated: true)
        return map
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(equipesMapView)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        equipesMapView.pin.top().left().right().bottom(pin.safeArea)
        
    }

}


