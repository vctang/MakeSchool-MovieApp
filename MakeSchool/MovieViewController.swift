//
//  ViewController.swift
//  MakeSchool
//
//  Created by Vicky Tang on 5/13/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        retrieveData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveData () {
        Alamofire.request("https://itunes.apple.com/us/rss/topmovies/limit=25/json").responseJSON { response in
            
            if((response.result.value) != nil) {
                
                let jsonRes = response.result.value as! NSDictionary?
                let resFeed = jsonRes?["feed"] as! NSDictionary?
                
                if let resData = resFeed?["entry"] as! NSArray! {
                    for info in resData {
                        let movie =  Movies(movieDictionary: info as! NSDictionary)
                        self.movies.append(movie)
                    }
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    // Deselect tableView cell
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell);
        let movie = movies[(indexPath?.row)!]
        
        let detailViewController = segue.destination as! DetailsViewController
        detailViewController.movie = movie
    }

}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        cell.movieData = self.movies[indexPath.row]
        
        return cell
    }
}
