//
//  SplitViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 3/27/18.
//  Copyright © 2018 rubin. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
self.delegate = self
        self.preferredDisplayMode = .allVisible
        
    }
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
    
        return true
    }


  

}
