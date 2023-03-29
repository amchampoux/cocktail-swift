//
//  MapViewController.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-01.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var allStadiums: [Stadium] = Datas.shared.allStadiums
    
    var mainView: MapView {
        return self.view as! MapView
    }
    
    override func loadView() {
        super.loadView()
        self.view = MapView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.equipesMapView.delegate = self
        allStadiums.forEach { stadium in
            let anno = StadiumAnnotation(stadium)
            mainView.equipesMapView.addAnnotation(anno)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(notificationObserver), name: Notification.Name("Center"), object: nil)

    }
    
    @objc func notificationObserver(_ notification: Notification) {
        if let notif = notification.object as? MKCoordinateRegion {
            mainView.equipesMapView.setRegion(notif, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let id = "ID"
        var view: StadiumAnnotationView
        if let anno = annotation as? StadiumAnnotation {
            if let d = mainView.equipesMapView.dequeueReusableAnnotationView(withIdentifier: id) as? StadiumAnnotationView {
                d.annotation = anno
                view = d
            } else {
                view = StadiumAnnotationView(annotation: annotation, reuseIdentifier: id)
            }
            view.update(annotation)
            return view
        }
        return MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)
    }

}
