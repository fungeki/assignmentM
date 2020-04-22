//
//  MovieDetailsViewController.swift
//  Assignment
//
//  Created by Ran Loock on 18/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieGenresLabel: UILabel!
    
    var movie: MovieObj? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            movieTitleLabel.text = movie.title
            movieRatingLabel.text = String(movie.rating)
            movieReleaseYearLabel.text = String(movie.releaseYear)
            let movieURL = URL(string: movie.image)
            movieImageView.sd_setImage(with: movieURL, placeholderImage: UIImage(named: "moviestar"))
            var genres = ""
            for str in movie.genre{
                if genres.count == 0{
                  genres = str
                } else {
                    genres = "\(genres), \(str)"
                }
            }
            movieGenresLabel.text = genres
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
