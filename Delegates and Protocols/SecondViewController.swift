//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Larry Nickerson on 12/7/17.
//  Copyright © 2017 Larry Nickerson. All rights reserved.
//

import UIKit

// to enable the second view controller to pass data back
protocol CanReceive {
    
    func dataReceived(data: String)
    
}

class SecondViewController: UIViewController {
  
    var delegate : CanReceive?

    // this property will be set by the FirstViewController
    var data = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        textField.placeholder = "enter shum shiznit ma nigga"

        // display any data that may have been passed from the first view controller
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        
        // pass our text field's data  back to first view controller that registered as a CanReceive delegate
        // using optional chainingcl
        delegate?.dataReceived(data: textField.text!)
        textField.text=""
        
        // and dismiss ourself
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
