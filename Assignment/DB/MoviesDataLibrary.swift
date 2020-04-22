//
//  MoviesDataLibrary.swift
//  Assignment
//
//  Created by Ran Loock on 18/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import CoreData

class MoviesLibrary {
    private var movies = [MovieObj]()
    
    private init (){
        
    }
    
    
    private static var sharedInstance:MoviesLibrary!
    
    
    //creates and instance if one doesnt exist.
    static func getInstance()->MoviesLibrary{
        if sharedInstance == nil{
            sharedInstance = MoviesLibrary()
        }
        return sharedInstance
    }
    private func fetchData(_ coreMovies: [NSManagedObject]) {
        var moviesObjArr = [MovieObj]()
        for model in coreMovies{
            let title = model.value(forKey: "title") as! String
            let image = model.value(forKey: "image") as! String
            let rating = model.value(forKey: "rating") as! Float
            let genre = model.value(forKey: "genre") as! [String]
            let releaseYear = model.value(forKey: "releaseYear") as! Int16
            print(releaseYear)
            let addedMovie = MovieObj(title: title, image: image, rating: rating,
                                      releaseYear: releaseYear, genre: genre)
            moviesObjArr.append(addedMovie)
        }
        movies = moviesObjArr
        
    }
    
    func getMovies(completion: @escaping ([MovieObj])->Void){
        var coreMovies = [NSManagedObject]()
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do {
            coreMovies = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        if coreMovies.count == 0{ //only downloads if there arent any movoies saved
            getMoviesFromDatabase { (moviesData) in
                if let moviesData = moviesData {
                    self.movies = moviesData
                    completion(moviesData)
                } else {
                    fatalError("data error, cant continue")
                }
            }
        } else {
            fetchData(coreMovies)
            completion(movies)
        }
    }
    
    func getMovies() -> [MovieObj]{
        if movies.count == 0{
            fatalError("wrong isomorphed function, please use getMovies(completion:)")
        }
        return self.movies
    }
    
    func getSortedMovies() -> [MovieObj]{
        let sortedMovies = movies.sorted { (before, after) -> Bool in
            return before.releaseYear > after.releaseYear
        }
        return sortedMovies
    }
}
        

