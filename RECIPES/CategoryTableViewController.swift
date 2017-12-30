//
//  CategoryTableViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    //Class Properties
    var recipes = [Recipe]()
    var categoryRecipe = [String : [Recipe]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }



}


//MARK: Datasource
extension CategoryTableViewController {
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryRecipe.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.categoryTableCell.rawValue)  as! CategoryTableViewCell
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: Cell.categoryTableCell.rawValue, for: indexPath) as! CategoryTableViewCell
        let keys = Array(categoryRecipe.keys)
        let key = keys[indexPath.row]
        let recieps = categoryRecipe[key]
        cell.setUp(categoryName: key, recipes: recieps!)

        return cell
    }
    
}




///MARK: - LOAD DATA
extension CategoryTableViewController {
    
    func loadData() {
        let filePath = Bundle.main.path(forResource: "response-2", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        do {
            let data = try Data(contentsOf: url)
            let recipes = try JSONDecoder().decode(Recipes.self, from: data)
            guard let recipeList = recipes.recipes else { return }

            self.recipes = recipeList
        }catch let error as NSError {
            print("Error loading data : \(error)")
        }
        
        var found = [Recipe]()
        
        //Sort Recipes by Categories
        for item in recipes {
            guard let dishTypes = item.dishTypes else {return}
           // print(dishTypes)
            if !dishTypes.isEmpty {
               let identificationKey = dishTypes[0]
               // print(identificationKey)
                let keys = Array(categoryRecipe.keys)
                if keys.contains(identificationKey){
                    var reciepeArray = categoryRecipe[identificationKey]
                    reciepeArray?.append(item)
                    categoryRecipe[identificationKey] = reciepeArray
                }else {
                    found.append(item)
                    categoryRecipe[identificationKey] = found
                    found = [Recipe]()
                }
            }
        }
        
//        print("Sorted Recipes: \(categoryRecipe.count)")
//        for (k, v) in categoryRecipe {
//            print("Key: \(k), Recipes : \(categoryRecipe[k]?.count)")
//        }
        
    }
}


//MARK: - Segue  toCategoryOpenTVC
extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segue.toCategoryOpenTVC.rawValue, sender: indexPath)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toCategoryOpenTVC.rawValue {
            
            guard let categoryOpenTVC = segue.destination as? CategoryOpenTableViewController else { return }
            guard let indexPath = sender as? NSIndexPath else { return }
            
            let cell = tableView(tableView, cellForRowAt: indexPath as IndexPath) as! CategoryTableViewCell
            
            categoryOpenTVC.categoryName = cell.categoryName
            categoryOpenTVC.recipes = cell.recipes
            
        }
     }
}

