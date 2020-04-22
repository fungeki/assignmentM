//
//  ViewController.swift
//  Assignment
//
//  Created by Ran Loock on 17/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MoviesLibrary.getInstance().getMovies { (movies) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "splashToMovieListSegue", sender: nil)
            }
        }
    
    }

}
