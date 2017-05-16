//
//  DetailsViewController.swift
//  MakeSchool
//
//  Created by Vicky Tang on 5/14/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var movie: Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request((movie?.moviePoster)!).responseImage { response in
            if let image = response.result.value {
                self.posterImageView.image = image
            }
        }
        
        self.titleLabel.text = self.movie?.movieTitle
        self.releaseDateLabel.text = "Release: \((self.movie?.movieRelease)!)"
        self.priceLabel.text = "Price: \((self.movie?.moviePrice)!)"
        self.summaryLabel.text = (self.movie?.movieSummary)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPress(_ sender: Any) {
        if let url = URL(string: self.movie.itunesLink!) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (nil) in
                print("Opened Link")
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
