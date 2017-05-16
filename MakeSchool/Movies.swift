//
//  Movies.swift
//  MakeSchool
//
//  Created by Vicky Tang on 5/13/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Movies: NSObject {

    var movieTitle: String?
    var moviePoster: String?
    var moviePrice: String?
    var movieSummary: String?
    var movieRelease: String?
    var itunesLink: String?
    
    init(movieDictionary: NSDictionary){
        
        if let title = movieDictionary["im:name"] as? NSDictionary,
            let titleLabel = title["label"] as? String,
            
            let posterURLAsString = movieDictionary["im:image"] as? NSArray,
            let posterURLAsString1 = posterURLAsString[2] as? NSDictionary,
            let posterURLAsString2 = posterURLAsString1["label"] as? String,
            
            let price = movieDictionary["im:price"] as? NSDictionary,
            let priceLabel = price["label"] as? String,
            
            let summary = movieDictionary["summary"] as? NSDictionary,
            let summaryLabel = summary["label"] as? String,
            
            let release = movieDictionary["im:releaseDate"] as? NSDictionary,
            let releaseAttribute = release["attributes"] as? NSDictionary,
            let releaseLabel = releaseAttribute["label"] as? String,
            
            let movieLinkAsString = movieDictionary["id"] as? NSDictionary,
            let movieLink = movieLinkAsString["label"] as? String
        {
            self.movieTitle = titleLabel
            self.moviePoster = posterURLAsString2
            self.moviePrice = priceLabel
            self.movieRelease = releaseLabel
            self.movieSummary = summaryLabel
            self.itunesLink = movieLink
        }
    }
    
}
