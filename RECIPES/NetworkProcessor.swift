//
//  NetworkProcessor.swift
//  RECIPES
//
//  Created by Chidi Emeh on 12/25/17.
//  Copyright © 2017 Chilly Bean. All rights reserved.
//

import Foundation


class NetworkProcessor {
    
    lazy var configuraiton = URLSessionConfiguration.default
    lazy var session = URLSession(configuration: configuraiton)
    
    var url : URL?
    
    init(url : URL) {
        self.url = url
    }
    
    typealias JSONDownloader = ((Codable?)-> Void)
    typealias IMAGEDATADownloader = ((Data?, HTTPURLResponse?, Error?)-> Void)
    
    
    //Download Recipe Data
    func downloadRecipe(withStructType : String, _ completion : @escaping JSONDownloader){
        
        guard let downloadURL = self.url else { return }
        let request = URLRequest(url: downloadURL)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                if let dataResponse = response as? HTTPURLResponse {
                    
                    switch dataResponse.statusCode {
                    case 200:
                        //Status Ok
                        guard let downloadData = data else { return }
                        
                            do {
                                switch withStructType {
                                case "recipe":
                                    let recipeJSON = try JSONDecoder().decode(Recipe.self, from: downloadData)
                                    completion(recipeJSON)
                                case "recipes":
                                    let recipesJSON = try JSONDecoder().decode(Recipes.self, from: downloadData)
                                    completion(recipesJSON)
                                default:
                                    print("No form of recipe")
                                }
                            }catch let decodingError as NSError{
                                print("Error Decoding : \(decodingError)")
                            }
                        print("Status OK")
                    default:
                        print("Recipe Reesponse Error Status code : \(dataResponse.statusCode)")
                    }
                }
            }else {
                print("Error downloading \(error.debugDescription)")
            }
        }
        
        dataTask.resume()
    }
    
    
    //Download Image Data
    func downloadImage(_ completion : @escaping IMAGEDATADownloader ){
        guard let imageUrl = self.url else { return }
        let imageRequest = URLRequest(url: imageUrl)
        
        let imageDataTask = session.dataTask(with: imageRequest) { (imageData, imageResponse, imageError) in
           
            if imageError == nil {
                guard let response = imageResponse as? HTTPURLResponse else {return}
                
                switch response.statusCode {
                case 200:
                    guard let data = imageData else {return}
                    completion(data, nil, nil )
                default:
                    return
                }
            }else {
                print("Error downloading Image:  \(imageError.debugDescription)")
                completion(nil, nil, imageError!)
            }
        }
        imageDataTask.resume()
    }
    
    
}










