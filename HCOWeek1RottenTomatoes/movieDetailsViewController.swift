//
//  movieDetailsViewController.swift
//  HCOWeek1RottenTomatoes
//
//  Created by Isabel Yepes on 26/09/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class movieDetailsViewController: UIViewController {

    var rowIndex : Int? = nil
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieyear: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var movieCriticsScore: UILabel!
    
    @IBOutlet weak var movieAudienceScore: UILabel!
    
    @IBOutlet weak var movieSynopsis: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        var movie = movies[rowIndex!]
        self.movieTitle.text = movie["title"] as? String
        var year = movie["year"] as Int
        self.movieyear.text = String(year)
        self.movieSynopsis.text = movie["synopsis"] as? String
        
        var ratings = movie["ratings"] as NSDictionary
        var critics_score = ratings["critics_score"] as Int
        self.movieCriticsScore.text = String(critics_score)
        var audience_score = ratings["audience_score"] as Int
        self.movieAudienceScore.text = String(audience_score)
        
        var posters = movie["posters"] as NSDictionary
        var posterURL = posters["thumbnail"] as String
        self.posterImage.setImageWithURL(NSURL(string: posterURL))
        
        var newString = posterURL.stringByReplacingOccurrencesOfString("_tmb.", withString: "_org.", options: NSStringCompareOptions.LiteralSearch, range: nil)
        self.posterImage.setImageWithURL(NSURL(string: newString))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
