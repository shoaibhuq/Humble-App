//
//  CharityPicker.swift
//  Humble
//
//  Created by Shoaib Huq on 3/19/19.
//  Copyright © 2019 Shoaib Huq. All rights reserved.
//

import UIKit
import SafariServices

struct Charity{
    var name: String
    var donateURL: String
    
    init(name: String, donateURL: String){
        self.name = name
        self.donateURL = donateURL
    }
}

//Charities Array
class CharityData{
    class func getData() -> [Charity] {
        var data = [Charity]()
        data.append(Charity(name: "Unicef", donateURL: "https://www.unicefusa.org/help/donate"))
        data.append(Charity(name: "American Red Cross", donateURL: "https://www.redcross.org/donate/donation.html/"))
        data.append(Charity(name: "Susan G. Komen", donateURL: "https://https://ww5.komen.org/Donate/Donate.html"))
        data.append(Charity(name: "Project Downtown", donateURL: "http://www.projectdowntown.org/donating.html"))
        
        return data.sorted(by: {$0.name < $1.name})
        }
    
    }


class CharityPicker: UIPickerView {
    
    var charityData: [Charity]!
    var charityURL: String = ""
    var charityRow = 0
    var charityName: String = ""
    let customWidth: CGFloat = 250
    let customHeight: CGFloat = 100
    
    
    func getURL() -> String {
        return charityURL
    }
    
}


extension CharityPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return charityData.count
    }
    
}

extension CharityPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    @objc func openURL(sender: UIButton){
        UIApplication.shared.open(URL(string: charityURL)! as URL, options: [:], completionHandler: nil)
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        charityURL = charityData[row].donateURL
    }

    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //Frame Dimensions of the Picker UIView
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        //Center Label Dimensions
        let centerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        //Center Label Font Attributes
        centerLabel.font = UIFont.systemFont(ofSize: 25)
        centerLabel.textColor = .white
        centerLabel.textAlignment = .center
        
        //Adding the charity data
        centerLabel.text = charityData[row].name
        
        //Adding the center label
        view.addSubview(centerLabel)
        
        
        
        //Adding bottom label
        let bottomLabel = UIButton(frame: CGRect(x: 0, y: 25, width: customWidth, height: customHeight))
        
        bottomLabel.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        bottomLabel.showsTouchWhenHighlighted = true
        bottomLabel.setTitle(charityData[row].donateURL, for: UIControl.State.normal)
        
        bottomLabel.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        
        view.addSubview(bottomLabel)
        
        return view
    }
    
}





