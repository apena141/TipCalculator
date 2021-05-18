//
//  ViewController.swift
//  PreWork
//
//  Created by Anthony Pena on 5/17/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billAmountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        tipSlider.setValue(15, animated: false)
    }


    @IBAction func calculateTip(_ sender: Any) {
        if(tipControl.selectedSegmentIndex == 3){
            onSliderChangedWithSlider(tipSlider)
            return
        }
        
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get the total by multiplying tip * tip percentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipSlider.setValue(Float(100 * tipPercentages[tipControl.selectedSegmentIndex]), animated: true)
        
        // Update the amount label and the total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func onSliderChangedWithSlider(_ sender: UISlider) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentage = Double(tipSlider.value) / 100
        
        let tip = bill * tipPercentage
        
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField){
        calculateTip(sender)
    }
    
    @IBAction func sliderTouched(_ sender: Any) {
        tipControl.selectedSegmentIndex = 3
    }
}

