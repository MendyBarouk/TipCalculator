//
//  ViewController.swift
//  TipCalculator
//
//  Created by Mendy Barouk on 21/03/2017.
//  Copyright © 2017 Mendy Barouk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var textFieldPrice: UITextField!
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var SCTipPercentage: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SCTipPercentage.addTarget(self, action: #selector(calculatePrice), for: .valueChanged)
        textFieldPrice.addTarget(self, action: #selector(calculatePrice), for: .editingChanged)
    }
    
    //MARK: --My Function--
    func calculatePrice() {
        var tipPercent: Double = 0
        switch SCTipPercentage.selectedSegmentIndex {
        case 0: tipPercent = 0.1
        case 1: tipPercent = 0.15
        case 2: tipPercent = 0.2
        default:
            print("No selected segment")
        }
        displayPrices(tipPercent: tipPercent)
    }
    
    func displayPrices(tipPercent: Double) {
        
        //guard let price = Double(textFieldPrice.text!) else { return <#return value#> }
        
        guard let price = Double(textFieldPrice.text!) else {
            labelTip.text = "₪ Tip"
            labelTotalPrice.text = "₪ Total"
            return
        }
        
        let tip: Double = tipPercent * price

        labelTip.text = "₪ " + String(format: "%.2f", tip)
        labelTotalPrice.text = "₪ " + String(format: "%.2f", tip + price)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

