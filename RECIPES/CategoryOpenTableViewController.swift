//
//  CategoryOpenTableViewController.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/29/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CategoryOpenTableViewController: UITableViewController {

    //Class Properties
    var recipes = [Recipe]()
    var categoryName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = categoryName!
        self.clearsSelectionOnViewWillAppear = true
    }

    //Pops VC
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    //Search Tapped
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    
    
}



//MARK: - Datasource
extension CategoryOpenTableViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return recipes.count
        default:
            return 0
        }
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.categoryDetailTableViewCell.rawValue) as! CategoryDetailTableViewCell
           
            //Get the category name and number of
            //recipes and set the detail
            let categoryName = self.categoryName!
            let numberOfRecipes = self.recipes.count
            let recipe = recipes.count > 2 ? recipes[2] : recipes[0]
            cell.setUp(numberOfRecipes: numberOfRecipes, categoryName: categoryName.uppercased(), recipe: recipe)
            
            return cell
            
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.categoryReciepeTableViewCell.rawValue) as! CategoryReciepeTableViewCell
            
            let recipe = recipes[indexPath.row]
            cell.setUp(withRecipe: recipe)
            return cell
        }
        return cell
     }
    
}

//categoryOpenToRecipeOpen

//MARK: - SEGUE
extension CategoryOpenTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            performSegue(withIdentifier: Segue.categoryOpenToRecipeOpen.rawValue, sender: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.categoryOpenToRecipeOpen.rawValue {
            
            guard let recipeOpenTVC = segue.destination as? RecipeOpenTableViewController else {return}
            guard let indexPath = sender as? NSIndexPath else { return }
            
            let categoryRecipeTVcell = tableView.cellForRow(at: indexPath as IndexPath) as? CategoryReciepeTableViewCell
            recipeOpenTVC.recipe = categoryRecipeTVcell?.recipe
        }
    }
    
    
}







