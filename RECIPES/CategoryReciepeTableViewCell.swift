//
//  CategoryReciepeTableViewCell.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/29/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class CategoryReciepeTableViewCell: UITableViewCell {

    //UI Properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var timeToCookLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var servingLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    var recipe : Recipe?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    func setUp(withRecipe : Recipe){
        recipe = withRecipe
        recipeNameLabel.text = withRecipe.title
        timeToCookLabel.text = String("\(withRecipe.readyInMinutes) minutes")
        difficultyLabel.text = "Medium"
        servingLabel.text = String("\(withRecipe.servings!) people")
        loadImage(withRecipe: withRecipe)
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
    
    
    func configure(){
        
        //TODO:
        //Fix this so that top corner radius is curved as well
        //self.backView.layer.masksToBounds = false
        self.backView.layer.borderColor = UIColor.clear.cgColor
        self.backView.layer.shadowColor =  UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1).cgColor
        self.backView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.backView.layer.shadowRadius = 5
        self.backView.layer.shadowOpacity = 1.0
        self.backView.layer.masksToBounds = false
        self.backView.layer.cornerRadius = 8
        self.backView.layer.borderWidth = 0.5
        //self.backView.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
    
    
}
