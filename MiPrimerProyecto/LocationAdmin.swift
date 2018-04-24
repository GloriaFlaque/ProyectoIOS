//
//  LocationAdmin.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 18/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
   
    override init(){
         super.init()
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestAlwaysAuthorization()
         locationManager?.startUpdatingLocation()
        
    }
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager, didUpdelegateLocations locations: [CLLocation]) {
        print("mi posicion en lat: ", locations[0].coordinate.latitude, "long: ",locations[0].coordinate.longitude)
        delegate?.LocalizacionActualizada(coordenada: locations[0].coordinate)
    }
    

}
protocol LocationAdminDelegate {
    func LocalizacionActualizada(coordenada:CLLocationCoordinate2D)
    
    
}
