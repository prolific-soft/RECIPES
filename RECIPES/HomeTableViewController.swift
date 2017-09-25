//
//  HomeTableViewController.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    //Class Properties
    let featuredCollectionCellReuseIdentifier = "FeaturedCollectionViewCell"
    let featuredRecipeCellReuseIdentifier = "FeaturedRecipeCell"
    let latestRecipeCellReuseIdentifier = "LatestRecipeCell"
    let sections = ["FEATURED RECIPES", "LATEST"]
    
    //First loading func
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    //Header view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = Bundle.main.loadNibNamed("HomeTableHeader", owner: self, options: nil)?.first as! HomeTableHeaderView
        sectionHeader.headerLabel.text = section == 0 ? sections[section] : sections[section]
        (sectionHeader.headerLabel as! CustomLabel).setSpacing(space: 1.75)
        sectionHeader.backgroundView.backgroundColor =  UIColor(hexString: "F8F8F8", withAlpha: 1)
        return sectionHeader
    }
    
    //Height for section header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 55 : 40
    }

    // MARK: - Table view data source
    //Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    //Height for each section
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 146 : 252
    }

    //Deque Tableview cell for rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: featuredRecipeCellReuseIdentifier, for: indexPath) as! FeaturedRecipeTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: latestRecipeCellReuseIdentifier, for: indexPath) as! LatestTableViewCell
            return cell
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //navigationController?.navigationBar.isTranslucent = false
    }
    
    //Assign Delegate and Datasource to HomeTableViewController
    //from the collectionview cell in featuredCollection cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let cell = cell as! FeaturedRecipeTableViewCell
            cell.featuredCollectionView.delegate = self
            cell.featuredCollectionView.dataSource = self
            cell.featuredCollectionView.reloadData()
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

extension HomeTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Number of Featured Recipe
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //Deque Featured Recipe cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCollectionCellReuseIdentifier, for: indexPath) as! FeaturedCollectionViewCell
        return cell
    }
    
    
}











