//
//  ViewController.swift
//  youtube
//
//  Created by Stamatis Kouniaris on 2020-08-07.
//  Copyright © 2020 Stamatis Kouniaris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {


    var model = VideoModel()
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }

//    MARK: - Videos fetched protocol
    
    func videosFetched(_ videos: [Video]) {
       
        self.videos = videos
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //get data for the cell
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        //return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

