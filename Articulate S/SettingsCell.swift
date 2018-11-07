//
//  File.swift
//  firstapp
//
//  Created by Anthony Rubin on 8/13/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
   
    @IBOutlet weak var wordLabel: UILabel!
    var switchChanged: (Bool) -> () = {  _ in }
    
    @IBOutlet weak var wordGroupSwitch: UISwitch!
    
    @IBAction func switchValueChanged( _ switch: UISwitch) {
        switchChanged(`switch`.isOn)
       
    }


}
