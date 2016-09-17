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

    var pandaState: PandaState? {
        didSet {
            if let pandaState = pandaState {
                moodLabel.text = "\(pandaState.mood)".uppercased()
                scoreLabel.text = pandaState.score.description
                
                switch pandaState.mood {
                case .ecstatic:
                    imageView.animationImages = [UIImage(named: "Pika1")!, UIImage(named: "Pika2")!]
                case .happy:
                    imageView.animationImages = [UIImage(named: "Pika1")!, UIImage(named: "Pika2")!]
                case .content:
                    imageView.animationImages = [UIImage(named: "Pika1")!, UIImage(named: "Pika2")!]
                case .angry:
                    imageView.animationImages = [UIImage(named: "Pika1")!, UIImage(named: "Pika2")!]
                case .dying:
                    imageView.animationImages = [UIImage(named: "Pika1")!, UIImage(named: "Pika2")!]
                }
                imageView.animationDuration = 1.0
                
                imageView.startAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pandaState = PandaState(score: 50, mood: Mood.happy)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

