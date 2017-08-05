//
//  ViewController.swift
//  TipCalPeter
//
//  Created by Peter Joseph Karunanidhi on 8/4/17.
//  Copyright © 2017 M A. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    var tipDefault : ((Int)->())?
    var sessionSave : ((Bool)->())?
    let defaults = UserDefaults.standard

    @IBOutlet weak var saveSwitch: UISwitch!
    @IBOutlet weak var percentOption: UISegmentedControl!
    
      override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        
        let choosenIndex = defaults.integer(forKey:"choosenIndex")
        percentOption.selectedSegmentIndex = choosenIndex
    }

    @IBAction func percentChanged(_ sender: UISegmentedControl) {
        tipDefault?(percentOption.selectedSegmentIndex)
        defaults.set(percentOption.selectedSegmentIndex, forKey: "choosenIndex")
        defaults.synchronize()

    }
    
    @IBAction func saveSwitch(_ sender: Any) {
        if saveSwitch.isOn{
        defaults.set(true, forKey: "sessionSave")
        }else{
        defaults.set(false, forKey: "sessionSave")
        }

        defaults.synchronize()
        
    }
  
}

