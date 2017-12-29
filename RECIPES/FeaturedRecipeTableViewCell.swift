//
//  FeaturedRecipeTableViewCell.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class FeaturedRecipeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    //First loading func
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }

}
