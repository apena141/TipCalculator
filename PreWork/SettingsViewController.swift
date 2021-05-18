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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        
        defaults.set(tipOneField.text, forKey: "tipOneField")
        defaults.set(tipTwoField.text, forKey: "tipTwoField")
        defaults.set(tipThreeField.text, forKey: "tipThreeField")
        
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
