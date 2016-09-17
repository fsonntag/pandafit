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

    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var moodLabel: WKInterfaceLabel!
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    
    var pandaState: PandaState? {
        didSet {
            if let pandaState = pandaState {
                moodLabel.setText("Panda is \(pandaState.mood)")
                scoreLabel.setText(pandaState.score.description)
                
                let duration = 1.5
                image.setImageNamed("Pika")
                image.startAnimatingWithImages(in: NSRange(location:0, length: 2), duration: duration, repeatCount: 0)
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.pandaState = PandaState(score: 50, mood: Mood.happy)
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
