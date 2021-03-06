//
//  MoviesViewController.swift
//  HCOWeek1RottenTomatoes
//
//  Created by Isabel Yepes on 26/09/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

var movies: [NSDictionary] = []
var rowIndex : Int? = nil


class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var movieTableView: UITableView!
    //var movies: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=zs244f7v8xdzm6unwf8m97xy&limit=20&country=us"
        
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!,data: NSData!, error: NSError!) -> Void in
        var object = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        //self.movies = object["movies"] as [NSDictionary]
        movies = object["movies"] as [NSDictionary]
        //println("object \(object)")
        self.movieTableView.reloadData()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "loadDetails" {
            var row = self.movieTableView.indexPathForSelectedRow()?.row
            var movie = movies[row!]
            var detail = segue.destinationViewController as movieDetailsViewController
            detail.rowIndex = row
            
            // println("Seque to \(detail.title), setting index to \(row)")//     
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        
        var movie = movies[indexPath.row]
        
        cell.titleLabel.text = "Title"
        cell.synopsisLabel.text = "Synopsis"
        
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        var posters = movie["posters"] as NSDictionary
        var posterURL = posters["thumbnail"] as String
        
        cell.posterView.setImageWithURL(NSURL(string: posterURL))
        
        //var cell = UITableViewCell()
        //cell.textLabel!.text = "Hello I'm at row: \(indexPath.row), section: \(indexPath.section)"
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
