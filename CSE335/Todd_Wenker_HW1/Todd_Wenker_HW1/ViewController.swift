//
//  ViewController.swift
//  Todd_Wenker_HW1
//
//  Created by Todd Wenker on 2/14/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var runningCalories: UITextField!
    @IBOutlet weak var strengthCalories: UITextField!
    @IBOutlet weak var intakeCalories: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bloodPressure: UITextField!
    
    var reportList:HealthReportList = HealthReportList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // set all text fields to 0
        self.runningCalories.text = "0"
        self.strengthCalories.text = "0"
        self.intakeCalories.text = "0"
        self.weight.text = "0"
        self.bloodPressure.text = "0"
        
        // setting delegates
        self.runningCalories.delegate = self
        self.strengthCalories.delegate = self
        self.intakeCalories.delegate = self
        self.weight.delegate = self
        self.bloodPressure.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addHealthReport(_ sender: UIButton) {
        let rc = Int(self.runningCalories.text!)
        let sc = Int(self.strengthCalories.text!)
        let ic = Int(self.intakeCalories.text!)
        let w = Int(self.weight.text!)
        let bp = Int(self.bloodPressure.text!)
        // (burned, intake, pressure, weight)
        let hr:HealthReport = HealthReport(b:(rc! + sc!),i:ic!,p:bp!,w:w!)
        reportList.addReport(hr:hr)
        
    }
    // sets the values in the WeeklyReportViewController from weeklyReport function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WeeklyReportViewController{
            let vc = segue.destination as? WeeklyReportViewController
            let (b,i,p,w) = reportList.weeklyReport()
            
            vc?.calorieBurned = b
            vc?.calorieIntake = i
            vc?.avgPressure = p
            vc?.weightChange = w
        
        }
    }
    // unwind from WeeklyReportViewController
    @IBAction func unwindToViewController(unwindSegue: UIStoryboardSegue){
        
    }
    // deselects the text field and removes the keyboard on return being pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // if the user touches outside the text field, the keyboard is dismissed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

