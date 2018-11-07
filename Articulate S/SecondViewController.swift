//
//  SecondViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 6/20/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UIGestureRecognizerDelegate, isOnProtocol {

    @IBOutlet weak var flashcardLabel: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var imageIndex: Int = 0
    var itemList:[Card] = []
   
    @IBAction func unwindsegue(_ sender: UIStoryboardSegue){
       
    }
    func addlist(list:[String])
    {
        for word in list
        {
            itemList.append(Card(image: word))
        }
    }
    override func viewWillLayoutSubviews() {
        if(UserDefaults.standard.bool(forKey: "changed")==true){
            view.bottomAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: ((view.frame.size.height) * 0.17)).isActive = true
            flashcardLabel.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 5).isActive = true
        }else{
            flashcardLabel.isHidden = true
            view.bottomAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 20).isActive = true
        }
    }
    func random(){
        if(UserDefaults.standard.bool(forKey: "random")==true){
            itemList.shuffle()
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        for i in 0..<14 {
            let list: [String]
            switch i {
            case 0: list = ["sad", "safe", "salt", "same", "sand", "saw", "seal", "sick", "sing", "sit", "soap", "sock", "soup", "suit", "sun", "sword"]
            case 1: list = ["celery", "circle", "city", "sailboat", "salad", "sandal", "sandwich", "Santa", "scissors", "seagull", "seven", "soccer", "sofa", "sundae", "sunflower"]
            case 2: list = ["bicycle", "castle", "dancing", "dinosaur", "dresser", "eraser", "faucet", "icicle", "message", "muscle", "pencil", "pizza", "princess", "whistle", "wrestle"]
            case 3: list = ["scared", "scarf", "school", "scuba", "skate", "skeleton", "ski", "sky"]
            case 4: list = ["sled", "sleep", "sleeves", "slice", "slide", "slime", "slip", "slow"]
            case 5: list = ["small", "smart", "smash", "smell", "smile", "smoke", "smooch", "smoothie"]
            case 6: list = ["snack", "snail", "snake", "snapper", "sneaker", "sneeze", "snowflake", "snowman"]
            case 7: list = ["space", "spaghetti", "spider", "spill", "spinach", "sponge", "spooky", "spoon"]
            case 8: list = ["stairs", "stapler", "star", "steak", "stick", "stop", "storm", "student", "stump"]
            case 9: list = ["swamp", "swan", "sweat", "sweater", "sweep", "sweet", "swim", "swing"]
            case 10: list = ["basket", "hamster", "ice cream", "monster", "mosquito", "plastic", "rooster", "sister"]
           case 11: list = ["scrape", "scream", "scribble", "splash", "spray", "sprinkles", "strawberry", "string", "strong"]
            case 12: list = ["bus", "chase", "chess", "dice", "dress", "gas", "glass", "grass", "horse", "house", "juice", "kiss", "moose", "mouse", "nurse", "race", "rice"]
            case 13: list = ["artist", "chest", "dentist", "fast", "forest", "ghost", "nest", "toast"]
            default: fatalError()
                
            }
            if UserDefaults.standard.value(forKey: "\(i)") as? Bool ?? true {
                addlist(list:list)
            }
        }
         random()
       let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgPhoto.isUserInteractionEnabled = true
        imgPhoto.addGestureRecognizer(tapGestureRecognizer)
        
        imageDisplayed()
        
        // Do any additional setup after loading the view.
        imgPhoto.isUserInteractionEnabled = true
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(Swiped(gesture:)))
        leftSwipe.cancelsTouchesInView = false
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(Swiped(gesture:)))
        rightSwipe.cancelsTouchesInView = false
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MemoryViewController{
            destination.returnToImage = imageIndex
        }
    }
    internal func isOn() {
        imgPhoto.isUserInteractionEnabled = true
       
    }
    
    func Swiped(gesture: UIGestureRecognizer) {
        imgPhoto.isUserInteractionEnabled = true
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = itemList.count - 1
                    
                }
                UIImageView.transition(with: imgPhoto, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
               
               
                let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png" )
                imgPhoto.image = UIImage(contentsOfFile: imagePath!)
                
                flashcardLabel.text = itemList[imageIndex].image
               
            case UISwipeGestureRecognizerDirection.left:
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex > itemList.count - 1 {
                    
                    imageIndex = 0
                    
                }
                UIImageView.transition(with: imgPhoto, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png")
                imgPhoto.image = UIImage(contentsOfFile: imagePath!)
              
                
                flashcardLabel.text = itemList[imageIndex].image
            default:
                break //stops the code/codes nothing.
            }
        }
    }
   
    func imageDisplayed(){
        let imagePath = Bundle.main.path(forResource: itemList[imageIndex].image, ofType: "png")
        imgPhoto.image = UIImage(contentsOfFile: imagePath!)
        flashcardLabel.text = itemList[imageIndex].image
    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        imgPhoto.isUserInteractionEnabled = false
        let card = itemList[imageIndex]
        card.delegate = self
        card.playSound()
    }

}
