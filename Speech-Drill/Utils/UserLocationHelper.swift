//
//  UserLocationHelper.swift
//  Speech-Drill
//
//  Created by Parth Tamane on 11/01/21.
//  Copyright © 2021 Parth Tamane. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

func storeLocationInFirebase(locationManager: CLLocationManager) {
    logger.info("Saving user location in firebase")
    
    let defaults = UserDefaults.standard
    
    if let isoCode = defaults.string(forKey: userLocationCodeKey) {
        logger.debug("Previous isoCode default: \(isoCode)")
        saveUserLocation(isoCode: isoCode)
        return
    }
    
    
    //    let uuid = UIDevice.current.identifierForVendor!.uuidString
    let uuid = getUUID()
    var isoCode = "UNK"
    
    if  CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied
            || !CLLocationManager.locationServicesEnabled() {
        
        saveUserLocation(isoCode: isoCode)
        
    } else if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.locationServicesEnabled()  {
        
        
        let geoCoder = CLGeocoder()
        
        guard let currentLocation = locationManager.location else {
            saveUserLocation(isoCode: isoCode)
            return
        }
        
        geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
            guard let currentLocPlacemark = placemarks?.first else {
                saveUserLocation(isoCode: isoCode)
                return
            }
            logger.debug(currentLocPlacemark.country ?? "No country found")
            logger.debug(currentLocPlacemark.isoCountryCode ?? "No country code found")
            isoCode = currentLocPlacemark.isoCountryCode ?? isoCode
            
            logger.debug("Saving status for: \(uuid) as \(isoCode)")
            saveUserLocation(isoCode: isoCode)
            //SAVE ISO CODE +1 TO FIREBASE
            
        }
    }
}


func removeLocationFromFirebase() {
    //    let uuid = UIDevice.current.identifierForVendor!.uuidString
    //    userLocationReference.child(uuid).setValue(nil)
    let uuid = getUUID()
    userLocationReference.child(uuid).setValue(nil) { (error, reference) in
        if let error = error {
            logger.error("Error marking \(uuid) offline: \(error)")
        }
    }
}

func saveUserLocation(isoCode: String) {
    logger.info("Setting uuid location to isoCode: \(isoCode)")
    //    let uuid = UIDevice.current.identifierForVendor!.uuidString
    let uuid = getUUID()
    let defaults = UserDefaults.standard
    defaults.set(isoCode, forKey: userLocationCodeKey)
    defaults.set(flag(from: isoCode), forKey: userLocationEmojiKey)
    
    //    userLocationReference.child(uuid).setValue(isoCode)
    userLocationReference.child(uuid).setValue(isoCode) { (error, reference) in
        if let error = error {
            logger.error("Error saving \(uuid) location: \(error)")
        }
    }
    saveUserLocationInfo()
}

func flag(from country:String) -> String {
    logger.info("Converting isoCode \(country) to flag emoji")
    
    if country == "UNK" {
        return "🏴‍☠️"
    } else {
        let base : UInt32 = 127397
        var s = ""
        for v in country.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
}
