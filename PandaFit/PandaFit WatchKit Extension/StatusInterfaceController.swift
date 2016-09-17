//
//  InterfaceController.swift
//  PandaFit WatchKit Extension
//
//  Created by Felix Sonntag on 16/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import WatchKit
import Foundation


class StatusInterfaceController: WKInterfaceController {

    @IBOutlet var imageBackgroundGroup: WKInterfaceGroup!
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var moodLabel: WKInterfaceLabel!
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    
    var panda: Panda? {
        didSet {
            if let panda = panda {
                moodLabel.setText("\(panda.name) is \(panda.mood)")
                scoreLabel.setText(panda.score.description)
                
                let duration = 1.5
                switch panda.mood {
                case .ecstatic:
                    image.setImageNamed("ecstatic")
                    imageBackgroundGroup.setBackgroundColor(UIColor(red: 0.0, green: 153/255, blue: 1.0, alpha: 1.0))
                case .happy:
                    image.setImageNamed("happy")
                    imageBackgroundGroup.setBackgroundColor(UIColor(red: 0.0, green: 153/255, blue: 1.0, alpha: 1.0))
                case .content:
                    image.setImageNamed("content")
                    imageBackgroundGroup.setBackgroundColor(UIColor.blue)
                case .angry:
                    image.setImageNamed("angry")
                    imageBackgroundGroup.setBackgroundColor(UIColor(red: 1.0, green: 102/255, blue: 0.0, alpha: 1.0))
                case .dying:
                    image.setImageNamed("dying")
                    imageBackgroundGroup.setBackgroundColor(UIColor(red: 102/255, green: 0.0, blue: 0.0, alpha: 1.0))
                }
                
                image.startAnimatingWithImages(in: NSRange(location:0, length: 2), duration: duration, repeatCount: 0)
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.panda = Panda(name: "Felix", score: 50, mood: Mood.angry)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
