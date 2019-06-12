//
//  LocationDetailViewController.swift
//  Final Project
//
//  Created by Inman, John (UMSL-Student) on 7/30/18.
//  Copyright © 2018 Inman, John (UMSL-Student). All rights reserved.
//

import UIKit
import MapKit

class LocationDetailViewController: UIViewController {
    
    var location: location?
    
    @IBOutlet weak var mapView: MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = location?.location
        if let shownLocation = initialLocation {
            centerMapOnLocation(location: shownLocation)
        }
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView?.setRegion(coordinateRegion, animated: true)
    }
    
    
    
}
