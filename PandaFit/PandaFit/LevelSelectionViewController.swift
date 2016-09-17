//
//  LevelSelectionViewController.swift
//  PandaFit
//
//  Created by Felix Sonntag on 17/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit

class LevelSelectionViewController: UIViewController {

    let infoMessage = "Your panda is in content mood at the moment. Walk a little to make him happy and preserve him from dying. 🐼"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func startingPandaSelected(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Starting Panda", message:
            self.infoMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Alright!", style: .default) { (action) in
            let statusViewController = self.storyboard?.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
            UserDefaults.standard.set("StartingPanda", forKey: "level")
            self.present(statusViewController, animated: true, completion: nil)
        })        
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func mediumPandaSelected(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Medium Panda", message:
            self.infoMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Alright!", style: .default) { (action) in
            let statusViewController = self.storyboard?.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
            UserDefaults.standard.set("MediumPanda", forKey: "level")
            self.present(statusViewController, animated: true, completion: nil)
        })
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func superPandaSelected(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Super Panda", message:
            self.infoMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Alright!", style: .default) { (action) in
            let statusViewController = self.storyboard?.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
            UserDefaults.standard.set("SuperPanda", forKey: "level")
            self.present(statusViewController, animated: true, completion: nil)
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
