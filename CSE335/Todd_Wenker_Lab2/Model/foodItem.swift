//
//  foodItem.swift
//  Todd_Wenker_Lab2
//
//  Created by Todd Wenker on 1/28/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

// Fodd item class
// Data: Name, Resturant can be ordered at

import Foundation

class foodItem
{
    var name:String?
    var resturantName:String?
    
    init(n:String, r:String)
    {
        self.name = n
        self.resturantName = r
    }
    
    func change_resturant(newResturant:String)
    {
        self.resturantName = newResturant
    }
}
