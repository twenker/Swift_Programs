//
//  WeeklyReportViewController.swift
//  Todd_Wenker_HW1
//
//  Created by Todd Wenker on 2/14/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class WeeklyReportViewController: UIViewController {
    // vars to write to text fields. 
    var calorieBurned:Int = 0
    var calorieIntake:Int = 0
    var avgPressure:Float = 0
    var weightChange:Int = 0
    
    @IBOutlet weak var calorieBurnedTextField: UITextField!
    @IBOutlet weak var calorieIntakeTextField: UITextField!
    @IBOutlet weak var avgPressureTextField: UITextField!
    @IBOutlet weak var weightChangeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // set text fields
        calorieBurnedTextField.text = String(calorieBurned)
        calorieIntakeTextField.text = String(calorieIntake)
        avgPressureTextField.text = String(avgPressure)
        weightChangeTextField.text = String(weightChange)
        
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
