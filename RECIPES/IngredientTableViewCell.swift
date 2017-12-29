//
//  IngredientTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/28/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    //UI Properties
    
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var bulletPointView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bulletPointView.layer.cornerRadius = bulletPointView.layer.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //SetUp with ingredient
    func setUp(withIngredient : ExtendedIngredients){
        ingredientLabel.text = withIngredient.originalString!
    }

}
