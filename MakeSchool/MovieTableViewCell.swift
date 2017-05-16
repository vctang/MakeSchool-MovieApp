//
//  MovieTableViewCell.swift
//  MakeSchool
//
//  Created by Vicky Tang on 5/13/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var movieData: Movies? {
        didSet{
            Alamofire.request((movieData?.moviePoster)!).responseImage { response in
                if let image = response.result.value {
                    self.movieImageView.image = image
                }
            }
            
            self.titleLabel.text = self.movieData?.movieTitle
            self.releaseDateLabel.text = "Release: \((self.movieData?.movieRelease)!)"
            self.priceLabel.text = "Price: \((self.movieData?.moviePrice)!)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
