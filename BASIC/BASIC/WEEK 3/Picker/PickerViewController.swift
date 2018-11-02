//
//  PickerViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 11. 2..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var countryLabel: UILabel!
   
    var countryArray = ["South Korea", "North Korea", "America", "Japan", "China", "Canada"]
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryLabel.text = "selected: \(countryArray[row])"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picker"
    }
    

    

}
