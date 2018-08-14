//
//  CurrentlyResponseObject.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 12/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation


class CurrentlyResponseObject:NSObject
{
    var summary = ""
    var icon = ""
    var precipProbability = 0.0
    var temperature = 0.1
    var humidity = 0.0
    
    init(dic:NSDictionary) {
        summary = ValueJsonString(dic: dic, key: "summary")
        icon = ValueJsonString(dic: dic, key: "icon")
        precipProbability = ValueJsonDouble(dic: dic, key: "precipProbability")
        temperature = ValueJsonDouble(dic: dic, key: "temperature")
        humidity = ValueJsonDouble(dic: dic, key: "humidity")

    }
    
    func getStringTemperature() -> String
    {
        let x = temperature
        let y = Double(round(10*x)/10)

        return "\(y)º"
    }
    
    func getStringHumidity() -> String
    {
        let x = humidity
        let y = Double(round(10*x)/10)
        
        return "\(y * 100.0)%"
    }
    
    func getStringPrecipProbability() -> String
    {
        let x = precipProbability
        let y = Double(round(10*x)/10)
        
        return "\(y * 100.0)%"
    }
}
