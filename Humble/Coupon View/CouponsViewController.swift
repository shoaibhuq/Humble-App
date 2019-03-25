//
//  CouponsViewController.swift
//  Humble
//
//  Created by Shoaib Huq on 3/18/19.
//  Copyright © 2019 Shoaib Huq. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class CouponsViewController: UIViewController{

    @IBOutlet weak var couponTableView: UITableView!
    
    
    var items: [Coupon] = []

    let refCoupons = Database.database().reference(withPath: "coupons")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //Initialize Test Coupons here
        
        //Coupon 1
        let humbleCoupon = Coupon(title: "Humble", desc: "Get $5 off of your first purchase!", url: "humble.com/example", isExpired: false, lat: 150, long: 150)
        
        let humbleCouponRef = refCoupons.child(humbleCoupon.title)
        
        humbleCouponRef.setValue(humbleCoupon.toAnyObject())
        //Coupon 2
        
        let targetCoupon = Coupon(title: "Target", desc: "Get 50% off milk!", url: "target.com", isExpired: false, lat: 150, long: 150)
        
        let targetCouponRef = refCoupons.child(targetCoupon.title)
        
        targetCouponRef.setValue(targetCoupon.toAnyObject())
        
                                
        
        
        refCoupons.observe(.value, with: { snapshot in
            var newItems: [Coupon] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let couponItem = Coupon(snapshot: snapshot) {
                    newItems.append(couponItem)
                }
            }
            self.items = newItems
            //self.couponTableView.reloadData()
        })
        
        
    }

}

extension CouponsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let couponItem = items[indexPath.row]
        
        cell.textLabel?.text = couponItem.title
        cell.detailTextLabel?.text = couponItem.desc
        
        
        
        
        
        return cell
    }
    
    
}

extension CouponsViewController: UITableViewDelegate{
    
}
