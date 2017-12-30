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
    var recipes = [Recipe]() {
        didSet {
            print("Recipes was set : \(recipes.count)")
        }
    }
    
    //First Loading Func
    override func viewDidLoad() {
        super.viewDidLoad()
         self.clearsSelectionOnViewWillAppear = true
        loadData()
    }


    // MARK: - Table view data source


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



