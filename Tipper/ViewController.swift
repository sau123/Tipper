//
//  ViewController.swift
//  Tipper
//
//  Created by Saumeel Gajera on 7/8/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
//    @IBOutlet weak var subViewSau: UIView!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults();
        let percentageTipIndex = defaults.integerForKey("percentageTipIndex");
        tipPercentSegment.selectedSegmentIndex = percentageTipIndex;
        
        let billAmount = defaults.stringForKey("billAmount");
        let tip = defaults.doubleForKey("tipAmount");
        let totalAmount = defaults.doubleForKey("totalAmount");
        
        amountLabel.text = billAmount;
        tipLabel.text = String.localizedStringWithFormat("$%.2f", tip);
        totalLabel.text = String.localizedStringWithFormat("$%.2f", totalAmount);

        amountLabel.becomeFirstResponder();
//        self.view.addSubview(subViewSau);

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load");
        
//        self.view.addSubview(subViewSau);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
        @IBAction func editingChanged(sender: AnyObject) {
        print("Editing");
            
        var tipPercentages = [0.1, 0.2, 0.25];
        let tipPercentage = tipPercentages[tipPercentSegment.selectedSegmentIndex];
        let billAmount = NSString(string: amountLabel.text!).doubleValue;
        let tip = billAmount * tipPercentage;
        let totalAmount = billAmount + tip;
        
        tipLabel.text = String.localizedStringWithFormat("$%.2f", tip);
        totalLabel.text = String.localizedStringWithFormat("$%.2f", totalAmount);
            
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setInteger(tipPercentSegment.selectedSegmentIndex, forKey:"percentageTipIndex");
        defaults.setDouble(tip, forKey: "tipAmount");
            defaults.setObject(amountLabel.text, forKey: "billAmount");
            defaults.setDouble(totalAmount, forKey: "totalAmount");
            
        defaults.synchronize();

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
}

