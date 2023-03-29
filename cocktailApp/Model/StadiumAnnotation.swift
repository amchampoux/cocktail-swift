//
//  StadiumAnnotation.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-05.
//

import Foundation
import MapKit

class StadiumAnnotation: NSObject, MKAnnotation {
    var stadium: Stadium
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(_ stadium: Stadium) {
        self.stadium = stadium
        self.title = self.stadium.name
        self.coordinate = CLLocationCoordinate2D(latitude: self.stadium.lat, longitude: self.stadium.lon)
        self.subtitle = "Capacité: \(self.stadium.capacity) places"
    }
}

