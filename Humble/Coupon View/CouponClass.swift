//
//  CouponClass.swift
//  Humble
//
//  Created by Shoaib Huq on 3/19/19.
//  Copyright © 2019 Shoaib Huq. All rights reserved.
//

import Foundation
import Firebase

struct Coupon {
    let ref: DatabaseReference?
    let title: String
    let desc: String
    let url: String
    var isExpired: Bool
    let lat: Double
    let long: Double
    
    init(title: String, desc: String, url:String, isExpired: Bool, lat: Double, long: Double){
        self.ref = nil
        self.title = title
        self.desc = desc
        self.url = url
        self.isExpired = isExpired
        self.lat = lat
        self.long = long
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["tile"] as? String,
            let desc = value["desc"] as? String,
            let url = value["url"] as? String,
            let isExpired = value["isExpired"] as? Bool,
            let lat = value["lat"] as? Double,
            let long = value["long"] as? Double
            else {
            return nil
            }
        self.ref = snapshot.ref
        self.title = title
        self.desc = desc
        self.url = url
        self.isExpired = isExpired
        self.lat = lat
        self.long = long
        }
        
        func toAnyObject() -> Any {
            return [
                "title": title,
                "desc": desc,
                "url": url,
                "isExpired": isExpired,
                "lat": lat,
                "long": long
            ]
            }
        
    }
