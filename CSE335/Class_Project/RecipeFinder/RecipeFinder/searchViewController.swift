//
//  searchViewController.swift
//  RecipeFinder
//
//  Created by Todd Wenker on 4/20/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import CoreData

class searchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recipeText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [recipeDummy]()
    
    // used to store json result
    struct recipeDummy {
        let title:String
        let ingredients:String
        let thumbnail:String
        let href:String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RecipeCell = self.tableView.dequeueReusableCell(withIdentifier: "MyCell") as! RecipeCell
        
        let url = URL(string: searchResults[indexPath.row].href)
        let domain = url?.host
        cell.myTitle.text = searchResults[indexPath.row].title
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
            vc?.titleString = searchResults[indexPath.row].title
            vc?.ingredients = searchResults[indexPath.row].ingredients
            vc?.thumbnail = searchResults[indexPath.row].thumbnail
            vc?.href = searchResults[indexPath.row].href
            
        }
    }
    
    
    
    // use API to return recipes
    @IBAction func findRecipe(_ sender: Any) {
        
        DispatchQueue.main.async(execute: {
            self.getJsonData()

        })
        //tableView.reloadData()
        
    }
    
    
    // ex query: http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3
    // i = ingredient, q = recipe, p = pages
    // TODO: replace spaces with %20
    func getJsonData(){
        searchResults.removeAll()
        let updateText = recipeText.text?.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "http://www.recipepuppy.com/api/?q=" + updateText!)!
        let urlSession = URLSession.shared
        
        print(url)
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if error != nil{
                print (error!.localizedDescription)
            }
            
            let jsonResult = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            print(jsonResult)
            
            let results = jsonResult["results"] as! [[String:Any]]
            var href = [String]()
            var thumbnail = [String]()
            var ingredients = [String]()
            var title = [String]()
            
            for x in results {
                if let hr = x["href"] as? String {
                    href.append(hr)
                }
                if let ingred = x["ingredients"] as? String {
                    ingredients.append(ingred)
                }
                if let thumb = x["thumbnail"] as? String {
                    thumbnail.append(thumb)
                }
                if let ti = x["title"] as? String {
                    title.append(ti)
                }
            }
            
            for x in 0...(href.count - 1) {
                var recipe = recipeDummy(title: title[x], ingredients: ingredients[x], thumbnail: thumbnail[x], href: href[x])
                self.searchResults.append(recipe)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })

        jsonQuery.resume()
    
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

