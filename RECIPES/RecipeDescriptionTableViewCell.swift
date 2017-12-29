//
//  RecipeDescriptionTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/28/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class RecipeDescriptionTableViewCell: UITableViewCell {

    // UI Properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var timeToCookLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var servingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //Setup view with provided recipe
    func setUp(withRecipe : Recipe){
        loadImage(withRecipe: withRecipe)
        categoryLabel.text = withRecipe.sourceName!
        recipeNameLabel.text = withRecipe.title!
        timeToCookLabel.text = String("\(withRecipe.readyInMinutes) minutes")
        //Determine Difficulty
        guard let peopleToServe = withRecipe.servings else { return }
        servingLabel.text = String("\(peopleToServe) People")
        
    }
    
    
    func loadImage(withRecipe : Recipe){
        var downloadeImage = UIImage()
        //Downloading Image
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
