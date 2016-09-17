//
//  PGNetworkController.swift
//  PandaFit
//
//  Created by Felix Sonntag on 17/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit
import Alamofire

class PGNetworkController: NSObject {        
    
    func getPandaState(name: String) -> Panda {
//        TODO update URL and parsing
        Alamofire.request("localhost:7000/getCurrentStatus").responseJSON { response in
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        return Panda(name: name, score: 50)
    }

    func postSteps(numberSteps: Int) {
        let parameters: Parameters = [
            "numSteps": numberSteps
        ]
        Alamofire.request("localhost:7000/postNewSteps", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { (response) in
            print(response.response) // HTTP URL response
            print(response.data)     // server data            
        }
    }
}
