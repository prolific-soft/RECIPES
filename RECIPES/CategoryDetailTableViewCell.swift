//
//  CategoryDetailTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/29/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CategoryDetailTableViewCell: UITableViewCell {
    
    //UI Properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfRecipesLabel: UILabel!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setUp(numberOfRecipes : Int, categoryName: String, recipe: Recipe){
        
        categoryTitleLabel.text = categoryName
        numberOfRecipesLabel.text = String("\(numberOfRecipes) Recipes")
        loadImage(withRecipe: recipe)
        
    }
    
    func loadImage(withRecipe : Recipe){
        var downloadeImage = UIImage()
        //Download Image
        guard let imageString = withRecipe.image else { return }
        guard let imageURL = URL(string: imageString) else {return}
        let imageProcessor = NetworkProcessor(url: imageURL)
        imageProcessor.downloadImage { (data, response, error) in
            DispatchQueue.main.async {
                guard let imageData = data else { return }
                downloadeImage = UIImage(data: imageData)!
                self.recipeImage.image = downloadeImage
            }
        }
    }
    
}
