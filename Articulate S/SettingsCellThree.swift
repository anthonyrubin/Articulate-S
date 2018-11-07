//
//  SettingsCellThree.swift
//  Articulate S
//
//  Created by Anthony Rubin on 5/20/18.
//  Copyright © 2018 rubin. All rights reserved.
//

import UIKit

class SettingsCellThree: UITableViewCell {
    var switchChanged3: (Bool) -> () = { _ in   }
    
    @IBOutlet weak var wordGroupSwitch: UISwitch!
    
    @IBAction func switchValueChanged3() {
        let defaults = UserDefaults.standard
        
        defaults.set(wordGroupSwitch.isOn, forKey: "random")
        defaults.synchronize()
        
    }
}
