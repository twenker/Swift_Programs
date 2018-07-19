//
//  ViewController.swift
//  CSE335_project1.1
//
//  Created by Todd Wenker on 1/17/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //  Outlets
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var bmiNumLabel: UILabel!
    @IBOutlet weak var bmiDiagnosisLabel: UILabel!
    
    @IBOutlet weak var bmiButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // set the label with the bmi value and diagnosis to hidden
        self.bmiNumLabel.hidden = true
        self.bmiDiagnosisLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // when the button is pressed
    @IBAction func buttonPressed(sender: UIButton) {
        // check if the height and weight texts are empty
        if self.heightText.text == "" || self.weightText.text == "" {
            return
        }
        
        let height = Float(self.heightText.text!)
        let weight = Float(self.weightText.text!)
        
        // bmi = (weight/height^2) * 703
        let bmi:Float = weight! / (height! * height!) * 703
        
        self.bmiNumLabel.text = String(bmi)
        
        // set diagnosis label with correct text and color
        
        // You are underweight if BMI < 18 - Blue Color
        // You are normal if BMI is greater than or equal to 18 and less than 25 - Green Color
        // You are pre-obese if BMI is between 25 and 30 – purple Color
        // You are obese if BMI is greater than 30 - red color
        if bmi < 18 {
            self.bmiDiagnosisLabel.text = "You are underweight."
            self.bmiDiagnosisLabel.textColor = UIColor.blueColor()
        }
        else if bmi < 25 {
            self.bmiDiagnosisLabel.text = "You are normal."
            self.bmiDiagnosisLabel.textColor = UIColor.greenColor()
        }
        else if bmi < 30 {
            self.bmiDiagnosisLabel.text = "You are pre-obese."
            self.bmiDiagnosisLabel.textColor = UIColor.purpleColor()
        }
        else {
            self.bmiDiagnosisLabel.text = "You are obese"
            self.bmiDiagnosisLabel.textColor = UIColor.redColor()
        }
        
        self.bmiDiagnosisLabel.hidden = false
        self.bmiNumLabel.hidden = false
        
        
    }
    
    
}

