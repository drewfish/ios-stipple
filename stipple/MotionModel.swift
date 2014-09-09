//
//  MotionModel.swift
//  stipple
//
//  Created by Andrew Folta on 9/8/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation
import CoreMotion


@objc protocol MotionModelDelegate {
    func motionUpdateLeanLeft()
    func motionUpdateLeanRight()
}


class MotionModel {

    var delegate: MotionModelDelegate?

    private let UPDATE_INTERVAL = 0.2   // seconds
    private let ROLL_THRESHHOLD = 0.3   // radians
    private let manager: CMMotionManager = CMMotionManager()
    private var rollReference: Double?

    init() {
        manager.deviceMotionUpdateInterval = UPDATE_INTERVAL
    }

    func motionUpdatesStart() {
        manager.showsDeviceMovementDisplay = true
        manager.startDeviceMotionUpdatesUsingReferenceFrame(
            CMAttitudeReferenceFrameXArbitraryZVertical,
            toQueue: NSOperationQueue.currentQueue(),
            withHandler: {
                [unowned self] (data: CMDeviceMotion?, error: NSError?) in
                // ignore errors
                if let gotData = data {
                    self.motionUpdate(gotData)
                }
            }
        )
    }

    func motionUpdatesStop() {
        manager.stopDeviceMotionUpdates()
        manager.showsDeviceMovementDisplay = false
        rollReference = nil
    }

    private func motionUpdate(data: CMDeviceMotion) {
        var roll = data.attitude.roll
        if rollReference == nil {
            rollReference = roll
            return
        }
        if let gotDelegate = delegate {
            var lean = Int((roll - rollReference!) / ROLL_THRESHHOLD)
            if lean < 0 {
                rollReference = roll
                gotDelegate.motionUpdateLeanLeft()
            }
            if lean > 0 {
                rollReference = roll
                gotDelegate.motionUpdateLeanRight()
            }
        }
    }
}

