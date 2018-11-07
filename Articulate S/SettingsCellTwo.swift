//
//  SettingsCellTwo.swift
//  firstapp
//
//  Created by Anthony Rubin on 4/15/18.
//  Copyright © 2018 rubin. All rights reserved.
//

import UIKit

class SettingsCellTwo: UITableViewCell {
    var switchChanged2: (Bool) -> () = { _ in   }
    
    @IBOutlet weak var wordGroupSwitch: UISwitch!
    
    @IBAction func switchValueChanged2() {
        let defaults = UserDefaults.standard
        
        defaults.set(wordGroupSwitch.isOn, forKey: "changed")
        defaults.synchronize()

    }

}
