//
//  AppDelegate.swift
//  stipple
//
//  Created by Andrew Folta on 9/6/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit
import CoreMotion


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
//    var tipViewController: ViewController!
    var settingsModel = SettingsModel()


//    let MOTION_UPDATE_INTERVAL = 0.2    // seconds
//    let MOTION_ROLL_THRESHHOLD = 0.3    // radians
//    let motionManager: CMMotionManager = CMMotionManager()
//    var motionRollReference: Double?
//
//    func motionUpdate(data: CMDeviceMotion) {
//        var roll = data.attitude.roll
//        if motionRollReference == nil {
//            motionRollReference = roll
//            return
//        }
//        var lean = Int((roll - motionRollReference!) / MOTION_ROLL_THRESHHOLD)
//        tipViewController.motionUpdate(lean &/ abs(lean))
//    }
//
//    func motionUpdatesStart() {
//        motionManager.showsDeviceMovementDisplay = true
//        motionManager.startDeviceMotionUpdatesUsingReferenceFrame(
//            CMAttitudeReferenceFrameXArbitraryZVertical,
//            toQueue: NSOperationQueue.currentQueue(),
//            withHandler: {
//                [unowned self] (data: CMDeviceMotion?, error: NSError?) in
//                // ignore errors
//                if let gotData = data {
//                    self.motionUpdate(gotData)
//                }
//            }
//        )
//    }
//
//    func motionUpdatesStop() {
//        motionManager.stopDeviceMotionUpdates()
//        motionManager.showsDeviceMovementDisplay = false
//        motionRollReference = nil
//    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

// TODO MOTION -- this is no longer correct because of UINavigationController
// tipViewController = window?.rootViewController as? ViewController

//        motionManager.deviceMotionUpdateInterval = MOTION_UPDATE_INTERVAL
//        motionUpdatesStart()

        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
//        motionUpdatesStart()
    }

    func applicationWillResignActive(application: UIApplication) {
//        motionUpdatesStop()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


