//
//  Panda.swift
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

class Panda: NSObject, NSCoding {
    
    var name: String
    var score: Int = 50
    var mood: Mood
    
    
    init(name: String, score: Int) {
        self.name = name
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
    
    init(name: String, score: Int, mood: Mood) {
        self.name = name
        self.score = score
        self.mood = mood
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let score = aDecoder.decodeInt32(forKey: "score")
        guard let name = aDecoder.decodeObject(forKey: "name") as? String
        else {
            return nil
        }
        self.init(name:name, score: Int(score))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.score, forKey: "score")
        
    }

}
