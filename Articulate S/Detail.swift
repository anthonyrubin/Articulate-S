//
//  Detail.swift
//  firstapp
//
//  Created by Anthony Rubin on 7/16/17.
//  Copyright © 2017 rubin. All rights reserved.
//

import UIKit



class Detail: UITableViewController {
    
    var word: Word? {
        didSet (newWord) {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word?.words.count ?? 0 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = self.word?.words[indexPath.row] ?? ""
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }

}
extension Detail: WordSelectionDelegate {
    func wordSelected(newWord: Word) {
        word = newWord
    }
 
}
