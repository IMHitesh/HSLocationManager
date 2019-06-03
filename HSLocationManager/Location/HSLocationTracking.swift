//
//  HSLocationTracking.swift
//  HSLocationManager
//
//  Created by Hitesh on 03/06/19.
//  Copyright © 2019 Hitesh. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class HSLocationTracking: NSObject {
    
    //Constant
    static let timeInternal = 30
    static let accuracy = 200
    
    
    var manager: HSLocationManager!
    var statusCheckedOnce = false
    private static var privateShared : HSLocationTracking?
    
    override init() {
        super.init()
        manager = HSLocationManager(delegate: self)
    }
    
    
    class func shared() -> HSLocationTracking {
        guard let uwShared = privateShared else {
            privateShared = HSLocationTracking()
            return privateShared!
        }
        return uwShared
    }
    
    class func destroy() {
        privateShared = nil
    }
    
    
    func isLocationServiceEnable()->Bool{
        if CLLocationManager.authorizationStatus() == .denied{
            //           showLocationAlert()
            return false
        }else{
            return true
        }
    }
    
    
    func showLocationAlert(){
        print("Please enalble location service")
    }
    
    func startLocationTracking(){
        if CLLocationManager.authorizationStatus() == .authorizedAlways ||  CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            manager.startUpdatingLocation(interval: 30, acceptableLocationAccuracy: 200)
        }else if CLLocationManager.authorizationStatus() == .denied{
            logh("Location service is disable")
        }else{
            manager.requestAlwaysAuthorization()
        }
    }
}


extension HSLocationTracking:HSLocationManagerDelegate{
    
    func scheduledLocationManager(_ manager: HSLocationManager, didUpdateLocations locations: [CLLocation]) {
        let recentLocation = locations.last!
        logh("Location retrive successfully:\(recentLocation.debugDescription)")
    }
    
    func scheduledLocationManager(_ manager: HSLocationManager, didFailWithError error: Error) {
        logh("Location Error \(error.localizedDescription)")
    }
    
    func scheduledLocationManager(_ manager: HSLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if CLLocationManager.authorizationStatus() == .denied{
            logh("Location service is disable...")
        }else{
            startLocationTracking()
        }
    }
    
    
}
