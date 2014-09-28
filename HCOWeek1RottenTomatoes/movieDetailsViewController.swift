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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        var movie = movies[rowIndex!]
        self.movieTitle.text = movie["title"] as? String
        self.movieyear.text = movie["year"] as? String
        self.movieSynopsis.text = movie["synopsis"] as? String
        
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
