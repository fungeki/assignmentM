//
//  GetMovies.swift
//  Assignment
//
//  Created by Ran Loock on 17/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import CoreData


func getMoviesFromDatabase(completion: @escaping ([MovieObj]?)->Void) {
    
    
    let urlStr = "https://api.androidhive.info/json/movies.json"
    guard let urlObj = URL(string: urlStr) else {
        print("something went wrong with the url encoding")
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: urlObj){(data, res, err) in
        DispatchQueue.main.async {
            do{
                guard let data = data else {
                    print("corrupted data - returned nil")
                    completion(nil)
                    return
                }
                
                
                let moviesData = try JSONDecoder.init().decode([MovieObj].self, from: data)
                guard let appDelegate =
                    UIApplication.shared.delegate as? AppDelegate else {
                        completion(nil)
                        return
                }
                let context = appDelegate.persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
                for model in moviesData{
                    let movie = NSManagedObject(entity: entity!, insertInto: context)
                    movie.setValue(model.title, forKey: "title")
                    movie.setValue(model.image, forKey: "image")
                    movie.setValue(model.releaseYear, forKey: "releaseYear")
                    movie.setValue(model.rating, forKey: "rating")
                    movie.setValue(model.genre, forKey: "genre")
                }
                do {
                    try context.save()
                   completion(moviesData)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                    completion(nil)
                }
                
            }catch{
                print("error fetching data !!! :( check if data matches MovieObj")
                 completion(nil)
                
            }
        }
        
    }.resume()
}
