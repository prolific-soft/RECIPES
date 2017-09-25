//
//  FeaturedCollectionViewCell.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
   
    //UI properties
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImage.layer.cornerRadius = 3
        recipeImage.layer.masksToBounds = true
    }
}
