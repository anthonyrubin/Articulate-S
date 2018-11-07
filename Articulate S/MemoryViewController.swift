//
//  MemoryViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 10/11/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit; import AVFoundation
import StoreKit

enum Colors {
    
    static let red = UIColor(red: 1.0, green: 0.0, blue: 77.0/255.0, alpha: 1.0)
    static let blue = UIColor.blue
    static let green = UIColor(red: 35.0/255.0 , green: 233/255, blue: 173/255.0, alpha: 1.0)
    static let yellow = UIColor(red: 1, green: 209/255, blue: 77.0/255.0, alpha: 1.0)
    
}

enum Images {
    
    static let box = UIImage(named: "Box")!
    static let triangle = UIImage(named: "Triangle")!
    static let circle = UIImage(named: "Circle")!
    static let swirl = UIImage(named: "Spiral")!
    
}

class MemoryViewController: UIViewController, UIGestureRecognizerDelegate, isOnProtocol{
    var firstSelected = Int()
    var secondSelected = Int()
    var sstring = String()
    var player: AVAudioPlayer?
    var returnToImage = Int()
    var emitter = CAEmitterLayer()
    //item list to be used by the imageTapped function
    var newItemList:[Card] = []
    var universalImage = UIImage()
    var universalInt = Int()
    var dissappear = 0
    var colors:[UIColor] = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow
    ]
    var images:[UIImage] = [
        Images.box,
        Images.triangle,
        Images.circle,
        Images.swirl
    ]
    var velocities:[Int] = [
        100,
        90,
        150,
        200
    ]
    
    
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var xbutton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var homeAndXbutton: UIButton!
    @IBOutlet weak var memoryGameReset: UIImageView!
    @IBOutlet weak var R1C1: UIImageView!
    @IBOutlet weak var R1C2: UIImageView!
    @IBOutlet weak var R1C3: UIImageView!
    @IBOutlet weak var R1C4: UIImageView!
    @IBOutlet weak var R2C1: UIImageView!
    @IBOutlet weak var R2C2: UIImageView!
    @IBOutlet weak var R2C3: UIImageView!
    @IBOutlet weak var R2C4: UIImageView!
    @IBOutlet weak var R3C1: UIImageView!
    @IBOutlet weak var R3C2: UIImageView!
    @IBOutlet weak var R3C3: UIImageView!
    @IBOutlet weak var R3C4: UIImageView!
    @IBOutlet weak var R4C1: UIImageView!
    @IBOutlet weak var R4C2: UIImageView!
    @IBOutlet weak var R4C3: UIImageView!
    @IBOutlet weak var R4C4: UIImageView!
    
    var outletArray: [UIImageView] = []
    //random # used for random memory card backing
    let random = Int(arc4random_uniform(4))
    
    //count used to keep track of how many cards have been revealed
    var count = 0
    
    let m = memoryCard(cardIsRevealed: false, dissapear: false, sound: "")
    //matrix of memoryCard structs
    
    var memoryArray: [[memoryCard]] = [[]]
    
    func cardBacking() -> UIImage{
        var result: UIImage
        if random == 1{
            result = UIImage(named: "memback1")!
        }else if random == 2{
            result = UIImage(named: "memback2")!
        }else if random == 3{
            result = UIImage(named: "memback3")!
        }else{
            result = UIImage(named: "memback4")!
        }
        return result
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCards()
        //end viewDidLoad method
    }
    
    func loadCards(){
        xbutton.isUserInteractionEnabled = false
        xbutton.setImage(nil, for: .normal)
        dissappear = 0
        var itemList:[Card] = []
        newItemList = []
        playAgain.isHidden = true
        returnButton.isHidden = true
        homeAndXbutton.addTarget(self, action:#selector(home(_:)), for: .touchUpInside)
        
        memoryArray = [[m,m,m,m],[m,m,m,m],[m,m,m,m],[m,m,m,m]]
        outletArray = [R1C1, R1C2, R1C3, R1C4, R2C1, R2C2, R2C3, R2C4, R3C1, R3C2, R3C3, R3C4, R4C1, R4C2, R4C3, R4C4]
        
        for i in 0..<outletArray.count {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
            outletArray[i].contentMode = UIViewContentMode.scaleToFill
            outletArray[i].isUserInteractionEnabled = true
            outletArray[i].addGestureRecognizer(tapGestureRecognizer)
            outletArray[i].image = cardBacking()
        }
        func addlist(list:[String])
        {
            for word in list
            {
                itemList.append(Card(image: word))
            }
        }
        
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
            if (UserDefaults.standard.value(forKey: "\(i)") as? Bool ?? true) {
                addlist(list:list)
            }
        }
        itemList.shuffle()
        
        let shuffledList = itemList[0..<8]
        
        newItemList.append(contentsOf: shuffledList)
        newItemList.append(contentsOf: shuffledList)
        newItemList.shuffle()
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        emitter.removeFromSuperlayer()
        self.view.setNeedsDisplay()
        loadCards()
        homeAndXbutton.isUserInteractionEnabled = true
        
    }
    func home(_ sender: UIButton!){
        self.dismiss(animated: true, completion: {})
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController{
            destination.imageIndex = returnToImage
        }
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        home(returnButton)
        
    }
    
    
    func cardResetFunction(tapGestureRecognizer: UITapGestureRecognizer){
        UIImageView.transition(with: outletArray[firstSelected], duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIImageView.transition(with: outletArray[secondSelected], duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
        outletArray[firstSelected].image = cardBacking()
        outletArray[secondSelected].image = cardBacking()
        outletArray[firstSelected].contentMode = .scaleToFill
        outletArray[secondSelected].contentMode = .scaleToFill
        outletArray[firstSelected].isUserInteractionEnabled = true
        outletArray[secondSelected].isUserInteractionEnabled = true
        memoryArray[firstSelected/4][firstSelected%4].cardIsRevealed = false
        memoryArray[secondSelected/4][secondSelected%4].cardIsRevealed = false
        
        memoryGameReset.isUserInteractionEnabled = false
        count = 0
    }
    
    
    func match(){
        memoryGameReset.image = universalImage
        memoryGameReset.backgroundColor = UIColor.white
        memoryGameReset.isUserInteractionEnabled = true
        homeAndXbutton.setImage(nil, for: .normal)
        homeAndXbutton.isUserInteractionEnabled = false
        xbutton.addTarget(self, action:#selector(clearCards(_:)), for: .touchUpInside)
        xbutton.isUserInteractionEnabled = true
        xbutton.setImage(#imageLiteral(resourceName: "xbutton"), for: UIControlState.normal)
        
    }
    
    func matchImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        memoryGameReset.isUserInteractionEnabled = false
        
        let card = newItemList[universalInt]
        card.delegate = self
        card.playSound()
        
    }
    internal func isOn() {
        if(memoryGameReset.image != nil){
            memoryGameReset.isUserInteractionEnabled = true
        }else{
            memoryGameReset.isUserInteractionEnabled = false
        }
    }
    
    func clearCards(_ sender: UIButton!){
        let defaults = UserDefaults.standard
        defaults.set(defaults.integer(forKey: "counter")+1, forKey: "counter")
        if(dissappear == 14){
            if #available(iOS 10.3, *){
                if(UserDefaults.standard.integer(forKey: "counter")<20 && UserDefaults.standard.integer(forKey: "counter")%6==0){
                    SKStoreReviewController.requestReview()
                }
            }
            emitter.emitterPosition = CGPoint(x: self.view.frame.size.height, y: -10)
            emitter.emitterShape = kCAEmitterLayerLine
            emitter.emitterSize = CGSize(width: self.view.frame.size.width + 700, height: 0)
            
            emitter.emitterCells = generateEmitterCells()
            
            self.view.layer.addSublayer(emitter)
            
            playAgain.isHidden = false
            returnButton.isHidden = false
            self.view.bringSubview(toFront: self.buttonStack)
        }
        
        homeAndXbutton.setImage(#imageLiteral(resourceName: "bluehome.png"), for: .normal)
        homeAndXbutton.isUserInteractionEnabled = true
        xbutton.setImage(nil, for: .normal)
        xbutton.isUserInteractionEnabled = false
        memoryGameReset.image = nil
        memoryGameReset.backgroundColor = nil
        memoryGameReset.isUserInteractionEnabled = false
        
        
        for i in 0..<4 {
            for x in 0..<4 {
                memoryArray[i][x].cardIsRevealed = false
                if (memoryArray[i][x].dissapear==true){
                    outletArray[(i*4)+x].image = nil
                    outletArray[(i*4)+x].isUserInteractionEnabled = false
                }else if(memoryArray[i][x].dissapear==false){
                    outletArray[(i*4)+x].isUserInteractionEnabled = true
                }
            }
        }
        count = 0;
        dissappear += 2
    }
    
    func memoryGameResetUserInteraction(){
        memoryGameReset.isUserInteractionEnabled = true;
    }
    func setUserInteractionsToFalse(){
        for i in 0..<16{
            outletArray[i].isUserInteractionEnabled = false
        }
    }
    func setUserInteractionsToTrue(){
        for i in 0..<4 {
            for x in 0..<4 {
                if(memoryArray[i][x].dissapear==false){
                    outletArray[(i*4)+x].isUserInteractionEnabled = true
                }else{
                    outletArray[(i*4)+x].isUserInteractionEnabled = false
                }
            }
        }
    }
    
    func winningSound(){
        guard let url = Bundle.main.url(forResource: "twinkle", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        for index in 0..<16 {
            
            let cell = CAEmitterCell()
            
            cell.birthRate = 4.0
            cell.lifetime = 14.0
            cell.lifetimeRange = 0
            cell.velocity = CGFloat(getRandomVelocity())
            cell.velocityRange = 0
            cell.emissionLongitude = CGFloat(Double.pi)
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 0
            cell.color = getNextColor(i: index)
            cell.contents = getNextImage(i: index)
            cell.scaleRange = 0.25
            cell.scale = 0.1
            
            cells.append(cell)
            
        }
        
        return cells
        
    }
    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }
    
    private func getNextColor(i:Int) -> CGColor {
        if i <= 4 {
            return colors[0].cgColor
        } else if i <= 8 {
            return colors[1].cgColor
        } else if i <= 12 {
            return colors[2].cgColor
        } else {
            return colors[3].cgColor
        }
    }
    
    private func getNextImage(i:Int) -> CGImage {
        return images[i % 4].cgImage!
    }
    
    func tapped(tapGestureRecognizer: UITapGestureRecognizer){
        count+=1
        if(count<=2){
            let tappedImage = tapGestureRecognizer.view as! UIImageView
            UIImageView.transition(with: outletArray[tappedImage.tag], duration: 0.25, options: .transitionFlipFromTop, animations: nil, completion: nil)
            let imagePath = Bundle.main.path(forResource: newItemList[tappedImage.tag].image, ofType: "png")
            outletArray[tappedImage.tag].image = UIImage(contentsOfFile: imagePath!)
            memoryArray[tappedImage.tag/4][tappedImage.tag%4].cardIsRevealed = true
            memoryArray[tappedImage.tag/4][tappedImage.tag%4].sound = newItemList[tappedImage.tag].image
            outletArray[tappedImage.tag].contentMode = .scaleAspectFit
            outletArray[tappedImage.tag].isUserInteractionEnabled = false
            
            if(count==1){
                sstring = memoryArray[tappedImage.tag/4][tappedImage.tag%4].sound
                firstSelected = tappedImage.tag
            }
            if(count==2){
                secondSelected = tappedImage.tag
                if(sstring == memoryArray[tappedImage.tag/4][tappedImage.tag%4].sound){
                    twoCardsRevealed()
                }
                if(sstring != memoryArray[tappedImage.tag/4][tappedImage.tag%4].sound){
                    didNotMatch()
                }
            }
        }
    }
    func twoCardsRevealed() {
        winningSound()
        outletArray[firstSelected].shake()
        outletArray[secondSelected].shake()
        setUserInteractionsToFalse()
        homeAndXbutton.isUserInteractionEnabled = false
        memoryArray[firstSelected/4][firstSelected%4].dissapear = true
        memoryArray[secondSelected/4][secondSelected%4].dissapear = true
        let imagePath = Bundle.main.path(forResource: newItemList[secondSelected].image, ofType: "png")
        universalImage = UIImage(contentsOfFile: imagePath!)!
        universalInt = (secondSelected)
        
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(match), userInfo: nil, repeats: false)
        let matchPictureGestureRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(matchImageTapped(tapGestureRecognizer:)))
        memoryGameReset.addGestureRecognizer(matchPictureGestureRecognizer)
    }
    
    func didNotMatch(){
        memoryGameReset.isUserInteractionEnabled = true
        let resetGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cardResetFunction(tapGestureRecognizer:)))
        memoryGameReset.addGestureRecognizer(resetGestureRecognizer)
        
    }
    
}
extension MutableCollection {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: numericCast(arc4random_uniform(numericCast(diff))))
            swapAt(i, j)
        }
    }
}
public extension UIView {
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = -5) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation
        layer.add(animation, forKey: "shake")
    }
}





