//
//  ViewController.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 12/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TimeTempViewController: LocationViewController{

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var btRefresh: FloatButton!
    
    @IBOutlet weak var lbPlace: UILabel!
    
    @IBOutlet weak var lbTemperature: UILabel!
    
    @IBOutlet weak var lbHumidity: UILabel!
    
    @IBOutlet weak var lbRain: UILabel!
    
    @IBOutlet weak var lbSumary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.setControllerLocation(location: self)
        self.setController(controller: self)
        self.setMap(map: map)
        if !validateLocationPermisions(controller: self)
        {
            return}
        self.ReturnObject = { res in
            if !self.validateLocationPermisions(controller: self)
            {
                return}
            self.lbTemperature.text = res.currently.getStringTemperature()
            self.lbPlace.text = res.timezone
            self.lbHumidity.text = res.currently.getStringHumidity()
            self.lbRain.text = res.currently.getStringPrecipProbability()
            self.lbSumary.text = res.currently.summary
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.reloadData(controller: self)
        if !validateLocationPermisions(controller: self)
        {
            return}
        
    }
    
    @IBAction func triRefresh(_ sender: UIButton) {
        self.reloadData(controller: self)
    }
}



