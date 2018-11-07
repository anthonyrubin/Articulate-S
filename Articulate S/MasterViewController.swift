//
//  MasterViewController.swift
//  firstapp
//
//  Created by Anthony Rubin on 7/18/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit

protocol WordSelectionDelegate: class {
    func wordSelected(newWord: Word)
}

class MasterViewController: UITableViewController{
    var words = [Word]()
    
   
    weak var delegate: WordSelectionDelegate?
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        dismiss(animated: true) { _ in }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.words.append(Word(name: "initial /s/ 1 syllable", words: ["sad", "safe", "salt", "same", "sand", "saw", "seal", "sick", "sing", "sit", "soap", "sock", "soup", "suit", "sun", "sword"]))
        
        self.words.append(Word(name: "initial /s/ multisyllabic", words:["celery", "circle", "city", "sailboat", "salad", "sandal", "sandwich", "Santa", "scissors", "seagull", "seven", "soccer", "sofa", "sundae", "sunflower"]))
        
        self.words.append(Word(name: "intersyllabic /s/", words: ["bicycle", "castle", "dancing", "dinosaur", "dresser", "eraser", "faucet", "icicle", "message", "muscle", "pencil", "pizza", "princess", "whistle", "wrestle"]))
        
        self.words.append(Word(name: "initial /sk/", words: ["scared", "scarf", "school", "scuba", "skate", "skeleton", "ski", "sky"]))
        
        self.words.append(Word(name: "initial /sl/", words: ["sled", "sleep", "sleeves", "slice", "slide", "slime", "slip", "slow"]))
        
        self.words.append(Word(name: "initial /sm/", words: ["small", "smart", "smash", "smell", "smile", "smoke", "smooch", "smoothie"]))
        
        self.words.append(Word(name: "initial /sn/", words: ["snack", "snail", "snake", "snapper", "sneaker", "sneeze", "snowflake", "snowman"]))
        
        self.words.append(Word(name: "initial /sp/", words: ["space", "spaghetti", "spider", "spill", "spinach", "sponge", "spooky", "spoon"]))
        
        self.words.append(Word(name: "initial /st/", words: ["stairs", "stapler", "star", "steak", "stick", "stop", "storm", "student", "stump"]))
        
        self.words.append(Word(name: "initial /sw/", words: ["swamp", "swan", "sweat", "sweater", "sweep", "sweet", "swim", "swing"]))
        
        self.words.append(Word(name: "medial /s/ clusters", words: ["basket", "hamster", "ice cream", "monster", "mosquito", "plastic", "rooster", "sister"]))
        
       self.words.append(Word(name: "initial 3 consonant clusters", words: ["scrape", "scream", "scribble", "splash", "spray", "sprinkles", "strawberry", "string", "strong"]))
        
        self.words.append(Word(name: "final /s/", words: ["bus", "chase", "chess", "dice", "dress", "gas", "glass", "grass", "horse", "house", "juice", "kiss", "moose", "mouse", "nurse", "race", "rice"]))
        
        self.words.append(Word(name: "final /st/", words: ["artist", "chest", "dentist", "fast", "forest", "ghost", "nest", "toast"]))
      
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return 1
        }
        if(section == 1){
            return 1
        }
        else{
            return self.words.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SettingsCellTwo
            if let set = UserDefaults.standard.bool(forKey: "changed") as? Bool{
                cell2.wordGroupSwitch.setOn(set, animated: false)
                
            } else{
                cell2.wordGroupSwitch.isOn = true
            }
            cell2.selectionStyle = UITableViewCellSelectionStyle.none
            cell2.textLabel?.text = "flashcard text"
            cell2.textLabel?.textColor = UIColor.red
            cell2.textLabel?.backgroundColor = UIColor.clear
            return cell2
        }
        if(indexPath.section == 1){
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SettingsCellThree
            if let set = UserDefaults.standard.bool(forKey: "random") as? Bool{
                cell2.wordGroupSwitch.setOn(set, animated: false)
                
            } else{
                cell2.wordGroupSwitch.isOn = true
            }
            cell2.selectionStyle = UITableViewCellSelectionStyle.none
            cell2.textLabel?.text = "randomize flashcards"
            cell2.textLabel?.textColor = UIColor.red
            cell2.textLabel?.backgroundColor = UIColor.clear
            return cell2
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
            let word = self.words[indexPath.row]
            cell.wordGroupSwitch.isOn = isSwitchOn(at: indexPath.row)
            cell.textLabel?.text = word.name
            cell.textLabel?.backgroundColor = UIColor.clear
            cell.switchChanged = { [weak self] isOn in
                self?.wordGroup(at: indexPath.row , changedTo: isOn)
            }
            return cell
            
        }
    }
    
    
    
    func wordGroup(at index: Int, changedTo value: Bool) {
        let numberOfGroupsTurnedOn = Array(0..<14).map {
            isSwitchOn(at: $0)
            }.filter { $0 }.count
        
        if  (numberOfGroupsTurnedOn <= 1 && value == false) {
            //display a message
            
            let alertController = UIAlertController(title: "Error", message: "You cant turn off all wordgroups", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel) { [weak self]  _ in
                self?.tableView.reloadData()
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true) { _ in }
            
        } else {
            // persist the setting
            UserDefaults.standard.set(value, forKey: "\(index)")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    func isSwitchOn(at index: Int) -> Bool {
        return UserDefaults.standard.value(forKey: "\(index)") as? Bool ?? true
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Detail" {
            let hubso = storyboard?.instantiateViewController(withIdentifier: "secondTableVIew")
            if(hubso?.viewIfLoaded?.window == nil){
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail"{
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
            
            var DetailViewController: Detail!
            // with help of adaptive segue we can support all devices
            if let NavigationController = segue.destination as? UINavigationController {
                // works on devices where UISplitViewController is implemented
                DetailViewController = NavigationController.topViewController as! Detail
            } else {
                // works for iPhone on ios7, where UISplitViewController is not implemented
                DetailViewController = segue.destination as! Detail
            }
            // this is common part, where one can configure detail view
            // segue provides a new instance of detail view everytime
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedwords = self.words[indexPath.row]
                let selectedname = selectedwords.name
                DetailViewController.title = "Words contained in \(selectedname)"
                DetailViewController.wordSelected(newWord: selectedwords)
            }
        }
    }
}
