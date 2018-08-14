//
//  TemperatureResponsObject.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 12/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation

class ZoneResponsObject:NSObject
{
    var latitude = 0.0
    var longitude = 0.0
    var timezone = ""
    var currently = CurrentlyResponseObject(dic: ["":""])
    
    init(dic:NSDictionary) {
        latitude = ValueJsonDouble(dic: dic, key: "latitude")
        longitude = ValueJsonDouble(dic: dic, key: "longitude")
        timezone = ValueJsonString(dic: dic, key: "timezone")
        currently = CurrentlyResponseObject(dic: ValueJsonDiccionario(dic: dic, key: "currently"))
    }
}
