//
//  LocationModel.swift
//  Final Project
//
//  Created by Inman, John (UMSL-Student) on 7/18/18.
//  Copyright © 2018 Inman, John (UMSL-Student). All rights reserved.
//

import Foundation
import MapKit

struct location {
    let name: String
    let type: String
    let location: CLLocation
}

class LocationModel {
    
    //Only member variable, "list", is an array of location type (struct on line 12)
    var list: [location] = []
    
    init() {
        //addLocation("Example Name", "Example Type", 0, 0)
    }
    
    //Function to add a location to the list
    func addLocation(_ name: String, _ type: String, _ lat: Double, _ long: Double) {
        
        //Convert latitude and longitude to CLLocation
        let coordinates = CLLocation(latitude: lat, longitude: long)
        //Create temp variable to add to the list
        let newLocation = location(name: name, type: type, location: coordinates)
        //Add the new location to the list
        list.append(newLocation)
        print("New Location Added")
        
    }
    
    func getLocation(at index: Int) -> location? {
        return list[index]
    }
    
}
