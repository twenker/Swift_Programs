//
//  jupiterViewController.swift
//  Todd_Wenker_lab3
//
//  Created by Todd Wenker on 2/3/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class jupiterViewController: UIViewController {

    // holds weight value sent from moonViewController
    var weight:String = ""
    var returnMessage:String = ""
    
    @IBOutlet weak var earthTextField: UILabel!
    @IBOutlet weak var jupiterTextField: UILabel!
    @IBOutlet weak var returnTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jupiterWeight = (Float(weight)!)*2.4
        // set earth and jupiter text fields to correct weight
        earthTextField.text?.append(weight)
        jupiterTextField.text?.append(String(jupiterWeight))
        
        returnTextField.text = returnMessage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
