//
//  ViewController.swift
//  Todd_Wenker_lab6
//
//  Created by Todd Wenker on 3/30/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // holds the values from core data
    var cityFetchResults = [CityEntity]()
    // handler to the managege object context
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var cityTable: UITableView!
    @IBOutlet weak var text: UITextField!
    
    // return index of name to be deleted
    func getIndex(x:String) -> Int{
        for (index, y) in cityFetchResults.enumerated(){
            if y.name == x{
                return index
            }
        }
        return -1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cityTable.delegate = self
        cityTable.dataSource = self
    }
    
    func fetchRecord() -> Int {
        // Create a new fetch request using the city entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityEntity")
        // Execute the fetch request, and cast the results to an array of city entity objects
        cityFetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CityEntity])!
        
        print(cityFetchResults.count)
        
        return cityFetchResults.count
        
    }
    
    // fetch values from core data and sets the size of the table to its count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchRecord()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // add data to table
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.layer.borderWidth = 1.0
        cell.textLabel?.text = cityFetchResults[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
        
    }
    /*
    // implement delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            
            // delete the selected object from the managed
            // object context
            managedObjectContext.delete(cityFetchResults[indexPath.row])
            // remove it from the fetch results array
            cityFetchResults.remove(at:indexPath.row)
            
            do {
                // save the updated managed object context
                try managedObjectContext.save()
            } catch {
                
            }
            // reload the table after deleting a row
            cityTable.reloadData()
        }
        
    }
 */
    // add city to core data and table
    @IBAction func addCity(_ sender: Any) {
        if (text.text?.isEmpty)!{
            return
        }
        // create a new entity object
        let ent = NSEntityDescription.entity(forEntityName: "CityEntity", in: self.managedObjectContext)
        // create new city entity from defaults
        let newCity = CityEntity(entity: ent!, insertInto: managedObjectContext)

        newCity.name = text.text!
        newCity.details = nil
        newCity.picture = nil
        
        // save the updated context
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }

        cityFetchResults.append(newCity)
        // reload the table with added row
        cityTable.reloadData()
        // reset text field
        text.text = ""
        
    }
    @IBAction func deleteCity(_ sender: Any) {
        
        // index of value to be deleted
        let index = getIndex(x: text.text!)
        if index == -1{
            return
        }
        
        managedObjectContext.delete(cityFetchResults[index])
        cityFetchResults.remove(at: index)
        
        cityTable.reloadData()
        // reset text
        text.text = ""
        
    }
    
    // when a row is selected, seque to detailViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    // set values in detailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail"){
            let vc = segue.destination as? detailViewController
            
            let indexPath = self.cityTable.indexPathForSelectedRow!
            vc?.cityStr = cityFetchResults[indexPath.row].name

        }
    }
    
}

