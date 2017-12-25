//
//  Recipe.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/25/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import Foundation

///Recipe as defined in the API
struct Recipe : Codable {
    
    var vegetarian : Bool?
    var vegan : Bool?
    var glutenFree : Bool?
    var dairyFree : Bool?
    var veryHealthy : Bool?
    var cheap : Bool?
    var veryPopular : Bool?
    var sustainable : Bool?
    var weightWatcherSmartPoints : Int?
    var gaps : String?
    var lowFoodmap : Bool?
    var ketogenic : Bool?
    var whole30 : Bool?
    var servings : Int?
    var sourceUrl : String?
    var spoonacularSourceUrl : String?
    var aggregateLikes : Int?
    var spoonacularScore  : Float?
    var healthScore : Float?
    var creditText : String?
    var sourceName : String?
    var pricePerServing : Double?
    
        struct ExtendedIngredients : Codable {
            var id : Int?
            var aisle : String?
            var image : String?
            var consistency : String?
            var name : String?
            var amount : Float?
            var unit : String?
            var unitShort : String?
            var unitLong : String?
            var originalString : String?
            var metaInformation : [Any]?
        }
    
    var extendedIngredients : [ExtendedIngredients]?
    var id : Int?
    var title : String?
    var readyInMinutes : Int
    var image : String?
    var imageType : String?
    var cuisines : [Any]?
    var dishTypes : [String]?
    var diets : [String]?
    var occasions : [Any]?
    
        struct WinePairing: Codable {
            var pairedWines : [String]?
            var pairingText : String?
                struct ProductMatches : Codable{
                    var id : String?
                    var title : String?
                    var description : String?
                    var price : String?
                    var imageUrl : String?
                    var averageRating : Float?
                    var score : Double?
                    var link : String?
                }
            var productMatches : [ProductMatches]?
        }
    
    var winePairing : WinePairing?
    var instructions : String?
    
        struct analyzedInstructions : Codable {
            var name : String?
             struct Steps : Codable {
                    var number : Int?
                    var step : String?
                    
                        struct ingredients : Codable {
                            var id : Int?
                            var name : String?
                            var image : String?
                        }
                    
                    var ingredients : [ingredients]?
                    
                    struct equipment : Codable {
                            var id : Int?
                            var name : String?
                            var image : String?
                        }
                    
                    var equipment : [equipment]?
                }
            var steps : [Steps]?
        }
    
    var analyzedInstructions : [analyzedInstructions]?
}






