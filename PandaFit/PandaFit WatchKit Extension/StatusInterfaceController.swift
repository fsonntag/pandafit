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
    
    var pandaState: PandaState? {
        didSet {
            if let pandaState = pandaState {
                moodLabel.setText("Panda is \(pandaState.mood)")
                scoreLabel.setText(pandaState.score.description)
                
                let duration = 1.5
                switch pandaState.mood {
                case .ecstatic:
                    image.setImageNamed("ecstatic")
                    imageBackgroundGroup.setBackgroundColor(UIColor.cyan)
                case .happy:
                    image.setImageNamed("happy")
                    imageBackgroundGroup.setBackgroundColor(UIColor(red: 150, green: 150, blue: 150, alpha: 1.0))
                case .content:
                    image.setImageNamed("content")
                    imageBackgroundGroup.setBackgroundColor(UIColor.cyan)
                case .angry:
                    image.setImageNamed("angry")
                    imageBackgroundGroup.setBackgroundColor(UIColor.red)
                case .dying:
                    image.setImageNamed("dying")
                    imageBackgroundGroup.setBackgroundColor(UIColor.cyan)
                }
                
                image.startAnimatingWithImages(in: NSRange(location:0, length: 2), duration: duration, repeatCount: 0)
            }
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.pandaState = PandaState(score: 50, mood: Mood.ecstatic)
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
