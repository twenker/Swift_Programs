//
//  healthReport.swift
//  Todd_Wenker_HW1
//
//  Created by Todd Wenker on 2/14/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import Foundation

class HealthReport{
    // variables for calories burned, taken in, blood pressure, and weight
    var calorieBurned:Int = 0
    var calorieIntake:Int = 0
    var bloodPressure:Int = 0
    var weight:Int = 0
    
    init(b:Int,i:Int,p:Int,w:Int){
        self.calorieBurned = b
        self.calorieIntake = i
        self.bloodPressure = p
        self.weight = w
    }
    
}

class HealthReportList{
    // array of health reports
    var reportList = [HealthReport]()
    
    init(){
        return
    }
    
    // inserts new reports at the beginning of the array
    func addReport(hr:HealthReport){
        reportList.insert(hr,at:0)
    }
    
    // the weekly report. Returns total calories burned, taken in, avg blood pressure, and weight change
    func weeklyReport() -> (Int,Int, Float, Int){
        var calorieBurned:Int = 0
        var calorieIntake:Int = 0
        var totalPressure:Float = 0
        var avgPressure:Float = 0
        var weightChange:Int = 0
        var x = 0
        
        // make sure the array isnt empty
        if reportList.isEmpty {
            return (calorieBurned,calorieIntake,avgPressure,weightChange)
        }
        
        // iterate through array, cumulative sum of calories burned/taken in and pressure
        while x < reportList.count && x < 7{
            calorieBurned += reportList[x].calorieBurned
            calorieIntake += reportList[x].calorieIntake
            totalPressure = totalPressure + Float(reportList[x].bloodPressure)
            
            x += 1
        }
        // x <= 7 depending of size of array, used to find avg pressure and weight change
        avgPressure = totalPressure/Float(x)
        weightChange = reportList[0].weight - reportList[x-1].weight
        
        return (calorieBurned,calorieIntake,avgPressure,weightChange)
    }
    
}





