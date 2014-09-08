//
//  SettingsViewController.swift
//  stipple
//
//  Created by Andrew Folta on 9/7/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipUI: UISegmentedControl!

    @IBAction func onDismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onDefaultTip(sender: AnyObject) {
        settingsModel.defaultPercentage = defaultTipUI.selectedSegmentIndex
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipUI.styleAsPercentages()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipUI.updateFromSettings()
    }

}
