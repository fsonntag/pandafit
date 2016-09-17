//
//  FriendsViewController.swift
//  PandaFit
//
//  Created by Felix Sonntag on 17/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let networkController = PGNetworkController()
    let friendsTableViewController: FriendsTableViewController = FriendsTableViewController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        
        friendsTableView.delegate = self.friendsTableViewController
        friendsTableView.dataSource = self.friendsTableViewController
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriend(_ sender: AnyObject) {
        if let name = nameTextField.text {
            let newFriend = networkController.getPandaState(name: name)
            self.friendsTableViewController.addOrUpdatePanda(newPanda: newFriend)
            nameTextField.text = ""
            
        } else {
            let alertController = UIAlertController(title: "No Friend Name", message:
                "Please enter the name of the friend you want to add", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Alright!", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FriendsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            addFriend(textField)
            return false
        }
        return true
    }
}
