//
//  recipeViewController.swift
//  RecipeFinder
//
//  Created by Todd Wenker on 4/21/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import CoreData

class recipeViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var hrefLabel: UILabel!
    @IBOutlet weak var addRecipeLabel: UIButton!
    @IBOutlet weak var deleteRecipeLabel: UIButton!
    
    var titleString:String?
    var ingredients:String?
    var thumbnail:String?
    var href:String?
    var recipeList = [RecipeEntity]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchRecord()
        if findRecipe(){
            addRecipeLabel.isHidden = true
        }
        else{
            deleteRecipeLabel.isHidden = true
        }
        
        titleLabel.text = titleString
        ingredientsLabel.text = ingredients
        hrefLabel.text = href
    }
    
    // returns true if selectedRecipe is in recipeList
    func findRecipe() -> Bool{
        for x in recipeList{
            if href! == x.href{
                return true
            }
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchRecord() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipeEntity")
        recipeList = ((try? managedObjectContext.fetch(fetchRequest)) as? [RecipeEntity])!
        
        print(recipeList)
        
        return recipeList.count
    }
    
    // return index of href!!! to be deleted
    func getIndex(x:String) -> Int{
        for (index, y) in recipeList.enumerated(){
            if y.href == x{
                return index
            }
        }
        return -1
    }

    @IBAction func addRecipe(_ sender: Any) {
        
        let ent = NSEntityDescription.entity(forEntityName: "RecipeEntity", in: self.managedObjectContext)
        let newRecipe = RecipeEntity(entity: ent!, insertInto: managedObjectContext)
        
        newRecipe.title = titleString
        newRecipe.ingredients = ingredients
        newRecipe.href = href
        newRecipe.thumbnail = thumbnail
        
        do {
            try self.managedObjectContext.save()
        } catch _{
            
        }
        
        recipeList.append(newRecipe)
        print("\(href) has been added.")
        
        addRecipeLabel.isHidden = true
        deleteRecipeLabel.isHidden = false
    }
    
    @IBAction func deleteRecipe(_ sender: Any){
        
        // index of value to be deleted
        let index = getIndex(x: href!)
        if index == -1{
            return
        }
        
        managedObjectContext.delete(recipeList[index])
        recipeList.remove(at: index)
        print("\(href) has been deleted.")
        
        // save the updated context
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }
        
        
        deleteRecipeLabel.isHidden = true
        addRecipeLabel.isHidden = false
    }
    
    @IBAction func visitSite(_ sender: Any) {
        self.performSegue(withIdentifier: "showWeb", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showWeb"){
            let vc = segue.destination as? webViewController
            
            vc?.urlString = href
            
        }
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
