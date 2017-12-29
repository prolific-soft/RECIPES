//
//  FeaturedCollectionViewCell.swift
//  FLAVR
//
//  Created by Chidi Emeh on 7/9/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
   
    //Properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    var recipe : Recipe?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //recipeImage.layer.cornerRadius = 3
        //recipeImage.layer.masksToBounds = true
        
        //self.configureLayerSetUp()
        self.configure()
    }
    
    
    func setUp(withRecipe : Recipe ){
        self.recipe = withRecipe
        //Get Image of Recipe and setup UIImage
        
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
    
    
    //Shadow layer
    func configureLayerSetUp(){
        
        self.contentView.layer.cornerRadius = 7
        self.contentView.layer.shadowColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 1, height: 8)
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowRadius = 5
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        //backView.layer.masksToBounds = true
    }
    
    
    func configure(){
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 0.5
        
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor =  UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        //self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
    
    
}
