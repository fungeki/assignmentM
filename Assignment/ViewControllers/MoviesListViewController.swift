//
//  MoviesListViewController.swift
//  Assignment
//
//  Created by Ran Loock on 18/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesListViewController: UIViewController {

    var movieList = MoviesLibrary.getInstance().getSortedMovies()
    
    @IBOutlet weak var moviesListTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesListTableview.rowHeight = self.view.frame.height / 3
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieDetailsViewController = segue.destination as! MovieDetailsViewController
        let index = sender as! Int
        movieDetailsViewController.movie = movieList[index]
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListTableviewCell") as! MovieListTableViewCell
        let model = movieList[indexPath.row]
        cell.moveTitleLabel.text = model.title
        cell.releaseYearLabel.text = String(model.releaseYear)
        let modelURL = URL(string: model.image)
        cell.movieImageView.sd_setImage(with: modelURL, placeholderImage: UIImage(named: "moviestar"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "masterMovieListToDetailSegue", sender: indexPath.row)
    }
}
