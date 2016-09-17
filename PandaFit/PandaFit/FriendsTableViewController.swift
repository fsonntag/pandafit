//
//  FriendsTableViewController.swift
//  PandaFit
//
//  Created by Felix Sonntag on 17/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: Array<Panda> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.friends = loadFriends()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell

        let panda = friends[indexPath.row]

        cell.name.text = panda.name
        cell.score.text = panda.score.description
        switch panda.mood {
        case .ecstatic:
            cell.stateImageView.image = UIImage(named: "ecstatic1")
        case .happy:
            cell.stateImageView.image = UIImage(named: "ecstatic2")
        case .content:
            cell.stateImageView.image = UIImage(named: "ecstatic1")
        case .angry:
            cell.stateImageView.image = UIImage(named: "ecstatic2")
        case .dying:
            cell.stateImageView.image = UIImage(named: "dying1")
        }
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadFriends() -> Array<Panda> {
        if let friendsData =  UserDefaults.standard.value(forKey: "friends") as? Data {
            let array = NSKeyedUnarchiver.unarchiveObject(with: friendsData)
            if let array = array as? Array<Panda> {
                return array
            } else {
                return Array()
            }
        } else {
            return Array()
        }
    }
    
    func addOrUpdatePanda(newPanda: Panda) -> Void {
        var contained = false
        for panda in self.friends {
            if panda.name == newPanda.name {
                panda.mood = newPanda.mood
                panda.score = newPanda.score
                contained = true
            }
        }
        if !contained {
            self.friends.append(newPanda)
        }
        let friendsData = NSKeyedArchiver.archivedData(withRootObject: self.friends)
        UserDefaults.standard.setValue(friendsData, forKey: "friends")
//        UserDefaults.standard.set(self.friends, forKey: "friends")
        self.tableView.reloadData()
    }

}
