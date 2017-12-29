//
//  InstructionTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/28/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {

    //UI Properties
    @IBOutlet weak var instructionNumberLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
