//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Saumeel Gajera on 7/8/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults();
        let percentageTipIndex = defaults.integerForKey("percentageTipIndex");
        tipPercentSegment.selectedSegmentIndex = percentageTipIndex;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeTipPercentage(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setInteger(tipPercentSegment.selectedSegmentIndex, forKey: "percentageTipIndex");
        
        
        let tipPercentages = [0.1, 0.2, 0.25];
        let tipPercentage = tipPercentages[tipPercentSegment.selectedSegmentIndex];
        // get prev values for billAmount, tip and totalAmount
        let billAmountString = defaults.stringForKey("billAmount");
        
        let billAmount = NSString(string: billAmountString!).doubleValue;
        let tip = billAmount * tipPercentage;
        let totalAmount = billAmount + tip;
        
        
        defaults.setDouble(tip, forKey: "tipAmount");
        defaults.setObject(billAmountString, forKey: "billAmount");
        defaults.setDouble(totalAmount, forKey: "totalAmount");

        
        
        defaults.synchronize();

    }
}
