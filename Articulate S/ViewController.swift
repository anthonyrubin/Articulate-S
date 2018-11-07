//
//  ViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 6/13/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GoButton: UIButton!
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    
    @IBOutlet weak var aboutButton: UIButton!
    
    
    @IBAction func unwindsegue(_ sender: UIStoryboardSegue){
    }
    
    override func viewWillLayoutSubviews() {
        if((view.frame.size.width == 896 && view.frame.size.height == 414)||(view.frame.size.width == 414 && view.frame.size.height == 896)){
            iphoneXR()
        }
        if(view.frame.size.width == 375 || view.frame.size.width == 812)&&(view.frame.size.height == 375 || view.frame.size.height == 812){
            iphoneX()
        }
        if(view.frame.size.width == 320 || view.frame.size.width == 568)&&(view.frame.size.height == 320 || view.frame.size.height == 568){
            iphoneSE()
        }
        
        if(view.frame.size.width == 414 || view.frame.size.width == 736)&&(view.frame.size.height == 414 || view.frame.size.height == 736){
            iphone8Plus()
        }
        
        if(view.frame.size.width == 375 || view.frame.size.width == 667)&&(view.frame.size.height == 375 || view.frame.size.height == 667){
            iphone8()
        }
        
        if(view.frame.size.width == 1024 || view.frame.size.width == 1366)&&(view.frame.size.height == 1024 || view.frame.size.height == 1366){
            ipadPro()
        }
        
        if(view.frame.size.width == 1112 || view.frame.size.width == 834)&&(view.frame.size.height == 1112 || view.frame.size.height == 834){
            ipad10inch()
        }
        
        if(view.frame.size.width == 768 || view.frame.size.width == 1024)&&(view.frame.size.height == 768 || view.frame.size.height == 1024){
            ipad9inch()
        }
    }
    func iphoneXR(){
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "articulateSIphonePage.png")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 80)
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 271).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 225).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 440).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 21).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 165).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 360).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 170).isActive = true
    }
    func iphoneX(){
        //complete
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "articulateSIphonePage.png")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 80)
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 21).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 261).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 235).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 430).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 21).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 165).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 324).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 170).isActive = true
    }
    func iphoneSE(){
        //complete
        
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "articulateSIphonePage.png")
        
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 232).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 30).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135).isActive = true
        
        
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 160).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 21).isActive = true
        
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant:137).isActive = true
        
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 222).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 148).isActive = true
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 66)
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
    }
    func iphone8Plus(){
        //complete
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "articulateSIphonePage.png")
        
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 85)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 300).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 36).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170).isActive = true
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 206).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 390).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 25).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 173).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 288).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 186).isActive = true
        
    }
    func iphone8(){
        //complete
        Background.contentMode = .scaleToFill
        Background.image = #imageLiteral(resourceName: "articulateSIphonePage.png")
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 270).isActive = true
        GoButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 30).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 161).isActive = true
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 184).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 346).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 24).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 160).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 262).isActive = true
        aboutButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 172).isActive = true
    }
    func ipadPro(){
        //complete
        Background.contentMode = .scaleToFill
        
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 135)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 750).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 830).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 310).isActive = true
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 400).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 720).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 76).isActive = true
        
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 655).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 530).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 450).isActive = true
    }
    func ipad10inch(){
        //complete
        Background.contentMode = .scaleToFill
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 120)
        
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 615).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 675).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 255).isActive = true
        
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 310).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 575).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 50).isActive = true
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 52)
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 519).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 421).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 369).isActive = true
    }
    func ipad9inch(){
        Background.contentMode = .scaleToFill
        GoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 103)
        view.bottomAnchor.constraint(equalTo: GoButton.bottomAnchor, constant: 570).isActive = true
        view.trailingAnchor.constraint(equalTo: GoButton.trailingAnchor, constant: 630).isActive = true
        GoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 235).isActive = true
        
        SettingsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        view.trailingAnchor.constraint(equalTo: SettingsButton.trailingAnchor, constant: 287).isActive = true
        SettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 532).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 44).isActive = true
        
        aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 46)
        view.trailingAnchor.constraint(equalTo: aboutButton.trailingAnchor, constant: 485).isActive = true
        aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 390).isActive = true
        view.bottomAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 340).isActive = true
    }
    
}

