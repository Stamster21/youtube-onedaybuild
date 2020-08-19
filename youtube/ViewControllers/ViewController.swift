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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get a reference to the video that was tapped on
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //reference to the detail viewcontroller
       let detailVC = segue.destination as? DetailViewController
        
        //set the property to the detail viewcontroller
        detailVC?.video = selectedVideo
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //get data for the cell
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
 
        //return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

