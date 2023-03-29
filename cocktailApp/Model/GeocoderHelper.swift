//
//  GeocoderHelper.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-13.
//

import Foundation
import CoreLocation

class GeocoderHelper {
    
    static let shared = GeocoderHelper()
    let geocoder = CLGeocoder()
    
    func toString(_ coords: CLLocation, completion: ((String) -> Void)?) {
        geocoder.reverseGeocodeLocation(coords) { places, _ in
            if let place = places?.first {
                completion?(place.locality ?? "")
            }
        }
    }
    
}
