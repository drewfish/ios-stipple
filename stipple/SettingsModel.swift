//
//  SettingsModel.swift
//  stipple
//
//  Created by Andrew Folta on 9/7/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


class SettingsModel {
    private var store = NSUserDefaults.standardUserDefaults()

    var defaultPercentage: Int {
        get {
            return store.integerForKey("defaultPercentage")
        }
        set {
            store.setInteger(newValue, forKey: "defaultPercentage")
            store.synchronize()
        }
    }

    var billAmount: Double? {
        get {
            var setAmount = store.doubleForKey("billAmount")
            var setDate: NSDate? = store.objectForKey("billAmountDate") as? NSDate
            if setAmount == 0.0 || setDate == nil {
                return nil
            }
            var expires = NSDate(timeIntervalSinceNow: -600.0)
            if setDate!.compare(expires) == NSComparisonResult.OrderedAscending {
                return nil
            }
            return setAmount
        }
        set {
            store.setDouble(newValue!, forKey: "billAmount")
            store.setObject(NSDate(), forKey: "billAmountDate")
            store.synchronize()
        }
    }

}


