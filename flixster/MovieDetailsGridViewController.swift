//
//  MovieDetailsGridViewController.swift
//  flixster
//
//  Created by Efaz on 7/15/21.
//

import UIKit
import AlamofireImage

class MovieDetailsGridViewController: UIViewController {

    
    var movie: [String: Any]!
    var trailerURL: URL!
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        //let id = ("\((movie["id"]))")
        let id = "\((movie["id"])!)"
        trailerURL = URL(string: "https://api.themoviedb.org/3/movie/" + id + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
                  
        print("hi")
        print(id)
        print(type(of: id))
       
        
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        
        posterImage.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780"+backdropPath)
        
        backdropImage.af_setImage(withURL: backdropUrl!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Loading up the trailer screen")
        
        let trailerViewController = segue.destination as! MovieTrailerViewController
        trailerViewController.urlTransfer = trailerURL
        
        
        
        
    }
    

}
