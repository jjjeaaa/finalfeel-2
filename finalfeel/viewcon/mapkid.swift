//
//  mapkid.swift
//  finalfeel
//
//  Created by Mabear on 5/4/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapkid: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    

    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
       checkLocationServices()

    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters , longitudinalMeters: regionInMeters)
            mapView.setRegion(region,animated: true)
        }
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
          setupLocationManager()
            } else {
            
            //set alert letting the user know they have to turn this on.
        }
    }
    func checkLocationAutorization() {
        switch  CLLocationManager.authorizationStatus() {
        case.authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case.denied:
            // show alert instructing them hot to turn on permission
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            // show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
       
        }
    }

}

extension mapkid: CLLocationManagerDelegate {
    func locationManger(_ manager : CLLocationManager, didUpdateLocation location:[CLLocation]){
        guard let location = location.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center,latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region,animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAutorization()
    }
    }


