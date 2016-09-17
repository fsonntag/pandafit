//
//  ViewController.swift
//  PandaFit
//
//  Created by Felix Sonntag on 16/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var panda: Panda? {
        didSet {
            if let panda = panda {
                moodLabel.text = "\(panda.mood)".uppercased()
                scoreLabel.text = panda.score.description
                
                switch panda.mood {
                case .ecstatic:
                    imageView.animationImages = [UIImage(named: "ecstatic1")!, UIImage(named: "ecstatic2")!]
                case .happy:
                    imageView.animationImages = [UIImage(named: "happy1")!, UIImage(named: "happy2")!]
                case .content:
                    imageView.animationImages = [UIImage(named: "content1")!, UIImage(named: "content2")!]
                case .angry:
                    imageView.animationImages = [UIImage(named: "angry1")!, UIImage(named: "angry2")!]
                case .dying:
                    imageView.animationImages = [UIImage(named: "dying1")!, UIImage(named: "dying2")!]
                }
                imageView.animationDuration = 1.0
                
                imageView.startAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.panda = Panda(name: "Felix", score: 50, mood: Mood.happy)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

