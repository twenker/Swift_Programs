//
//  ViewController.swift
//  Todd_Wenker_lab3
//
//  Created by Todd Wenker on 2/3/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var returnMessage:String = ""
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var returnTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        returnTextField.text = returnMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // checks if the segue destination is moonViewController before setting its weight variable to
    // the text of the text field
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is moonViewController{
            let vc = segue.destination as? moonViewController
            vc?.weight = weightTextField.text!
            vc?.returnMessage = "Coming from the Earth"
        }
    }

    @IBAction func unwindFromMoon(_ segue:UIStoryboardSegue){
        returnMessage = "Back from the Moon"
    }

}

