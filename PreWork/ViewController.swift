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
    @IBOutlet weak var tipPercentageLabel: UILabel!
    let defaults = UserDefaults.standard
    var tipPercentages: [Double] = [0.15, 0.18, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billAmountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        tipSlider.setValue(defaults.float(forKey: "tipOneField"), animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
        tipControl.setTitle(defaults.string(forKey: "tipOneField"), forSegmentAt: 0)
        tipControl.setTitle(defaults.string(forKey: "tipTwoField"), forSegmentAt: 1)
        tipControl.setTitle(defaults.string(forKey: "tipThreeField"), forSegmentAt: 2)
        tipPercentages.removeAll()
        tipPercentages.insert(defaults.double(forKey: "tipOneField"), at: 0)
        tipPercentages.insert(defaults.double(forKey: "tipTwoField"), at: 1)
        tipPercentages.insert(defaults.double(forKey: "tipThreeField"), at: 2)
        tipPercentageLabel.text = String(format: "%.2f", tipPercentages[0]) + "%"
        tipSlider.setValue(Float(tipPercentages[0]), animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        if(tipControl.selectedSegmentIndex == 3){
            onSliderChangedWithSlider(tipSlider)
            return
        }
        
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        // Get the total by mu0ltiplying tip * tip percentage
        tipPercentageLabel.text = String(format: "%.2f", (tipPercentages[tipControl.selectedSegmentIndex])) + "%"
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipSlider.setValue(Float(tipPercentages[tipControl.selectedSegmentIndex]), animated: true)
        
        // Update the amount label and the total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func onSliderChangedWithSlider(_ sender: UISlider) {
        tipPercentageLabel.text = String(format: "%.2f", tipSlider.value) + "%"
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

