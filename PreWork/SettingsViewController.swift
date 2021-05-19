//
//  SettingsViewController.swift
//  PreWork
//
//  Created by Anthony Pena on 5/17/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipOneField: UITextField!
    @IBOutlet weak var tipTwoField: UITextField!
    @IBOutlet weak var tipThreeField: UITextField!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipOneField.text = defaults.string(forKey: "tipOneField")
        tipTwoField.text = defaults.string(forKey: "tipTwoField")
        tipThreeField.text = defaults.string(forKey: "tipThreeField")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        defaults.set(tipOneField.text, forKey: "tipOneField")
        defaults.set(tipTwoField.text, forKey: "tipTwoField")
        defaults.set(tipThreeField.text, forKey: "tipThreeField")
        if(darkModeSwitch.isOn){
            defaults.setValue(true, forKey: "darkMode")
        }
        else{
            defaults.setValue(false, forKey: "darkMode")
        }
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(defaults.bool(forKey: "darkMode") == true){
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.setOn(true, animated: false)
        }
    }
    
    @IBAction func onSwitch(_ sender: Any) {
        if(darkModeSwitch.isOn){
            overrideUserInterfaceStyle = .dark
        }
        else{
            overrideUserInterfaceStyle = .light
        }
    }
    /*
    // MARK: - Navigation
     @IBAction func onSwitch(_ sender: Any) {
     }
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
