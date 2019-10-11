//
//  ZWWMovieTableViewController.swift
//  Week4Assessment
//
//  Created by Zebadiah Watson on 10/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class ZWWMovieTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movieResults: [ZWWMovie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = 200
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        ZWWMovieController.shared().fetchMovie(withTitle: searchText) { (movies) in
            self.movieResults = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? ZWWMovieTableViewCell else { return UITableViewCell() }
        
        let movie = movieResults[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.ratingLabel.text = "\(movie.rating)"
        cell.summaryText.text = movie.overview

        // Configure the cell...

        return cell
    }
    
}
