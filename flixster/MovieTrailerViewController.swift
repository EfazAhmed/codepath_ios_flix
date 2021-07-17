//
//  MovieTrailerViewController.swift
//  flixster
//
//  Created by Efaz on 7/16/21.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, WKUIDelegate {

    var urlTransfer: URL!
    var youtubeTrailer = ""
    var hi = [[String:Any]]()
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let url = urlTransfer
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    //print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                    self.hi = (dataDictionary["results"]) as! [[String:Any]]
                
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                    let key = "\(((self.hi[0])["key"])!)"
                    let base = #"https://www.youtube.com/watch?v="#
                    self.youtubeTrailer = base + key
                    print(self.youtubeTrailer)
                    
                    let myURL = URL(string: self.youtubeTrailer)
                    let myRequest = URLRequest(url: myURL!)
                    self.webView.load(myRequest)
             }
        }
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
