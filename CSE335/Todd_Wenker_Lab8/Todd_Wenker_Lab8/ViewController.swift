//
//  ViewController.swift
//  Todd_Wenker_Lab8
//
//  Created by Todd Wenker on 4/20/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var monkeyPlayer: UIImageView!
    @IBOutlet weak var appleImage1: UIImageView!
    @IBOutlet weak var appleImage2: UIImageView!
    @IBOutlet weak var appleImage3: UIImageView!
    @IBOutlet weak var appleImage4: UIImageView!
    
    var appleCount:Int = 4
    var timer = Timer()
    var timerCount:Int = 0
    
    @IBAction func upButton(_ sender: Any) {
        var frame = monkeyPlayer.frame
        frame.origin.y += -10
        monkeyPlayer.frame = frame
        
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage1) && !appleImage1.isHidden){
            self.appleImage1.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage2) && !appleImage2.isHidden){
            self.appleImage2.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage3) && !appleImage3.isHidden){
            self.appleImage3.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage4) && !appleImage4.isHidden){
            self.appleImage4.isHidden = true
            self.appleCount += -1
        }
        if appleCount <= 0 && loseLabel.isHidden{
            winLabel.isHidden = false
            timer.invalidate()
        }
    }

    @IBAction func rightButton(_ sender: Any) {
        var frame = monkeyPlayer.frame
        frame.origin.x += 10
        monkeyPlayer.frame = frame
        
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage1) && !appleImage1.isHidden){
            self.appleImage1.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage2) && !appleImage2.isHidden){
            self.appleImage2.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage3) && !appleImage3.isHidden){
            self.appleImage3.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage4) && !appleImage4.isHidden){
            self.appleImage4.isHidden = true
            self.appleCount += -1
        }
        if appleCount <= 0 && loseLabel.isHidden{
            winLabel.isHidden = false
            timer.invalidate()
        }
    }
    
    @IBAction func downButton(_ sender: Any) {
        var frame = monkeyPlayer.frame
        frame.origin.y += 10
        monkeyPlayer.frame = frame
        
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage1) && !appleImage1.isHidden){
            self.appleImage1.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage2) && !appleImage2.isHidden){
            self.appleImage2.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage3) && !appleImage3.isHidden){
            self.appleImage3.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage4) && !appleImage4.isHidden){
            self.appleImage4.isHidden = true
            self.appleCount += -1
        }
        if appleCount <= 0 && loseLabel.isHidden{
            winLabel.isHidden = false
            timer.invalidate()
        }
    }
    
    @IBAction func leftButton(_ sender: Any) {
        var frame = monkeyPlayer.frame
        frame.origin.x += -10
        monkeyPlayer.frame = frame
        
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage1) && !appleImage1.isHidden){
            self.appleImage1.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage2) && !appleImage2.isHidden){
            self.appleImage2.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage3) && !appleImage3.isHidden){
            self.appleImage3.isHidden = true
            self.appleCount += -1
        }
        if(viewIntersectsView(monkeyPlayer, second_View: appleImage4) && !appleImage4.isHidden){
            self.appleImage4.isHidden = true
            self.appleCount += -1
        }
        if appleCount <= 0 && loseLabel.isHidden{
            winLabel.isHidden = false
            timer.invalidate()
        }
    }
    
    
    func viewIntersectsView(_ first_View: UIView, second_View:UIView) -> Bool
    {
        return first_View.frame.intersects(second_View.frame)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        winLabel.isHidden = true
        loseLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerUpdate(){
        timerCount += 1
        timerLabel.text = "\(timerCount)"
        if timerCount == 10 && winLabel.isHidden{
            loseLabel.isHidden = false
            timer.invalidate()
        }
    }

}

