//
//  CategoryTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/29/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryLabel: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView(){
        
        backView.layer.cornerRadius = 7
        backView.layer.shadowColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        backView.layer.shadowOffset = CGSize(width: 1, height: 8)
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowRadius = 5
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        //backView.layer.masksToBounds = true
        
    }

}
