//
//  FavoriteTableViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    //Class Properties
    var recipes = [Recipe]()
    
    //First 
    override func viewDidLoad() {
        super.viewDidLoad()
         self.clearsSelectionOnViewWillAppear = true
        loadData()
    }


}

//MARK: - Datasource
extension FavoriteTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: Cell.favoriteTableCell.rawValue) as! FavoriteTableViewCell
        let recipe = recipes[indexPath.row]
        cell.setUp(withRecipe: recipe)
        return cell
     }
    
}


//MARK: - Load Data
extension FavoriteTableViewController {
    
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
        
    }

}


//MARK: - Segue
extension FavoriteTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segue.favoriteToRecipeOpen.rawValue, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.favoriteToRecipeOpen.rawValue {
            
            guard let recipeOpenTVC = segue.destination as? RecipeOpenTableViewController else {return}
            guard let indexPath = sender as? NSIndexPath else { return }
            
            let categoryRecipeTVcell = tableView.cellForRow(at: indexPath as IndexPath) as? FavoriteTableViewCell
            recipeOpenTVC.recipe = categoryRecipeTVcell?.recipe
        }
    }
    
}



// MARK: - Editing Cells
extension FavoriteTableViewController {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //Only section 0 can be deleted
        return indexPath.section == 0 ? true : false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete Recipe
            tableView.beginUpdates()
            recipes.remove(at: indexPath.row)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
}




