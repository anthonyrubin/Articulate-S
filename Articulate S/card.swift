//
//  card.swift
//  firstapp
//
//  Created by Anthony Rubin on 7/29/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import Foundation; import UIKit; import AVFoundation

protocol isOnProtocol: AnyObject{
    func isOn()
}

class Card: NSObject
{
    weak var delegate: isOnProtocol!
    var player: AVAudioPlayer?
    var image: String

    init(image: String,  isActive:Bool = true) {
        self.image = image
        
    }
    
    func playSound()
    {
        guard let url = Bundle.main.url(forResource: self.image, withExtension: "wav") else { return }
        do
        {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension Card: AVAudioPlayerDelegate  {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){
        if let del = delegate{
            del.isOn()
        }else{
            print("the delegate is not set")
        }
   
    }
   }

