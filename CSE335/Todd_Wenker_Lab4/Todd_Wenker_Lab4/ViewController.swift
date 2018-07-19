//
//  ViewController.swift
//  Todd_Wenker_Lab4
//
//  Created by Todd Wenker on 2/26/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // default city entities
    var defaultCount = 0
    let defaultCityName = ["Paris","Moscow","Istanbul","Madrid","Bruges"]
    let defaultCityDetails = ["The capital of France.", "The capital of Russia.", "The largest city of Turkey.", "The capital of Spain.", "An old Flemish city."]
    let defaultCityPictureNames = ["Paris.png","Moscow.png","Istanbul.png","Madrid.png","Bruges.png"]
    
    // array for fetched city entities from core data
    var fetchResults = [CityEntity]()
    
    // handler to the managege object context
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // table view outlet
    @IBOutlet weak var cityTable: UITableView!
    
    func fetchRecord() -> Int {
        // Create a new fetch request using the city entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityEntity")
        // Execute the fetch request, and cast the results to an array of city entity objects
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CityEntity])!
        
        print(fetchResults.count)
        
        return fetchResults.count
        
    }
    // size of table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchRecord()
        
    }
    // set the values in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // add data to table
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.layer.borderWidth = 1.0
        cell.textLabel?.text = fetchResults[indexPath.row].name
        cell.imageView?.image = UIImage(data: (fetchResults[indexPath.row].picture!) as Data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
        
    }
    
    // implement delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            
            // delete the selected object from the managed
            // object context
            managedObjectContext.delete(fetchResults[indexPath.row])
            // remove it from the fetch results array
            fetchResults.remove(at:indexPath.row)
            
            do {
                // save the updated managed object context
                try managedObjectContext.save()
            } catch {
                
            }
            // reload the table after deleting a row
            cityTable.reloadData()
        }
        
    }
    
    @IBAction func addCity(_ sender: UIBarButtonItem) {
        // create a new entity object
        let ent = NSEntityDescription.entity(forEntityName: "CityEntity", in: self.managedObjectContext)
        // create new city entity from defaults
        let newItem = CityEntity(entity: ent!, insertInto: self.managedObjectContext)
        newItem.name = defaultCityName[defaultCount % 5]
        newItem.details = defaultCityDetails[defaultCount % 5]
        newItem.picture = UIImagePNGRepresentation(UIImage(named: defaultCityPictureNames[defaultCount % 5])!)! as NSData?
        
        // save the updated context
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }
        
        defaultCount += 1
        print(newItem)
        // reload the table with added row
        cityTable.reloadData()
    }
    
    @IBAction func deleteCity(_ sender: UIBarButtonItem) {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityEntity")

        
        // whole fetchRequest object is removed from the managed object context
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedObjectContext.execute(deleteRequest)
            try managedObjectContext.save()
            
            3
        }
        catch let _ as NSError {
            // Handle error
        }
        
        cityTable.reloadData()
        
    }
    
    // when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showView"){
            let vc = segue.destination as? detailViewController
            
            let indexPath = self.cityTable.indexPathForSelectedRow!
            
            vc?.titleStr = fetchResults[indexPath.row].name
            vc?.detailsStr = fetchResults[indexPath.row].details
            vc?.cityImage = fetchResults[indexPath.row].picture
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

