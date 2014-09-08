//
//  extensions.swift
//  stipple
//
//  Created by Andrew Folta on 9/7/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


extension UIView {

    // expose settings model to all views
    var settingsModel: SettingsModel {
        return (UIApplication.sharedApplication().delegate as AppDelegate).settingsModel
    }

}


extension UIViewController {

    // expose settings model to all view controllers
    var settingsModel: SettingsModel {
        return (UIApplication.sharedApplication().delegate as AppDelegate).settingsModel
    }

}


extension UISegmentedControl {

    func styleAsPercentages() {
        var tint = self.tintColor
        self.tintColor = tint.colorWithAlphaComponent(0.2)
        var atts: [NSObject: AnyObject] = [:]
        atts[NSFontAttributeName] = UIFont(name: "Noteworthy-Light", size: 12.0)
        atts[NSForegroundColorAttributeName] = tint
        self.setTitleTextAttributes(atts, forState: .Normal)
    }

    func updateFromSettings() {
        self.selectedSegmentIndex = settingsModel.defaultPercentage
    }

    func selectedAsDouble() -> Double {
        return NSString(string: titleForSegmentAtIndex(selectedSegmentIndex)!).doubleValue
    }

}

