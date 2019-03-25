//
//  FirstViewController.swift
//  Humble
//
//  Created by Shoaib Huq on 3/13/19.
//  Copyright © 2019 Shoaib Huq. All rights reserved.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController{
    
    @IBOutlet weak var charityPicker: UIPickerView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    var charityNamePicker: CharityPicker!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        charityNamePicker = CharityPicker()
        charityNamePicker.charityData = CharityData.getData()
        
        charityPicker.delegate = charityNamePicker
        charityPicker.dataSource = charityNamePicker
        
        
        
        quoteLabel.text = "Remeber that the happeist people are not those getting more, but those giving more."
    }


}


