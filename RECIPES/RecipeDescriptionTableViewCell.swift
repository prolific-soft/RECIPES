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

        // Configure the view for the selected state
    }

}
