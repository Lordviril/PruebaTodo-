//
//  LocationViewController.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 13/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class LocationViewController: UIViewController, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    var ReturnObject:((_ Zone:ZoneResponsObject)->Void)?
    private var controller:UIViewController?
    
    var lat = 0.0
    var lot = 0.0
    
    private var map: MKMapView!
    
    private var Locations : [CLLocation]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            
        }

    }
    
    func validateLocationPermisions(controller: UIViewController) -> Bool
    {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                showAlertError(View: controller, Men: ErrorNoPermisos)
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")

                return true
            }
        } else {
            showAlertError(View: controller, Men: ErrorNoPermisos)
            return false
        }
    }
    func setController(controller: UIViewController)
    {
        self.controller = controller
    }
    
    func setMap(map: MKMapView)
    {
        self.map = map
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    func reloadData(controller:UIViewController)
    {
        if !validateLocationPermisions(controller: controller)
        {
            return
            
        }
        
        let locValue = CLLocationCoordinate2D(latitude: lat, longitude: lot)
        getTemperature(Controller: self, log: lot, lat: lat, Ok: { res in
            
            
            self.ReturnObject?(res)
            
            
        })
        
        let userLocation = self.Locations!.last
        let viewRegion = MKCoordinateRegionMakeWithDistance((userLocation?.coordinate)!, 600, 600)
        self.map.setRegion(viewRegion, animated: true)
        
        self.map.removeAnnotations(self.map.annotations)
        let annotation = MKPointAnnotation()

        annotation.coordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        self.map.addAnnotation(annotation)
    }
    func setControllerLocation(location:CLLocationManagerDelegate)
    {
        locationManager.delegate = location
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        Locations = locations
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        getTemperature(Controller: self, log: locValue.longitude, lat: locValue.latitude, Ok: { res in
            
            
            self.ReturnObject?(res)
            
            
        })
        
        let userLocation = locations.last
        let viewRegion = MKCoordinateRegionMakeWithDistance((userLocation?.coordinate)!, 600, 600)
        self.map.setRegion(viewRegion, animated: true)
        
        self.map.removeAnnotations(self.map.annotations)
        let annotation = MKPointAnnotation()
        self.lat = locValue.latitude
        self.lot = locValue.longitude
        annotation.coordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        self.map.addAnnotation(annotation)
    }

    
    

    


}
