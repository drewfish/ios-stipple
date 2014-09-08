//
//  ViewController.swift
//  stipple
//
//  Created by Andrew Folta on 9/6/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billUI: UITextField!
    @IBOutlet weak var tipValueUI: UILabel!
    @IBOutlet weak var tipChooserUI: UISegmentedControl!
    @IBOutlet weak var totalUI: UILabel!
    var outputFormatter = NSNumberFormatter()
    var inputFormatter = NSNumberFormatter()

    @IBAction func update(sender: AnyObject) {
        var bill = inputFormatter.numberFromString(billUI.text)?.doubleValue ?? 0.0
        settingsModel.billAmount = bill
        var tipPct = tipChooserUI.selectedAsDouble() / 100.0
        var tip = bill * tipPct
        var total = bill + tip
        tipValueUI.text = outputFormatter.stringFromNumber(tip)
        totalUI.text = outputFormatter.stringFromNumber(total)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        outputFormatter.numberStyle = .CurrencyStyle
        outputFormatter.locale = NSLocale.currentLocale()
        inputFormatter.numberStyle = .CurrencyStyle
        inputFormatter.locale = NSLocale.currentLocale()
        inputFormatter.currencySymbol = ""
        inputFormatter.currencyCode = ""
        inputFormatter.internationalCurrencySymbol = ""

        tipChooserUI.styleAsPercentages()

        var bill = settingsModel.billAmount
        if let gotBill = bill {
            billUI.text = inputFormatter.stringFromNumber(gotBill)
            update(self)
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipChooserUI.updateFromSettings()
        update(self)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billUI.becomeFirstResponder()
    }
}

