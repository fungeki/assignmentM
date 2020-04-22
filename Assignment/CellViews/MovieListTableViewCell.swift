//
//  MovieListTableViewCell.swift
//  Assignment
//
//  Created by Ran Loock on 18/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moveTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
