//
//  DetailViewController.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-18.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var webView: WKWebView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //this happens after view did load and occurs when the elements are about to appear after they were loaded.
        
        //clear the labels
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        
        //create the embed url
        let embedUrlString = Constants.EMBED_URL + video!.videoId

        let url = URL(string: embedUrlString)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
         //set the title
        titleLabel.text = video!.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        
        //set the description
        textView.text = video!.description
    }
    

}
