//
//  foodDictionary.swift
//  Todd_Wenker_Lab2
//
//  Created by Todd Wenker on 1/28/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import Foundation

class foodDictionary
{
    // food dictionary contains the String:foodItem pair
    var foodDictionary : [String:foodItem] = [String:foodItem]()
    
    init(){ }
    
    // add foodItem to dictionary
    func add(f:foodItem)
    {
        foodDictionary[f.name!] = f
    }
    
    // search foodDictionary and return foodItem
    func search(n:String) -> foodItem?
    {
        for (name, _) in foodDictionary
        {
            if name == n
            {
                return foodDictionary[name]
            }
        }
        
        return nil
        
    }
    
    // delete item in foodDictionary
    func deleteItem(n:String)
    {
        foodDictionary[n] = nil
    }
    
    // edit item in foodDictionary
    func editItem(n:String,r:String)
    {
        if foodDictionary[n] != nil{
            foodDictionary[n]?.change_resturant(newResturant: r)
        }
    }
    
    // receives the name of a foodItem in the dictionary and returns the next in sequence
    func next(n:String) ->(foodItem?)
    {
        // create array of keys
        var foodArr = [String]()
        for (name,_) in foodDictionary{
            foodArr.append(name)
        }

        // if foodDict is nil, return nil
        if foodArr.isEmpty{
            return nil
        }
        
        // iterate through foodArr till a match is found. Else return first element in dict
        for (index,name) in foodArr.enumerated(){
            // if a match is found
            if(name == n){
                // if the index is not at the end of the array
                if(index != foodArr.count-1){
                    return foodDictionary[foodArr[index+1]]
                }
                else{
                    return foodDictionary[foodArr[0]]
                }
            }
            
        }
        
        // if the name is not matched, return first element
        return foodDictionary[foodArr[0]]
    }
    
    func prev(n:String) -> (foodItem?)
    {
        // create array of keys
        var foodArr = [String]()
        for (name,_) in foodDictionary{
            foodArr.append(name)
        }
        
        // if foodDict is nil, return nil
        if foodArr.isEmpty{
            return nil
        }
        
        // iterate through foodArr till a match is found. Else return first element in dict
        for (index,name) in foodArr.enumerated(){
            // if a match is found
            if(name == n){
                // if the index is not at the start of the array
                if(index != 0){
                    return foodDictionary[foodArr[index-1]]
                }
                else{
                    // return last element
                    return foodDictionary[foodArr[foodArr.endIndex]]
                }
            }
            
        }
        
        // if the name is not matched, return first element
        return foodDictionary[foodArr[0]]
    }
}

