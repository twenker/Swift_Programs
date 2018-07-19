//
//  savedViewController.swift
//  RecipeFinder
//
//  Created by Todd Wenker on 4/21/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import CoreData

class savedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipeList = [RecipeEntity]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchRecord() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipeEntity")
        recipeList = ((try? managedObjectContext.fetch(fetchRequest)) as? [RecipeEntity])!
        
        print(recipeList)
        
        return recipeList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchRecord()
    }
    
    // populate table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RecipeCell = self.tableView.dequeueReusableCell(withIdentifier: "MyCell") as! RecipeCell
        
        let url = URL(string: recipeList[indexPath.row].href!)
        let domain = url?.host
        cell.myTitle.text = recipeList[indexPath.row].title!
        cell.myHref.text = domain
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    // go to recipeViewController when row selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "showRecipe", sender: self)
    }
    
    // prepare for segue. send array of saved Recipes and selected recipe
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showRecipe"){
            let vc = segue.destination as? recipeViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            vc?.titleString = recipeList[indexPath.row].title
            vc?.ingredients = recipeList[indexPath.row].ingredients
            vc?.thumbnail = recipeList[indexPath.row].thumbnail
            vc?.href = recipeList[indexPath.row].href
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60.0
        // Do any additional setup after loading the view.
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
