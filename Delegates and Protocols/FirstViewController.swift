//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Larry Nickerson on 12/7/17.
//  Copyright © 2017 Larry Nickerson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // this data will be passed from the SecondViewController via a Delegate callback
        //label.text = dataPassedBack
        textField.placeholder = "shalowam to the 12 tribes world-wide"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeToBlue(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "sendDataForwards" {
            
            let secondVC = segue.destination as! SecondViewController
            // textfields may be force unwrapped because they are guaranteed to have a value
            // even if it is just an empty string
            
            // register to recieve data passed back from second view controller
            secondVC.delegate = self
            
            // send data forwards to the Second View Controller
            secondVC.data = textField.text!
        }
     }
 
    //MARK: Conform to CanReceive Delegate Protocal
    
    func dataReceived(data: String) {
        // update our label to the data sent from SecondViewController
        label.text = data
    }
    
}

