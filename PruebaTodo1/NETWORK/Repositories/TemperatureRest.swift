//
//  TemperatureRest.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 12/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

func getTemperature(Controller:UIViewController, log:Double, lat:Double, Ok:@escaping ((ZoneResponsObject)->Void) )
{
    if !Connectivity.isConnectedToInternet() {
        showAlertError(View: Controller, Men: ErrorConection)
        return
        // do some tasks..
    }
    

    
    let url = KUrlTemperature.replacingOccurrences(of: "[latitude]", with: "\(lat)").replacingOccurrences(of: "[longitude]", with: "\(log)")
    SwiftSpinner.show("Cargando...")
    getDictionary(url: url, Ok: {res in
        
        var zone = ZoneResponsObject(dic: res)
        

        
        if zone.latitude >= 0.0
        {
            Ok(zone)
        }else
        {
            showAlertError(View: Controller, Men: ErrorEmptyZones)
        }
        

        SwiftSpinner.hide()
        
    }, Error: { res in
        SwiftSpinner.hide()
        showAlertError(View: Controller, Men: res)
        
    })

}




