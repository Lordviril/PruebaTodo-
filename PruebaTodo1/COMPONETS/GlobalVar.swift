//
//  GlobalVar.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import CoreLocation

let KUrl = "https://api.darksky.net/"
let keyUser = "768de95943c26dfdb5cbca4681ce1587"
let KUrlTemperature = KUrl + "forecast/\(keyUser)/[latitude],[longitude]"

extension CLLocation {
    func isSamePlaceTo(location: CLLocation) -> Bool {
        return Float(coordinate.latitude) == Float(location.coordinate.latitude) &&
            Float(coordinate.longitude) == Float(location.coordinate.longitude)
    }
}
