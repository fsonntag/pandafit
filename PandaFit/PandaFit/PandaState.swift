//
//  PandaState.swift
//  PandaFit
//
//  Created by Felix Sonntag on 17/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit

enum Mood {
    case ecstatic
    case happy
    case content
    case angry
    case dying
}

class PandaState: NSObject {
    
    var score: Int = 50
    var mood: Mood
    
    init(score: Int) {
        self.score = score
        switch score {
        case let x where x < 20:
            self.mood = .dying
        case let x where x < 40:
            self.mood = .angry
        case let x where x < 60:
            self.mood = .content
        case let x where x < 80:
            self.mood = .happy
        case let x where x >= 80:
            self.mood = .ecstatic
        default:
            print("Warning: couldn't get a valid value for the score: \(score)")
            self.mood = .content
        }
    }
    
    init(score: Int, mood: Mood) {
        self.score = score
        self.mood = mood
    }

}
