//
//  ViewController.swift
//  Todd_Wenker_Lab2
//
//  Created by Todd Wenker on 1/25/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // text field for entering in new foodItem entry into foodDictionary
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var resturantTextField: UITextField!
    // text field to display search items
    @IBOutlet weak var searchNameTextField: UITextField!
    @IBOutlet weak var searchResturantTextField: UITextField!
    // foodDictionary object instance
    var foodDict:foodDictionary = foodDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // search function
    @IBAction func searchFoodItem(_ sender: UIBarButtonItem) {
        if let name = self.searchNameTextField.text{
            let f = foodDict.search(n: name)
            if let x = f{
                self.searchNameTextField.text = x.name!
                self.searchResturantTextField.text = x.resturantName!
            }
        }
    }
    
    
    // add function
    @IBAction func addFoodItem(_ sender: UIBarButtonItem) {
        if let name = self.nameTextField.text, let resturantName = self.resturantTextField.text
        {
            //
            let food = foodItem(n: name, r: resturantName)
            foodDict.add(f: food)
        }
    }
    
    // delete funciton
    @IBAction func deleteFoodItem(_ sender: UIBarButtonItem) {
        if let name = self.searchNameTextField.text{
            foodDict.deleteItem(n: name)
        }
    }

    // edit resturant corresponding to name
    @IBAction func editResturant(_ sender: UIButton) {
        if let name = self.searchNameTextField.text, let resturant = self.searchResturantTextField.text{
            foodDict.editItem(n: name, r: resturant)
        }
    }
    
    // takes the string from searchNameTextField and prints the next element
    @IBAction func next(_ sender: Any) {
        if let name = self.searchNameTextField.text {
            if let f = foodDict.next(n: name){
                self.searchNameTextField.text = f.name!
                self.searchResturantTextField.text = f.resturantName!
            }
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if let name = self.searchResturantTextField.text{
            if let f = foodDict.prev(n: name){
                self.searchNameTextField.text = f.name!
                self.searchResturantTextField.text = f.resturantName!
            }
        }
    }
    

}

