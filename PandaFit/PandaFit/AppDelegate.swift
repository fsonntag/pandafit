//
//  AppDelegate.swift
//  PandaFit
//
//  Created by Felix Sonntag on 16/09/16.
//  Copyright © 2016 Felix Sonntag. All rights reserved.
//

import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let healthKitManager:PGHealthKitManager = PGHealthKitManager()
    let networkController:PGNetworkController = PGNetworkController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        authorizeHealthKit()
        
        let level = UserDefaults.standard.value(forKey: "level")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if level != nil {
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainNavigationController")
            self.window?.rootViewController = initialViewController

        } else {
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "LevelSelectionViewController")
            self.window?.rootViewController = initialViewController

        }
        
        self.window?.makeKeyAndVisible()
        
        DispatchQueue.global(qos: .background).async {
            while true {
                self.retrieveAndPostSteps()
                sleep(10)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func authorizeHealthKit() {
        healthKitManager.authorizeHealthKit { (authorized, error) in
            if (authorized) {
                print("Authorized HealthKit")
            } else {
                print("Couldn't authorize HealthKit")
                if (error != nil) {
                    print(error)
                }
                
            }
        }
    }
    
    func retrieveAndPostSteps() {
        healthKitManager.retrieve(quantityTypeIdentifier: HKQuantityTypeIdentifier.stepCount) { (steps) in
            print(steps)
            //            TODO uncomment this
            //            networkController.postSteps(numberSteps: steps)
        }
    }


}

