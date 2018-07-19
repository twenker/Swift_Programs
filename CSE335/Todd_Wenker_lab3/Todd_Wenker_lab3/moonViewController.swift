//
//  moonViewController.swift
//  Todd_Wenker_lab3
//
//  Created by Todd Wenker on 2/3/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class moonViewController: UIViewController {
    
    // holds the weight value sent from ViewController
    var weight:String = ""
    var returnMessage:String = ""
    
    @IBOutlet weak var earthTextField: UILabel!
    @IBOutlet weak var moonTextField: UILabel!
    @IBOutlet weak var returnTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moonWeight = (Float(weight)!)/6
        // append the earth and moon text fields with the correct weight value
        earthTextField.text?.append(weight)
        moonTextField.text?.append(String(moonWeight))

        // set return message
        returnTextField.text = returnMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is jupiterViewController{
            let vc = segue.destination as? jupiterViewController
            vc?.weight = weight
            vc?.returnMessage = "Coming from the Moon"
        }
    }
    
    @IBAction func unwindFromJupiter(_ segue:UIStoryboardSegue){
        returnTextField.text = "Back from Jupiter"
    }
 
}
